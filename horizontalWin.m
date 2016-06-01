function [ winner ] = horizontalWin( t ) 
p1=0;
p2=0;
winner=0;
for j=1:8
    for i=1:8
        if(t(j,i)==0)
           p1=0;
           p2=0;
        end
        if t(j,i)==1;
            p1=p1+1;   
            p2=0;
            
        end
        if t(j,i)==2;
            p2=p2+1;
            p1=0;
           
        
        end
     if p1==4 
        winner=1;
    end
    if p2==4
        winner= 2;
    end
    end
  p1=0;
  p2=0;
end

