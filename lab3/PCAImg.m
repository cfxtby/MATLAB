%PCA算法进行降维

all=[];
for i=1:10
    a1=imread(strcat(int2str(i),'.pgm'));
    all=[all;a1(1:112*92)];
end
all=double(all);
[base,allE]=PCA(all);

base = all1' * vsort(:,1:p) * diag(dsort(1:p).^(-1/2));

for i=1:5
    a1=imread(strcat(int2str(i),'.pgm'));
    a=a1(1:112*92);
    a=double(a);
    new=(double(a)-allE)*base;
    t = p;
    temp = base(:,1:t) * new(1:t)';
    temp = temp' + allE;
    png=10*log10(sum(a.^2)/sum((a-temp).^2));
    png
    subplot(4,5,i);
    
    imshow(mat2gray(reshape(a,112,92)));
    title('原图');
    subplot(4,5,i+5);
    imshow(mat2gray(reshape(temp,112,92)));
       title(strcat('重建图 信噪比为',int2str(png)));
end
for i=11:15
    a1=imread(strcat(int2str(i-5),'.pgm'));
    a=a1(1:112*92);
    a=double(a);
    new=(double(a)-allE)*base;
    t = p;
    temp = base(:,1:t) * new(1:t)';
    temp = temp' + allE;
    png=10*log10(sum(a.^2)/sum((a-temp).^2));
    png
    subplot(4,5,i);
    
    imshow(mat2gray(reshape(a,112,92)));
    title('原图');
    subplot(4,5,i+5);
    imshow(mat2gray(reshape(temp,112,92)));
    title(strcat('重建图 信噪比为',int2str(png)));
end



