/*
Правило 1: если X < 3, то Y = 0
Правило 2: если 3 ≤ X и X < 6, то Y = 2
Правило 3: если 6 ≤ X, то Y = 4
*/

f(X,0):-
    X < 3, !.

f(X,2):-
   X < 6, !.

f(X,4).

% 5.2.1.  Вычисление максимума
mymax(X,Y,X):-
    X >= Y, !.

mymax(X,Y,Y).


% 5.2.2. Процедура проверки принадлежности списку, дающая единственное решение
% принадлежит(X,L)

принадлежит(X,[X|L]):- !.
принадлежит(X,[Y|L]):-
    принадлежит(X,L).

%   5.2.3. Добавление элемента к списку, если он в нем отсутствует (добавление без дублирования)
%   добавить(X,L,L1).


добавить(X,L,L):-
    принадлежит(X,L),!.

добавить(X,L,[X|L]).

%   5.2.4. Задача классификации объектов
/*
отношение класс( Игрок, Категория)
победитель — любой игрок, победивший во всех сыгранных им играх
боец — любой игрок, в некоторых играх победивший, а в некоторых проигравший
спортсмен — любой игрок, проигравший во всех сыгранных им партиях
*/

победил(том, джон).
победил(энн, том).
победил(пат, джим).


класс(Х,боец):-
    победил(Х,_),
    победил(_,Х),!.

класс(Х,победитель):-
    победил(Х,_),!.

класс(Х,спортсмен):-
    победил(_,Х).


/*
5.1. Пусть есть программа:

p( 1).
p( 2) :- !.
p( 3).

Напишите все ответы пролог-системы на следующие вопросы:
(a) ?- p( X).
(b) ?- p( X), p(Y).
(c) ?- p( X), !, p(Y).
*/

p(1).
p(2):- !.
p(3).

/*
5.2. Следующие отношения распределяют числа на три класса - положительные, нуль и отрицательные:

класс( Число, положительные) :- Число > 0.

класс( 0, нуль).

класс( Число, отрицательные) :- Число < 0.

Сделайте эту процедуру более эффективной при помощи отсечений.
*/

класс_ч(Число, положительные):-
    Число > 0, !.

класс_ч(0, нуль):- !.

класс_ч(_, отрицательные).

/*
5.3. Определите процедуру

разбить( Числа, Положительные, Отрицательные)
которая разбивает список чисел на два списка: список, содержащий положительные числа (и нуль), и список отрицательных чисел.
Например: разбить( [3, -1, 0, 5, -2], [3, 0, 5], [-1, -2] )
Предложите две версии: одну с отсечением, другую — без.
*/

разбить([],[],[]).
разбить([H|L],[H|L1],L2):-
    H >= 0,!,
    разбить(L,L1,L2).

разбить([H|L],L1,[H|L2]):-
    разбить(L,L1,L2).

/*
5.4. Даны два списка Кандидаты и Исключенные,
напишите последовательность целей (используя принадлежит и not),
которая, при помощи перебора, найдет все элементы списка Кандидаты,
не входящие в список Исключенные.
*/