%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EE465 Introduction to Digital Image Processing Spring 2009-2011
% Copyright: Xin Li@2009-2014
% Computer Assignment 2: Image Acquisition Basics
% Due Date: Feb. 4, 2014
%Oluwatoni Fuwape
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% General instructions: 
% 1. Wherever you see a pair of <...>, you need to replace <>
% by the MATLAB code you come up with
% 2. Wherever you see a pair of [...], you need to write a new MATLAB
% function with the specified syntax
% 3. Wherever you see a pair of {...}, you need to write your answers as
% MATLAB annotations, i.e., starting with %

% The objective of this assignment is to learn the basic concepts of
% image resolution and color-filter-array pattern 
% MATLAB functions: rgb2gray, imresize, interp2, subplot, round, squeeze  

% Part I: get familiar with the spatial/bit-depth resolution of a
% grayscale image and observe the degradation of image quality
% when ad-hoc processing tools are used (3 points)
% read in the test image cameraman (provided by matlab)
x=double(imread('cameraman.tif'));
% check the spatial resolution (width and height) of the image
whos x
% 1. reduce the image resolution by a factor of two (also-called down-sampling)
% Hint: you need to know how to use ":" operator (1 point)
x1=x(1:2:256,1:2:256);
imshow(x1,[]);

% 2. increase the image resolution by a factor of two (also-called up-sampling)
% Hint: use >help imresize or >help interp2 to learn how to use these two
% functions assoicated with linear interpolation (1.5 points)
x2=imresize(interp2(x,2),[256 256]);
% <interpolated image from x1 by either imresize or interp2 (please make
% sure the size of x2 is the same as x)>;
subplot(1,2,1);imshow(x,[]);title('original image');
subplot(1,2,2);imshow(x2,[]);title('interpolated image');
% {report what kind of visual quality degradation you observe when comparing
%     x2 with the original x.}
% The unterpolated image is blurry and less clear compared to the original
% image

% 3. reduce the bit-depth resolution of x from 256 to 16 
% Hint: you can google ``uniform quantization'' to learn more 
% background information (.5 point)
Q=16;
% <please provide an appropriate division factor (it is technically called 
% quantization stepsize)>;
x3=round(x/Q);
subplot(1,2,1);imshow(x,[]);title('8-bit image');
subplot(1,2,2);imshow(x3,[]);title('4-bit image');
% {report what kind of visual quality degradation you observe when comparing
%     x3 with the original x.}
%more blurry and more noise/distortion is observed in the new image

% Part II: play with a color image of flowers (2 points)
% read in the test image 
x=double(imread('fl_orig.ppm'));
y=rgb2gray(x/255);
% generate Bayer pattern z
% green channels: quincinx lattice
z=zeros(size(y));
z(1:2:end,1:2:end)=squeeze(x(1:2:end,1:2:end,2));
z(2:2:end,2:2:end)=squeeze(x(2:2:end,2:2:end,2));
% red/blue channels: quarter-size
z(1:2:end,2:2:end)=squeeze(x(1:2:end,2:2:end,1));
z(2:2:end,1:2:end)=squeeze(x(2:2:end,1:2:end,3));
% Bayer pattern is NOT the grayscale version but visually appears similar
% Note that y is normalized within [0,1] and z is within [0,255]
imshow([y*255 z],[]);
% [write a new matlab function called cfa_interp.m to reconstruct full-resolution
% color image from the bayer pattern z. ]
%Hint: For MATLAB beginners, learn to search which function is provided by MATLAB 
% to do CFA interpolation; for MATLAB veterans, you can try out your own ideas of 
% interpolating each channel independently via linear methods (refer to Part 1)]
xx=cfa_interp(z);
imshow(xx);
% This problem is often called image demosaicing. You can learn more about 
% more advanced demosaicing methods using wiki or read my survey paper
% at http://www.csee.wvu.edu/~xinl/papers/demosaicing_survey.pdf

% Bonus Part: MRI image acquisition in k-space (0.5 point)
clear all
close all
%load spiralexampledata
% d - spiral data;
% k - kspace locations (kx,ky); use plot(real(k),imag(k),'.') to see
% w - density compensation function (used to weight the k-space data); 
load rt_spiral.mat 

% a simple implementation of gridding algorithm for MRI reconstruction
% choose an image size
n=256/2;
% read the supplied grid2w.m function and learn how to call it
X=grid2w(d,k,w,n);
x=ifft(X);
% display the reconstructed result
% Hint: if the displayed result does not appear correct, >help fftshift
% and understand why you need to use fftshift here (we will discuss this
% issue later during the lecture on FT of images)
figure(1);imshow(abs(x),[]);