% This function generates a masked, threshold image from original image, 
% using custom threshold value

function img_filtered = filterLowPix(img_raw, thres)
    
    img_filtered = img_raw;
    img_filtered(img_filtered(:)<=thres)=0;

end
