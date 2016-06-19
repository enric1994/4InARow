# 4InARow


The scope of this project is create a machine that taugth itself using a regard algorithm.

![Alt text](/4inarow.png)

The system works as follows:

-Every move of the game is recorded, when the game ends, depending on the winner a regard +1 or -1 is assigned to each move.

-To decide the next move the system only check the current scenario in the database and choose the move with the best regard. If the scenario don't exists in the database, the machine choose a random column.

#How to use it?

- Add to path the files

- To train the system: 

>> [a,b]=PlayAndLearn(number of games)
I recommend 300 games (1 minute of training)

Be careful with the number of games, the time wasted in each game is bigger. 150 games takes 20 seconds, 1500 games takes 15 minutes. (The graph show the duration of each game in seconds)

![Alt text](/time1500iterations.png)


- Play with the trained system:

>>playVSHuman(a,b)

#Improvements
-To create a richer database a random factor is added (only during training), each time the system make a decision there is a chance that a random number replace the good choice.
This mistake on purpose improve the early game and generate new scenarios.

-To make a bigger database, a function that transforms each scenario in a simplified version without losing information is required. 

![Alt text](/standardscenario.png)

Using the '3' as end of column, a 64 matrix is converted in a 13 array.

![Alt text](/transformedscenario.png)


-(TODO)Mirror the scenarios to half the database using the symmetrical scenarios. 

-(TODO)Reduce the training time optimizing the matlab code. Some function takes a lot of time.

Train the system with 10000 games: takes all the night (6h), compute 150000 scenarios and use 5MB of data.

![Alt text](/10000.png)

Assuming that there are 3^64 possible scenarios, and each scenario needs to be played one time in each column, and assuming that the time per game will stay constant, the time required to compute a perfect database is 4.578*10^30 hours (more than the age of the universe). The size of this database is around 1.14 * 10^23 GB.





