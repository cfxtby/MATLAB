function [base,allE]  = PCA( training )
%输入训练样本training，输出为训练成功后的基base,同时包括了均值allE
all=double(training);
allE=mean(all);
all1=all;
[m,n]=size(all1);
for i=1:m
    all1(i,:)=all(i,:)-allE;%将每个特征都减去平均值
end
%使用svd进行求解协方差的特征值和特征向量
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
while(dsum_extract/dsum<0.9999)
      p=p+1;
      dsum_extract=sum(dsort(1:p));
end
%求出基
base = all1' * vsort(:,1:p) * diag(dsort(1:p).^(-1/2));
end

