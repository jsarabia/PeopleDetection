function outHist = blockHist(angle, mag)

mag = mag/norm(mag);

%angle = abs(angle);
%angle= imadd(angle,90);

hist = zeros(1,9);
    for y = 1:1:8
        for x = 1:1:8
            t = angle(y,x);
            m = mag(y,x);
            votes = interpolate(t,m);
            hist(1, votes(1,1)) = hist(1, votes(1,1)) + votes(1,2);
            hist(1, votes(2,1)) = hist(1, votes(2,1)) + votes(2,2);
        end
    end
    outHist = hist;
    hist = zeros(1,9);
    for y = 1:1:8
        for x = 1:9:16
            t = angle(y,x);
            m = mag(y,x);
            votes = interpolate(t,m);
            hist(1, votes(1,1)) = hist(1, votes(1,1)) + votes(1,2);
            hist(1, votes(2,1)) = hist(1, votes(2,1)) + votes(2,2);
        end
    end
    outHist = [outHist,hist];
    hist = zeros(1,9);
    for y = 9:1:16
        for x = 1:1:8
            t = angle(y,x);
            m = mag(y,x);
            votes = interpolate(t,m);
            hist(1, votes(1,1)) = hist(1, votes(1,1)) + votes(1,2);
            hist(1, votes(2,1)) = hist(1, votes(2,1)) + votes(2,2);
        end
    end
    outHist = [outHist,hist];
    hist = zeros(1,9);
    for y = 9:1:16
        for x = 9:1:16
            t = angle(y,x);
            m = mag(y,x);
            votes = interpolate(t,m);
            hist(1, votes(1,1)) = hist(1, votes(1,1)) + votes(1,2);
            hist(1, votes(2,1)) = hist(1, votes(2,1)) + votes(2,2);
        end
    end
    outHist = [outHist,hist];
    
end