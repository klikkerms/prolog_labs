sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl(Sub_list,[_|List]):-sub_posl(Sub_list,List).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[_|Set]):-sub_set(Sub_set,Set).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


sprava_next(_,_,[_]):-fail.
sprava_next(A,B,[A|[B|_]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(_,_,[_]):-fail.
sleva_next(A,B,[B|[A|_]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).


next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

%Ñïèñîê-öâåò,íàöèîíàëüíîñòü,íàïèòîê,æèâîòíîå,ñèãàðåòû.
pr_ein:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),


		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses),
		write(WHO1),nl,write(WHO2).
in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


sprava_next(_,_,[_]):-fail.
sprava_next(A,B,[A|[B|_]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(A,B,[B|[A|_]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).


next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).


		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses),
		write(WHO1),nl,write(WHO2).

pr_friends:-
    Friend=[_,_,_],
    in_list(Friend,[belokurov,_]),
    in_list(Friend,[ryzhov,_]),
    in_list(Friend,[chernov,_]),
    in_list(Friend,[_,redhead]),
    in_list(Friend,[_,blonde]),
    in_list(Friend,[_,dark-haired]),

    not(in_list(Friend,[belokurov, blonde])),
    not(in_list(Friend,[belokurov,dark-haired])),
    (in_list(Friend,[ryzhov, dark-haired]);in_list(Friend,[ryzhov,blondin])),
    (in_list(Friend,[chernov,blonde]);in_list(Friend,[chernov, redhead])),

    write(Friend).

pr_girl:-
    Friend=[_,_,_],
    in_list(Friend,[_,white,_]),
    in_list(Friend,[_,green,_]),
    in_list(Friend,[_,blue,_]),
    in_list(Friend,[_,_,white]),
    in_list(Friend,[_,_,green]),
    in_list(Friend,[_,_,blue]),

    in_list(Friend,[ann,_,_]),
    in_list(Friend,[natasha,_,green]),
    in_list(Friend,[valya,_,_]),

    (in_list(Friend,[ann,white,white]);in_list(Friend,[ann,blue,blue]);in_list(Friend,[ann,green,green])),
     not(in_list(Friend,[valya,white,_])),
     not(in_list(Friend,[valya,_,white])),
     not(in_list(Friend,[natasha,green,_])),
     write(Friend).


pr_workers:-
    Workers=[_,_,_],
    in_list(Workers,[borisov,_,_,_,_,_]),
    in_list(Workers,[ivanov,_,_,_,_,_]),
    in_list(Workers,[semenov,_,_,_,_,_]),
%ñëåñàðü,òîêàðü,ñâàðùèê
    in_list(Workers,[_,locksmith,_,_,_,_]),
    in_list(Workers,[_,turner,_,_,_,_]),
    in_list(Workers,[_,welder,_,_,_,_]),

    in_list(Workers,[_,_,brother,_,_,_]),
    in_list(Workers,[_,_,_,_,_,sister]),
    in_list(Workers,[_,_,_,old,_,_]),
    in_list(Workers,[_,_,_,young,_,_]),
    in_list(Workers,[_,_,_,_,married,_]),

    in_list(Workers,[borisov,_,_,_,_,sister]),
    in_list(Workers,[semenov,_,_,old,married,_]),

     not(in_list(Workers,[_,locksmith,brother,old,_,sister])),
     not(in_list(Workers,[semenov,turner,_,_,_,_])),
     not(in_list(Workers,[borisov,locksmith,_,_,_,_])),
     write(Workers).

pr_vessel:-
    Vessel=[_,_,_,_],
    in_list(Vessel,[butilka,_]),
    in_list(Vessel,[stakan,_]),
    in_list(Vessel,[kuvshin,_]),
    in_list(Vessel,[banka,_]),

    in_list(Vessel,[_,milk]),
    in_list(Vessel,[_,limonad]),
    in_list(Vessel,[_,kvas]),
    in_list(Vessel,[_,water]),

    not(in_list(Vessel,[butilka,water])),
    not(in_list(Vessel,[butilka,milk])),

    not(in_list(Vessel,[banka,limonad])),
    not(in_list(Vessel,[banka,water])),


   sleva_next([_,limonad],[kuvshin,_],Vessel), %ñîñóä ñ ëèìîíàäîì íàõîäèòñÿ ìåæäó êóâøèíîì
   sprava_next([_,limonad],[_,kvas],Vessel),    % è ñîñóäîì ñ êâàñîì íàõîäèòñÿ ìåæäó êóâøèíîì

    next_to([stakan,_],[banka,_],Vessel),  %Ñòàêàí íàõîäèòñÿ îêîëî áàíêè
    next_to([stakan,_],[_,milk],Vessel),  % è ñîñóäà ñ ìîëîêîì  íàõîäèòñÿ îêîëî áàíêè

    write(Vessel).

pr_talant:-
    Talant=[_,_,_,_],
    in_list(Talant,[voronov,_]),
    in_list(Talant,[pavlov,_]),
    in_list(Talant,[levitsky,_]),
    in_list(Talant,[sakharov,_]),

    in_list(Talant,[_,dancer]),
    in_list(Talant,[_,painter]),
    in_list(Talant,[_,singer]),
    in_list(Talant,[_,writer]),

    not(in_list(Talant,[voronov,singer])),%âîðîíîâ íå ïåâåö
    not(in_list(Talant,[levitsky,singer])),%Ëåâèöêèé íå ïåâåç

    not(in_list(Talant,[pavlov,painter])),%Ïàâëîâ íå õóäîæíèê
    not(in_list(Talant,[pavlov,writer])),%ïàâëîâ íå ïèñàòåëü

    not(in_list(Talant,[sakharov,writer])),%Ñàõàðîâ íå ïèñàòåëü
    not(in_list(Talant,[voronov,writer])),%Âîðîíîâ íå ïèñàòåëü

    write(Talant).

pr_athletes:-
    Sport=[_,_,_],
    in_list(Sport,[michael,_,basketball,_]),
    in_list(Sport,[simon,israel,_,_]),
    in_list(Sport,[richard,_,_,_]),
    in_list(Sport,[_,australia,_,_]),
    in_list(Sport,[_,_,cricket,1]),
    in_list(Sport,[_,america,_,_]),
    in_list(Sport,[_,_,tennis,_]),
    in_list(Sport,[_,_,_,2]),
    in_list(Sport,[_,_,_,3]),

    in_list(Sport,[michael,_,_,Num1]),in_list(Sport,[_,america,_,Num2]),Num1<Num2,%Ìàéêë èãðàåò â áàñêåòáîë è èãðàåò ëó÷øå ÷åì àìåðèêàíåö
    in_list(Sport,[simon,_,_,Num3]),in_list(Sport,[_,_,tennis,Num4]),Num3<Num4,%Ñàéìîí èãðàåò ëó÷øå òåííèñèñòà

    not(in_list(Sport,[simon,_,tennis,_])),%Ñàéìîí íå òåííèñèñò
    not(in_list(Sport,[michael,america,_,_])),%Ìàéêë íå àìåðèêàíåö


    in_list(Sport,[WHO1,australia,_,_]),write("Àâñòðàëèåö ýòî - "), write(WHO1),nl,
    in_list(Sport,[richard,_,THAN,_]),write("Ðè÷àðä óâëåêàåòñÿ - "), write(THAN),nl,

    write(Sport).

pr_people:-
    People=[_,_,_,_,_],
    in_list(People,[serj,_,_]),
    in_list(People,[boris,_,_]),
    in_list(People,[leonid,_,_]),
    in_list(People,[grigoriy,_,_]),
    in_list(People,[viktor,_,_]),

    in_list(People,[_,riga,_]),
    in_list(People,[_,penza,_]),
    in_list(People,[_,lvov,_]),
    in_list(People,[_,harkov,_]),
    in_list(People,[_,moscow,_]),

    in_list(People,[_,_,riga]),
    in_list(People,[_,_,penza]),
    in_list(People,[_,_,lvov]),
    in_list(People,[_,_,harkov]),
    in_list(People,[_,_,moscow]),



         not(in_list(People,[_,X,X])),
in_list(People,[serj,_,riga]),
in_list(People,[boris,riga,penza]),
in_list(People,[leonid,X,_]),
in_list(People,[grigoriy,_,harkov]),
in_list(People,[viktor,lvov,moscow]),

    in_list(People,[_,penza,X]),
    write(People).



