function w = calWeight(map_names, img_names, Mset, imgpath)
    img_num = length(img_names);
    map_num = length(map_names);

    w = zeros([img_num map_num]);
    bins = 1000;
    supdir='./superpixels/'; %the superpixel label file path

    F = zeros( [img_num*map_num, bins] );%the feature matrix

    for i = 1:img_num,
        imname = [imgpath '/' [img_names{i},'.bmp'] ];
        img = imread(imname);
        [m,n,~] = size(img);
        img_R = double(img(:,:,1)); 
        img_G = double(img(:,:,2));
        img_B = double(img(:,:,3));
        
        %------------generate the superpixels-------------------%
        comm=['SLICSuperpixelSegmentation' ' ' imname ' ' int2str(20) ' ' int2str(200) ' ' supdir];
        system(comm); 
        spname = [supdir img_names{i}  '.dat'];

        superpixels=ReadDAT([m,n],spname); 
        spnum = max(superpixels(:)); % the actual numbler of the superpixels

        avg = zeros(1,spnum);
        for p=1:map_num,
            mest = Mset{i,p};
            mest = double(mest);
            for j=1:spnum,
                h = superpixels == j;
                %calculate the average saliency score for each superpixel
                avg(j) = mean(mest(h)); 
            end;
            thes = 0.3;
            sign = avg >= thes * max(avg);%sailency thresholding
            slabels = find(sign); % record the superpixel label over the theshold 
            %compute the color histogram for the p^th map of the i^th img
            fhis = [];
            for j=1:length(slabels),
                h = superpixels == slabels(j);
                H = floor(img_R(h)/25.6)*100+floor(img_G(h)/25.6)*10+floor(img_B(h)/25.6);
                his = hist( H(:) , 0:1:bins-1 );
                fhis = [fhis;his];
            end;
            F( (i-1)*map_num + p , : ) = sum(fhis);
        end;
    end;

    F = F / 10000; % to reduce the scale of each bin, for accelerating the speed.
    %---------------------RPCA---------------------------%
    %lamda is used to control the weight of the saprsity of E 
    lamda = 0.05;
    [~ ,E] = exact_alm_rpca(F',lamda);
    S = double(E');
    %equation 10
    for i=1:img_num,
        for j=1:map_num,
            w(i,j) = norm( S((i-1)*map_num+j,:) );
        end;
    end;
    w = w / (max(w(:))-min(w(:))); %normalization
    w = exp(-w);
    sum_w = sum(w , 2);
    sum_w = repmat(sum_w , 1, map_num);
    w = w ./ sum_w;
end