(in-package :cl-user)
(defpackage tacit-tales.lib
  (:use
   :cl
   :cl-fad
   :split-sequence)
  (:export :file-string :directory-listing))
(in-package :tacit-tales.lib)

(defun file-string (path)
  (with-open-file (stream path)
    (let ((data (make-string (file-length stream))))
      (read-sequence data stream)
      data)))

(defun directory-listing (path)
  (flet ((trunc-file (x)
	   (subseq (namestring x) (length (sb-posix:getcwd)))))
    (list :dir
	  (if (file-exists-p path)
	      (trunc-file (file-exists-p path)))
	  :subdirs
	  (mapcar #'trunc-file
		  (remove-if-not
		   (lambda (x) (cl-fad:directory-exists-p x))
		   (list-directory path)))
	  :files
	  (mapcar #'trunc-file
		  (remove-if-not
		   (lambda (x) (not (cl-fad:directory-exists-p x)))
		   (list-directory path))))))
