
% Lab 5 - Simpsons Family Tree
% Task 1 - Facts

% Male
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

% Female
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parent relationships

% Abraham and Mona's children
parent(abraham, herb).
parent(mona, herb).
parent(abraham, homer).
parent(mona, homer).

% Clancy and Jackie's children
parent(clancy, marge).
parent(jackie, marge).
parent(clancy, patty).
parent(jackie, patty).
parent(clancy, selma).
parent(jackie, selma).

% Homer and Marge's children
parent(homer, bart).
parent(marge, bart).
parent(homer, lisa).
parent(marge, lisa).
parent(homer, maggie).
parent(marge, maggie).

% Selma's child
parent(selma, ling).


% Task 1 - Rules

% Father
father(X, Y) :- parent(X, Y), male(X).

% Mother
mother(X, Y) :- parent(X, Y), female(X).

% Son
son(X, Y) :- parent(Y, X), male(X).

% Daughter
daughter(X, Y) :- parent(Y, X), female(X).

% Brother
brother(X, Y) :-
    male(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

% Sister
sister(X, Y) :-
    female(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.



% Grandfather
grandfather(X, Y) :-
    male(X),
    parent(X, Z),
    parent(Z, Y).

% Aunt
aunt(X, Y) :-
    sister(X, P),
    parent(P, Y).

% Uncle
uncle(X, Y) :-
    brother(X, P),
    parent(P, Y).

% Cousin
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    parent(G, P1),
    parent(G, P2),
    P1 \= P2,
    X \= Y.

% Ancestor
ancestor(X, Y) :- parent(X, Y).

ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).



% =====================================
% Lab 5 - Task 1
% Queries and Results
% =====================================

% 1. Father
% ?- father(homer, bart).
% true.
% ?- father(marge, bart).
% false.

% 2. Mother
% ?- mother(marge, lisa).
% true.
% ?- mother(homer, lisa).
% false.

% 3. Son
% ?- son(bart, homer).
% true.
% ?- son(lisa, homer).
% false.

% 4. Daughter
% ?- daughter(lisa, marge).
% true.
% ?- daughter(bart, marge).
% false.

% 5. Brother
% ?- brother(herb, homer).
% true.
% ?- brother(lisa, bart).
% false.

% 6. Sister
% ?- sister(patty, marge).
% true.
% ?- sister(bart, lisa).
% false.

% 7. Grandfather
% ?- grandfather(abraham, bart).
% true.
% ?- grandfather(mona, bart).
% false.

% 8. Aunt
% ?- aunt(patty, bart).
% true.
% ?- aunt(homer, bart).
% false.

% 9. Uncle
% ?- uncle(herb, bart).
% true.
% ?- uncle(marge, bart).
% false.

% 10. Cousin
% ?- cousin(bart, ling).
% true.
% ?- cousin(bart, lisa).
% false.

% 11. Ancestor
% ?- ancestor(abraham, bart).
% true.
% ?- ancestor(bart, abraham).
% false.

% =====================================
% Total: 22 Queries for 11 Rules
% =====================================

