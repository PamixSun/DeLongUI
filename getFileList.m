function fileList = getFileList()

List = dir('*.mat');
fileList = cell(1, length(List));

for i = 1 : length(List)
    fileList{i} = List(i).name;
end

end