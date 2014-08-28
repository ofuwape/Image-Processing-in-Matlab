%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EE465 Introduction to Digital Image Processing
% Copyright: Xin Li@2011-2014
% Computer Assignment 4: Image Interpolation Basics
% Due Date: Feb. 18, 2014
%Oluwatoni Fuwape
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% General instructions: 
% 1. Wherever you see a pair of <...>, you need to replace <>
% by the MATLAB code you come up with
% 2. Wherever you see a pair of [...], you need to write a new MATLAB
% function with the specified syntax
% 3. Wherever you see a pair of {...}, you need to write your answers as
% MATLAB annotations, i.e., starting with %

% The objective of this assignment is to play with various image
% interpolation related MATLAB functions (easy and fun)
% MATLAB functions: imresize, imrotate, griddata  

% Part I: compare different digital zooming techniques
x=imread('oil_painting.bmp');
% check the spatial resolution (width and height) of the image
whos x
% 1. increase the image resolution by a factor of two 
% and compare three different techniques: bilinear, bicubic and NEDI (1.5 points)
% Note: you might have used imresize before but here you need to
% know how to use advanced option of imresize which allows you to choose
% which interpolation method to use
x1=imresize(x,2,'bilinear');
x2=imresize(x,2,'bicubic');
% You are given sri_color.m which implements NEDI 
% learn how to use this function (e.g., what is the input parameter
% level about?)
% Note: This method runs slower than the previous two
tic;x3=sri_color(double(x),2);toc;
% 2. Compare the visual quality (note that side-by-side is not always
% the best solution; sometimes frame-by-frame works better)
figure(1);imshow(double(x1)/255,[]);pause;
figure(1);imshow(double(x2)/255,[]);pause;
figure(1);imshow(x3/255,[]);

% Part II: rotate an image all the way round (1.5 points)
% read in an image (clock.raw) in RAW format
% Note: RAW means no header (imread does not work)
% and therefore you need to specify the spatial and bit-depth resolution in
% the input - e.g., 'uchar' means 8bps image 
%[write a matlab function names read_raw.m to handle the read-in
% of raw data into MATLAB]
% syntax: function x=read_raw(name,fmt,height,width)
% Hint: you need to know how to use MATLAB function 'fread' 
im=read_raw('clock.raw','uchar',512,512)';
% use the half-size image so it can run faster
x=double(imresize(im,.5)); 
y=x;
for i=1:12
    y=imrotate(y,30,'bicubic','crop');
end
imshow([x y]/255,[]);
% Question: what do you observe from the comparison between the original
% and rotated clock image? What do you think contribute to the quality
% degradation after consecutive rotation? 
% Hint: this example shows the difference between continuous and discrete
% spaces (information loss is inevitable when you interpolate missing
% pixels).
% {your answer goes here}--> The rotated image is blurry and unclear. I
% believe this is due to the fact that missing pixels where interpolated in
% the rotated image which resulted in the loss of information and a lower
% quality in the rotated image.


% Part III: digital fun mirror and really cool to try it out (2 points)
% work with the image of Bill Gates or Steve Jobs or anyone else
x=double(imresize(rgb2gray(imread('bill_gates.jpg')),.5));
[M,N]=size(x);
[r,c]=meshgrid(1:N,1:M);
% randomly disturb the row coordinates
w=randn(1,M);
r1=r+repmat(w,N,1)';
y=griddata(r1,c,x,r,c,'cubic');
imshow(y,[]);


%%My distortion
[M,N]=size(x);
[r,c]=meshgrid(1:N,1:M);
% randomly disturb the row coordinates
wm=randn(1,N)';
c1=c+repmat(wm,1,M)';
y=griddata(r,c1,x,r,c,'cubic');
imshow(y,[]);
% Bonus Part: reimplement LS method in NEDI (0.5 point)
% Please Google the web about the instruction of how to use mldivide or '\' operator for calculating
% Least-Square solution Ax=b. Replace the codes inv(A'*A)*(A'*b) in sri1.m and sri2.m 
% by mldivide operator. Verify whether such replacement speeds up your
% implementation. Please name your modified functions sri1_new.m and sri2_new.m

