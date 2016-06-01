function [ winner ] = diagonalUpWin( t ) 

winner=diagonalDownWin(flip(t));
