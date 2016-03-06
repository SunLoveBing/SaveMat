function [ folderNum,folderName ] = FolderInfo( folderInfo )

folderNum = 0;
for k = 1 : length(folderInfo)
    if strcmp(folderInfo(k).name,'.')||strcmp(folderInfo(k).name,'..')
        continue;
    else
        folderNum = folderNum + 1;
    end
end

folderName = cell(1,folderNum);
for k = 1 : folderNum
    folderName{k} = folderInfo(k+2).name;
end

end

