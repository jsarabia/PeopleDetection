fid = fopen('INRIAPerson/test_64x128_H96/pos.lst');
%fid = fopen('INRIAPerson/train_64x128_H96/pos.lst');
tline = fgetl(fid);
count = 0.0;
total = 0.0;
outpos = [];
outneg = [];
while ischar(tline)    
    I_HOG = hog(['INRIAPerson/test_64x128_H96',tline(5:end)]);
    %I_HOG = hog(['INRIAPerson/train_64x128_H96',tline(6:end)]);
    output = w*I_HOG'+w0;
    outpos = [outpos output];
    if(output > 0)
        count = count + 1.0;
    end
    tline = fgetl(fid);
    total = total + 1.0;
end
fclose(fid);
count
total
total = 0.0;
fid = fopen('INRIAPerson/test_64x128_H96/neg.lst');
%fid = fopen('INRIAPerson/train_64x128_H96/neg.lst');
tline = fgetl(fid);
count = 0;
while ischar(tline)    
    I_HOG = hog(['INRIAPerson/test_64x128_H96',tline(5:end)]);
    %I_HOG = hog(['INRIAPerson/train_64x128_H96',tline(6:end)]);
    output = w*I_HOG'+w0;
    outneg = [outneg output];
    if(output < 0)
    %if (output < 2*width )
        count = count + 1.0;
    end
    tline = fgetl(fid);
    total=total+1.0;
end
count
total
fclose(fid);