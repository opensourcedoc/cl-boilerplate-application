(ql:quickload 'cl-portable :silent t)
(use-package 'cl-portable)

;; Load and use Lisp packages as needed.


;; Set an executable name.
#+(or sbcl ccl clisp) (defvar *output* "program")

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
        (defvar *program* (concatenate 'string *output* ".exe"))
        (defvar *program* *output*))

;; Compile the program.
#+(or sbcl ccl clisp) (compile-program *program* #'main)
#+(or sbcl ccl clisp) (quit-with-status)

;; Run the main function on-the-fly
;;  if no compliation mode.
#-(or sbcl ccl clisp) (main)