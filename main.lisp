(ql:quickload 'cl-portable :silent t)
(use-package 'cl-portable)

;; Load and use Lisp packages as needed.


;; Set an executable name.
#+(or sbcl ccl clisp) (defconstant +program+ "program")

;; Declare your function here.

;; Simulate a main function.
(defun main ()
    ;; Implement your main program here.
    (write-line "Hello World")
    #+ccl (finish-output) ;; Trick for Clozure CL.

    ;; Return exit status.
    (quit-with-status 0))

;; Set a proper executable name
;;  according to current OS.
#+(or sbcl ccl clisp) 
    (if (equal :windows (platform))
        (defvar *program* (concatenate 'string +program+ ".exe"))
        (defvar *program* +program+))

;; Compile the program.
;; It is merely supported to compile GUI programs in SBCL.
#+(or sbcl ccl clisp) (compile-program *program*
                                       #'main
                                       :type :console)
#+(or sbcl ccl clisp) (quit-with-status)

;; Run the main function on-the-fly
;;  if no compliation mode.
#-(or sbcl ccl clisp) (main)