function out= formatHOG(hog)
    out = zeros(15,7,36);
    for y = 1:1:15
        for x = 1:1:7
            for z = 1:1:36
                out(y,x,z) = hog(z + 36 * ((x-1) + 7 * (y-1)));
            end
        end
    end
end