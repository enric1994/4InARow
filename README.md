# 4InARow
<<<<<<< HEAD
The scope of this project is create a machine that taugth itself using a regard algorithm.

![Alt text](/4inarow.png)

The system works as follows:

-Every move of the game is recorded, when the game ends, depending on the results a regard +1 or -1 is assigned to each move.

-To decide the next move the system only check the current scenario in the database and choose the move with the best regard. If the scenario don't exists in the database, the machine choose a random column.

#How to use it?

The first step is train the system using:
>>[db1,db2]=PlayAndLearn(number of games)

Be careful with the number of games, the time wasted in each game is bigger. 150 games takes 20 seconds, 1500 games takes 15 minutes.

![Alt text](/time1500iterations.png)

The second step is play with your machine!

>>playVSHuman(db1,db2)

#Improvements
-To create a richer database a random factor is added (only during training), each time the system make a decision there is a chance that a random number replace the good choice.
This mistake on purpose improve the early game and generate new scenarios.

-(TODO)To make a bigger database, a function that transforms each scenario in a simplified version without losing information is required. Otherwise the database will contain 3^64 possible scenarios.

-(TODO)Mirror the scenarios to half the database. 

-(TODO)Reduce the training time optimizing the matlab code.

#Comments

Note that the database is dual, there is a version for the first player and another for the second player. Now only the database for the second player is used.










=======

![Alt text](/4inarow.png)
>>>>>>> 9559ec80e60e44f869d13263dabe65d82a67adad
