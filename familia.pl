padrede('victor','alejandro').
padrede('victor','nicolay').
padrede('victor','ada').
padrede('victor','andrey').
padrede('victor','angelo').
padrede('victor','jonathan').
padrede('carmen','alejandro').
padrede('carmen','nicolay').
padrede('carmen','ada').
padrede('carmen','andrey').
padrede('carmen','angelo').
padrede('carmen','jonathan').
padrede('alejandro','paola').

padrede('paola','ariel').

padrede('alejandro','diego').

padrede('diego','leon').

padrede('marcela','paola').
padrede('marcela','diego').
padrede('ada','isabella').
padrede('ada','victoria').
padrede('jose','isabella').
padrede('jose','victoria').
padrede('angelo','josue').
padrede('angelo','marcelo').
padrede('yanine','josue').
padrede('yanine','marcelo').
padrede('jonathan','leonardo').
padrede('deyo','leonardo').
padrede('ana','guillermo').
padrede('ana','alejo').
padrede('ana','juan').
padrede('ana','patricia').
padrede('ana','mauricio').
padrede('ana','marcela').
padrede('guillermo','luis').
padrede('angeles','luis').
padrede('juan','laura').
padrede('juan','angela').
padrede('juan','sebastian').
padrede('helena','laura').
padrede('helena','angela').
padrede('yesika','sebastian').
padrede('mauricio','andres').
padrede('mauricio','nicolas').
padrede('mauricio','paula').
padrede('andrea','andres').
padrede('janeth','nicolas').
padrede('janeth','paula').

hombre('victor').
hombre('alejandro').
hombre('nicolay').
hombre('andrey').
hombre('angelo').
hombre('jonathan').
hombre('diego').
hombre('jose').
hombre('marcelo').
hombre('leonardo').
hombre('guillermo').
hombre('alejo').
hombre('juan').
hombre('mauricio').
hombre('luis').
hombre('sebastian').
hombre('sebastian').
hombre('andres').
hombre('nicolas').
hombre('nicolas').
hombre('ariel').

mujer('carmen').
mujer('paola').
mujer('yanine').
mujer('deyo').
mujer('marcela').
mujer('isabella').
mujer('victoria').
mujer('ana').
mujer('patricia').
mujer('angeles').
mujer('laura').
mujer('angela').
mujer('helena').
mujer('laura').
mujer('angela').
mujer('yesika').
mujer('paula').
mujer('andrea').
mujer('janeth').
mujer('paula').
mujer('ada').

hijode(A,B) :- padrede(B,A),hombre(A).
hijade(A,B) :- padrede(B,A),mujer(A).

madrede(A,B) :- padrede(A,B), mujer(A).

abuelode(A,B) :- padrede(A,C), padrede(C,B), hombre(A).
abuelade(A,B) :- padrede(A,C), padrede(C,B), mujer(A).

hermanode(A,B) :- padrede(C,A), padrede(C,B), A\== B, hombre(A).
hermanade(A,B) :- padrede(C,A), padrede(C,B), A\== B, mujer(A).

primode(A,B) :- hermanode(C,D), padrede(C,A), padrede(D,B), hombre(A).
primade(A,B) :- hermanode(C,D), padrede(C,A), padrede(D,B), mujer(A).

bisabuelode(A,B) :- padrede(C,B), padrede(D,C),padrede(A,D), hombre(A).

bisabuelade(A,B) :- padrede(C,B), padrede(D,C),padrede(A,D), mujer(A).

tiode(A,B) :- padrede(C,B), padrede(D,C), padrede(D,A), hombre(A).
tiade(A,B) :- padrede(C,B), padrede(D,C), padrede(D,A), mujer(A).
sobrinode(A,B) :- padrede(C,A), hermanode(C,B).
nietode(A,B) :- padrede(B,C), padrede(C,A).
bisnietode(A,B) :- nietode(C,B), hijode(A,C).

estacasado(A,B) :- padrede(A,C), padrede(B,C).
%estacasado(A,B) :- hijode(C,A), hijode(C,B).
%
familiarde(A,B) :- padrede(A,B).
familiarde(A,B) :- madrede(A,B).
familiarde(A,B) :- abuelode(A,B).
familiarde(A,B) :- hermanode(A,B).
familiarde(A,B) :- tiode(A,B).
familiarde(A,B) :- primode(A,B).
familiarde(A,B) :- bisabuelode(A,B).

familiares(X,L) :- findall(Y, familiarde(X,Y), L).

esfeliz(A) :- estacasado(A,C), mujer(C).
esfeliz(A) :- estacasado(A,C), hombre(C).

sinRepeticion([X],[X]).
sinRepeticion([X|XS],[X|L]):- not(member(X,XS)),sinRepeticion(XS,L).
sinRepeticion([X|XS],L):- member(X,XS),sinRepeticion(XS,L).


padres(R) :- findall(Y,padrede(X,Y),M),findall([X,M],padrede(X,_),L), sinRepeticion(L,R).
