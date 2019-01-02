clc;
clear all;
close all;
%% take input from user
uno=input('Enter your user number :');
[fname path]=uigetfile('*.jpg','Select Your Training Instance Image');
fname=strcat(path,fname);
%% Read an image
im=imread(fname);
im=imresize(im,[128 128]);
imshow(im);
%% Feature Extraction
f=Features(im)
%% Save the image in Train Folder with name as uno.png
tfname=strcat('.\Train\',num2str(uno),'.png');
imwrite(im,tfname);
msgbox('Your are registered');
%% Store the features in a database

try
 load database   
 F=[F;f];
 C=[C;uno];
    save database F C
catch
    F=f;
    C=uno;
    save database F C
end
