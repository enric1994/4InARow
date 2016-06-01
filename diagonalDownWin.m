function [ winner ] = diagonalDownWin( t ) 
p1=0;
p2=0;
winner=0;
for x=1:8
 for y=1:8   
    if t(x,y)~=0
       for  i=0:8-max(x,y)
           
           if t(x+i,y+i)==1
               p1=p1+1;
               p2=0;
           end
    if t(x+i,y+i)==2
               p2=p2+1;
               p1=0;
    end
 end
end

     if p1==4 
        winner=1;
    end
    if p2==4
        winner= 2;
    end
    
  p1=0;
  p2=0;
 end
end

