function [base,allE]  = PCA( training )
%����ѵ������training�����Ϊѵ���ɹ���Ļ�base,ͬʱ�����˾�ֵallE
all=double(training);
allE=mean(all);
all1=all;
[m,n]=size(all1);
for i=1:m
    all1(i,:)=all(i,:)-allE;%��ÿ����������ȥƽ��ֵ
end
%ʹ��svd�������Э���������ֵ����������
c=all1*all1';
[v,d] = eig(c);
d1=diag(d);
%������ֵ��С�Խ�������
dsort=flipud(d1);
vsort=fliplr(v);

%����ѡ��90%������
dsum=sum(dsort);
dsum_extract=0;
p=0;
while(dsum_extract/dsum<0.9999)
      p=p+1;
      dsum_extract=sum(dsort(1:p));
end
%�����
base = all1' * vsort(:,1:p) * diag(dsort(1:p).^(-1/2));
end

