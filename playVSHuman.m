function [  ] = playVSHuman(  playsDatabase,prizesDatabase )
close all
t=zeros(8,8);



winner=0;

for z=1:64
    if whoWin(t)~=0
        break;
    end
   gui(t);
    disp('PLAYER 1 (RED) TURN')
    selectedColumn=detect();
    t=move(t,selectedColumn,1);
    gui(t);
    if whoWin(t)==1 ;
        break;
    end
    
    disp('PLAYER 2 (GREEN) TURN')
    selectedColumn=whereImove(t,playsDatabase,prizesDatabase);
    t=move(t,selectedColumn,2);
   gui(t);
    
    
    if whoWin(t)==2;
        break;
    end   
end
%END OF GAME
winner=whoWin(t);

fprintf('PLAYER %d WIN! \n',winner)
gui(t);


end

