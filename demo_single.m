close all;
clear;
%% parameter settings
path(path, './RPCA/exact_alm_rpca/exact_alm_rpca');

imgpath = './images/single';%put any single images in this foledr
mappath = './maps/single';

imglist = dir([imgpath '/*.bmp']); %bmp imgs only
maplist = dir([mappath '/*.png']); 

%the map names used in this demo, correspoding to MR, HS, LR, RC, HC and GB
map_names = {'_stage2.png','_res.png','_LR.png','_RC.png','_HC.png','_GB.png'};
map_num = length(map_names);

for i=1:length(imglist),
    %% self-adaptively weight fusion
    img_num = 1;
    inames{1} = strrep(imglist(i).name, '.bmp', '');
    Mset = cell(img_num, map_num);
    for j=1:map_num,
        Mset{1,j} = imread([mappath '/' inames{1} map_names{j}]);
    end; 
    w = calWeight(map_names, inames, Mset, imgpath);
    saliency = zeros(size(Mset{1,1}));
    for j=1:map_num,
        saliency  = saliency + w(1,j)*double(Mset{1,j});
    end;
    raws = saliency;
    raws = normalize(raws);
    imwrite(raws, ['rawresult/'  strrep(imglist(i).name, 'bmp' , 'png')] , 'png');
end;