#|
lab_1:
- Author: annaidolova
- Date: 2026-09-21
|#

#|Пункт 1|#
(set 'my_list (list 'a 4 (* 2 31) NIL (cons 'b (list 7)) ))

#|Пункт 2|#
(car my_list)

#|Пункт 3|#
(cdr my_list)

#|Пункт 4|#
(third my_list)

#|Пункт 5|#
(car(last my_list))

#|Пункт 6|#
(atom (first my_list))
(atom (nth 3 my_list))
(atom (car(last my_list)))

(listp (first my_list))
(listp (nth 4 my_list))
(listp (car(last my_list)))

#|Пункт 7|#
(evenp (second my_list))
(plusp (third my_list))
(= (third my_list) (second my_list))
(boundp (car my_list))

#|Пункт 8|#
(append my_list (nth 4 my_list))

#|Завдання варіанта 4|#

(let ((list_a (list 'a)))
  (list (cons 1 list_a)
      (cons 2 list_a)
      (cons 3 list_a)
      'c))

