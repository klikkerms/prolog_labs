%1
writeList([]):-!.
writeList([H|T]):-write(H),write(" "),writeList(T).

readList(N,L):-rList(N,0,[],L).
rList(N,N,L,L):-!.
rList(N,I,CurL,L):-I1 is I+1, read(X),append(CurL,[X],CurL1),rList(N,I1,CurL1,L).

%2
readList(N,L):-rList(N,0,[],L).
rList(N,N,L,L):-!.
rList(N,I,CurL,L):-I1 is I+1, read(X),append(CurL,[X],CurL1),rList(N,I1,CurL1,L).

sum_list_down(List,Sum):-sListD(List,0,Sum).
sListD([],Sum,Sum):-!.
sListD([H|L],CurSum,Sum):-CurSum1 is CurSum + H, sListD(L,CurSum1,Sum).

read_sum_list(N):-
    readList(N,L),
    sum_list_down(L,Sum),
    nl, write("Sum = "),write(Sum),nl,fail.

%3
readList(N,L):-rList(N,0,[],L).
rList(N,N,L,L):-!.
rList(N,I,CurL,L):-I1 is I+1, read(X),append(CurL,[X],CurL1),rList(N,I1,CurL1,L).

sum_list_up([],0):-!.
sum_list_up([H|List],Sum):-sumListUp(List,SumNew),Sum is SumNew + H.

read_sum_List(N):-
    readList(N,L),
    sum_list_up(L,Sum),
    nl, write("Sum = "),write(Sum),nl,fail.

%4
list_el_numb([H|_],H,0):-!.
list_el_numb([_|List],Elem,Numb):-list_el_numb(List,Elem,NewNumb),Numb is NewNumb+1.


readList(N,L):-rList(N,0,[],L).
rList(N,N,L,L):-!.
rList(N,I,CurL,L):-I1 is I+1, read(X),append(CurL,[X],CurL1),rList(N,I1,CurL1,L).

list_el_numb([H|_],H,0):-!.
list_el_numb([_|List],Elem,Numb):-list_el_numb(List,Elem,NewNumb),Numb is NewNumb+1.

read_list_el(N):-
    write("List: "),readList(N,List),nl,
    write("Element: "),read(Elem),nl,
    write("Number: "),list_el_numb(List,Elem,X),
    write(X),nl,false.

%5
readList(N,L):-rList(N,0,[],L).
rList(N,N,L,L):-!.
rList(N,I,CurL,L):-I1 is I+1, read(X),append(CurL,[X],CurL1),rList(N,I1,CurL1,L).

list_el_numb([H|_],H,0):-!.
list_el_numb([_|List],Elem,Numb):-list_el_numb(List,Elem,NewNumb),Numb is NewNumb+1.

read_list_el(N):-
    write("List: "),readList(N,List),nl,
    write("Number: "),read(Numb),nl,
    write("Element: "),list_el_numb(List,X,Numb),
    write(X),nl,false.

%6
min(X,Y,X):-X<Y,!.
min(_,Y,Y):-!.

min_list_up([H],H):-!.
min_list_up([H|T],Min):-min_list_up(T,Min1),min(H,Min1,Min).


%7
min(X,Y,X):-X<Y,!.
min(_,Y,Y):-!.

min_list_down([H|T],Min):-min_l_d([H|T],H,Min).
min_l_d([],Min,Min):-!.
min_l_d([H|T],Tec,Min):-min(Tec,H,Tec1),min_l_d(T,Tec1,Min).


