;; a simple script that reads an email prefix and prints a complete email

#|
; (defmacro my-for (start end)
;   (when 
|#

(defparameter *my-data* '("foo" "bar"))

;(with-open-file (my-stream "input-list" :direction :input)
;  (print my-stream))

(defun email-expander (domain prefix &key target-stream)
  "reformats an email to contain a given domain"
  (princ (concatenate 'string prefix domain) target-stream)
  (terpri target-stream))

(defun mass-email-expander (domain prefix-list &key output-stream)
  "format a bunch of emails to the same domain"
  (with-open-file (my-stream output-stream :direction :output)
    (loop for i
       from 0
       do (email-expander domain (nth i prefix-list) :target-stream my-stream)
       until (= i (1- (length prefix-list))))))
