function writeNC(filePath_in,filePath_out)
addpath(genpath('D:\documents\matlab\POESdata\data\out'));

[satID_or,year_or,day_or,milsec_or,time_or,alt_or,lat_or,lon_or,L_or,B_or,variables_or]=readNC(filePath_in);
[satID,year,day,milsec,time,alt,lat,lon,L,B,variables]=dataSlim(satID_or,year_or,day_or,milsec_or,time_or,alt_or,lat_or,lon_or,L_or,B_or,variables_or);
   
%对L作处理，映射到定义的L面上
for i=1:size(L,1)
    if(L(i)>=3)
       L(i)=floor(L(i)/0.5)*0.5;
    else if(L(i)>=2)
          L(i)=floor(L(i)/0.25)*0.25;
        else L(i)=floor(L(i)/0.1)*0.1;
        end
    end
end

%打开文件，防止文件名已经存在
ncid=netcdf.create(filePath_out,'NC_NOCLOBBER');%prevent overwriting of existing file with the same name
var_name={'mep_ele_tel0_flux_e1','mep_ele_tel0_flux_e2','mep_ele_tel0_flux_e3','mep_ele_tel0_flux_e4','mep_ele_tel90_flux_e1','mep_ele_tel90_flux_e2','mep_ele_tel90_flux_e3','mep_ele_tel90_flux_e4','mep_pro_tel0_flux_p1','mep_pro_tel0_flux_p2','mep_pro_tel0_flux_p3','mep_pro_tel0_flux_p4','mep_pro_tel0_flux_p5','mep_pro_tel0_flux_p6','mep_pro_tel90_flux_p1','mep_pro_tel90_flux_p2','mep_pro_tel90_flux_p3','mep_pro_tel90_flux_p4','mep_pro_tel90_flux_p5','mep_pro_tel90_flux_p6'};

%定义维度
dimid=netcdf.defDim(ncid,'record',size(time,1));

%定义变量
varid_satID=netcdf.defVar(ncid,'satID','double',dimid);
varid_year=netcdf.defVar(ncid,'year','double',dimid);
varid_day=netcdf.defVar(ncid,'day','double',dimid);
varid_milsec=netcdf.defVar(ncid,'msec','double',dimid);
varid_time=netcdf.defVar(ncid,'time','double',dimid);
varid_alt=netcdf.defVar(ncid,'alt','double',dimid);
varid_lat=netcdf.defVar(ncid,'lat','double',dimid);
varid_lon=netcdf.defVar(ncid,'lon','double',dimid);
varid_L=netcdf.defVar(ncid,'L_IGRF','double',dimid);
varid_B=netcdf.defVar(ncid,'Btot','double',dimid);

varid_variables=zeros(size(var_name,2),1);
for n=1:size(var_name,2)
   var_mat=cell2mat(var_name(n));
   varid_variables(n)=netcdf.defVar(ncid,var_mat,'float',dimid);
end

%结束定义
netcdf.endDef(ncid);

%写入文件
netcdf.putVar(ncid,varid_satID,satID);
netcdf.putVar(ncid,varid_year,year);
netcdf.putVar(ncid,varid_day,day);
netcdf.putVar(ncid,varid_milsec,milsec);
netcdf.putVar(ncid,varid_time,time);
netcdf.putVar(ncid,varid_alt,alt);
netcdf.putVar(ncid,varid_lat,lat);
netcdf.putVar(ncid,varid_lon,lon);
netcdf.putVar(ncid,varid_L,L);
netcdf.putVar(ncid,varid_B,B);
for n=1:size(var_name,2)
    netcdf.putVar(ncid,varid_variables(n),variables(:,n));
end

%关文件
netcdf.close(ncid);

end