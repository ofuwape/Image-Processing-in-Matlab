%Maputi Botlhole
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EE465 Introduction to Digital Image Processing Spring 2009-2013
% Copyright: Xin Li@2009-2014
% Computer Assignment 3: Image Perception and Its Application
% Due Date: Feb. 11, 2014 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Part I: contrast-related optical illusion (2 points)
x1=imread('illusion.png');
imshow(x1,[]);
[gx gy]=ginput(2);
crpI=imcrop(x1,[min(gx) min(gy) max(gx) max(gy)]);
imshow(rgb2gray(crpI));
% {Modify the codes you had for interactive image cropping in ca1 so you can click
%     on two points around A and B and then display their grayscale values. 
%     Verfiy theyr are indeed the same number despite visually apparent difference}


% Part II: measurment-related optical illusion (2 points)
x2=(imread('arrows.png'));
imshow(x2,[]);
x2a=
x2b=
% {write up your own matlab codes to measure the length of two arrows (in terms of the number 

% of pixels) and verify theu are indeed the same despite that visually the bottom one appears longer}




% Part III: picture in picture (1 points)
% can you reveal the hidden picture in the given image house2.png
x3=(imread('house2.png'));
imshow(x3,[]);
hidden=find(mod(x3,2)==0);
hid=find(x3==1);
x3(hid)=hid;
x3(hidden)=0;
imshow(x3,[]);


% {find a way to extract the hidden image from x3. Hint: The hidden picture is a binary image embedded to one of the bitplanes.
%     What you need to figure out is which bitplane. For more background infor. about steganography, please refer to http://en.wikipedia.org/wiki/Steganography.}

% Bonus part: Einstein-Monroe optical illusion (0.5 point)
x4=imread('marilyneinstein.jpg');
% Is this a picture of Albert Einstein? Yes. But wait - look at it far away
% Do you see Marillyne Monroe now? That is strange!!!
imshow(x4,[]);
