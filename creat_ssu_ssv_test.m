% 创建SSU和SSV作为测试用
clc;clear;close all
file_dir='..\Model-Output\data1\';
file_dir_out='..\Model-Output\data1_test\';

file_out=[file_dir_out,num2str(i_mon,'%02d'),'_U.nc']; %修改起始时间和U
if exist(file_out,'file')
    delete(file_out);
end
U=squeeze(U_mon(:,:,i_mon))/U_mon_num(i_mon);
nccreate(file_out,'Longitude','Dimensions',{'Longitude',n_lon},'Datatype','single','Format','classic');
    ncwrite(file_out,'Longitude',single(Longitude));
    nccreate(file_out,'Latitude','Dimensions',{'Latitude',n_lat},'Datatype','single','Format','classic');
    ncwrite(file_out,'Latitude',single(Latitude));
    nccreate(file_out,'Time','Dimensions',{'Time',1},'Datatype','single','Format','classic');
    ncwrite(file_out,'Time',single(i_mon));
    nccreate(file_out,'U','Dimensions',{'Longitude',n_lon,'Latitude',n_lat},'Datatype','single','Format','classic');
    ncwrite(file_out,'U',single(U));
%     clear U
    
    
    file_out=[file_dir_out,num2str(i_mon,'%02d'),'_V.nc']; %修改起始时间和U
    if exist(file_out,'file')
        delete(file_out);
    end
    V=squeeze(V_mon(:,:,i_mon))/V_mon_num(i_mon);
    nccreate(file_out,'Longitude','Dimensions',{'Longitude',n_lon},'Datatype','single','Format','classic');
    ncwrite(file_out,'Longitude',single(Longitude));
    nccreate(file_out,'Latitude','Dimensions',{'Latitude',n_lat},'Datatype','single','Format','classic');
    ncwrite(file_out,'Latitude',single(Latitude));
    nccreate(file_out,'Time','Dimensions',{'Time',1},'Datatype','single','Format','classic');
    ncwrite(file_out,'Time',single(Time));
    nccreate(file_out,'V','Dimensions',{'Longitude',n_lon,'Latitude',n_lat},'Datatype','single','Format','classic');
    ncwrite(file_out,'V',single(V));
%     clear V

