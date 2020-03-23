%% base case of lstlength is an empty and 0     



lstlength([],0). 

lstlength([_|T],s(X)):- peano(N,s(X)). 

lstlength([_|T],SIZE):-lstlength(T,SMALLER), SIZE is SMALLER+1.  

%% peano base case 0,0 and peano (N,S(X) will convert my s(X) to an int. 
peano(0,0).
peano(N,s(X)):- peano(N2,X), N2 is N+1. 











   


              
