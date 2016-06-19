function [ playsDatabase,prizesDatabase ] =PlayAndLearn(iterations )
s = zeros(1,iterations);

%prizesDatabase=prizesDatabaseIn;
%playsDatabase=playsDatabaseIn;
prizesDatabase=ones(1,8);
playsDatabase{1}={3,3,3,3,3,3,1,3,3};
winner1=0;
winner2=0;
totalTime=0;
for i=1:iterations
    tic
   fprintf('%d / %d \n',i,iterations);
   
[winner,newPlaysDatabase,newPrizesDatabase]=fourInARow(playsDatabase,prizesDatabase);
    playsDatabase=newPlaysDatabase;
    
    prizesDatabase=newPrizesDatabase;
    if winner==1 winner1=winner1+1; end
    if winner==2 winner2=winner2+1; end
    s(i)=toc;
totalTime=totalTime+s(i);

end
fprintf('Player 1 win %d times \n',winner1);
fprintf('Player 2 win %d times \n',winner2);

plot(s);
fprintf('Time elapsed: %f \n',totalTime);
end

