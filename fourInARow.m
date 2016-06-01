function [newPlaysDatabase,newPrizesDatabase] = fourInARow(playsDatabase,prizesDatabase )
%BUGS:
%Full columns
close all

%%test
%playsDatabase=zeros(8,8,2);
%prizesDatabase=zeros(2,8);
%%

t=zeros(8,8);
gameDatabase1=t;
gameDatabase2=t;

gameWhere1=0;
gameWhere2=0;
winner=0;

while(64)
    if whoWin(t)~=0
        break;
    end
    gui(t);
    disp('PLAYER 1 (RED) TURN')
    selectedColumn=detect();
    t=move(t,selectedColumn,1);
    gameDatabase1=cat(3,gameDatabase1,t);
    gameWhere2=cat(2,gameWhere2,selectedColumn);
    gui(t);
    if whoWin(t)==1 ;
        break;
    end
    
    disp('PLAYER 2 (GREEN) TURN')
    selectedColumn=randi(8);
    gameWhere1=cat(2,gameWhere1,selectedColumn);
    t=move(t,selectedColumn,2);
    gameDatabase2=cat(3,gameDatabase2,t);
    gui(t);
    
    
    if whoWin(t)==2;
        break;
    end
end
%END OF GAME
winner=whoWin(t);

fprintf('PLAYER %d WIN! \n',winner)
gui(gameDatabase1(:,:,size(gameDatabase1,3)));

%UPDATE DATABASE
if winner==1
    gameDatabase1(:,:,1)=[];
    gameDatabase1(:,:,length(gameWhere1))=[];
    gameWhere1(1)=[];
    for i=1:length(gameWhere1)
        %check if the play exist in database
        repeated=0;
        for d=1:size(playsDatabase,3)
            if gameDatabase1(:,:,i)==playsDatabase(:,:,d)
                repeated=d;
            end
        end
        %new play, initialize regards to 0
        if repeated==0
            playsDatabase=cat(3,playsDatabase,gameDatabase1(:,:,i));
            prizesDatabase=cat(1,prizesDatabase,[0,0,0,0,0,0,0,0,]);
            prizesDatabase(i,gameWhere1(i))=prizesDatabase(i,gameWhere1(i))-1; %negative regard
        end
        %existing play, set prizes
        if repeated~=0
            prizesDatabase(d,gameWhere1(i))=prizesDatabase(d,gameWhere1(i))-1;
        end
      repeated=0;  
    end
    
    gameDatabase2(:,:,length(gameWhere2)-1)=[]; %change here %problems here
    gameWhere2(1)=[];
    for i=1:length(gameWhere2)-1 %change here
        %check if the play exist in database
        repeated=0;
        for d=1:size(playsDatabase,3)
            if gameDatabase2(:,:,i)==playsDatabase(:,:,d)
                repeated=d;
            end
        end
        %new play, initialize regards to 0
        if repeated==0
            playsDatabase=cat(3,playsDatabase,gameDatabase2(:,:,i));
            prizesDatabase=cat(1,prizesDatabase,[0,0,0,0,0,0,0,0,]);
            prizesDatabase(i,gameWhere2(i))=prizesDatabase(i,gameWhere2(i))+1; %positive regard
        end
        %existing play, set prizes
        if repeated~=0
            prizesDatabase(d,gameWhere2(i))=prizesDatabase(d,gameWhere2(i))+1;
        end
        
    end
    
end


if winner==2
    gameDatabase1(:,:,1)=[];
    gameDatabase1(:,:,length(gameWhere1))=[];
    gameWhere1(1)=[];
    for i=1:length(gameWhere1)
        %check if the play exist in database
        repeated=0;
        for d=1:size(playsDatabase,3)
            if gameDatabase1(:,:,i)==playsDatabase(:,:,d)
                repeated=d;
            end
        end
        %new play, initialize regards to 0
        if repeated==0
            playsDatabase=cat(3,playsDatabase,gameDatabase1(:,:,i));
            prizesDatabase=cat(1,prizesDatabase,[0,0,0,0,0,0,0,0,]);
            prizesDatabase(i,gameWhere1(i))=prizesDatabase(i,gameWhere1(i))-1;
        end
        %existing play, set prizes
        if repeated~=0
            prizesDatabase(d,gameWhere1(i))=prizesDatabase(d,gameWhere1(i))-1;
        end
        
    end
    gameDatabase2(:,:,length(gameWhere2))=[];
    gameWhere2(1)=[];
    for i=1:length(gameWhere2)
        %check if the play exist in database
        repeated=0;
        for d=1:size(playsDatabase,3)
            if gameDatabase2(:,:,i)==playsDatabase(:,:,d)
                repeated=d;
            end
        end
        %new play, initialize regards to 0
        if repeated==0
            playsDatabase=cat(3,playsDatabase,gameDatabase2(:,:,i));
            prizesDatabase=cat(1,prizesDatabase,[0,0,0,0,0,0,0,0,]);
            prizesDatabase(i,gameWhere2(i))=prizesDatabase(i,gameWhere2(i))+1; %positive regard
        end
        %existing play, set prizes
        if repeated~=0
            prizesDatabase(d,gameWhere2(i))=prizesDatabase(d,gameWhere2(i))+1;
        end
        
    end
    
end

newPlaysDatabase=playsDatabase;
newPrizesDatabase=prizesDatabase;
end


