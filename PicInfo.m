function [ picName,picPath,picNum ] = PicInfo( path,folderNum,folderName )

temp = strcat(path,folderName{1},'\*.jpg');
temp_picInfo = dir(temp);
picNum_max = length(temp_picInfo);
for k = 2 : folderNum
    temp = strcat(path, folderName{k}, '\*.jpg');
    temp_picInfo = dir(temp);
    if picNum_max < length(temp_picInfo)
        picNum_max = length(temp_picInfo);
    end
end

picPath = cell(folderNum,picNum_max);
picName = cell(1,picNum_max);
picNum = 0;
for k = 1 : folderNum
    temp = strcat(path,folderName{k},'\*.jpg');
    temp_picInfo = dir(temp);
    for m = 1 : length(temp_picInfo)
        picNum = picNum + 1;
        picPath{k,m} = strcat(path,folderName{k},'\',temp_picInfo(m).name);
        picName{k,m} = temp_picInfo(m).name;
    end
end

end

