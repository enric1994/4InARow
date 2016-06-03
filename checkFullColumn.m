function [full ] = checkFullColumn( col,tc )
idx(1)=0;
idx2=cell2mat(tc(1,:));%check whereImove
idx=cat(2,idx,find(idx2==3));
count=0;
for i=1:8
   
    if i+idx(col)<size(tc,2)
    if tc{1,idx(col)+i}==3%%isequaln(tc{1}(idx(col)+i),{3})==1
      
    else
        count=count+1;
    end
    end
end

if count==8
    full=1;
else
    full=0;
end
end
         
                
              
