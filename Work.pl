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
parent(maria,igor).
parent(maria,semyon).

parent(grisha,maria).
parent(grisha,vitya).
parent(grisha,stepa).
parent(diana,maria).
parent(diana,vitya).
parent(diana,stepa).


parent(sasha,anya).
parent(sasha,ksenya).
parent(sasha,roma).
parent(alina,anya).
parent(alina,ksenya).
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
