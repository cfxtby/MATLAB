function [base,training]=PCA(all,group1)
    [m,n]=size(all);
    all1=zeros(0,n);
    for i = 1:m
        if group1(i)==1
            all1=[all1;all(i,:)];
        end
    end
    [m,n]=size(all1);
    allE=mean(all1);
    for i=1:m
        all1(i,:)=all1(i,:)-allE;
    end
    c=all1*all1';
    [v,d] = eig(c);
    d1=diag(d);
    %按特征值大小以降序排列
    dsort=flipud(d1);
    vsort=fliplr(v);

    %以下选择90%的能量
    dsum=sum(dsort);
    dsum_extract=0;
    p=0;
    while(dsum_extract/dsum<0.999)
          p=p+1;
          dsum_extract=sum(dsort(1:p));
    end
    base = all1' * vsort(:,1:p) * diag(dsort(1:p).^(-1/2));
    training=all*base;
    training=(sign(training-0.5)+1)/2;
end