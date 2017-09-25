(in-package :cl-user)
(defpackage tacit-tales-test-asd
  (:use :cl :asdf))
(in-package :tacit-tales-test-asd)

(defsystem tacit-tales-test
  :author "Jacob Sonnenberg"
  :license ""
  :depends-on (:tacit-tales
               :prove)
  :components ((:module "t"
                :components
                ((:file "tacit-tales"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
