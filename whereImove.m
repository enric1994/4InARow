function [ col ] = whereImove( t,playsDatabase,prizesDatabase )

fullColumn=1;
col=0;
%check full columns
while fullColumn==1 
    col=0;
%search play in the database
    for i=1:size(playsDatabase,3)
        if t==playsDatabase(:,:,i)
             [~,col]=max(prizesDatabase(i,:));
             %random move to get a richer database
             if randi(4)==1 %Random factor, low values for a best early game.
                col=randi(8); 
             end
             %
             if nnz(playsDatabase(:,col,i))<8
                fullColumn=0; 
                prizesDatabase(i,col)=prizesDatabase(i,col)-1;
             end
               break; 
            end
         
    end
    
        
    if col==0
        col=randi(8);
     if nnz(t(:,col))<8
         fullColumn=0;
     end
    end
end
end


