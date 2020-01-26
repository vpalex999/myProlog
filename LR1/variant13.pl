/*
Вариант 13
1. Напишите новую версию предиката length(+L, -N), в котором при подсчете количества элементов списка 
не учитывается пустой список.
К примеру, для списка    [a,b,c,d,e]  новая версия процедуры должна сообщить,
что длина списка равна пяти, а для списка  [a,[],c,d,[]]  эта процедура должна давать длину, 
равную трем. 

тесты:
length([],N).
N = 0.

length([a,b,c,d,e],N).
N = 5.

length([a,[],c,d,[]],N).
N = 3.


*/

mylength([],0).

mylength([H|L],N):-
    atom(H),
    mylength(L,N1),
    N is N1 + 1.


mylength([H|L],N):-
    \+(atom(H)),
    mylength(L,N).


/*
2. Пусть имеется список структур "client": [client(a,29,3),client(b,29,6),client(c,40,2)]. 
Первым аргументом каждой структуры служит имя клиента, 
вторым - суточный тариф, а третьим  -  количество дней, на которое взята автомашина. 
Напишите правило, позволяющее вычислить итоговую сумму оплаты, 
объединяющую выплаты всех клиентов, данные о которых содержатся в списке.

тест:
"client": [client(a,29,3),client(b,29,6),client(c,40,2)].

*/

'client'([client(a,29,3),client(b,29,6),client(c,40,2)]).

summclient(client(_,Tariff,Days),Summ):-
    Summ is Tariff * Days.

totalsumm([],0).
totalsumm([Client|L], TotalSumm):-
    summclient(Client, Summ),
    totalsumm(L, OtherSumm),
    TotalSumm is Summ + OtherSumm.