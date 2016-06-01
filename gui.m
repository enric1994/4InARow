function []= gui(t)
%use t=[0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0;0,0,0,0,1,0,0,0;0,0,0,1,2,0,0,0]
text(4.5,10.5,'4 in a Row');
rectangle('Position',[1,1,8,8])
hold on

rectangle('Position',[0,0,11,11])
hold on
for i=1:8
    for j=1:8
        circle(j+1/2,1/2+i,1/2,'k');
        hold on
        if(t(9-i,j)==1)
            circle(j+1/2,1/2+i,1/3,'r');
                        circle(j+1/2,1/2+i,1/4,'r');
                                                circle(j+1/2,1/2+i,1/5,'r');


            hold on
        end
        if(t(9-i,j)==2)
            circle(j+1/2,1/2+i,1/3,'g');
                        circle(j+1/2,1/2+i,1/4,'g');
                                                circle(j+1/2,1/2+i,1/5,'g');


            hold on
        end
       
    end
end

axis([0 10 0 11])
end
