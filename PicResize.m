function PicResize( path,folderNum,folderName,picPath,picWidth,picHeight,picName )

for k = 1 : folderNum
    temp = strcat(path, folderName{k}, '\*.jpg');
    temp_picInfo = dir(temp);
    cd('D:\Landmark Detection\Code\SaveMat\resize\');
    resFolderName=['resize' folderName{k}];%新的文件夹名
    c=['mkdir ' resFolderName];%创建命令
    system(c);
    cd(resFolderName);
    for m = 1 : length(temp_picInfo)
        I = imread(picPath{k, m});
        J = imresize(I,[picHeight,picWidth]);
        imwrite(J,picName{k,m});
    end
end

end

