/*
Вариант 8
1. Определите предикат p(+V,-L) - истинный тогда и только тогда,
когда L - список всех элементов списка V, встречающихся в нем более одного раза. 

тесты:

p([],L).
L = [].

p([1],L).
L = [],

p([1,1,2],L).
L = [1].

p([1,2,1,2,2],L).
L = [1,2].

*/

p([],[]).
p([_],[]).

p(V,L):-
    % p(V,L1,L2,L) 
    % - L1 - накапливает недублированные эл-ты списка V,
    % - L2 - накапливает дублированные эл-ты списка V
    p(V,[],[],L1),
    реверс(L1,L).

p([],_,L,L).        % граничное значение V, или условие конца цикла

p([H|V],L1,L2,L):-  % если H - повторяющийся эл-т. более двух раз.
    всписке(H,L2),  % и есть в списке дублируемых эл-тов L2
    p(V,L1,L2,L).   % пропускаем H

p([H|V],L1,L2,L):-      % если H - повторяющийся эл-т. два раза.
    всписке(H,L1),      % есть в списке недублируемых эл-тов L1
    p(V,L1,[H|L2],L).   % добавить H в список дублируемых эл-тов L2


p([H|V],L1,L2,L):-      % если H - не повторяющийся эл-т.
    \+(всписке(H,L1)),  % если нет в списке недублируемых эл-тов L1
    p(V,[H|L1],L2,L).   % добавть H в список недублируемых эл-тов. L1


% вспомогательная функция - проверка вхождения элемента в список
всписке(H,[H|_]).
всписке(H,[_|T]):-
    всписке(H,T).

% вспомогательная функция - реверс списка.
реверс([],[]).

реверс(L1,L):-
    реверс(L1,[],L).

реверс([],L,L).

реверс([H|L1],L2,L):-
    реверс(L1,[H|L2],L).


/*
2. Напишите предикат subst(+V, +X, +Y, -L) - истинный тогда и только тогда,
когда список L получается после замены всех вхождений элемента X всписке V на элемент Y.

тесты:

subst([],1,5,L).
L = []

subst([2],1,5,L).
L = [2]

subst([1],1,5,L).
L = [5]

subst([1,2,3],1,5,L).
L = [5,2,3]

subst([1,2,3,1,7,1],1,5,L).
L = [5,2,3,5,7,5]

*/

subst([],_,_,[]).

subst(V,X,Y,L):-
    subst(V,X,Y,[],L1),
    реверс(L1,L).

subst([],_,_,L,L).

subst([X|V],X,Y,L1,L):-
    subst(V,X,Y,[Y|L1],L).

subst([H|V],X,Y,L1,L):-
    subst(V,X,Y,[H|L1],L).


