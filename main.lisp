#+quicklisp (ql:quickload "cl-portable" :silent t)
#-quicklisp (load "cl-portable.lisp" :print nil)

;; Load other third-party Common Lisp packages here.


#+(or sbcl ccl clisp) (import 'cl-portable::compile-program)
#+(or sbcl ccl clisp) (import 'cl-portable::platform)
(import 'cl-portable::quit-with-status)

;; Import other third-party Common Lisp functions or macros here.


;; Set your executable name.
#+(or sbcl ccl clisp) (defconstant +program+ "program")

;; Declare your local functions here.

;; Simulate a main function.
(defun main ()
    ;; Implement your main program here.
    (write-line "Hello World")
    #+ccl (finish-output)  ; Trick for Clozure CL.

    ;; Return an exit status.
    (quit-with-status 0))

;; Set a proper executable name according to current OS.
#+(or sbcl ccl clisp) 
    (if (equal :windows (platform))
        (defvar *program* (concatenate 'string +program+ ".exe"))
        (defvar *program* +program+))

;; Compile the program.
#+(or sbcl ccl clisp)
  (if (equal :windows (platform))
      ;; It is merely supported to compile GUI programs
      ;;  in SBCL on Windows.
      (compile-program *program* #'main :type :console)
      (compile-program *program* #'main))
#+(or sbcl ccl clisp) (quit-with-status)

;; Run the main function on-the-fly
;;  if no compliation mode.
#-(or sbcl ccl clisp) (main)