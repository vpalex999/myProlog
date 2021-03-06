/*
Вариант 14
1. Опишите процедуру для предиката расщепить/4, которая берет список целых чисел L1
и целое число N и выдает списки L2 и L3 такие, что числа из исходного списка, 
меньшие, чем N, помещаются в список L2, а остальные - всписок L3.

расщепить(L1,N,L2,L3).

тест:
расщепить([1,2],2,L1,L2).
L1 = [1].
L2 = [2].

*/

расщепить([],_,[],[]).
расщепить([H|T],N,[H|L1],L2):-
    H < N,
    расщепить(T,N,L1,L2).


расщепить([H|T],N,L1,[H|L2]):-
    расщепить(T,N,L1,L2).


/*
2. Напишите предикат для вычисления чисел Фибоначчи, используя метод накапливающего параметра.
*/