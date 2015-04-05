function out = findPeople(img, w, w0, scale)
    imgpath = img;
    img = imread(img);
    img = rgb2gray(img);
    if(scale < 1)
        img = imresize(img, scale);
    end
    [r,c] = size(img);
    locations = zeros(r-134,c-70);
        for y = 1:1:(r-134)
            for x = 1:1:(c-70)
                ihog = hog(img(y:y+133,x:x+69));
                output = w*ihog'+w0;
                if(output > 0)
                    rectangle('Position', [x,y,70,134]);
                    locations(y,x) = output;
                end
            end
        end
    imshow(img);
    out = locations;
end