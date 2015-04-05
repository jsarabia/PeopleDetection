%load('trainingHOGs.mat');
%load('normalizedData.mat');
X = [posTr;negTr];
for i=1:1:3634
    for j=1:1:3780
        if(isnan(X(i,j)) == 1)
            X(i,j) = 0;
        end
    end
end
z = ones(2416,1);
z = [z;-1*ones(1218, 1)];
H = (X * X') .* (z * z');
f = -1*ones(3634,1);
A = -1*eye(3634);
a = zeros(3634, 1);
B = [[z']; [zeros(3633,3634)]];
b = zeros(3634,1);
alpha = quadprog(H+eye(3634)*.001, f, A, a, B, b);
for i = 1:1:length(alpha)
    if(alpha(i) < .0001)
        alpha(i) = 0;
    end
end
w = transpose(alpha .* z) * X;
w0 = (1/z(23,1)) - ((w)*X([23],:)');
width = 1/norm(w);
%g(x) = w'x + w0