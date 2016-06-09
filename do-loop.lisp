;;; prints n fibonacci numbers

(defun fib-sequence (n)
  (do ((i 0 (1+ i))
       (cur 0 next)
       (next 1 (+ cur next)))
      ((= i n) cur)
    (print cur)))

(defun ask-user ()
  (do ((input nil (read)))
      ((equal input 'q))   ; quit when 'q' is entered
    (if input
        (print (+ 2 input)))))

(defun prompt-with-function (f)
  (do ((input nil (read)))
      ((equal input 'q))
    (if input
        (print (funcall f input)))))

(defun sq (x)
  (* x x))

(defun repeat-symbol (s)
  (let ((name (symbol-name s)))
    (concatenate 'string name name)))
