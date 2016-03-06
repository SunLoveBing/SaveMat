clear all;
close all;
clc;
addpath('D:\Landmark Detection\Code\SaveMat');

path = 'D:\Landmark Detection\Code\SaveMat\车型分类\';
folderInfo = dir(path);
cd(path);
mkdir('..','resize');
cd('../resize');
picWidth = 112;
picHeight = 48;

%获得储存图片的文件夹个数和文件夹名,以及图片名和具体路径
[ folderNum,folderName ] = FolderInfo( folderInfo );
[ picName,picPath,picNum ] = PicInfo( path,folderNum,folderName );

%为训练数据添加标签
label = zeros(1,1);
for k = 1 : folderNum
    temp = strcat(path,folderName{k},'\*.jpg');
    picNum_temp = dir(temp);
    label_name{k} = k * ones(1,length(picNum_temp));
    label = [label,label_name{k}];
end
[~,n] = size(label);
label = label(1,2:n);

%调整图片尺寸
PicResize( path,folderNum,folderName,picPath,picWidth,picHeight,picName );

%保存训练矩阵
path = 'D:\Landmark Detection\Code\SaveMat\resize\'; % 调整大小后，训练图像的存放位置
cd(path);
mkdir('..','trainmat');
cd('../trainmat');

[a] = MatSave( path,picHeight,picWidth,picNum,label );
savefile = 'train.mat';
save(savefile,'a');


