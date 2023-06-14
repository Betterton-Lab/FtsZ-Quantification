% This code loads a full original image (FOI) and a background segment 
% from the full original image (Background image, BKI). It finds the
% background from FOI by using the median of BKI. It subtract the
% background from FOI and returns a background-subtracted image (BSI) of FOI. 
% In the end, this code saves the BSI image in the same folder of FOI, with
% a suffix _BSI.tif

% % DMSO images: 
data_path = 'C:\Users\LuKeZ\Desktop\FtsZ quantification\FtsZ tiffs\DMSO\W1F001T0001Z00C1';
FOI_name = {' (1)',' (2)',' (3)',' (4)',' (5)',' (6)',' (7)',' (8)',' (9)',' (10)',' (11)',' (12)'};

% CCCP images: 
% data_path = 'C:\Users\LuKeZ\Desktop\FtsZ quantification\FtsZ tiffs\CCCP\W1F001T0001Z00C1';
% FOI_name = {' (1)',' (2)',' (3)',' (4)',' (5)',' (6)',' (7)',' (8)',' (9)'};

for img_idx = 1:length(FOI_name)
    FOI_path = strcat(data_path, FOI_name(img_idx), '.tif');
    
    % Display Full-Original Image - FOI
    FOI = imread(char(FOI_path));
    figure;
    imagesc(FOI); colormap gray; colorbar;
    axis off;

    % Getting the background value of FOI
    FOI_background = double(median(FOI(:)));
    % Subtracting background from FOI, make BSI
    BSI = imsubtract(FOI, FOI_background);
    figure;
    imagesc(BSI); colormap gray; colorbar;
    clim([0, 500]);
    axis off;
    
    % Save the BSI image to data folder (FOI_NAME_BSI.tif)
    BSI_name = char(strcat(data_path, FOI_name(img_idx),'_BSI.tif'));
    imwrite(BSI, BSI_name);

end



