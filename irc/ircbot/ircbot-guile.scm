;; Copyright (C) 2013 Johan Ceuppens 
;;
;;This program is free software; you can redistribute it and/or modify it under 
;;the terms of the GNU General Public License as published by the Free Software 
;;Foundation; either version 2 of the License, or (at your option) any later 
;;version.
;;
;;This program is distributed in the hope that it will be useful, but WITHOUT 
;;ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS 
;;FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
;;
;;You should have received a copy of the GNU General Public License along with 
;;this program; if not, write to the Free Software Foundation, Inc., 59 Temple 
;;Place, Suite 330, Boston, MA 02111-1307 USA

(use-modules (ice-9 popen))
(use-modules (ice-9 rdelim))

(define (make-ircbot-guile)
	(let ((s (socket PF_INET SOCK_STREAM 0)))

		;; most irc servers run on port 6667 and on 6669
		(define (connect- host port)
			(connect s AF_INET (inet-pton AF_INET host) port))


		(define (logon- nickname username)
			(display "PASS *\r\n\r\n" s)
			(display (string-append "NICK " nickname "\r\n\r\n") s)
			(display (string-append "USER " username " 8 * :" username "\r\n\r\n") s)
			;; server's first response
			;;(do ((line (read-line s) (read-line s)))
      			;;	((eof-object? line))
    			;;	(display line)
    			;;	(newline)))
			(display (read-line s))
			(newline)
			(display (read-line s))
			(newline)
			(display (read-line s))
			(newline)
			(display (read-line s))
			(newline))

		(define (join- channel)
			(display (string-append "JOIN #" channel "\r\n\r\n") s)
			;; server's join channel response
			;(do ((line (read-line s) (read-line s)))
      			;	((eof-object? line))
    			;	(display line)
    			;	(newline))
			)

		(define (snoop-)
			(do ((line (read-line s) (read-line s)))
      				((eof-object? line))
    				(display line)
    				(newline)))
			

		(define (quit-)
			(display "QUIT" s))

		(lambda (msg)
			(cond ((eq? msg 'connect) connect-)
				((eq? msg 'logon) logon-)
				((eq? msg 'join) join-)
				((eq? msg 'snoop) snoop-)
				((eq? msg 'quit) quit-)

				(else (display "make-ircbot-guile : message not understood : ")(display msg)(newline))))))
