% Haider Adeel Agha
% BSCS-1-344

function [out] = mybordertrace (in)

border = [];
p = 0;
cx = 0; cy = 0;
k=0;

for i=1:size(in,1)
    for j=1:size(in,2)
        
        
        if(in(i,j) == 1)
            
            s = [i;j];                  %starting pixel to check repition of loop
            border = [[s]];             %starting border pixels
            p = [[s]];                  %current boundary pixel

            %------while loop for checking condition of last pixel
            %matching
            %starting pixels %
            

            while(~(cx==s(1,1) && cy==s(2,1)))      
                
%            condition 1
%             - - -
%             1 p -
%             - - -

                if((cx-p(1,1))==0 && (cy-p(2,1))==-1 )                  
                    if(in(cx,cy)==1)                                %if the current pixel is part of the picture
                        border = [border [cx;cy]];                  %adding to the border
                        p = [cx;cy];                                %setting up the current boundary pixel
                        cx = cx+1;                                  %backtracking
                        cy = cy;
                        continue;
                    end
                    cx = cx-1;                                      %setting c to be in the next clockwise direction
                    cy = cy;
                    continue;
                
%            condition 2
%             1 - -
%             - p -
%             - - -
                    
                elseif(cx-p(1,1)==-1 && cy-p(2,1)==-1)
                    if(in(cx,cy)==1)
                        border = [border [cx;cy]];
                        p = [cx;cy];
                        cx = cx+1;
                        cy = cy;
                        continue;
                    end
                    cx = cx;
                    cy = cy+1;
                    continue;

%            condition 3
%             - 1 -
%             - p -
%             - - -
%             %continues in clockwise direction
                    
                elseif(cx-p(1,1)==-1 && cy-p(2,1)==0)
                    if(in(cx,cy)==1)
                        border = [border [cx;cy]];
                        p = [cx;cy];
                        cx = cx;
                        cy = cy-1;
                        continue;
                    end
                    cx = cx;
                    cy = cy+1;
                    continue;
                    
                elseif(cx-p(1,1)==-1 && cy-p(2,1)==1)
                    if(in(cx,cy)==1)
                        border = [border [cx;cy]];
                        p = [cx;cy];
                        cx = cx;
                        cy = cy-1;
                        continue;
                    end
                    cx = cx+1;
                    cy = cy;
                    continue;
                    
                elseif(cx-p(1,1)==0 && cy-p(2,1)==1)
                    if(in(cx,cy)==1)
                        border = [border [cx;cy]];
                        p = [cx;cy];
                        cx = cx-1;
                        cy = cy;
                        continue;
                    end
                    cx = cx+1;
                    cy = cy;
                    continue;
                    
                elseif(cx-p(1,1)==1 && cy-p(2,1)==1)
                    if(in(cx,cy)==1)
                        border = [border [cx;cy]];
                        p = [cx;cy];
                        cx = cx-1;
                        cy = cy;
                        continue;
                    end
                    cx = cx;
                    cy = cy-1;
                    continue;
                    
                elseif(cx-p(1,1)==1 && cy-p(2,1)==0)
                    if(in(cx,cy)==1)
                        border = [border [cx;cy]];
                        p = [cx;cy];
                        cx = cx;
                        cy = cy+1;
                        continue;
                    end
                    cx = cx;
                    cy = cy-1;
                    continue;
                    
                elseif(cx-p(1,1)==1 && cy-p(2,1)==-1)
                    if(in(cx,cy)==1)
                        border = [border [cx;cy]];
                        p = [cx;cy];
                        cx = cx;
                        cy = cy+1;
                        continue;
                    end
                    cx = cx-1;
                    cy = cy;
                    continue;
                    
                else
                    break;
                
                end   
         
            end
            out = zeros(size(in,1),size(in,2));             %the border pixels obtained
            for i=1:size(border,2)                          %making picture out of the pixels
                out(border(1,i),border(2,i)) =1;
            end
            imshow(out);
            return;
        end
    
        cx = i;
        cy = j;
    end
    
end
end