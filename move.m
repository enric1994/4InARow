function [t]=move(t,num,player) 
%t=vector amb les fiches
%num= columna on tirem la fitcha
%player= jugador que tira la ficha (1,2)
%retorna el nou tauler de joc amb la ficha on l'hem tirat
 t(8-nnz(t(:,num)),num)=player; 
end
