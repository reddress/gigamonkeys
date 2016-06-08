(defvar *x* 10)

(defun foo ()
  (format t "Before assignment~18tX: ~d~%" *x*)
  (setf *x* (+ 1 *x*))
  (format t "After assignment~18tX: ~d~%" *x*))

(defun bar ()
  (foo)
  (let ((*x* 20)) (foo))
  (foo))

;;; call:
;;; (foo)
;;; (bar)

;;; lexical variable

(setf y 10)

(defun foo-lexical ()
  (format t "Lexical before assignment~18tX: ~d~%" y)
  (setf y (+ 1 y))
  (format t "Lexical after assignment~18tX: ~d~%" y))

(defun bar-lexical ()
  (foo-lexical)
  (let ((y 20)) (foo-lexical) (format t "local y ~d~%" y))
  (foo-lexical))

;;; (foo-lexical)
;;; (bar-lexical)

