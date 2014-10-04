function nmap = normalize( map )
    % normallize
    nmap = double(map);
    nmap = (nmap-min(nmap(:)))*255/(max(nmap(:))-min(nmap(:)));
    nmap = nmap*255/max(nmap(:));
    nmap = uint8(floor(nmap));
end

