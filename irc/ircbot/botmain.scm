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

(display "What scheme are you using (answers : guile) ? ")
(let ((compiler (read)))
	(cond ((eq? compiler 'guile)
		(load "ircbot-guile.scm")
		(let ((bot (make-ircbot-guile)))
			(display "What is the servername (IP address) ? ")
			(let ((server (read)))
			(display "What is the port number? ")
			(let ((port (read)))
			((bot 'connect) (symbol->string server) port)
			(display "What is the nickname ? ")
			(let ((nickname (read)))
			((bot 'logon) (symbol->string nickname) "bot"))
			(display "What is the channel name (without #) ? ")
			(let ((channel (read)))
			((bot 'join) (symbol->string channel))
			((bot 'snoop)))
				))))

		(else (display "Unknown Scheme system. Aborting..."))))
