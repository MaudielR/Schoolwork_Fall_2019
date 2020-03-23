%facts %male 
male(me).
male(fathr).
male(bb).
male(gbb).

%facts_Female
female(widow).
female(rh).

%facts_children

child(rh,widow).
child(fathr,me).
child(me,fathr).
child(me,rh). 
child(rh,me).
child(bb,me).
child(bb,widow). 
child(me,widow). 
child(gbb,rh).
child(gbb,fathr).
child(fathr,widow).

%facts_spouses
spouse(widow,me).
spouse(me,w).
spouse(fathr,rh).
spouse(rh,fathr).


%son_&_daughter_of_Y %takes_two_arguments_male_female_and_child_of_Z_ 
son(X,Y):-child(Y,Z),male(X).
daughter(X,Y):-child(Y,Z),female(X).

%brother_&_sister_takes_two_arguments_both_the_child_&_gender
brother(X,Y):-son(X,Y),child(Y,Z).
sister(X,Y):-daughter(X,Y),child(Y,Z).

%father_&_mother_take_two_arguments_child_and_gender
father(X,Y):-child(Y,X),male(X). 
mother(X,Y):-child(Y,X),female(X).


%% granparents take two arguments, father and child or mother and child.   
grandfather(X,Y):-father(X,Z),child(Y,Z).

grandmother(X,Y):-mother(X,Z),child(Y,Z).

%% uncle takes two arguemets, brother and child, checking if uncle is the a brother and child

uncle(X,Y):-brother(X,Z),child(Y,Z). 

grandchild(X,Y):-child(X,Z),child(Z,Y).    

proof(ME) :- daughter(A,ME), mother(A,ME), son(D,ME), brother(B, D), uncle(E,ME), brother(B,A), grandchild(F,ME), mother(C,A), grandmother(C,ME), grandchild(ME,C), grandfather(ME,ME). 


