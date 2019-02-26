function fileProcess(filePath_in,filePath_out)
filelist=dir(filePath_in);
fileNum=size(filelist,1);

for k=3:fileNum
    filein=strcat(filePath_in,'\',filelist(k).name);
    fileout=strcat(filePath_out,'\',filelist(k).name);
    writeNC(filein,fileout);
end
end