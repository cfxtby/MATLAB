
% FaceRec.m  %CQUPT  
% PCA  ʶ����88% 
% calc xmean,sigma and its eigen decomposition
allsamples=[];                                           %����ѵ��ͼƬ
for i=1:40
       for j=1:5
        a=imread(strcat('e:\ORL\s',num2str(i),'\',num2str(j),'.pgm'));
        b=a(1:112*92);                                 %b����ʸ��1*N��N=10304����ȡ˳�������к��У�
                                                               %�����ϵ��£�������
        b=double(b);
        allsamples=[allsamples;b];                        %allsamples��һ��M*N����allsamples��ÿһ�����ݴ�
                                                               %��һ��ͼƬ������M=200
       end
end
 
samplemean=mean(allsamples);                         %ƽ��ͼƬ��1*N
for    i=1:200 
    xmean(i,:)=allsamples(i,:)-samplemean; %allsamples��һ��M*N����allsamples��ÿһ�б���
                                                                               %�������ǡ�ÿ��ͼƬ���ݡ�ƽ��ͼƬ��
end;
%��ȡ����ֲ����������
sigma=xmean*xmean';                                     % M* M����
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
i=1;
 
                  % (ѵ���׶�)�����������γɵ�����ϵ
base = xmean' * vsort(:,1:p) * diag(dsort(1:p).^(-1/2));
                  %base��N*p�׾��󣬳���dsort(i) ^(-1/2))�Ƕ�����ͼ��ı�׼�������䷽��Ϊ1��
                  % xmean' * vsort(:,1:p)��С���������������������������ת���Ĺ���
                 %�������н�ѵ������������ϵ�Ͻ���ͶӰ���õ�һ��M*p�ӿռ��е�һ���㣬
                 %�����ӿռ��е����ϵ��
allcoor=allsamples*base;
accu = 0;                                   %���������ʶ������о���������Щ���ϵ��������ʶ��
 
%���Թ���
for i=1:40
       for j=6:10                             %����40 x 5 ������ͼ��
       a=imread(strcat('e:\ORL\s',num2str(i),'\',num2str(j),'.pgm'));
       b=a(1:10304);
       b=double(b);
       tcoor=b*base;                     %�������꣬��1*p�׾���
       for k=1:200
              mdist(k)=norm(tcoor-allcoor(k,:));
       end;
 
  %���׽���
[dist,index2]=sort(mdist);
        class1=floor( (index2(1)-1)/5 )+1;
        class2=floor((index2(2)-1)/5)+1;
        class3=floor((index2(3)-1)/5)+1;
        if class1~=class2 && class2~=class3
            class=class1;
        elseif class1==class2
            class=class1;
        elseif class2==class3
            class=class2;
        end;
        if class==i
            accu=accu+1;
        end;
    end;
end;
accuracy=accu/200                  % ���ʶ����