;;; factor an integer

(defun rem-is-zero (a b)
  (if (> b 1)
      (= 0 (rem a b))
      nil))

(defun first-divisor-do (n)
  (dotimes (i (1+ (floor (sqrt n))))
    (when (rem-is-zero n i)
      (return-from first-divisor-do i)))
  n)

(defun first-divisor-rec (n i)
  (if (rem-is-zero n i)
      i
      (first-divisor-rec n (1+ i))))

(defun first-divisor (n)
  (first-divisor-rec n 2))

(defun factor-accum (n factors)
  (if (= n 1) 
      factors
      (let ((new-factor (first-divisor n)))
        (factor-accum (/ n new-factor) (cons new-factor factors)))))

(defun factor (n)
  (factor-accum n ()))

(factor 120)

(apply #'* (factor 120))

(defun factor-do-as-while (n)
  (do* ((current-divisor (first-divisor n) (first-divisor current-value))
        (factors () (cons current-divisor factors))
        (current-value n (/ current-value current-divisor)))
       ((= current-value 1) (nreverse factors))))
    ;;; (format t "~d ~d ~a~%" current-divisor current-value factors)))
