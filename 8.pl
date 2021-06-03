write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

read_list_str(List):-read_str(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
read_str(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

get_word_space(Str,Word,Str2):-get_word_space(Str,[],Word,Str2).
get_word_space([],Word,Word,[]).
get_word_space([H|T],Word,Word,T):-H=32,!.
get_word_space([H|T],Word,Word1,Str2):-append(Word,[H],Word2),get_word_space(T,Word2,Word1,Str2).

%1.1
prlongest:- see('C:/Users/Rozz/Desktop/Roma/1.txt'), read_list_str(_, LengthList),
seen, max(LengthList, Max), write(Max).

read_list_str(List, LengthList):-read_str(A,N,Flag),read_list_str([A],List,[N],LengthList,Flag).
read_list_str(List,List,LengthList, LengthList,1):-!.
read_list_str(Cur_list,List,CurLengthList,LengthList,0):-
read_str(A,N,Flag),append(Cur_list,[A],C_l),append(CurLengthList, [N], NewLengthList),read_list_str(C_l,List,NewLengthList,LengthList,Flag).

max(List, MaxEl):- max(List, 0, MaxEl).
max([],CurMax, CurMax):- !.
max([H|T], CurMax, X):- H > CurMax, NewMax is H, max(T,NewMax,X), !.
max([_|T], CurMax, X):- max(T, CurMax, X).

%1.2
prno_spaces:- see('C:/Users/Rozz/Desktop/Roma/1.txt'), read_list_str_space(_, C),
seen, write("C = "), write(C).

read_str_symbol(A,Count,S,Flag):- get0(X), r_str_symbol(X,A,[],Count,0,S,Flag).
r_str_symbol(-1,A,A,Count,Count,_,1):-!.
r_str_symbol(10,A,A,Count,Count,_,0):-!.
r_str_symbol(X,A,B,Count,C,S,Flag):- append(B,[X],B1), get0(X1),
(X = S -> C1 is C+1; C1 is C), r_str_symbol(X1,A,B1,Count,C1,S,Flag).

read_list_str_space(List, C):- read_str_symbol(A,Count,32,Flag),
(Count = 0 -> C1 = 1; C1 = 0), read_list_str_space([A],List,C1,C,Flag).

read_list_str_space(List,List,C,C,1):-!.

read_list_str_space(Cur_list,List,CurC,C,0):-
read_str_symbol(A,Count,32,Flag), append(Cur_list,[A],C_l),
(Count = 0 -> C1 is CurC+1; C1 is CurC),
read_list_str_space(C_l,List,C1,C,Flag).

%1.3
prmore_than_A:- see('C:/Users/Rozz/Desktop/Roma/1.txt'), count_A(_,N,C), M is C/N,
seen, see('C:/Users/Rozz/Desktop/Roma/1.txt'), read_list_str_A(_,M), seen.

count_A(List,N,C):- read_str_symbol(_,Count,65,Flag),
N1 = 1, count_A(List,N1,N,Count,C,Flag).
count_A(_,N,N,C,C,1):-!.
count_A(List,CurN,N,CurC,C,0):- read_str_symbol(_,Count,65,Flag),
C1 is CurC + Count, N1 is CurN + 1,
count_A(List,N1,N,C1,C,Flag).

read_list_str_A(List, M):- read_str_symbol(A,Count,65,Flag),
(Count > M -> write_str(A), nl; true), read_list_str_A(List,M,Flag).

read_list_str_A(_,_,1):-!.

read_list_str_A(List,M,0):-
read_str_symbol(A,Count,65,Flag), (Count > M -> write_str(A),nl; true),
read_list_str_A(List,M,Flag).
%1.4
prfrequent:- see('C:/Users/Rozz/Desktop/Roma/1.txt'), read_list_str1(List), seen,
freq_word(List,Freq_word), (Freq_word\=[] -> write("Word = "), write_str(Freq_word); false).

read_list_str1(List):- read_str(A,_,Flag), append(A,[32],L),
read_list_str1(L,List,Flag).
read_list_str1(List,List,1):-!.
read_list_str1(Cur_list,List,0):-
read_str(A,_,Flag), append(Cur_list,A,C_l), append(C_l,[32],L),
read_list_str1(L,List,Flag).

in_list(_,El):-!.
in_list([_|T],El):-in_list(T,El).


get_word([],[]):- !.
get_word([32|_],[]):- !.
get_word([H|T1],[H|T2]):- H\=32, get_word(T1,T2),!.



num_word([],_,I,I):-!.
num_word([32|T],Word,I,C):- delete_space(T,List),
num_word(List,Word,I,C), !.
num_word(List,Word,I,C):- get_word(List,W), delete_fword(List,L),
(W = Word -> I1 is I+1; I1 is I), num_word(L,Word,I1,C).

append_list([],List2,List2).
 
append_list([H|T1],List2,[H|T2]):- append_list(T1,List2,T2).

delete_space([32|T],List):- delete_space(T,List),!.
delete_space(List,List).


delete_fword([],[]):-!.
delete_fword([H|T1],List):- H\=32, delete_fword(T1,List),!.
delete_fword([32|T],T):-!.



freq_word(List,Freq_word):- delete_space(List,L), append_list(L,[32],Source_list),
freq_word(Source_list,Source_list,[],0,Freq_word).
freq_word(_,[],Word,_,Word):-!.
freq_word(Source_list,Changing_list,Current_word,Num,Freq_word):-
get_word(Changing_list,Cur), num_word(Source_list,Cur,0,I),
delete_fword(Changing_list, List), delete_space(List,Changed_list),
(I > Num -> freq_word(Source_list,Changed_list,Cur,I,Freq_word);
freq_word(Source_list,Changed_list,Current_word,Num,Freq_word)).

%1.5
prnot_repeat:- see('C:/Users/Rozz/Desktop/Roma/1.txt'), read_list_str1(List), seen,
unique_words(List,List,[],R), see('C:/Users/Rozz/Desktop/Roma/1.txt'),
read_list_str2(_,R,ResList), seen, tell('C:/Users/Rozz/Desktop/Roma/2.txt'),
write_list_str(ResList),told.

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

read_list_str2(_,UniqList,ResList):- read_str(A,_,Flag), append(A,[32],L),
(check_unique(L,UniqList) -> read_list_str2([A],UniqList,ResList,Flag);
read_list_str2([],UniqList,ResList,Flag)).

read_list_str2(List,_,List,1):-!.
read_list_str2(Cur_list,UniqList,List,0):- read_str(A,_,Flag), append(A,[32],L),
(check_unique(L,UniqList) -> append(Cur_list,[A],C_l); append(Cur_list,[],C_l)),
read_list_str2(C_l,UniqList,List,Flag).

unique_words(_,[],L,L):-!.
unique_words(List,CurList,L,R):- delete_space(CurList,List1), get_word(List1, Word),
delete_fword(List1,L2), num_word(List,Word,0,Number),
(Number = 1 -> append(L,[Word],L1); L1 = L), unique_words(List,L2,L1,R).

check_unique([],_):-!.
check_unique(List,UniqList):- delete_space(List,List1), get_word(List1,Word),
in_list(UniqList,Word), delete_fword(List1,L), check_unique(L,UniqList).


