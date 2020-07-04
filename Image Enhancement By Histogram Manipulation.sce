clear
IMG=imread("D:\SID\ANTI-FUN!!\SIES\TE 19-20\Sem 6\IPMV\Mini Project\GroupPhoto.jpg");
IMG_SIZE=size(IMG);
IMG_GS=rgb2gray(IMG);
IMG_GS2=double(IMG_GS);
[counts,bins]=imhist(IMG_GS);
counts=counts/sum(counts);
CDF1=cumsum(counts);
x=[0:1:255]
CDF2=[0:1:255]
CDF2=CDF2./max(CDF2)
Tr=CDF1(IMG_GS2 + 1);
z=interp1(CDF2,x,Tr,'spline');
z=matrix(z,IMG_SIZE(1),IMG_SIZE(2));
Z=round(z);
Z=uint8(Z);
hst1=imhist(IMG_GS);
hst2=imhist(Z);
figure(1)
subplot(3,1,1)
title('Original Image')
imshow(IMG)
subplot(3,1,2)
title('Grayscale Image')
imshow(IMG_GS)
subplot(3,1,3)
title('Enhanced Image')
imshow(Z)
figure(2)
subplot(1,2,1)
title('Histogram Of Original Image')
plot2d(hst1)
subplot(1,2,2)
title('Histogram Of Enhanced Image')
plot2d(hst2)
figure(3)
subplot(1,2,1)
title('CDF of Original Image')
plot2d(CDF1)
subplot(1,2,2)
title('CDF of Enhanced Image')
plot2d(CDF2)
