<p align="center"><b>МОНУ НТУУ КПІ ім. Ігоря Сікорського ФПМ СПіСКС</b></p>
<p align="center">
<b>Звіт з лабораторної роботи 3</b><br/>
"Функціональний і імперативний підходи до роботи зі списками"<br/>
дисципліни "Вступ до функціонального програмування"
</p>
<p align="right"><b>Студентка</b>: Ідолова А.П. група КВ-33</p>
<p align="right"><b>Рік</b>: 2026</p>

## Загальне завдання

Реалізуйте алгоритм сортування чисел у списку двома способами: функціонально і
імперативно.
1. Функціональний варіант реалізації має базуватись на використанні рекурсії і
конструюванні нових списків щоразу, коли необхідно виконати зміну вхідного
списку. Не допускається використання: псевдо-функцій, деструктивних операцій,
циклів . Також реалізована функція не має бути функціоналом (тобто приймати на
вхід функції в якості аргументів).
2. Імперативний варіант реалізації має базуватись на використанні циклів і
деструктивних функцій (псевдофункцій). Не допускається використання функцій
вищого порядку або функцій для роботи зі списками/послідовностями, що
використовуються як функції вищого порядку. Тим не менш, оригінальний список
цей варіант реалізації також не має змінювати, тому перед виконанням
деструктивних змін варто застосувати функцію 
copy-list (в разі необхідності).
Також реалізована функція не має бути функціоналом (тобто приймати на вхід
функції в якості аргументів).
Алгоритм, який необхідно реалізувати, задається варіантом (п. 3.1.1). Зміст і шаблон
звіту наведені в п. 3.2.
Кожна реалізована функція має бути протестована для різних тестових наборів. Тести
мають бути оформленні у вигляді модульних тестів (наприклад, як наведено у п. 2.3).
   
## Варіант 4
<p align="center">
<img src="lab_3_variant.png">
</p>

## Лістинг функції функціонального підходу
```lisp
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
```

### Тестові набори та утиліти
```lisp
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
```
### Тестування
```lisp
‌‌CL-USER>(test-insertion-sort-functional)
 
NIL

Standard output:
* passed... test 1
passed... test 2
passed... test 3
passed... test 4
passed... test 5
passed... test 6
passed... test 7
passed... test 8
```
## Лістинг функції імперативного підходу
```lisp
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

```
### Тестові набори та утиліти
```lisp
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
```
### Тестування
```lisp
‌‌‌‌CL-USER>(test-insertion-sort-imperative)
 
NIL

Standard output:
passed... test 1
passed... test 2
passed... test 3
passed... test 4
passed... test 5
passed... test 6
passed... test 7
passed... test 8

```