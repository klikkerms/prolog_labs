max(X,Y,Z):-X>Y,Z is X,!.
max(_,Y,Y):-!.


max(X,Y,Z,U):-max(X,Y,R),max(R,Z,U).

fact(1,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is X1*N.

fact(N,X):-factorial(N,X,1).
factorial(1,X,X):-!.
factorial(N,X,X1):-N1 is N-1,X2 is X1*N,factorial(N1,X,X2).

fib(1,1):-!.
fib(2,1):-!.
fib(N,X):-N1 is N-1,N2 is N-2,fib(N1,X1),fib(N2,X2),X is X1+X2.

fibonach(N,N,X,_,X):-!.
fibonach(N,N_nac,Xt,Cur_x,X):-N_nac1 is N_nac+1,Xt1 is Xt + Cur_x,fibonach(N,N_nac1,Xt1,Xt,X).
fib1(N,X):-fibonach(N,1,1,0,X).

sum(X,S):- 0 is X div 10,S=X,!.
sum(X,S):-X_1 is X div 10,sum(X_1,S_1),S is S_1+X mod 10.
