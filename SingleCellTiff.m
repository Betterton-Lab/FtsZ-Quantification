% Last updated: 6-5-2023, By LuKeZ 

% This code loads the tif images and use a customize threshold function to analyze the image

% This code first apply a background subtraction on the tif images, the
% background value is defined as the median pixel value of an empty space
% cropped out of the full image. 

% We segment out individual cells from the background subtracted full image
% and analyze them using a custom threshold function. Any pixels less than
% the threshold will be filter out (be assigned 0). Any pixels above the
% threshold remains unchanged. 

% Path to image file: 
% data_path = 'C:\Users\LuKeZ\Desktop\FtsZ quantification\FtsZ tiffs\CCCP\SingleCells\';
% cell_name = {'2A','2B','2C','2D','2E','2F','2G','2H','2I','6A','6B','6C',...
%     '7A','7B','7C','7D','7E','7F','7G','8A','8B','8C','8D','8E'};

data_path = 'C:\Users\LuKeZ\Desktop\FtsZ quantification\FtsZ tiffs\DMSO\SingleCells\';
cell_name = {'2A','2B','2C','2D','2E','2F','2G','3A','3B','3C','3D','3A','3E',...
    '4A','4B','4C','4D','4E','4F','6A','6B','6C','6D','6E','6F','6G','8A','8B','8C','8D','8E','8F','8G'};

img_suffix = '.tif';

% Initialize a table saving the number of pixel above threshold in column
pix_thres_table = zeros(numel(cell_name)+1,5);
pix_thres_table(1,1) = 0;
pix_thres_table(1,2) = 100;
pix_thres_table(1,3) = 250;
pix_thres_table(1,4) = 400;
pix_thres_table(1,5) = 500;

for cell_idx = 1:numel(cell_name)

    file_path = strcat(data_path, cell_name(cell_idx), img_suffix);
    cell_img = imread(char(file_path));
    
    % Getting rid of the Red and Blue channel: 
    % Analyze the green channel only
    
    % raw image, threhold = 0:
    raw_img = cell_img;
    pix_thres_table(cell_idx+1,1)=nnz(raw_img);

    % Setting the threshold:
    % 100
    img_2 = filterLowPix(raw_img, pix_thres_table(1,2));
    pix_thres_table(cell_idx+1,2)=nnz(img_2);
    % 250
    img_3 = filterLowPix(raw_img, pix_thres_table(1,3));
    pix_thres_table(cell_idx+1,3)=nnz(img_3);
    % 400
    img_4 = filterLowPix(raw_img, pix_thres_table(1,4));
    pix_thres_table(cell_idx+1,4)=nnz(img_4);
    % 500
    img_5 = filterLowPix(raw_img, pix_thres_table(1,5));
    pix_thres_table(cell_idx+1,5)=nnz(img_5);

    % Plot each images and a single colorbar: 
    figure;
    hold on;
    set(gcf, "Units", "centimeters", "Position", [5, 10, 30, 5]);
    set(gca, "FontName","Arial", "FontSize", 20);
    
    subplot(1,5,1);
    imagesc(raw_img); 
    clim([0, 500]);
%     colormap gray;
    title(pix_thres_table(1,1));
    axis off;

    subplot(1,5,2);
    imagesc(img_2); 
    clim([0, 500]);
%     colormap gray;
    title(pix_thres_table(1,2));
    axis off;

    subplot(1,5,3);
    imagesc(img_3); 
    clim([0, 500]);
%     colormap gray;
    title(pix_thres_table(1,3));
    axis off;

    subplot(1,5,4);
    imagesc(img_4); 
    clim([0, 500]);
%     colormap gray;
    title(pix_thres_table(1,4));
    axis off;

    subplot(1,5,5);
    imagesc(img_5);
    clim([0, 500]);
%     colormap gray; 
    cb=colorbar;
    cb.Position = cb.Position + [0.07, 0.0, 0.01, 0.0];
    cb.FontSize = 10;
%   cb.TickLabels = [];
    cb.FontWeight = "bold";
    title(pix_thres_table(1,5));
    axis off;

    hold off; 

    % Save the image to file: 
    image_name = erase(cell_name(cell_idx),".png") + "masked.png";
    saveas(gcf, image_name);
    pause(0.5);
    close all;

end

save('pix_thres_table_DMSO_1-500.mat','pix_thres_table');



