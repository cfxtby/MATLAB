
for i=1:400
    subplot(20,20,i);
    imshow(reshape(test(i,:), 16,16)');
    
end