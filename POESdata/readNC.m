function[satID,year,day,milsec,time,alt,lat,lon,L,B,variables]=readNC(filePath_in)
%�������·��������
addpath(genpath('D:\documents\matlab\POESdata\data'));

%���ļ�
ncid=netcdf.open(filePath_in);

%��ȡ�������ơ�ʱ�䡢λ�õȻ�����Ϣ
%����id
%���double���ʹ�����Ȼд�����ļ���������
varid_satID=netcdf.inqVarID(ncid,'satID');
satID=netcdf.getVar(ncid,varid_satID);
satID=double(satID);

%���
varid_year=netcdf.inqVarID(ncid,'year');
year=netcdf.getVar(ncid,varid_year);
year=double(year);

%һ���еĵڼ���
varid_day=netcdf.inqVarID(ncid,'day');
day=netcdf.getVar(ncid,varid_day);
day=double(day);

%һ���еĺ���
varid_milsec=netcdf.inqVarID(ncid,'msec');
milsec=netcdf.getVar(ncid,varid_milsec);
milsec=double(milsec);

%1970���������
varid_time=netcdf.inqVarID(ncid,'time');
time=netcdf.getVar(ncid,varid_time);
%time=vpa(time,10);
time=double(time)./1000;

%���Ǹ߶�
varid_alt=netcdf.inqVarID(ncid,'alt');
alt=netcdf.getVar(ncid,varid_alt);
alt=double(alt);

%�ų���γ���ž�����
varid_lat=netcdf.inqVarID(ncid,'mag_lat_sat');
lat=netcdf.getVar(ncid,varid_lat);
lat=double(lat);
varid_lon=netcdf.inqVarID(ncid,'mag_lon_sat');
lon=netcdf.getVar(ncid,varid_lon);
lon=double(lon);

%Lֵ��Bֵ
varid_L=netcdf.inqVarID(ncid,'L_IGRF');
L=netcdf.getVar(ncid,varid_L);
L=double(L);
varid_B=netcdf.inqVarID(ncid,'Btot_sat');
B=netcdf.getVar(ncid,varid_B);
B=double(B);

%ͨ������
var_name={'mep_ele_tel0_flux_e1','mep_ele_tel0_flux_e2','mep_ele_tel0_flux_e3','mep_ele_tel0_flux_e4','mep_ele_tel90_flux_e1','mep_ele_tel90_flux_e2','mep_ele_tel90_flux_e3','mep_ele_tel90_flux_e4','mep_pro_tel0_flux_p1','mep_pro_tel0_flux_p2','mep_pro_tel0_flux_p3','mep_pro_tel0_flux_p4','mep_pro_tel0_flux_p5','mep_pro_tel0_flux_p6','mep_pro_tel90_flux_p1','mep_pro_tel90_flux_p2','mep_pro_tel90_flux_p3','mep_pro_tel90_flux_p4','mep_pro_tel90_flux_p5','mep_pro_tel90_flux_p6'};
variables=zeros(size(time,1),size(var_name,2));
for n=1:size(var_name,2)
    var_mat=cell2mat(var_name(:,n));
    varid=netcdf.inqVarID(ncid,var_mat);
    variables(:,n)=netcdf.getVar(ncid,varid);
end

%�ر��ļ�
netcdf.close(ncid);
end