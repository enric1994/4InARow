function [t]=move(t,num,player) 

 t(8-nnz(t(:,num)),num)=player; 
end
