(in-package :cl-user)
(defpackage tacit-tales.web
  (:use :cl
        :caveman2
        :tacit-tales.config
        :tacit-tales.view
        :tacit-tales.db
        :datafly
        :sxql)
  (:export :*web*))
(in-package :tacit-tales.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
  (render #P"index.html"))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))
