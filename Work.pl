max(X,Y,Z):-X>Y,Z is X,!.%1
max(_,Y,Y):-!.


max(X,Y,Z,U):-max(X,Y,R),max(R,Z,U).%2

fact(1,1):-!.%3
fact(N,X):-N1 is N-1,fact(N1,X1),X is X1*N.

fact(N,X):-factorial(N,X,1).%4
factorial(1,X,X):-!.
factorial(N,X,X1):-N1 is N-1,X2 is X1*N,factorial(N1,X,X2).

fib(1,1):-!.%5
fib(2,1):-!.
fib(N,X):-N1 is N-1,N2 is N-2,fib(N1,X1),fib(N2,X2),X is X1+X2.

fibonach(N,N,X,_,X):-!.%6
fibonach(N,N_nac,Xt,Cur_x,X):-N_nac1 is N_nac+1,Xt1 is Xt + Cur_x,fibonach(N,N_nac1,Xt1,Xt,X).
fib1(N,X):-fibonach(N,1,1,0,X).

sum(X,S):- 0 is X div 10,S=X,!.%7
sum(X,S):-X_1 is X div 10,sum(X_1,S_1),S is S_1+X mod 10.


szsum(0,RES,RES):-!.
szsum(N,RES,Sum):-Mod is N mod 10,N1 is N div 10,EZ is RES + Mod,szsum(N1,EZ,Sum).
ezsum(N,Sum):-szsum(N,0,Sum).


max(Max,Max):-Max div 10 =:= 0,!.
max(N,Max):-Max2 is N mod 10, N1 is N div 10,max(N1,Max1),(Max1>Max2 -> Max is Max1;Max is Max2).

maximum(0,CosMax,CosMax):-!.
maximum(N,RES,Max):-MAKZ is N mod 10,N1 is N div 10,(MAKZ>RES -> MAXI is MAKZ;MAXI is RES), maximum(N1,MAXI,Max).
ezmax(N,Max):-maximum(N,0,Max).

min(X,Y,Z):-X<Y,Z is X,!.
min(_,Y,Z):-Z is Y,!.
nod1(N1,N1,N1):-!.
nod1(N1,N2,Nod):-max(N1,N2,Max),min(N1,N2,Min),M is Max-Min,((N1 =Max,nod1(M,N2,Nod),!);(nod1(N1,M,Nod),!)).



%12
nod(N,N,N):-!.
nod(N,M,X):-N>M, N1 is N-M,nod(N1,M,X),!.
nod(N,M,X):-N<M, M1 is M-N,nod(N,M1,X),!.

prost(1):-!.
prost(2):-!.
prost(N):-N>0,prost(N,2),!.
prost(N,N):-!.
prost(N,M):-0 is N mod M,!,fail.
prost(N,M):-M1 is M+1,prost(N,M1),!.

kol_del(N,X):-N1 is N div 2,kol_del(N,N1,X1),X is X1+1,!.
kol_del(_,0,0):-!.
kol_del(N,M,X):-M1 is M-1,C is N mod M,kol_del(N,M1,X1),(C=0,X is X1+1;C\=0,X is X1),!.

%11
d11(0,0):-!.
d11(X,K):-X1 is X div 10,d11(X1,K1),0 is (X mod 10) mod 3,K is K1+(X mod 10).
d11(X,K1):-X1 is X div 10,d11(X1,K1).
