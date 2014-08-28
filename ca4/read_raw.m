function xo = read_raw(name,fmt,height,width)
fid = fopen(name);
xo = fread(fid, [height, width], fmt);
fclose(fid);
end

