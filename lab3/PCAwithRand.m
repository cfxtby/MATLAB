%ʹ�����ɵ���ά�������ǰ��ά���������Ϊ20�����һά����Ϊ1,�������ĿΪ100,��ֵ��Ϊ0
num=100
D=[20,20,1];
matix=zeros(0,100);
for i=1:3
    get=getRandomPoint(0,D(i),100);
    matix=[matix;get];
end
matix=matix';
[base,evl]=PCA(matix);
matix1=zeros(100,3);
for i=1:100
    matix1(i,:)=matix(i,:)-evl;
end
getPca=matix1*base;
new=getPca*base';
for i=1:100
    new(i,:)=new(i,:)+evl;
end
for i=1:100
    png=10*log10(sum(matix(i,:).^2)/sum((matix(i,:)-new(i,:)).^2))
end

for i=1:3
    subplot(2,3,i);
    imshow(mat2gray(reshape(matix(:,i),10,10)));
    title('ԭͼ');
end
for i=1:3
    subplot(2,3,i+3);
    imshow(mat2gray(reshape(new(:,i),10,10)));
    title('�ؽ���ͼ');
end




