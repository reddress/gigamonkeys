(defun print-seq (times str)
  (dotimes (i times)
    (format t "iteration ~d ~a~%" (1+ i) str)))

(defun print-foreach (lst)
  (dolist (elt lst)
    (format t "element ~a~%" elt)))
