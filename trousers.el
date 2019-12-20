;;; trousers.el --- pants mode for emacs

;; Copyright © 2019-2020 Philipp Fehre <philipp@fehre.co.uk>

;; Author: Philipp Fehre <philipp@fehre.co.uk>
;; URL: https://github.com/sideshowcoder/trousers
;; Keywords: pants, buildsystem
;; Version: 0.0.1-snapshot
;; Package-Requires: ((emacs "26.3") (projectile "2.0"))

;;; Commentary:
;;
;; Emacs mode for the Pants build system see https://pantsbuild.org/index.html
;; uses projectile to discover the the project root and provides convenience
;; functions to ease compiling and testing the current buffer.
;;

;;; Code:

;;; Pointers:
;; https://spin.atomicobject.com/2016/05/27/write-emacs-package/

(require 'projectile)

(defgroup trousers nil
  "Use the pants buildsystem from emacs."
  :group 'buildsystems
  :group 'convenience
  :link '(url-link :tag "GitHub" "https://github.com/sideshowcoder/trousers")
  :link '(emacs-commentary-link :tag "Commentary" "trousers"))

(defcustom trousers-pants-default-args
  '("--no-colors")
  "A list of options arguments passed to pants on all invocations.

Defaults to --no-colors to avoid ansi escape codes in output."
  :group 'trousers
  :type '(repeat string))

(define-compilation-mode trousers-pants-compilation-mode "Trousers Pants-Compilation"
  "Pants compilation mode from trousers."
  )

(defun trousers--run-pants ()
  "Run pants invocation.

Using the pants executable from the projectile-root." )

(defun trousers--available-pants-goals ()
  "Determine the available goals for pants.

Running pants goals, parsing the output to return a list of
  available goals.")

;;;###autoload
(defun trousers-exec-goal-on-target (goal target)
  "Execute GOAL on TARGET via pants.

when the goal is test sets the projectile-test-project
accordingly, any other goal will set the
projectile-compile-project."
  (interactive "sPants Goal: \nsPants Target: "))

(defun trousers-compile-target (target)
  "Run pants compile on TARGET."
  (interactive "sPants Target:")
  (trousers-exec-goal-on-project "compile" project))

(defun trousers-test-project (target)
  "Run pants test on TARGET.

TARGET should include the appropriate pants test target, likely
something like my/pants/projects:tests"
  (interactive "sPants Project (including tests target):")
  (trousers-exec-goal-on-project "test" project))

(defun trousers-compile-closest-subproject ()
  "Do what I mean compile.

Take the file path of the current buffer, finding the dominating
BUILD file, and running pants compile with the determined path."
  (interactive))

(provide 'trousers)

;;; trousers.el ends here
