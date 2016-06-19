function [winner,newPlaysDatabase,newPrizesDatabase] = fourInARow(playsDatabase,prizesDatabase )
%BUGS:
%Full columns
%close all

%%test
%playsDatabase{1}=[3,3,3,3,3,3,3,1,3];
%prizesDatabase=ones(1,8);
%[newPlaysDatabase,newPrizesDatabase]=fourInARow(playsDatabase,prizesDatabase)
%%

t=zeros(8,8);
gameDatabase1=t;
gameDatabase2=t;

gameWhere1=0;
gameWhere2=0;
winner=0;

for z=1:63 %%?
    if whoWin(t)~=0
        break;
    end
    % gui(t);
    %disp('PLAYER 1 (RED) TURN')
   [ selectedColumn,~]=whereImove(t,playsDatabase,prizesDatabase,1);
    t=move(t,selectedColumn,1);
    gameDatabase1=cat(3,gameDatabase1,t);
    gameWhere2=cat(2,gameWhere2,selectedColumn);
    % gui(t);
    if whoWin(t)==1 ;
        break;
    end
    
    % disp('PLAYER 2 (GREEN) TURN')
    [selectedColumn,~]=whereImove(t,playsDatabase,prizesDatabase,1);
    gameWhere1=cat(2,gameWhere1,selectedColumn);
    
    t=move(t,selectedColumn,2);
    gameDatabase2=cat(3,gameDatabase2,t);
    %  gui(t);
    
    
    if whoWin(t)==2;
        break;
    end
end
%END OF GAME
winner=whoWin(t);

%fprintf('PLAYER %d WIN! \n',winner)
%gui(t);
%UPDATE DATABASE
if winner==1
    %DB1
    gameDatabase1(:,:,1)=[];
    gameDatabase1(:,:,length(gameWhere1))=[];
    gameWhere1(1)=[];
    
    for i=1:length(gameWhere1)
        %transform database
        tgameDatabase1{i}=transform(gameDatabase1(:,:,i));
       
        %check if the play exist in database
        repeated=0;
        
        for d=1:size(playsDatabase,2)
            if isequaln(tgameDatabase1{i},playsDatabase{d})==0
                repeated=d;
                
            end
        end
        %new play, initialize regards to 0
        if repeated==0
            playsDatabase=cat(2,playsDatabase,tgameDatabase1(i,:));
            prizesDatabase=cat(1,prizesDatabase,[0,0,0,0,0,0,0,0,]);%%
            prizesDatabase(size(prizesDatabase,1),gameWhere1(i))=prizesDatabase(size(prizesDatabase,1),gameWhere1(i))-1; %negative regard
        end
        %existing play, set prizes
        if repeated~=0
            prizesDatabase(repeated,gameWhere1(i))=prizesDatabase(repeated,gameWhere1(i))-1;
        end
   
end
    
    %DB2, for plays of the p1
    gameWhere2(1)=[];
    
    for i=1:length(gameWhere2) %%
        tgameDatabase2{i}=transform(gameDatabase2(:,:,i));
        %check if the play exist in database
        repeated=0;
        for d=1:size(playsDatabase,2)
            if isequaln(tgameDatabase2{i},playsDatabase{d})==1
                repeated=d;
            end
        end
        %new play, initialize regards to 0
        if repeated==0
            playsDatabase=cat(2,playsDatabase,tgameDatabase2{i});
            prizesDatabase=cat(1,prizesDatabase,[0,0,0,0,0,0,0,0,]);
            prizesDatabase(size(prizesDatabase,1),gameWhere2(i))=prizesDatabase(size(prizesDatabase,1),gameWhere2(i))+1;
            %positive regard
        end
        %existing play, set prizes
        if repeated~=0
            prizesDatabase(repeated,gameWhere2(i))=prizesDatabase(repeated,gameWhere2(i))+1;
        end
        
    end
    
end


if winner==2
    %gameDatabase1(:,:,length(gameWhere1))=[];
    gameDatabase1(:,:,1)=[];
    gameWhere1(1)=[];
    
    for i=1:length(gameWhere1)
        tgameDatabase1(i,:)=transform(gameDatabase1(:,:,i));
        %check if the play exist in database
        repeated=0;
        for d=1:size(playsDatabase,2)
            if isequal(tgameDatabase1{i},playsDatabase{d})==1
                repeated=d;
            end
            
        end
        %new play, initialize regards to 0
        if repeated==0
            playsDatabase=cat(2,playsDatabase,tgameDatabase1(i,:));
            prizesDatabase=cat(1,prizesDatabase,[0,0,0,0,0,0,0,0,]);
            prizesDatabase(size(prizesDatabase,1),gameWhere1(i))=prizesDatabase(size(prizesDatabase,1),gameWhere1(i))+1;
        end
        %existing play, set prizes
        if repeated~=0
            prizesDatabase(repeated,gameWhere1(i))=prizesDatabase(repeated,gameWhere1(i))+1;
        end
        
    end
    %DB2
    gameDatabase2(:,:,length(gameWhere2))=[];
    gameWhere2(1)=[];
    
    for i=1:length(gameWhere2)
        tgameDatabase2(i,:)=transform(gameDatabase2(:,:,i));
        
        %check if the play exist in database
        repeated=0;
        for d=1:size(playsDatabase,2)
            
            if isequal(tgameDatabase2{i},playsDatabase{d})==1
                repeated=d;
            end
        end
        %new play, initialize regards to 0
        if repeated==0
            playsDatabase=cat(2,playsDatabase,tgameDatabase2(i,:));
            prizesDatabase=cat(1,prizesDatabase,[0,0,0,0,0,0,0,0,]);
            prizesDatabase(size(prizesDatabase,1),gameWhere2(i))=prizesDatabase(size(prizesDatabase,1),gameWhere2(i))-1;
            
        end
        %existing play, set prizes
        if repeated~=0
            prizesDatabase(repeated,gameWhere2(i))=prizesDatabase(repeated,gameWhere2(i))-1;
        end
        
    end
    
end

newPlaysDatabase=playsDatabase;
newPrizesDatabase=prizesDatabase;
end


