%This takes a face image as input
% converts that to double and then takes
%mean and standard deviation of the image
%It returns f, which is f=[m s]
function [f]=Features(im)
im=rgb2gray(im);
im1=double(im);
m=(mean(mean(im1)))/10;
s=(std(std(im1)));
f=[m s];