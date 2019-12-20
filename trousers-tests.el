;;; trousers-tests.el --- trousers unit tests

;;; Commentary:

;; Run standalone with this,
;;   cask exec Emacs -batch -L . -l trousers-tests.el -f ert-run-tests-batch
;; Or as part of the project with
;;   make test

;;; Code:

(require 'ert)

(ert-deftest smoke-test ()
  (should (equal 2 (+ 1 1))))

(provide 'trousers-tests)

;;; trousers-tests.el ends here
