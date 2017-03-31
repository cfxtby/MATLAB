% FaceRec.m       %CQUPT
% PCA  ʶ����88% 
% calc xmean,sigma and its eigen decomposition
allsamples=[];                          %����ѵ��ͼƬ
for i=1:40
       for j=1:5
       a=imread(strcat('e:\ORL\s',num2str(i),'\',num2str(j),'.pgm'));
      b=a(1:112*92);                  %b����ʸ��1*N��N=10304����ȡ˳�������к��У�
                                               %�����ϵ��£�������
       b=double(b);
allsamples=[allsamples;b];         %allsamples��һ��M*N����allsamples��ÿһ�����ݴ�
                                                  %��һ��ͼƬ������M=200
       end
end
samplemean=mean(allsamples);    %ƽ��ͼƬ��1*N
for i=1:200 xmean(i,:)=allsamples(i,:)-samplemean;    %allsamples��һ��M*N����allsamples��ÿһ�б���
                                                                               %�������ǡ�ÿ��ͼƬ���ݡ�ƽ��ͼƬ��
end;
%��ȡ����ֲ����������
sigma=xmean*xmean';                          % M* M����
[v d]=eig(sigma);
d1=diag(d);
%������ֵ��С�Խ�������
dsort=flipud(d1);
vsort=fliplr(v);
 
%����ѡ��90%������
dsum=sum(dsort);
       dsum_extract=0;
       p=0;
       while(dsum_extract/dsum<0.9)
              p=p+1;
              dsum_extract=sum(dsort(1:p));
       end
p=199;
% (ѵ���׶�)�����������γɵ�����ϵ
base = xmean' * vsort(:,1:p) * diag(dsort(1:p).^(-1/2));
 
%����������
for(k=1:p)
       temp=reshape(base(:,k),112,92);
       newpath=[��e:\test\�� int2str(k) ��.jpg��];
       imwrite(mat2gray(temp), newpath);
end
 
%��ģ�ͱ���
Save(��e:\ORL\model.mat�� ,��base��, ��samplemean��);