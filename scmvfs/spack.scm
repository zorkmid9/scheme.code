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


;; Packaging System uses files with filename. The file contents is structured
;; as follows :
;; "package-name" "version-number" "pathname"
;; eof
;; 

(define (scm-vfs-version fn)
	(let ((v 0))
		(let ((p (open-input-file fn)))
			(read- p)
			;; returns #f 
			(if (eof-object? (set! v (string (read- p)))))	

		(define (read- s)
			(read s)))))

(define (scm-vfs-path fn)
	(let ((pah 0))
		(let ((p (open-input-file fn)))
			(read- p)
			(read- p)
			(if (eof-object? (string (set! pah (read- p))))) 	

		(define (read- s)
			(read s)))))
