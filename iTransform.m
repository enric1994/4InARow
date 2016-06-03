function [ newT ] = iTransform( t )
line=1;
col=1;
newT=zeros(8);
for i=length(t)-1:-1:1
  if (t(i)==1 ||  t(i)==2 )
     newT(line,col)=t(i); 
     col=col+1;
  else
     line=line+1; 
     col=1;
  end
end
newT=flip(flip(newT')')'; %please, kill me
end
    
    
    
    
%    while(t(col)~=3)
%     %newT(i,:)=zeros(1);
%     if (t(i)==1 ||  t(i)==2 )
%         disp('1')
%         col=col+1;
%         newT(line,col)=t(i);
%     end
%     if t(i)==3
%         disp('3')
%         line=line+1;
%         
%     end
%    end
% col=1;



