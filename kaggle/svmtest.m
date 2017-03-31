%x=a(:,1:n-1);
%[base,allE]=PCA(x(1:1200,:));
%[a,b]=size(base);
%tmp=zeros(0,b);
%for i=1:m
 %   tmp=[tmp;(x(i,:)-allE)*base];
%end
%tmp=X1;
%x=Y1;
m2=1200;
%[bestacc,bestc,bestg] = SVMcg(y(1:m2),tmp(1:m2,:),0.00001,10,-100,100,2,1,1,0.9)
%cmd = ['-s 3 -t 2',' -c ',num2str(bestc),' -g ',num2str(bestg)];
%model = libsvmtrain(y(1:m2),tmp(1:m2,:), cmd);

mseb=zeros(0,3);
mse = 1.6*10^9;
cv1=1.6*10^9;
for log2c =3:8,
  for log2g =-8:-3,
    cmd = ['-v 2 -c ', num2str(10^log2c), ' -g ', num2str(10^log2g) , ' -s 3 -p 0.7 -n 0.5'];
    %cmd = ['-v 2 -c ', num2str(10^4*5*((log2c+10)/20*2-8.5+11)), ' -g ', num2str(10^(-6)*5*(11+(log2g+10)/20*2-8.5)) , ' -s 3 -p 0.4 -n 0.5'];
    %cmd = ['-v 2 -c ', num2str(10^log2c), ' -g ', num2str(10^log2g) , ' -s 3 -p 1 -n 0.5'];
    cv = libsvmtrain(y(1:m),x4(1:m,:),cmd);
    if (cv < mse),
        if cv<cv1
            cv1=cv;
            [t,l]=size(mseb);
            t=t+1;
        end;
        mseb=[mseb;[log2c,log2g,cv]];
        bestc = 10^log2c; bestg = 10^log2g;
    end
  end
end

model = libsvmtrain(y(1:m2),x4(1:m2,:), cmd);
%model = libsvmtrain(y(1:m2),tmp(1:m2,:), '-s 2 -t 2 -g 0.000001');
%model = libsvmtrain(y(1:m2),tmp(1:m2,:), '-t 0 -c 10');
%model=svmtrain(x,y,'kernel_function' , 'polynomial', 'polyorder' ,5);
%利用建立的模型看其在训练集合上的回归效果
[py,accuracy,mse] = libsvmpredict(y(1:m2,:),x(1:m2,:),model);
[py1,accuracy1,mse1] = libsvmpredict(y(m2+1:m),x(1+m2:m,:),model);
%[py,accuracy,mse] = libsvmpredict(y(m2+1:m),tmp(m2+1:m,:),model);
RMS=sqrt(sum((py-y(1:m2,:)).^2)/length(py))
RMS=sqrt(sum((py1-y(m2+1:m,:)).^2)/length(py1))
%c=[order,py];
%csvwrite('output.csv',c);
%%
%toc