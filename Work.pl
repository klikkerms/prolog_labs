max(X,Y,Z):-X>Y,Z is X,!.
max(_,Y,Y):-!.


max(X,Y,Z,U):-max(X,Y,R),max(R,Z,U).

fact(1,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is X1*N.
