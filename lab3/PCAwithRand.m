%使用生成的三维随机数，前两维随机数方差为20，最后一维方差为1,随机数数目为100,均值均为0
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
    title('原图');
end
for i=1:3
    subplot(2,3,i+3);
    imshow(mat2gray(reshape(new(:,i),10,10)));
    title('重建后图');
end




