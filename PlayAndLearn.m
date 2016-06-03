function [ playsDatabase,prizesDatabase ] =PlayAndLearn(iterations )
s = zeros(1,iterations);

prizesDatabase=ones(1,8);
playsDatabase{1}={3,3,3,3,3,3,1,3,3};

totalTime=0;
for i=1:iterations
    tic
   fprintf('%d / %d \n',i,iterations);
[newPlaysDatabase,newPrizesDatabase]=fourInARow(playsDatabase,prizesDatabase);
    playsDatabase=newPlaysDatabase;
    prizesDatabase=newPrizesDatabase;
    s(i)=toc;
totalTime=totalTime+s(i);
end
plot(s);
fprintf('Time elapsed: %f',totalTime);
end

