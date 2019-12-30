function All_His_Inter
param_eddy_tracking

% roms_file='/vol/home/student/YinHQ/roms/scs12_36/output/scs36_his_0001.nc';
% ntime=31;
% path_in='../Model-Output/data7/';
% His_uv_Inter(roms_file,Grd,path_in,ntime,theta_s,theta_b,hc,zdep)

% roms_file='/vol/home/student/YinHQ/roms/scs12_36/output/scs36_his_0002.nc';
% ntime=30;
% path_in='../Model-Output/data8/';
% if ~exist(path_in,'file')
%     mkdir(path_in);
% end
% His_uv_Inter(roms_file,Grd,path_in,ntime,theta_s,theta_b,hc,zdep)

% roms_file='/vol/home/student/YinHQ/roms/scs12_36/output/scs36_his_0003.nc';
% ntime=30;
% path_in='../Model-Output/data9/';
% if ~exist(path_in,'file')
%     mkdir(path_in);
% end
% His_uv_Inter(roms_file,Grd,path_in,ntime,theta_s,theta_b,hc,zdep)

roms_file='/vol/home/student/YinHQ/roms/scs12_36/output/scs36_his_0007.nc';
ntime=30;
path_in='../Model-Output/data13/';
if ~exist(path_in,'file')
    mkdir(path_in);
end
His_uv_Inter(roms_file,Grd,path_in,ntime,theta_s,theta_b,hc,zdep)
