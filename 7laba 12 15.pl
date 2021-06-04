
read_stroka_neopr(A):-get0(X), stroka_neopr(X,A,[]).
stroka_neopr(10,A,A):-!.
stroka_neopr(X,A,B) :- append(B,[X],B1), get0(X1),stroka_neopr(X1,A,B1).

write_stroka([]):-!.
write_stroka([H|T]):- put(H),write_stroka(T).

count_elem([],Kol,Kol):- !.
count_elem([_|T],KKol,Kol):- KKol1 is KKol + 1, count_elem(T,KKol1,Kol).
count_elem(Spis,Kol):- count_elem(Spis,0,Kol).

nomer1 :- write("Vvedite stroky:"),read_stroka_neopr(S),
          write_stroka(S),write(","),write_stroka(S), write(","),
          write_stroka(S),nl,write("Kolvo elem: "),
          count_elem(S, Kol),write(Kol).



%12
spisok_doN(_,N,N,Str,Str):- !.
spisok_doN([H|T],NN,N,SStr,NStr):- append(SStr,[H],SStr1),NN1 is  NN+1,
           spisok_doN(T,NN1,N,SStr1,NStr).
spisok_doN(Str,N,NStr):- spisok_doN(Str,0,N,[],NStr).

spisok_3elem([_,_],Str,Str):- !.
spisok_3elem([_],Str,Str):- !.
spisok_3elem([],Str,Str):- !.
spisok_3elem(Str,SSlov,Slov):- spisok_doN(Str,3,DoStr),append(DoStr,PosleStr,Str),
         append(SSlov,[DoStr],SSlov1),spisok_3elem(PosleStr,SSlov1,Slov).
spisok_3elem(Str,Slov):- spisok_3elem(Str,[],Slov).

write_spstroka([]):- !.
write_spstroka([H|T]):- write_stroka(H),nl,write_spstroka(T).

max_3elem([H1,H2,H3],H1):- H1>=H2,H1>=H3,!.
max_3elem([_,H2,H3],H2):- H2>=H3,!.
max_3elem([_,_,H3],H3):- !.

menaem_mid_elem([],Str,Str):- !.
menaem_mid_elem([H|T],SStr,Str):- max_3elem(H,Max), Max1 is Max+1,[H1,_,H2]=H,
           append(SStr,[[H1,Max1,H2]],SStr1),menaem_mid_elem(T,SStr1,Str).
menaem_mid_elem(Spis,Str):- menaem_mid_elem(Spis,[],Str).

check_povozrast([H1,H2,H3]):- H1=<H2,H2=<H3,!.

stroka_vozrast([],Str,Str):- !.
stroka_vozrast([H|T],SStr,Str):-(check_povozrast(H)->append(SStr,[H],SStr1);
                 SStr1=SStr),stroka_vozrast(T,SStr1,Str).
stroka_vozrast(Str,NStr):- stroka_vozrast(Str,[],NStr).

nomer12:- write("Vvedite stroky: "),read_stroka_neopr(S),nl,write("Original: "),nl,
          spisok_3elem(S,Slov),write_spstroka(Slov),nl,write("Izmenen: "),nl,
          menaem_mid_elem(Slov,Slov1),write_spstroka(Slov1).





%15
tolko_abc([]):- !.
tolko_abc([H|T]):-((H=97|H=98|H=99)->tolko_abc(T);fail).

nomer15:- write("Vvedite stroky: "),read_stroka_neopr(S),((tolko_abc(S))->
          write("Tolko a,b,c");write("Ne tolko a,b,c")).
