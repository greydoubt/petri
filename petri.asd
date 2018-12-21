;;;; petri.asd

(asdf:defsystem #:petri
  :description "An implementation of Petri nets"
  :author "Michał \"phoe\" Herda <phoe@disroot.org>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:alexandria
               #:closer-mop
               #:1am
               #:split-sequence
               #:phoe-toolbox/bag
               ;; ASYNC
               #:bordeaux-threads
               #:lparallel
               #:trivial-backtrace)
  :components ((:file "petri")))

(asdf:defsystem #:petri/test
  :description "Tests for PETRI-NET"
  :author "Michał \"phoe\" Herda <phoe@disroot.org>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:alexandria
               #:1am
               #:petri)
  :components ((:file "test")))

(defmethod asdf:perform ((o asdf:test-op)
                         (c (eql (asdf:find-system ':petri))))
  (asdf:load-system :petri/test)
  (uiop:symbol-call :1am :run
                    (symbol-value (find-symbol "*PETRI-TESTS*" :petri/test))))
