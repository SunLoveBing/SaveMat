clear all;
close all;
clc;
addpath('D:\Landmark Detection\Code\SaveMat');

path = 'D:\Landmark Detection\Code\SaveMat\���ͷ���\';
folderInfo = dir(path);
cd(path);
mkdir('..','resize');
cd('../resize');
picWidth = 112;
picHeight = 48;

%��ô���ͼƬ���ļ��и������ļ�����,�Լ�ͼƬ���;���·��
[ folderNum,folderName ] = FolderInfo( folderInfo );
[ picName,picPath,picNum ] = PicInfo( path,folderNum,folderName );

%Ϊѵ��������ӱ�ǩ
label = zeros(1,1);
for k = 1 : folderNum
    temp = strcat(path,folderName{k},'\*.jpg');
    picNum_temp = dir(temp);
    label_name{k} = k * ones(1,length(picNum_temp));
    label = [label,label_name{k}];
end
[~,n] = size(label);
label = label(1,2:n);

%����ͼƬ�ߴ�
PicResize( path,folderNum,folderName,picPath,picWidth,picHeight,picName );

%����ѵ������
path = 'D:\Landmark Detection\Code\SaveMat\resize\'; % ������С��ѵ��ͼ��Ĵ��λ��
cd(path);
mkdir('..','trainmat');
cd('../trainmat');

[a] = MatSave( path,picHeight,picWidth,picNum,label );
savefile = 'train.mat';
save(savefile,'a');


