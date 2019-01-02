%% Test face
clc;
clear all;
close all;
[fname, path]=uigetfile('.jpg','Provide a face for testing');
fname=strcat(path,fname);
im=imread(fname);
im=imresize(im, [100 100]);
imshow(im);
title('Test Face');
%% Find out which class it belongs to
Ftest=FeatureStatistical(im);
%% Compare with the Database
load db.mat
Ftrain=db(:,1:2);
Ctrain=db(:,3);
for i=1:size(Ftrain,1)
dist(i,:)=sum(abs(Ftrain(i,:)-Ftest));
end
Min=min(dist);
if(Min<12)
m=find(dist==Min,1);
det_class=Ctrain(m);
msgbox(strcat('Detected class=',num2str(det_class)));
else
    msgbox('This face is not registered');
end



