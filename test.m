img = imread('INRIAPerson/test_64x128_H96/pos/crop_000002b.png');
I_HOG = hog('INRIAPerson/test_64x128_H96/pos/crop_000002b.png');
I_HOG = formatHOG(I_HOG);
A=foldHOG(I_HOG);
P=HOGpicture(A,20);
P = transpose(P);
figure(2),imshow(P,[])
figure(1),imshow(img,[])