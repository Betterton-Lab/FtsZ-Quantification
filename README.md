# FtsZ-Quantification
Toolkit for quantifying FtsZ ring

 <br />
 
# About this code / How to use: 

1. Background subtraction (SubBackground.m)
   
   Load the full-original images (FOI) in by modifying the "data_path =" to your data directory, you can also batch load images by changing the "FOI_name =" to match your batch image's unique suffix (IMG1, IMG2, IMG3 etc.). The code will automatically output a or batches of background-subtracted images (BSI) into your data folder, with their original image file names followed by a \_BSI.tif suffix. 
 
 <br />

2. Masking Single Cell (SingleCellTiff.m)
   
   Batch load any single cell tiffs in by modifying the "data_path =" and "cell_name =" lines to match your data directory path and your file name. Set your custom threshold values by changing the "pix_thres_table" entries values. (The code's defaults are 0, 100, 250, 400, 500). The code will automatically output five masked images for each single cell, masked by the preset custom threshold values. Any pixels lesser than the threshold are erased to zero, any pixels above the threshold retain their values. In the end, the code generates a table (pix_thres_table_DMSO_1-500.mat) for all cells that counts the number of pixels above each threshold, with the first row being the threshold value reference row. 
