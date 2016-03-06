function [ a ] = MatSave( path,picHeight,picWidth,picNum,label )

a = zeros(picHeight*picWidth,picNum);
folderInfo_res = dir(path);
[ folderNum_res,folderName_res ] = FolderInfo( folderInfo_res );
[ picName_res,picPath_res,picNum_res ] = PicInfo( path,folderNum_res,folderName_res );

num_res = 0;
for k = 1 : folderNum_res
    temp = strcat(path, folderName_res{k}, '\*.jpg');
    res_temp = dir(temp);
    for m = 1 : length(res_temp)
        I = imread(picPath_res{k,m});
        I = rgb2gray(I);
        J = I(:);
        num_res = num_res + 1;
        a(:,num_res) = J;       
    end
end

label = label';
a = a';
a = [a,label];

end

