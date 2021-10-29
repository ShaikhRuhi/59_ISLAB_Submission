/* Facts */
male(jack).
male(charles).
male(ross).
male(chandler).
female(judy).
female(nora).
female(rachel).
female(monica).
female(emma).
female(erica).
 
parent_of(jack,ross).
parent_of(jack,monica).
parent_of(judy,ross).
parent_of(judy,monica).
parent_of(charles,chandler).
parent_of(nora,chandler).
parent_of(ross,emma).
parent_of(rachel,emma).
parent_of(monica,erica).
parent_of(chandler,erica).
 
/* Rules */
father_of(X,Y):- male(X),
    parent_of(X,Y).
 
mother_of(X,Y):- female(X),
    parent_of(X,Y).
 
grandfather_of(X,Y):- male(X),
    parent_of(X,Z),
    parent_of(Z,Y).
 
grandmother_of(X,Y):- female(X),
    parent_of(X,Z),
    parent_of(Z,Y).
 
sister_of(X,Y):- %(X,Y or Y,X)%
    female(X),
    father_of(F, Y), father_of(F,X),X \= Y.
 
brother_of(X,Y):- male(X),
    mother_of(M, Y), mother_of(M,X),X \= Y.
 
aunt_of(X,Y):- female(X),
    parent_of(Z,Y), sister_of(Z,X),!.
 
brother_of(X,Y):- %(X,Y or Y,X)%
    male(X),
    father_of(F, Y), father_of(F,X),X \= Y.
 
brother_of(X,Y):- male(X),
    mother_of(M, Y), mother_of(M,X),X \= Y.
 
aunt_of(X,Y):-
    parent_of(Z,Y), brother_of(Z,X).

ancestor_of(X,Y):- parent_of(X,Y).
ancestor_of(X,Y):- parent_of(X,Z),
    ancestor_of(Z,Y).