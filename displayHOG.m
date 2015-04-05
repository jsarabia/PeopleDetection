function [] = displayHOG(imgPath)
I_HOG = hog(imgPath);
img = imread(imgPath);
I_HOG = formatHOG(I_HOG);
A=foldHOG(I_HOG);
P=HOGpicture(A,20);
%P = transpose(P);
figure(1),
subplot(1,2,1), imshow(P,[])
subplot(1,2,2), imshow(img,[])
end