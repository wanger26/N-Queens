%By: Jakob Wanger
eightQueens(Board) :- permutation([1,2,3,4,5,6,7,8],Board), checkDiagonals(Board).

checkDiagonals([]).			% Base Case: when you have an empty list there cannot be any Queen in another Queens diagonal (becasue its empty)	
checkDiagonals([Queen|Others]) :-
	checkDiagonals(Others), 	% ---Recursive Call--- check all the Queen's in the list to make sure % none of them have another Queen within its diagonal
	checkDiagonals(Queen,Others,1).	% ---Call to Helper Method-- calling helper function keeping Queen constant and comparing it with all other Queens on the board to make sure none lie on any of the Queens diagonal


%Using recursion to act as for loop to hold one Queen's position constant and comparing it to the other Queens position to check all the diagonals of the constant queen
checkDiagonals(_,[],_).			% Base Case: When the list is empty the Queen kept constant has no other Queens (because list is empty) in any of its digonals
checkDiagonals(Queen,[Head|Tail],Column) :- 
	abs(Queen-Head) =\= Column, 	% 2 queens are in the same digonal when the absolute value of their difference in row numbers equal the Column number of the Queen not kept constant
	NextColumn is Column + 1, 	% Advance to the next Column. Therefore we  need to add 1 to the current column number
	checkDiagonals(Queen,Tail,NextColumn). %---Recursive Call--- check the next Queen in the list to check to see if the currently constant Queen is in the same Digonal as the next Queen in the list 
