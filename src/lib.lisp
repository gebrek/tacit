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
  (let ((dir-files (list-directory path)))
    ;; (list :directory)
    (list :subdirs
	  (mapcar (lambda (x) (concatenate
			       'string
			       (car (last
				     (remove "" (split-sequence #\/ (directory-namestring x))
					     :test #'equal)))
			       "/"))
		  dir-files)
	  :files
	  (remove "" (mapcar #'file-namestring dir-files) :test #'equal))))
