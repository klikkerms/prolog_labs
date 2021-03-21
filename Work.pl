max(X,Y,Z):-X>Y,Z is X,!.
max(_,Y,Y):-!.


max(X,Y,Z,U):-max(X,Y,R),max(R,Z,U).
