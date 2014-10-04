close all;
clear;
%% parameter settings
addpath(genpath('./External'));
addpath(genpath('./SACS_code'));

imgpath = './images/multiple'; %put a group of images in this folder
mappath = './submaps/multiple'; % the sub saliency maps by other methods

imglist = dir([imgpath '/*.bmp']); % BMP imgs only
maplist = dir([mappath '/*.png']); 

img_num = length(imglist);
%the map names used in this demo, correspoding to MR, HS, RC, SP and CO
map_names = {'_stage2.png','_res.png','_RC.png','_SP.png','_CO.png'};
map_num = length(map_names);

%% self-adaptively weight fusion

inames = cell(1,img_num);
for i=1:img_num,
    inames{i} = strrep(imglist(i).name, '.bmp', '');
end;
Mset = cell(img_num, map_num);
for i=1:img_num,
    for j=1:map_num,
        Mset{i,j} = imread([mappath '/' inames{i} map_names{j}]);
    end; 
end;

w = sacs_calWeight(map_names, inames, Mset, imgpath);


saliency = cell(1,img_num);
for j=1:img_num,
    saliency{j} = zeros(size(Mset{j,1}));
end;
for j = 1:img_num,
    for q=1:map_num,
        saliency{j}  = saliency{j} + w(j,q)*double(Mset{j,q});
    end;
end;
raws = saliency;
for j=1:img_num,
    rs = raws{j};
    rs = normalize(rs);
    imwrite(rs, ['results/'  strrep(imglist(j).name, 'bmp' , 'png')] , 'png');
end;