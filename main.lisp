#+quicklisp (ql:quickload "cl-portable" :silent t)
#-quicklisp (load "cl-portable.lisp" :print nil)

;; Load other third-party Common Lisp packages here.


(import 'cl-portable::argument-script)
#+(or sbcl ccl clisp) (import 'cl-portable::compile-program)
(import 'cl-portable::platform)
(import 'cl-portable::quit-with-status)

;; Import other third-party Common Lisp functions or macros here.


;; Set your executable name.
(defconstant +program+ "program")

;; Declare your local functions here.

;; Simulate a main function.
(defun main (argv)
    ;; Implement your main program here.
    (write-line "Hello World")
    #+ccl (finish-output)  ; Trick for Clozure CL.

    ;; Return an exit status.
    (quit-with-status 0))

;; Set a proper executable name according to current OS.
(if (equal :windows (platform))
    (defvar *program* (concatenate 'string +program+ ".exe"))
    (defvar *program* +program+))

;; Starter of the program.
(defun init ()
  (main (cons *program* (cdr (argument-script)))))

;; Compile the program.
#+(or sbcl ccl clisp)
  (if (equal :windows (platform))
      ;; It is merely supported to compile GUI programs
      ;;  in SBCL on Windows.
      (compile-program *program* #'init :type :console)
      (compile-program *program* #'init))
#+(or sbcl ccl clisp) (quit-with-status)

;; Run the main function on-the-fly
;;  if no compliation mode.
#-(or sbcl ccl clisp) (init)