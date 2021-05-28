:- dynamic  style/2.
:- dynamic rating/2.
:- dynamic year_of_creation/2.
:- dynamic viewing_time/2.
:- dynamic country/2.

read_str(A) :-
  get0(X),
  r_str(X, A, []).
r_str(10, A, A) :- !.
r_str(X, A, B) :-
  append(B, [X], B1),
  get0(X1),
  r_str(X1, A, B1).

style_r(X, Y) :-
  repeat,
  ( style(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract( style(X, Y)));
  X = nil, Y = nil).

rating_r(X, Y) :-
  repeat,
  (rating(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract(rating(X, Y)));
  X = nil, Y = nil).

year_of_creation_r(X, Y) :-
  repeat,
  (year_of_creation(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract(year_of_creation(X, Y)));
  X = nil, Y = nil).

viewing_time_r(X, Y) :-
  repeat,
  (viewing_time(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract(viewing_time(X, Y)));
  X = nil, Y = nil).

country_r(X, Y) :-
  repeat,
  (country(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract(country(X, Y)));
  X = nil, Y = nil).



prTell :-
  tell('C:/Users/Rozz/Desktop/11lbb/1.txt'), style_r(X1, _), X1 = nil, told,
  tell('C:/Users/Rozz/Desktop/11lbb/2.txt'),  rating_r(X2, _),  X2 = nil, told,
  tell('C:/Users/Rozz/Desktop/11lbb/3.txt'),  year_of_creation_r(X3, _),  X3 = nil, told,
  tell('C:/Users/Rozz/Desktop/11lbb/4.txt'),  viewing_time_r(X4, _),  X4 = nil, told,
  tell('C:/Users/Rozz/Desktop/11lbb/5.txt'), country_r(X5, _), X5 = nil, told.


prSee :-
  see('C:/Users/Rozz/Desktop/11lbb/1.txt'), get0(Sym1), read_data(Sym1, 1), seen,
  see('C:/Users/Rozz/Desktop/11lbb/2.txt'),  get0(Sym2), read_data(Sym2, 2), seen,
  see('C:/Users/Rozz/Desktop/11lbb/3.txt'),  get0(Sym3), read_data(Sym3, 3), seen,
  see('C:/Users/Rozz/Desktop/11lbb/4.txt'),  get0(Sym4), read_data(Sym4, 4), seen,
  see('C:/Users/Rozz/Desktop/11lbb/5.txt'), get0(Sym5), read_data(Sym5, 5), seen.


read_data(-1, _) :- !.
read_data(_, Flag) :-
  read_str(Lang),
  name(X, Lang),
  read(Y),
  (
    Flag = 1 ->
    asserta( style(X, Y));
    (
      Flag = 2 ->
      asserta(rating(X, Y));
      (
        Flag = 3 ->
        asserta(year_of_creation(X, Y));
        (
          Flag = 4 ->
          asserta(viewing_time(X, Y));


          asserta(country(X, Y))


        )
      )
    )

  ),
  get0(Sym),
  read_data(Sym, Flag).

question1(X1):-	write("What style will the film have?"),nl,
				write("0. fantasy"),nl,
                                write("2. comedy"),nl,
                                write("3. action movie"),nl,
                                write("4. triller"),nl,
				read(X1).


question2(X2):-	write("Rating on kinopoisk?"),nl,
 write("0. hight rating"),nl,
    write("1. middle rating"),nl,
    read(X2).



question3(X3):- write("The year of the film's creation?"),nl,
    write("0. until 2000"),nl,
                                write("1.  after 2000"),nl,
				read(X3).

question4(X4):- write("Duration of the film?"),nl,
    write("0. 1.5-2h"),nl,
    write("1. 2h+"),nl,
    read(X4).



question5(X5):- write("Select the country of creation?"),nl,
    write("0. France"),nl,
    write("1. USA"),nl,
    write("2. Great Britain"),nl,
    write("3. Russia"),nl,
    read(X5).


addBlogger(Blogger, X1, X2, X3, X4, X5) :-
  append('C:/Users/Rozz/Desktop/11lbb/1.txt'),
  nl, write(Blogger), nl, write(X1), write("."), told,

  append('C:/Users/Rozz/Desktop/11lbb/2.txt'),
  nl, write(Blogger), nl, write(X2), write("."), told,

  append('C:/Users/Rozz/Desktop/11lbb/3.txt'),
  nl, write(Blogger), nl, write(X3), write("."), told,

  append('C:/Users/Rozz/Desktop/11lbb/4.txt'),
  nl, write(Blogger), nl, write(X4), write("."), told,

  append('C:/Users/Rozz/Desktop/11lbb/5.txt'),
  nl, write(Blogger), nl, write(X5), write("."), told.



pr :-
  prSee,
  question1(X1),
  question2(X2),
  question3(X3),
  question4(X4),
  question5(X5),

  ( style(X, X1),
  rating(X, X2),
  year_of_creation(X, X3),
  viewing_time(X, X4),
  country(X, X5),

  write(X);
  (write("Blogger -> "),
  read(Blogger),
  asserta(style(Blogger, X1)),
  asserta(rating(Blogger, X2)),
  asserta(year_of_creation(Blogger, X3)),
  asserta(viewing_time(Blogger, X4)),
  asserta(country(Blogger, X5)),

  prTell, nl,
  write("Blogger was added!")
  )).
