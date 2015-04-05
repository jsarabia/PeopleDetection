%n is number of training samples total
n = 1000;
m = n/2;
X = [posTr(1:m,:);negTr(1:m,:)];
for i=1:1:n
    for j=1:1:3780
        if(isnan(X(i,j)) == 1)
            X(i,j) = 0;
        end
    end
end

y = ones(m,1);
y = [y;-1*ones(m, 1)];
H = eye(3780+1+n);
%for i = 3781:1:4781
%    H(i,i) = 0;
%end
%f = zeros(4781,1);
%for i=3782:1:4781
%    f(i,1) = 1000;
%end
H = eye(3780+1+n);
H(3780+1:end,3780+1:end) = 0;
C=0.001;
f = C*ones(3780+1+n,1);
f(1:3780+1) = 0;
A = diag(y)*[X ones(n,1)];
A = -1*[A eye(n)];
b = -1 * ones(n, 1);
lb = [-inf(1,3780+1), zeros(1,n)];
neww = quadprog(H, f, A, b, [], [], lb, [], [])
w = zeros(3780,1);
for i=1:1:3780
    w(i) = neww(i);
end
w0 = neww(3781);
w = w';