fid = fopen('INRIAPerson/train_64x128_H96/pos.lst');
tline = fgetl(fid);
posTr = [];
while ischar(tline)    
    I_HOG = hog(['INRIAPerson/train_64x128_H96',tline(6:end)], 1);
    posTr = [posTr; I_HOG];
    tline = fgetl(fid);
end
fclose(fid);

fid = fopen('INRIAPerson/train_64x128_H96/neg.lst');
tline = fgetl(fid);
negTr = [];
while ischar(tline)    
    I_HOG = hog(['INRIAPerson/train_64x128_H96',tline(6:end)], 1);
    negTr = [negTr; I_HOG];
    tline = fgetl(fid);
end
fclose(fid);