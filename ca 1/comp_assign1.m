%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EE465 Introduction to Digital Image Processing Spring 2010
% Due date: Jan. 28, 2014
% Copyright: Xin Li'2009-2014
% Computer Assignment 1: Image acquisition and basic operations
%Name: Oluwatoni Fuwape
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% General instructions: 
% 1. Wherever you see a pair of <...>, you need to replace <>
% by the MATLAB code you come up with
% 2. Wherever you see a pair of [...], you need to write a new MATLAB
% function with the specified syntax
% 3. Wherever you see a pair of {...}, you need to write your answers as
% MATLAB annotations, i.e., starting with %

% The objective of this assignment is to learn the basic operations
% related to image acquisition

% Part I: image acquisition (0 point)
% If you already have an image for the facebook account, you can use that image.
% Otherwise if you have a digital camera, use it to take a picture of anything you like
% (e.g., your pet, your car, your friend, your doom etc.) and transfer it from
% your camera to your computer (you should be able to view it by standard image
% viewing software such as Windows Picture and Fax Viewer). If you do not have a 
% digital camera, choose one of the three images provided by the instructor (soccer.jpg
% football.jpg and lacrosse.jpg).


% Part II: read the image into MATLAB (2 points)
% use "help imread" to learn the basics about function "imread"
% Read in the image you have acquired (either from a digital camera or from the web)
x=imread('football.jpg');
% display the information of matrix x (please pay attention to its class and size information)
whos x
% note that the class should be "uint8" and the third dimension of x should be 3, 
% which denotes it is a color image(the three components correspond to R,G,B channels 
% respectively - e.g., blue channel is given by x(:,:,3))
figure(1);
imshow(x);		% please make sure you see a color image properly
% use "help rgb2gray" to learn how to convert a color image into grayscale
x_g=rgb2gray(x);
figure(2);
imshow(x_g);
g=x(:,:,2);
figure(3);
imshow(g);
figure(4);
imshow(x_g);
%<display the green channel of the image x>;
%<display the grayscale version of the image x>;

% Part III: basic image operations (1 point)
% transpose the image x_g and display it
figure(5);
imshow(x_g',[]);
[Ht Wt]=size(x_g);
imcrop(x_g,[0 0 Wt/2 Ht/2]);
%<crop the top-left quarter of the image x_g and display it>;
% Hint: MATLAB tutorial is useful for this task.
Fx_g=fliplr(x_g);
figure(6);
imshow(Fx_g);
%<flip the image x_g left to right and display it>;
% Hint: you can either write your own MATLAB codes to do the flipping
% or search a MATLAB function to do this job.

% Part IV: interactive image cropping (1 point)
%<display the image x_g, ask the user to specify the two corners along the diagonal
%direction of the bounding box, crop that portion and display it>
figure(7);
imshow(x_g);
[gx gy]=ginput(2);
crpI=imcrop(x_g,[min(gx) min(gy) max(gx) max(gy)]);
figure(8);
imshow(crpI);
% Hint: use "help ginput" and pay attention to the order of row/column.

% Part V: test JPEG compression (1 point)
%%<write the image out into a new file named xxx.jpg (you can specify the quality
%factor of 50) and verify the JPEG image looks OK using any image viewer.>
% Hint: use "help imwrite" to learn how to handle JPEG image format.
imwrite(crpI,'xxx.jpg','jpeg','Quality',50);
% Just for fun (contrast effect)
figure(9);
y=[ones(256)*20 ones(256)*120 ones(256)*200];
y(65:192,65:192)=110;y(65:192,256+65:256+192)=110;
y(65:192,512+65:512+192)=110;imshow(y,[]);
% Note that y(128,128)=y(128,384)=y(128,640) but visually
% the center square on the left side appears brighter than the
% one on the right side - this is called ``simulatenous contrast'' 
% Find out more at http://en.wikipedia.org/wiki/Contrast_effect

% What you need to submit: modified comp_assign1.m and the image you acquired
% Please make sure you can run the main program (comp_assign1.m) without any error.
