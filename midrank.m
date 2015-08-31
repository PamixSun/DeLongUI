function T=midrank(x)
[Z J]=sort(x);
Z=[Z Z(end)+1];
N=length(x);
T=zeros(1,N);
i=1;
while i<=N
    a=i;
    j=a;
    while Z(j)==Z(a)
        j=j+1;
    end
        b=j-1;
    for k=a:b
        T(k)=(a+b)/2;
    end
    i=b+1;
end
T(J)=T;
