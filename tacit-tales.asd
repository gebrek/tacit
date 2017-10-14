(in-package :cl-user)
(defpackage tacit-tales-asd
  (:use :cl :asdf))
(in-package :tacit-tales-asd)

(defsystem tacit-tales
  :version "0.1"
  :author "Jacob Sonnenberg"
  :license ""
  :depends-on (:clack
               :lack
               :caveman2
               :envy
               :cl-ppcre
               :uiop

               ;; for @route annotation
               :cl-syntax-annot

               ;; HTML Template
               :djula
	       :cl-who

	       ;; javascript drop in
	       :parenscript

               ;; for DB
               :datafly
               :sxql

	       ;; for other tasks
	       :drakma
	       :cl-json
	       :split-sequence
	       :vecto
	       :md5)
  :components ((:module "src"
                :components
                ((:file "thought")
		 (:file "hex")
		 (:file "main" :depends-on ("config" "view" "db"))
                 (:file "web" :depends-on ("lib" "view" "model"))
		 (:file "model" :depends-on ("config"))
                 (:file "view" :depends-on ("config"))
                 (:file "db" :depends-on ("config"))
		 (:file "lib" :depends-on ("config"))
                 (:file "config"))))
  :description ""
  :in-order-to ((test-op (load-op tacit-tales-test))))
