function [L,num] = mybwlabel(BW)

%%%%%%%%% Initializing the label matrix to 0's %%%%%%%
L = BW;
linked = zeros(size(BW,1));
for i=1:size(BW,1)
    for j=1:size(BW,2)
        
        L(i,j) = 0;
        
    end
    linked(i) = i;
end

smallest = 0;
nextlabel =1;
for i=2:size(BW,1)
    for j=2:size(BW,2)
        
        if(BW(i,j)~=1)
            neighbours = 0;
            
            if(BW(i-1,j)==BW(i,j))
                neighbours=neighbours+1;
                if(L(i-1,j)<smallest)
                    L(i,j)=L(i-1,j);
                    smallest = L(i-1,j);
                else
                    L(i,j) = smallest;
                end
            end
            
            if(BW(i,j-1)==BW(i,j))
                neighbours=neighbours+1;
                if(L(i,j-1)<smallest)
                    L(i,j)=L(i,j-1);
                    smallest = L(i,j-1);
                else
                    L(i,j) = smallest;
                end
            end
            
%             if(BW(i+1,j)==BW(i,j))
%                 neighbours=neighbours+1;
%                 if(L(i+1,j)<smallest)
%                     L(i,j)=L(i+1,j);
%                 else
%                     L(i,j) = smallest;
%                 end
%             end
%             
%             if(BW(i,j+1)==BW(i,j))
%                 neighbours=neighbours+1;
%                 if(L(i,j+1)<smallest)
%                     L(i,j)=L(i,j+1);
%                 else
%                     L(i,j) = smallest;
%                 end
%             end
%             
            if(neighbours==0)
                
                L(i,j) = linked(nextlabel);
                nextlabel = nextlabel+1;
                smallest=nextlabel;
            end
        end
        
    end
end
num = smallest;

for i=1:size(BW,1)
    for j=1:size(BW,2)
        
        L(i,j) = 0;
        
    end
    linked(i) = i;
end
