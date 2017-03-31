% FaceRec.m       %CQUPT
% PCA  识别率88% 
% calc xmean,sigma and its eigen decomposition
allsamples=[];                          %所有训练图片
for i=1:40
       for j=1:5
       a=imread(strcat('e:\ORL\s',num2str(i),'\',num2str(j),'.pgm'));
      b=a(1:112*92);                  %b是行矢量1*N，N=10304，提取顺序是先列后行，
                                               %即从上到下，从左到右
       b=double(b);
allsamples=[allsamples;b];         %allsamples是一个M*N矩阵，allsamples中每一行数据代
                                                  %表一张图片，其中M=200
       end
end
samplemean=mean(allsamples);    %平均图片，1*N
for i=1:200 xmean(i,:)=allsamples(i,:)-samplemean;    %allsamples是一个M*N矩阵，allsamples中每一行保存
                                                                               %的数据是“每个图片数据—平均图片”
end;
%获取特征植及特征向量
sigma=xmean*xmean';                          % M* M矩阵
[v d]=eig(sigma);
d1=diag(d);
%按特征值大小以降序排列
dsort=flipud(d1);
vsort=fliplr(v);
 
%以下选择90%的能量
dsum=sum(dsort);
       dsum_extract=0;
       p=0;
       while(dsum_extract/dsum<0.9)
              p=p+1;
              dsum_extract=sum(dsort(1:p));
       end
p=199;
% (训练阶段)计算特征脸形成的坐标系
base = xmean' * vsort(:,1:p) * diag(dsort(1:p).^(-1/2));
 
%生成特征脸
for(k=1:p)
       temp=reshape(base(:,k),112,92);
       newpath=[‘e:\test\’ int2str(k) ‘.jpg’];
       imwrite(mat2gray(temp), newpath);
end
 
%将模型保存
Save(‘e:\ORL\model.mat’ ,’base’, ‘samplemean’);