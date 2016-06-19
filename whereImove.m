function [ col,random ] = whereImove( ot,playsDatabase,prizesDatabase ,training)
t=transform(ot);
fullColumn=1;
col=0;
random=1;
%check full columns
while fullColumn==1 
    col=0;
%search play in the database
    for i=1:size(playsDatabase,2)
      
        if isequaln(t{1},playsDatabase{i})==1
             [~,col]=max(prizesDatabase(i,:));
             random=0;
             %random move to get a richer database, only during training
             if training==1
             if randi(3)==1 %Random factor, low values for a best early game.
                col=randi(8); 
             end
             end
             %
                if checkFullColumn(col,playsDatabase{i})==1%%?
                 %%fullColumn=0; 
                 col=0;
                 
                prizesDatabase(i,col)=prizesDatabase(i,col)-10;
                else
                   fullColumn=0; 
                end
               break; 
            end
         
    end
    
        
    if col==0
        col=randi(8);
        random=1;
     if checkFullColumn(col,t{1})==0%%?
         fullColumn=0;
     end
    end
end
end


