#|
lab_3:
- Author: annaidolova
- Date: 2026-10-19
|#

#|
Варіант 4
Алгоритм сортування вставкою №1 (з лінійним пошуком зліва) за незменшенням
|#

#|Пункт 1|#
#|Функціональний варіант|#
(defun insert-sorted (item sorted)
  (cond
    ((null sorted) (list item))
    ((<= item (first sorted)) (cons item sorted))
    (t (cons (first sorted) (insert-sorted item (rest sorted))))))

(defun insertion-sort-functional (lst)
  (if (null lst)
      nil
      (insert-sorted (first lst)
                     (insertion-sort-functional (rest lst)))))


(defun check-functional (name input expected)
  (format t "~:[FAILED~;passed~]... ~a~%"
          (equal (insertion-sort-functional input) expected)
          name))

(defun test-insertion-sort-functional ()
  (check-functional "test 1" '(3 1 4 1 5 9 2 6) '(1 1 2 3 4 5 6 9))
  (check-functional "test 2" nil nil)
  (check-functional "test 3" '(5) '(5))
  (check-functional "test 4" '(1 2 3 4 5) '(1 2 3 4 5))
  (check-functional "test 5" '(5 4 3 2 1) '(1 2 3 4 5))
  (check-functional "test 6" '(2 2 2 1 1) '(1 1 2 2 2))
  (check-functional "test 7" '(0 -3 7 -10 2) '(-10 -3 0 2 7))
  (check-functional "test 8" '(2 1) '(1 2)))

#|Пункт 2|#
#|Імперативний  варіант|#

(defun insertion-sort-imperative (lst)
  (let ((a (copy-list lst))
        (n (length lst)))
    (do ((i 1 (+ i 1)))
        ((>= i n) a)
      (let ((b (nth i a)))
        (do ((j 0 (+ j 1)))
            ((not (> b (nth j a)))
             (do ((k (- i 1) (- k 1)))
                 ((< k j))
               (setf (nth (+ k 1) a) (nth k a)))
             (setf (nth j a) b)))))))


(defun check-imperative (name input expected)
  (let* ((input-copy (copy-list input))
         (result (insertion-sort-imperative input)))
    (format t "~:[FAILED~;passed~]... ~a~%"
            (and (equal result expected)
                 (equal input input-copy))
            name)))

(defun test-insertion-sort-imperative ()
  (check-imperative "test 1" '(3 1 4 1 5 9 2 6) '(1 1 2 3 4 5 6 9))
  (check-imperative "test 2" nil nil)
  (check-imperative "test 3" '(5) '(5))
  (check-imperative "test 4" '(1 2 3 4 5) '(1 2 3 4 5))
  (check-imperative "test 5" '(5 4 3 2 1) '(1 2 3 4 5))
  (check-imperative "test 6" '(2 2 2 1 1) '(1 1 2 2 2))
  (check-imperative "test 7" '(0 -3 7 -10 2) '(-10 -3 0 2 7))
  (check-imperative "test 8" '(2 1) '(1 2)))