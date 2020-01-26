/*
Вариант 12
1. Напишите предикат gcd(+A,+B,-D) - истинный тогда и только тогда,
когда D -наибольший общий делитель двух целых положительных чисел A и B. 

тест:
gcd(5,5,D).
D = 5.

gcd(30,18,D).
D = 6
*/

gcd(A,B,D):-
    number(A),
    A > 0,
    number(B),
    B > 0,
    A =:= B,
    D is A.

gcd(A,B,D):-
    number(A),
    A > 0,
    number(B),
    B > 0,
    A >= B,
    A1 is A-B,
    gcd(A1,B,D).

gcd(A,B,D):-
    number(A),
    A > 0,
    number(B),
    B > 0,
    B1 is B -A,
    gcd(A,B1,D).


/*
2. Напишите программу для отношения double(+List, -ListList),
в котором каждый элемент списка List удваивается в списке ListList,
например, double([1,2,3],[1,1,2,2,3,3]) выполнено.

тест:
double([],ListList).
ListList = [].

double([1,2,3],ListList).
ListList = [1,1,2,2,3,3].
*/

double([],[]).

double(List, ListList):-
    double(List,[],ListList1),
    реверс(ListList1,ListList).

double([],L,L).

double([H|List], ListList1, ListList):-
    double(List,[H,H|ListList1],ListList).


% вспомогательная функция - реверс списка.
реверс([],[]).

реверс(L1,L):-
    реверс(L1,[],L).

реверс([],L,L).

реверс([H|L1],L2,L):-
    реверс(L1,[H|L2],L).
