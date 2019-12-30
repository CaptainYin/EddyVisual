function concate_uvnc
dirL={'../Model-Output/data7/','../Model-Output/data8/','../Model-Output/data9/','../Model-Output/data10/','../Model-Output/data11/'};
n_day=151;
% from 2011,11
%
out_dir='../Model-Output/merge/';
if ~exist(out_dir,'file')
    mkdir(out_dir);
end


ssu=ncread(strcat(dirL{1},'ssu.nc'),'ssu');
zdep=ncread(strcat(dirL{1},'ssu.nc'),'zdep');
[n_lon,n_lat,~,~]=size(ssu);

day=zeros(n_day,1);

ssu=zeros(n_lon,n_lat,length(zdep),n_day);
ssv=zeros(n_lon,n_lat,length(zdep),n_day);
start=1;
for i=1:length(dirL)
    dir=dirL{i};
    t=length(ncread(strcat(dir,'ssu.nc'),'day'));
    ssu(:,:,:,start:start+t-1)=ncread(strcat(dir,'ssu.nc'),'ssu');
    ssv(:,:,:,start:start+t-1)=ncread(strcat(dir,'ssv.nc'),'ssv');
    day(start:start+t-1)=ncread(strcat(dir,'ssv.nc'),'day');
    start=start+t;
end

%% write u v to netcdf file
file_out=[out_dir,'ssu.nc'];
if exist(file_out,'file')
    delete(file_out);
end
nccreate(file_out,'day','Dimensions',{'time' n_day},'Datatype','double','Format','classic');
ncwriteatt(file_out,'day','units','day');
ncwrite(file_out,'day',day);


nccreate(file_out,'ssu','Dimensions',{'x' n_lon 'y' n_lat 'z' length(zdep) 'time' n_day},'Datatype','double','Format','classic');
ncwrite(file_out,'ssu',ssu);
nccreate(file_out,'zdep','Dimensions',{'z_lev',length(zdep)},'Datatype','double','Format','classic');
ncwrite(file_out,'zdep',zdep);

file_out=[out_dir,'ssv.nc'];
if exist(file_out,'file')
    delete(file_out);
end
nccreate(file_out,'day','Dimensions',{'time' n_day},'Datatype','double','Format','classic');
ncwriteatt(file_out,'day','units','day');
ncwrite(file_out,'day',day);


nccreate(file_out,'ssv','Dimensions',{'x' n_lon 'y' n_lat 'z' length(zdep) 'time' n_day},'Datatype','double','Format','classic');
ncwrite(file_out,'ssv',ssv);
nccreate(file_out,'zdep','Dimensions',{'z_lev',length(zdep)},'Datatype','double','Format','classic');
ncwrite(file_out,'zdep',zdep);
    