;;;; Ch. 9

;;; from Ch. 8
(defmacro with-gensyms ((&rest names) &body body)
  `(let ,(loop for n in names collect `(,n (gensym)))
     ,@body))

(defvar *test-name* nil)

(defmacro deftest (name parameters &body body)
  `(defun ,name ,parameters
     (let ((*test-name* (append *test-name* (list ',name))))
       ,@body)))

(defmacro check (&body forms)
  `(combine-results
    ,@(loop for f in forms collect `(report-result ,f ',f))))

(defmacro combine-results (&body forms)
  (with-gensyms (result)
    `(let ((,result t))
       ,@(loop for f in forms collect `(unless ,f (setf ,result nil)))
       ,result)))

(defun report-result (result form)
  (format t "~:[FAIL~;pass~] ... ~a: ~a~%" result *test-name* form)
  result)

;;;; usage

(deftest test-+ ()
  (check
   (= (+ 1 2) 3)
   ;; (= (+ 1 1) 11)
   (= (+ -1 -5) -6)))

(deftest test-* ()
  (check
   (= (* 1 0) 0)
   (= (* 2 3) 6)))

(deftest test-arithmetic ()
  (combine-results
   (test-+)
   (test-*)))

(deftest test-compare ()
  (check
   (> 1 0)))

(deftest test-all ()
  (combine-results
   (test-arithmetic)
   (test-compare)
   (check
    (= (- 1 1) 0))))

