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

%8
readList(N,L):-rList(N,0,[],L).
rList(N,N,L,L):-!.
rList(N,I,CurL,L):-I1 is I+1, read(X),append(CurL,[X],CurL1),rList(N,I1,CurL1,L).

min(X,Y,X):-X<Y,!.
min(_,Y,Y):-!.

min_list_down([H|T],Min):-min_l_d([H|T],H,Min).
min_l_d([],Min,Min):-!.
min_l_d([H|T],Tec,Min):-min(Tec,H,Tec1),min_l_d(T,Tec1,Min).

read_min_elem_list(N):-
    write("List: "),readList(N,List),nl,
    write("Min elem = "),min_list_down(List,X),
    write(X),nl,false.

%9
elem([X,_],X):-!.
elem([_|T],X):-elem(T,X).

%10
reverse(L,X):-rev(L,[],X).
rev([],X,X):-!.
rev([H|T],CurL,X):-rev(T,[H|CurL],X).

%11
ravenstvo([H],[H|_]):-!.
ravenstvo([H|_],[H]):-!.
ravenstvo([H|T],[H1|T1]):- H is H1 ,ravenstvo(T,T1).
sravn([H|T],[H1|T1]):-ravenstvo([H|T],[H1|T1]).
sravn([H|T],[_|T1]):-sravn([H|T],T1).

%12
delet_num([_|T],0,T):-!.
delet_num([H|T],N,[H|T1]):-N1 is N-1,delet_num(T,N1,T1).

%13
delet_all([],_,[]):-!.
delet_all([H|T],El,[H|T1]):-H=\=El,delet_all(T,El,T1),!.
delet_all([_|T],El,T1):-delet_all(T,El,T1).

%14
check_is(_,[]):-!.
check_is(X,[H|T]):- X =\= H,check_is(X,T).
check([H|T]):-check_is(H,T),check(T).
check([]):-!.

