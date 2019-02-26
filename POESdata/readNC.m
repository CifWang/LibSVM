function[satID,year,day,milsec,time,alt,lat,lon,L,B,variables]=readNC(filePath_in)
%添加数据路径，方便
addpath(genpath('D:\documents\matlab\POESdata\data'));

%打开文件
ncid=netcdf.open(filePath_in);

%获取卫星名称、时间、位置等基本信息
%卫星id
%变成double类型处理，不然写入新文件会有问题
varid_satID=netcdf.inqVarID(ncid,'satID');
satID=netcdf.getVar(ncid,varid_satID);
satID=double(satID);

%年份
varid_year=netcdf.inqVarID(ncid,'year');
year=netcdf.getVar(ncid,varid_year);
year=double(year);

%一年中的第几天
varid_day=netcdf.inqVarID(ncid,'day');
day=netcdf.getVar(ncid,varid_day);
day=double(day);

%一天中的毫秒
varid_milsec=netcdf.inqVarID(ncid,'msec');
milsec=netcdf.getVar(ncid,varid_milsec);
milsec=double(milsec);

%1970年起的秒数
varid_time=netcdf.inqVarID(ncid,'time');
time=netcdf.getVar(ncid,varid_time);
%time=vpa(time,10);
time=double(time)./1000;

%卫星高度
varid_alt=netcdf.inqVarID(ncid,'alt');
alt=netcdf.getVar(ncid,varid_alt);
alt=double(alt);

%磁场磁纬、磁经坐标
varid_lat=netcdf.inqVarID(ncid,'mag_lat_sat');
lat=netcdf.getVar(ncid,varid_lat);
lat=double(lat);
varid_lon=netcdf.inqVarID(ncid,'mag_lon_sat');
lon=netcdf.getVar(ncid,varid_lon);
lon=double(lon);

%L值、B值
varid_L=netcdf.inqVarID(ncid,'L_IGRF');
L=netcdf.getVar(ncid,varid_L);
L=double(L);
varid_B=netcdf.inqVarID(ncid,'Btot_sat');
B=netcdf.getVar(ncid,varid_B);
B=double(B);

%通量数据
var_name={'mep_ele_tel0_flux_e1','mep_ele_tel0_flux_e2','mep_ele_tel0_flux_e3','mep_ele_tel0_flux_e4','mep_ele_tel90_flux_e1','mep_ele_tel90_flux_e2','mep_ele_tel90_flux_e3','mep_ele_tel90_flux_e4','mep_pro_tel0_flux_p1','mep_pro_tel0_flux_p2','mep_pro_tel0_flux_p3','mep_pro_tel0_flux_p4','mep_pro_tel0_flux_p5','mep_pro_tel0_flux_p6','mep_pro_tel90_flux_p1','mep_pro_tel90_flux_p2','mep_pro_tel90_flux_p3','mep_pro_tel90_flux_p4','mep_pro_tel90_flux_p5','mep_pro_tel90_flux_p6'};
variables=zeros(size(time,1),size(var_name,2));
for n=1:size(var_name,2)
    var_mat=cell2mat(var_name(:,n));
    varid=netcdf.inqVarID(ncid,var_mat);
    variables(:,n)=netcdf.getVar(ncid,varid);
end

%关闭文件
netcdf.close(ncid);
end