/*
Вариант 11
1. Используя предикаты
"родитель"(Родитель, Отпрыск),     
"женщина"(Человек),  
"мужчина"(Человек) и 
"супруги"(Жена, Муж), 
определите отношения теща, шурин и зять.

тест:
*/

родитель(олег, ирина).
родитель(дима, сергей).
родитель(лена, ирина).
родитель(света, сергей).
родитель(галя, лена).
родитель(галя, андрей).

женщина(лена).
женщина(света).
женщина(галя).


мужчина(олег).
мужчина(дима).
мужчина(андрей).

супруги(олег, лена).
супруги(дима, света).


тёща(X):-
    супруги(_,W),
    родитель(X,W),
    женщина(X).


шурин(Z):-
    супруги(_,W),
    родитель(X,W),
    родитель(X,Z),
    W \= Z,
    мужчина(Z).

зять(Z):-
    супруги(Z,W),
    родитель(X,W),
    женщина(X).

/*
2. Башня из кубиков может быть описана совокупностью фактов вида 
"на"(Кубик1, Кубик2), которые истинны, если Кубик1 поставлен на Кубик2. 
Определите предикат "выше"(Кубик1, Кубик2), который истинен, 
если Кубик1 расположен на башне выше, чем Кубик2.  
(Указание:  "выше" является транзитивным замыканием отношения "на".)

тест:

на(кубик2, кубик1).
на(кубик3, кубик2).

выше(кубик1, кубик3).
false.

выше(кубик1, кубик1).
false.
*/

на(кубик2, кубик1).
на(кубик3, кубик2).

выше(X,Y):-
    на(X,Y).

выше(X,Y):-
    на(Z,Y),
    на(X,Z).

