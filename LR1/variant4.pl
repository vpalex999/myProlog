/*
Вариант 4
1. Напишите предикат p(+X, +N, +V, -L) - истинный тогда и только тогда,
когда список L получается после добавления X на N-еместо в список V. 

addinposition(a,0,[b,c],L).
L = [b,c].

addinposition(a,1,[b,c],L).
L = [a,b,c].

addinposition(a,2,[b,c],L).
L = [b,a,c].

addinposition(a,3,[b,c],L). 
L = [b,c,a].

addinposition(a,4,[b,c],L). % позиции 3 - нет в списке.
false.

*/


addinposition(_,0,L,L).     %указана 0 позиция или конец цикла

addinposition(X,N,V,L):-       
    % addinposition(X,N,Count,V,L1,L) ; где Count - счётчик итераций
    %Count is 1,
    addinposition(X,N,1,V,[],L1),   % переотределяем, выставляем счётчик = 1
    %N =< Count,
    реверс(L1,L).


addinposition(_,_,_,[],L,L).        % Условие выхода из списка N=0(сброшена позиция и V - пустой)


addinposition(X,N,Count,[H|V],L1,L):-   % Если текущая итерация не на позиции N,
    
    N \= Count,                         % не на позиции N, 
    Count1 is Count + 1,                % увеличить счетчик итераций
    addinposition(X,N,Count1,V,[H|L1],L). % забираем голову из списка V, и идем дальше

addinposition(X,N,Count,V,L1,L):-   % Если текущая итерация  
    N =:= Count,                    % на позиции N,
                                      % сбрасываем N=0. (как отработанный)
    Count1 is Count +1,             % увеличить счетчик итераций
    addinposition(X,N,Count1,V,[X|L1],L).  % то добавляем X в текущую позицию




% вспомогательная функция - реверс списка.
реверс([],[]).

реверс(L1,L):-
    реверс(L1,[],L).

реверс([],L,L).

реверс([H|L1],L2,L):-
    реверс(L1, [H|L2],L).


/*
2. Напишите предикат p(+N, +V, -L) - истинный тогда и только тогда,
когда список L получается после удаления N-гоэлемента из списка V. 
*/

delinposition(N,V,L):-
    addinposition(_,N,L,V).