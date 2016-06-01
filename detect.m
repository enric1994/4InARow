function [ s ] = detect()

[x,y]=ginput(1);
if  x<2
    s=1;
end
if x>2 && x<3
    s=2;
end
if x>3 && x<4
    s=3;
end
if x>4 && x<5
    s=4;
end
if x>5 && x<6
    s=5;
end
if x>6 && x<7
    s=6;
end
if x>7 && x<8
    s=7;
end
if x>8 
    s=8;
end

end

