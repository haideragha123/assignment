function [L,num] = mybwlabel(BW)

L = zeros(size(BW,1),size(BW,2));

linked = zeros(size(BW,1));

linkages = zeros(size(BW,1),1);
for i=1:size(BW,1)
    linkages(i) = i;
end

nextlabel=1;
%largest = 0;
for i=2:size(BW,1)
    for j=2:size(BW,2)
        
        if(BW(i,j)~=0)
            
            if(BW(i,j)==BW(i-1,j) && BW(i,j)==BW(i,j-1) && L(i-1,j)~=L(i,j-1))
                
                if(L(i,j-1)<L(i-1,j))
                    smallest = L(i,j-1);
                    if(L(i,j-1)<linkages(L(i-1,j)))
                        linkages(L(i-1,j))=L(i,j-1);
                    end
                else
                  
                    smallest = L(i-1,j);
                    if(L(i-1,j)<linkages(L(i,j-1)) )
                        linkages(L(i,j-1))=L(i-1,j);
                    end
                end 
                L(i,j) = smallest;
                
            elseif(BW(i,j)==BW(i-1,j) && BW(i,j)==BW(i,j-1) && L(i-1,j)==L(i,j-1))
                
                L(i,j)= L(i-1,j);
                    
            elseif(BW(i,j)==BW(i,j-1))
                L(i,j)= L(i,j-1);
            elseif(BW(i,j)==BW(i-1,j))
                L(i,j)= L(i-1,j);
            else
                L(i,j) = nextlabel;
                nextlabel = nextlabel+1;
            
            end
        end
    end
end

% for i =1:nextlabel
%     
%         
%         x = linkages(i);
%         y = linkages(x);
%         linkages(i) = y;
% 
%     
% end
num = nextlabel-1;

for i=1:size(BW,1)
     for j=1:size(BW,2)
        %smallesto = 2;
         if(BW(i,j)~=0)
            prev = L(i,j);
            L(i,j) = linkages(L(i,j));
            for k=1:nextlabel
                if(linkages(k) == prev)
                    linkages(k) = L(i,j);
                end
            end
                
         end
            
     end
     %linkages(i,:) = smallesto;
 end
% 
% for i=1:size(BW,1)
%     for j=1:size(BW,2)
%         
%         if(L(j,i)~=0)
%             L(j,i) = linkages(L(j,i));
%         end
%     end
% end
end