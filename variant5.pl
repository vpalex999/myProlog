/*
Вариант 5
1. Напишите предикат p(+V,-L) - истинный тогда и только тогда,
когда список L получается после удаления всех повторных вхождений элементов в список V,
например, p([a, b, c, d, d, a], [a, b, c, d]) - истина. 

тесты:
p([],L).
L = [].

p([a],L).
L = [a].

p([a,a],L).
L = [a].

*/

p([],[]).

p(V,L):-
    p(V,[],L1),
    реверс(L1,L).

p([],L,L).

p([H|V],L1,L):-
    not(входитвсписок(H,L1)),
    p(V,[H|L1],L).

p([H|V],L1,L):-
    входитвсписок(H,L1),
    p(V,L1,L).





/*
входитвсписок(X,L)

входитвсписок(a,[]).
false.

входитвсписок(a,[b,c]).
false.

входитвсписок(a,[a]).
true.

входитвсписок(a,[d,c,a]).
true.

*/

% ф-я проверки элемента на вхождение в список.
входитвсписок(X,[X|_]).     % X входит в список
входитвсписок(X,[Y|L]):-    % Х не входит в список
    входитвсписок(X,L).     % уходим в цикл

% вспомогательная функция - реверс списка.
реверс([],[]).

реверс(L1,L):-
    реверс(L1,[],L).

реверс([],L,L).

реверс([H|L1],L2,L):-
    реверс(L1, [H|L2],L).


/*
2. Напишите предикат p(+V,-L) - истинный тогда и только тогда,
когда список L получается после удаления из списка V всех элементов, стоящих на четных местах,
например, p([1, 2, 3, 4, 5, 6], [1, 3, 5]) - истина. 

p([],L).
L = [].

p([1, 2, 3, 4, 5, 6], L).
L =  [1, 3, 5].

*/

p2([],[]).

p2(V,L):-
    p2(V,1,[],L1),
    реверс(L1,L).

p2([],_,L,L).

p2([H|V],Count,L1,L):-
    Mod is (Count mod 2),
    Mod \= 0,
    Count1 is Count + 1,
    p2(V,Count1,[H|L1],L).

p2([_|V],Count,L1,L):-
    Mod is (Count mod 2),
    Mod =:= 0,
    Count1 is Count + 1,
    p2(V,Count1,L1,L).

