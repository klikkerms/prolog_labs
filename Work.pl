style(hardcore,3).
style(indiana_jones,3).
style(ivan_vasilievich_changes_professions,2).
style(snatch,3).
style(leon,3).
style(unfriended,4).
style(butterfly_effect,4).
style(fight_club,3).
style(deadpool,0).
style(django_unchained,3).
style(the_last_hero,0).
style(van_helsing,0).
style(gentlemen,3).
style(lord_of_the_rings,0).
style(the_fifth_element,0).
style(shutter_island,3).
style(men_in_black,0).
style(brother,3).
style(die_hard,3).
style(taxi,2).


rating(hardcore,1).
rating(indiana_jones,1).
rating(ivan_vasilievich_changes_professions,0).
rating(snatch,0).
rating(leon,0).
rating(unfriended,1).
rating(butterfly_effect,0).
rating(fight_club,0).
rating(deadpool,1).
rating(django_unchained,0).
rating(the_last_hero,1).
rating(van_helsing,0).
rating(gentlemen,0).
rating(lord_of_the_rings,0).
rating(the_fifth_element,0).
rating(shutter_island,1).
rating(men_in_black,1).
rating(brother,0).
rating(die_hard,0).
rating(taxi,1).

year_of_creation(hardcore,1).
year_of_creation(indiana_jones,0).
year_of_creation(ivan_vasilievich_changes_professions,0).
year_of_creation(snatch,0).
year_of_creation(leon,0).
year_of_creation(unfriended,1).
year_of_creation(butterfly_effect,1).
year_of_creation(fight_club,0).
year_of_creation(deadpool,1).
year_of_creation(django_unchained,1).
year_of_creation(the_last_hero,1).
year_of_creation(van_helsing,1).
year_of_creation(gentlemen,1).
year_of_creation(lord_of_the_rings,1).
year_of_creation(the_fifth_element,0).
year_of_creation(shutter_island,1).
year_of_creation(men_in_black,0).
year_of_creation(brother,0).
year_of_creation(die_hard,0).
year_of_creation(taxi,0).


viewing_time(hardcore,0).
viewing_time(indiana_jones,0).
viewing_time(ivan_vasilievich_changes_professions,0).
viewing_time(snatch,0).
viewing_time(leon,0).
viewing_time(unfriended,0).
viewing_time(butterfly_effect,1).
viewing_time(fight_club,1).
viewing_time(deadpool,0).
viewing_time(django_unchained,1).
viewing_time(the_last_hero,0).
viewing_time(van_helsing,1).
viewing_time(gentlemen,0).
viewing_time(lord_of_the_rings,1).
viewing_time(the_fifth_element,1).
viewing_time(shutter_island,1).
viewing_time(men_in_black,0).
viewing_time(brother,0).
viewing_time(die_hard,0).
viewing_time(taxi,1).





country(hardcore,3).
country(indiana_jones,1).
country(ivan_vasilievich_changes_professions,3).
country(snatch,2).
country(leon,0).
country(prestige,2).
country(unfriended,3).
country(butterfly_effect,1).
country(fight_club,1).
country(deadpool,1).
country(django_unchained,1).
country(the_last_hero,3).
country(the_hateful_eight,1).
country(van_helsing,2).
country(gentlemen,2).
country(lord_of_the_rings,1).
country(the_fifth_element,0).
country(shutter_island,1).
country(men_in_black,1).
country(brother,3).
country(die_hard,1).
country(taxi,0).

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

pr:- question1(X1),question2(X2),question3(X3),question4(X4),question5(X5),
    style(X,X1),rating(X,X2),year_of_creation(X,X3),viewing_time(X,X4),country(X,X5),write(X).


