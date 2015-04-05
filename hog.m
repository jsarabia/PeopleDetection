function out = hog(f, isPath)
img = f;

if(isPath == 1)
    img = imread(f);
    img = rgb2gray(img);
end

%size(img)
[n,m] = size(img);
if(n == 160)
    %img = cast(img(16:160-11, 16:96-11), 'double');
    img = imresize(img, [134,70]);
end

xmask = [-1 0 1];
ymask = [-1; 0; 1];
dx = cast(conv2(img, xmask, 'same'), 'double');
dy = cast(conv2(img, ymask, 'same'), 'double');
mag = zeros(134,70);

mag = sqrt((dx.*dx)+(dy.*dy));

%mx = max(transpose(max(mag)));
%mag = cast(255*(mag*(1/mx)), 'uint8');

%for x=1:1:134
%    for y=1:1:70
%        angle(x,y) = atan2d(dy(x,y),dx(x,y));
%    end
%end
angle = atan2d(dy,dx);
for x =1:1:134
    for y = 1:1:70
        if(angle(x,y) < 0)
            angle(x,y) = angle(x,y) + 360;
        end
    end
end
for x =1:1:134
    for y = 1:1:70
        if(angle(x,y) > 180)
            angle(x,y) = angle(x,y) - 180;
        end
    end
end

%mx = max(transpose(max(angle)));
%angle = cast(255*(angle*(1/mx)), 'uint8');

%create 2x2 blocks
vec = [];
for y = 4:8:116
    for x = 4:8:52
        %blockMag = zeros(16,16);
        %blockAngle = zeros(16,16);
        %for j = 1:1:16
        %    for i = 1:1:16
        %        blockAngle(j,i) = angle((j+y),(i+x));
        %        blockMag(j,i) = mag((j+y),(i+x));
        %    end
        %end
        blockMag = mag(y:y+16,x:x+16);
        blockAngle = angle(y:y+16,x:x+16);
        hist = blockHist(blockAngle, blockMag);
        vec = [vec,hist];        
    end
end
out = vec;
for i = 1:1:3780
    if(isnan(out(i)))
        out(i) = 0;
    end
end
end