function [ saliency ] = posdeal2( saliency, thes,k)
    saliency = double(saliency);
    
    t1 = thes * max(saliency(:));
   
    [row , col] = find(saliency >= t1 );
    foci = [row , col];
    
    t2 = thes * max(saliency(:));
    
    [row , col] = find(saliency < t2 );
    it = find(saliency < t2 );
    index  = [row , col];
    
    %df = zeros(1,length(index));

    df = pdeal(foci , index);
    df = df.^(1/2);
    
    df = df - min(min(df));
    df = df / max(max(df));
    
    df = exp(-k*df);
    saliency(it) = saliency(it).*df';
    saliency = uint8(saliency);
end
