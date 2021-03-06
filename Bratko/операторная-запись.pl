
/*
инфиксная форма

(1) инфиксные операторы трех типов:

xfx xfy yfx

(2) префиксные операторы двух типов:

fx fy

(3) постфиксные операторы двух типов:

хf yf
*/

имеет(питер, информацию).

поддерживает(пол, стол).

:- op(600, xfx, имеет). % оператор f - распологается между аргументами x.

% питер имеет информацию.

/*
 ~ (А & В) <===> ~А v ~В

:- op(800, xfx, <===>).
:- op(700, xfy, &).
:- op(700, xfy, v).
:- op(500, fx, ~).

*/

/*
3.12. Если принять такие определения
:- op( 300, xfy, играет_в).
:- op( 200, xfy, и).

то два следующих терма представляют собой синтаксически правильные объекты:
Tepм1 = джимми играет_в футбол и сквош
Терм1 = сьюзан играет_в теннис и баскетбол и волейбол
Как эти термы интерпретируются пролог-системой? Каковы их главные функторы и какова их структура?
*/

рожд(Имя,Год):-
    Год >= 1950,
    Год =< 1960.

нод(X,X,X).
нод(X,Y,D):-
    X < Y,
    Y1 is Y - X,
    нод(X,Y1,D).

нод(X,Y,D):-
    Y < X,
    нод(Y,X,D).


длинна([],0).
длинна([_|L],N):-
    длинна(L,N1),
    N is N1 + 1.

/*
3.16. Определите отношение
mах( X, Y, Мах)
так, чтобы Мах равнялось наибольшому из двух чисел X и Y.
*/

mymax(X,Y,X):-
    X >= Y.

mymax(X,Y,Y):-
    X < Y.


/*
3.17. Определите предикат
максспис( Список, Мах)
так, чтобы Мах равнялось наибольшему из чисел, входящих в Список.
*/

maxlist([X], X).

maxlist([X,Y|L], N):-
    maxlist([Y|L],N1),
    X >=N1,
    N is X.

maxlist([X,Y|L], N):-
    maxlist([Y|L],N1),
    X < N1,
    N is N1.


/*
3.18. Определите предикат
сумспис( Список, Сумма)
так, чтобы Сумма равнялось сумме чисел, входящих в Список.
*/

mysummlist([],0).
mysummlist([X|L],N):-
    mysummlist(L,N1),
    N is X + N1.


/*
упорядоченный( Список)
который принимает значение истина,
если Список представляет собой упорядоченный список чисел.
Например: упорядоченный [1, 5, 6, 6, 9, 12] ).
*/

orderlist([X]).
orderlist([X,Y|L]):-
    X =< Y,
    orderlist([Y|L]).

/*
3.20. Определите предикат

подсумма( Множ, Сумма, ПодМнож)
где Множ это список чисел, Подмнож подмножество этих чисел, а сумма чисел из ПодМнож равна Сумма. Например:
?- подсумма( [1, 2, 5, 3, 2], 5, ПМ).
ПМ = [1, 2, 2];
ПМ = [2, 3];
ПМ = [5];
*/

undersumm([],0,[]).
undersumm([X|L1],N,[X|L2]):-
    N1 is N - X,
    undersumm(L1,N1,L2).

undersumm([X|L1],N,L2):-
    undersumm(L1,N,L2).


