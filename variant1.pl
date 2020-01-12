/*

1. Определите возведение в целую степень через умножение и деление.

Проверка:

встепень(2,0,REZ).
REZ = 1.

встепень(2,3,REZ).
REZ = 8.

встепень(2,-3,REZ).
REZ = 0.125.


2. Напишите предикат p(+L, -N) - истинный тогда и только тогда, когда N -
предпоследний элемент списка L, имеющего не менее двух элементов. 

Проверка:
p([1,2],N).
N = 1.

p([1,2,3],N).
N = 2.

p([1],N).
false

p([],N).
false.
*/

% список

p([H|T],N):-
    p(T,H,_, N).

p([H|T],HEAD,_,N):-
    p(T,H,HEAD,N).

p([],_,PREV,N):-
    nonvar(PREV),
    p1([],PREV,N).

p1([],N,N).

% Задача 1
% проверка возведения в 0 степень, всегда возвращаем = 1.
встепень(_,0,1).                     

% степень - положительное число
встепень(NUM,LEVEL,REZ):-           
    LEVEL > 0,
    LEVEL1 is LEVEL -1,
    встепень(NUM,LEVEL1, REZ1),
    REZ is REZ1 * NUM.


% степень - отрицательное число
встепень(NUM, LEVEL,REZ):-
    LEVEL < 0,
    LEVEL1 is LEVEL +1,
    встепень(NUM, LEVEL1, REZ1),
    REZ is REZ1/NUM.


% конец рекурсии
встепень(NUM,LEVEL,_):-
    LEVEL =:= 0,
    встепень(NUM,_,NUM).