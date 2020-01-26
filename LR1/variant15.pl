/*
Вариант 15

1. Напишите предикат digits(+N, -L) - истинный тогда и только тогда,
когда L - список цифр натурального числа N. 
*/

digits(N,L):-
    digits(N,[],L).

digits(0,L,L).

digits(N,L1,L):-
    N > 0, !,
    R is N mod 10,
    N2 is N // 10,
    digits(N2,[R|L1],L).

/*
2. Напишите предикат summa_digits(+N, -S) - истинный тогда и только тогда,
когда  S - сумма цифр натурального числа N
*/

summa_digits(0,0).

summa_digits(N,S):-
    N > 0, !,
    R is N mod 10,
    N2 is N // 10,
    summa_digits(N2,S2),
    S is S2 + R.