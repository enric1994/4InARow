function [ winner ] = whoWin( t )
if verticalWin(t) ==1 || horizontalWin(t) ==1 || diagonalUpWin(t) ==1 || diagonalDownWin(t) ==1
    winner=1;
elseif verticalWin(t) ==2 || horizontalWin(t) ==2 || diagonalUpWin(t) ==2 || diagonalDownWin(t) ==2
    winner=2;
else winner=0;
end

