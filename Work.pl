man(artem).
man(igor).
man(semyon).
man(misha).
man(oleg).
man(grisha).
man(vitya).
man(andrey).
man(sasha).
man(stepa).
man(vlad).
man(roma).

woman(marina).
woman(maria).
woman(nastya).
woman(diana).
woman(anya).
woman(milana).
woman(assol).
woman(alina).
woman(ksenia).

parent(artem,igor).
parent(artem,semyon).
parent(marina,igor).
parent(marina,semyon).

parent(grisha,maria).
parent(grisha,vitya).
parent(grisha,stepa).
parent(diana,maria).
parent(diana,vitya).
parent(diana,stepa).


parent(sasha,anya).
parent(sasha,ksenia).
parent(sasha,roma).
parent(alina,anya).
parent(alina,ksenia).
parent(alina,roma).

parent(semyon,misha).
parent(semyon,oleg).
parent(semyon,nastya).
parent(maria,misha).
parent(maria,oleg).
parent(maria,nastya).

parent(vitya,milana).
parent(vitya,andrey).
parent(vitya,assol).
parent(anya,milana).
parent(anya,andrey).
parent(anya,assol).

parent(stepa,vlad).
parent(ksenia,vlad).

man:-man(X),write(X),nl, fail.
woman:-woman(X),write(X),nl, fail.


children(X):-parent(X,Y),write(Y),nl,fail.

mother(X,Y):-parent(X,Y),woman(X).
mother(X):-mother(Y,X),write(Y),nl,fail.

son(X,Y):-parent(Y,X).
son(X):-parent(X,Y),man(Y),write(Y),nl,fail.

brother(X,Y):-man(X),parent(Z,X),woman(Z),parent(Z,Y).
brothers(X):-brother(Y,X),dif(X,Y),write(Y),nl,fail.

sister(X,Y):-woman(X),parent(Z,X),parent(Z,Y).
sisters(X):-sister(Y,X),dif(X,Y),write(Y),nl,fail.

b_s(X,Y):-parent(Z,X),woman(Z),parent(Z,Y).
b_s(X):-b_s(X,Y),dif(X,Y),write(Y),nl,fail.

father(X,Y):-parent(X,Y),man(X).
grand_pa(X,Y):-father(Z,Y),father(X,Z);mother(Z,Y),father(X,Z).
grand_pas(X):-grand_pa(Y,X),write(Y),nl,fail.



grand_so(X,Y):-parent(Z,X),parent(Y,Z),man(X).
grand_sons(X):-grand_so(Y,X),write(Y),nl,fail.

grand_pa_and_son(X,Y):-grand_pa(X,Y),man(Y);grand_pa(Y,X),man(X).

grand_pa_and_da(X,Y):-parent(X,Z),parent(Z,Y),woman(Y);parent(Y,Z),parent(Z,X),woman(X).


uncle(X,Y):-brother(X,Z),parent(Z,Y),dif(X,Z).
uncles(X):-parent(Y,X),brother(Z,Y),dif(Y,Z),write(Z),nl,fail.

aunt(X,Y):-parent(Z,Y),sister(X,Z),dif(Z,X).
aunt_all(X):-aunt(Y,X),write(Y),nl,fail.


