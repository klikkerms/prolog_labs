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

grand_pa(X,Y):-parent(Z,Y),parent(X,Z),man(X).
grand_so(X,Y):-parent(Z,X),parent(Y,Z),man(X).
grand_pa_and_son(X,Y):-grand_pa(X,Y),man(Y);grand_pa(Y,X),man(X).
