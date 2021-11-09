% insert images
im1 = imread('01.jpg');
im2 = imread('02.jpg');
im_black_1 = rgb2gray(im1);
im_black_2 = rgb2gray(im2);

[A1L1,H1L1,V1L1,D1L1] = swt2(im_black_1,1,'sym2');
[A2L1,H2L1,V2L1,D2L1] = swt2(im_black_2,1,'sym2');

% fusion start
AfL1 = 0.5*(A1L1+A2L1);
D = (abs(H1L1)-abs(H2L1))>=0;
HfL1 = D.*H1L1 + (~D).*H2L1;
D = (abs(V1L1)-abs(V2L1))>=0;
VfL1 = D.*V1L1 + (~D).*V2L1;
D = (abs(D1L1)-abs(D2L1))>=0;
DfL1 = D.*D1L1 + (~D).*D2L1;

% fused image
imf = iswt2(AfL1,HfL1,VfL1,DfL1,'sym2');
figure(1);
imshow(im_black_1,[]); title("1st input Image")
figure(2);
imshow(im_black_2,[]); title("2nd input Image")
figure(3); 
imshow(imf,[]);
title("Fused Image");