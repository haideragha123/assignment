
%remainder =0;
for i=2:size(reel,1)-1
    for j=2:size(reel,2)-1
        
        if (reel(i,j) >= 127)
            remainder = 255-reel(i,j);
            reel(i,j) = 255;
        end
        
        if(reel(i,j)<127) 
            remainder = reel(i,j);
            reel(i,j) = 0;
        
        end
        
       reel(i+1,j) = reel(i+1,j) + (remainder*(7/16));
       reel(i-1,j+1) = reel(i-1,j+1) + (remainder*(3/16));
       reel(i,j+1) = reel(i,j+1) + (remainder*(5/16));
       reel(i+1,j+1) = reel(i+1,j+1) + (remainder*(1/16));
    end
end

imshow(reel);

