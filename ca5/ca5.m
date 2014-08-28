%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EE465 Introduction to Digital Image Processing
% Copyright: Xin Li@2010-2014
% Computer Assignment 5: Image Enhancement Basics
% Due Date: Feb. 25, 2014
% Oluwatoni Fuwape
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
% MATLAB functions: hist, histeq, adapthisteq, imadjust, imhist  

% Part I: calculate the histogram of a given image (2 points)
x=double(imread('cube.tif'));
%[write a matlab function names my_hist.m to calculate the histogram
%for a given image]
h_x=my_hist(x,256);
% now call the hist function provided by matlab
h_ref=hist(x(:),1:256);
% compare the two results
i=1:256;
plot(i,h_x,i,h_ref-30000);
% {Question: what is the role of '-30000' in the above plot?}
% if the '-30000' is not there then it would be difficult to compare the
% two plots becuase they will be on top of each other, '-30000' helps separate the two plots for better comparison

% Part II: enhancement of a microarray image (2 points)
x=im2double(imread('microarray.png'));
% >help histeq 
x_enh1=histeq(x);
imshow(x_enh1/255,[]);
% >help adapthisteq 
x_enh2=adapthisteq(x);
imshow(x_enh2/255,[]);
    
% Part III: histogram matching (1 point)
% Learn how to use histeq function to process an input image A such that
% the histogram of the output matches that of a target image B
A=double(imread('cube.tif'));
B=double(imread('cameraman.tif'));
A_modified=histeq(A/255,my_hist(B,256));%%not sure
imshow(A_modified/255,[]);
hA=hist(A_modified(:),1:256);hB=hist(B(:),1:256);
plot(i,hA,i,hB);

% Bonus Part: where is the teapot? (0.5 point)
% try to apply what you have learned to enhance a poor-quality
% image due to low-resolution and low-illumination (teapot.png). 
% Hint: you might want to combine image enhancement with image interpolation.
A=double(imread('teapot.png'));
imshow(A,[]);
% A=imresize(A,
% <your codes go here and name the enhanced image B>
% side-by-side comparison
subplot(1,2,1);imshow(A/255,[]);
subplot(1,2,2);imshow(B/255,[]);