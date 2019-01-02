clc;
clear all;
close all;
%% take input from user

[fname path]=uigetfile('*.jpg','Select Your Test Instance Image');
fname=strcat(path,fname);
%% Read an image
im=imread(fname);
im=imresize(im,[128 128]);
imshow(im);
%% Feature Extraction
f=Features(im);

%% Find out the closest features from database
load database
D=[];
for(i=1:size(F,1))
    d=sum(abs(F(i)-f));
    D=[D d];
end
%% Smallest distance
sm=inf;
ind=-1;
for(i=1:length(D))
    if(D(i)<sm)
        sm=D(i);
        ind=i;
    end
end
detected_class=C(ind);
disp('The detected class is:');
detected_class
dfname=strcat('.\Train\',num2str(detected_class),'.png');
%% Plot current and detected images in same window
subplot(1,2,1);
imshow(im);
title('Given Image');
subplot(1,2,2);
imshow(imread(dfname));
title(strcat('Training instance=',num2str(detected_class)));