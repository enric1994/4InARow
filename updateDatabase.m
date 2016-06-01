function [ newPlaysDatabase,newPrizesDatabase ] = updateDatabase( gameDatabase,gameWhere,winner,playsDatabase,prizesDatabase )
%Assign rewards:
if winner==1
    prize=-1;
end
if winner==2
    prize=1;
end

%compute new database    %%CHECK THISS
for i=1:length(gameWhere)
    %check if the play exist in database
    repeated=0;
    for d=1:size(playsDatabase,3)
    if gameDatabase(:,:,i)==playsDatabase(:,:,d)
        repeated=d;
    end
    end
    %new play, initialize regards to 0
    if repeated==0
      playsDatabase=cat(3,playsDatabase,gameDatabase(:,:,i));
      prizesDatabase=cat(1,prizesDatabase,[0,0,0,0,0,0,0,0,]);
      prizesDatabase(i,gameWhere(i))=prizesDatabase(i,gameWhere(i))+prize;        
    end
    %existing play, set prizes
    if repeated~=0
prizesDatabase(d,gameWhere(i))=prizesDatabase(d,gameWhere(i))+prize;        
    end
    
end 
newPlaysDatabase=playsDatabase;
newPrizesDatabase=prizesDatabase;

end

