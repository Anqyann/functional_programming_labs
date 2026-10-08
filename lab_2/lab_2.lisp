#|
lab_2:
- Author: annaidolova
- Date: 2026-10-05
|#

#|Пункт 1|#
#|
Написати функцію remove-seconds-and-reverse , яка видаляє зі списку кожен
другий елемент і обертає результат у зворотному порядку.
|#

(defun remove-seconds-and-reverse-aux (lst res)
  (cond
    ((null lst) res)
    ((null (cdr lst)) (cons (car lst) res))
    (t (remove-seconds-and-reverse-aux  (cdr (cdr lst)) (cons (car lst) res)))))

(defun remove-seconds-and-reverse (lst)
  (remove-seconds-and-reverse-aux lst nil))


(defun check-remove (name input expected)
  (format t "~:[FAILED~;passed~]... ~a~%"
          (equal (remove-seconds-and-reverse input) expected)
          name))

(defun test-remove-seconds-and-reverse ()
  (check-remove "test 1" '(1 2 a b 3 4 d) '(d 3 a 1))
  (check-remove "test 2" nil nil)
  (check-remove "test 3" '(1) '(1))
  (check-remove "test 4" '(a b c d) '(c a))
  (check-remove "test 5" '(1 2) '(1)))

#|Пункт 2|#
#|
Написати функцію list-set-difference , яка визначає різницю двох множин,
заданих списками атомів.
|#
(defun is-in-list (elem lst)
  (cond
    ((null lst) nil)
    ((eql (car lst) elem) t)
    (t (is-in-list elem (cdr lst)))))

(defun list-set-difference (set1 set2)
  (cond
    ((null set1) nil)
    ((is-in-list (car set1) set2)
     (list-set-difference (cdr set1) set2))
    (t
     (cons (car set1) (list-set-difference (cdr set1) set2)))))

(defun check-difference (name set1 set2 expected)
  (format t "~:[FAILED~;passed~]... ~a~%"
          (equal (list-set-difference set1 set2) expected)
          name))

(defun test-list-set-difference ()
  (check-difference "test 1" '(1 2 3 4) '(3 4 5 6) '(1 2))

  (check-difference "test 2" '(1 2) '(1 2) nil)

  (check-difference "test 3" nil '(1 2) nil)

  (check-difference "test 4" '(1 2) '(3 4) '(1 2)))