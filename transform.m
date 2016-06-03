function [ newT ] = transform( t )
newT{1}=[];

for i=1:8
    for j=1:8
        
        if t(j,i)~=0
            newT{1}=cat(2,newT{1},{t(j,i)});
        end
    end
    newT{1}=cat(2,newT{1},{3});%change of column
    
    
end
%newT{1}(1)=[];
end

