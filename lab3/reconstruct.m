%Reconstruct.m   % CQUPT
Function []=reconstruct()
Load e:\ORL\model.mat;
%计算新图片在特征子空间中的系数
Img='D:\test2\10.jpg'
A=imread(img);
 
b=a(1:112*92);                               % b是行矢量 1*N，其中N =10304
b=double(b);
b=b-samplemean;
 
c = b * base;                                     % c 是图片 a在子空间中的系数, 是 1*p 行矢量
 
%  根据特征系数及特征脸重建图
 
%  前15  个
t = 15;
temp = base(:,1:t) * c(1:t)';
temp = temp + samplemean';
imwrite(mat2gray(reshape(temp, 112,92)),'d:\test2\t1.jpg');
 
%  前50个 
t = 50;
temp = base(:,1:t) * c(1:t)';
temp = temp + samplemean';
imwrite(mat2gray(reshape(temp, 112,92)),'d:\test2\t2.jpg');
 
% 前 100个 
t = 100;
temp = base(:,1:t) * c(1:t)';
temp = temp + samplemean';
imwrite(mat2gray(reshape(temp, 112,92)),'d:\test2\t3.jpg');
 
%  前150个 
t = 150;
temp = base(:,1:t) * c(1:t)';
temp = temp + samplemean';
imwrite(mat2gray(reshape(temp, 112,92)),'d:\test2\t4.jpg');
 
%  前199  个
t = 199;
temp = base(:,1:t) * c(1:t)';
temp = temp + samplemean';
 
imwrite(mat2gray(reshape(temp, 112,92)),'d:\test2\t5.jpg');
 