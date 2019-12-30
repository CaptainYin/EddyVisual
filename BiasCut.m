
clear all
tid=1;
roms_file='E:\his\all2_1.00\scs10_his_zlevs_0004.nc';
load('E:\his\all2_1.00\vgBnd_vietnam\20130919\bnds_layers_eddymark_extern.mat')
% Lonmin=113;Lonmax=119;Latmin=15;Latmax=19.5;
Lonmin=111;Lonmax=114;Latmin=10;Latmax=13;
path_to_pic='E:\his\all2_1.00\vgBnd_vietnam\20130919\';
%% Get data
grd='../his/scs10_grd.nc';
day=squeeze(ncread(roms_file,'ocean_time',tid,1,1))/86400;
datetime=datestr(datenum(2000,01,01)+day, 'yyyymmdd');
u=squeeze(ncread(roms_file,'u',[1 1 1 tid],[inf inf  inf 1],[1 1 1 1]));
v=squeeze(ncread(roms_file,'v',[1 1 1 tid],[inf inf  inf 1],[1 1 1 1]));
w=squeeze(ncread(roms_file,'w',[1 1 1 tid],[inf inf  inf 1],[1 1 1 1]));
temp=squeeze(ncread(roms_file,'temp',[1 1 1 tid],[inf inf  inf 1],[1 1 1 1]));
rdep=ncread(roms_file,'rdep');
wdep=squeeze(ncread(roms_file,'wdep'));
lon=ncread(grd,'lon_rho');lon=lon(:,1);
lat=ncread(grd,'lat_rho');lat=lat(1,:);
indexi=lon>=Lonmin&lon<=Lonmax;cut_lon=lon(indexi);
cut_lat=interp1([Lonmin Lonmax],[Latmin Latmax],cut_lon,'linear');
dep=rdep(14:24);
[X ,Y , Z]=meshgrid(lon,lat,dep);

% V=permute(temp(:,:,14:24),[2,1,3]);
% Vq=zeros(numel(cut_lon),numel(dep));
% for i=1:numel(cut_lon)
%     Vq(i,:) = interp3(X,Y,Z,V,cut_lon(i),cut_lat(i),dep);
% end
% 
% pcolor(cut_lon,dep,Vq');shading interp;
% hold on
% [c,h]=contour(cut_lon,dep,Vq',7,'color','k');
% clabel(c,h)
% c=colorbar('FontSize',15);
% c.Label.String='temp [\circC]';
% % c.Label.String='velocity (meter/second)';
% colormap(flip(othercolor('RdBu11',128),1));

V=permute(w(:,:,14:24),[2,1,3]);
Vq=zeros(numel(cut_lon),numel(dep));
for i=1:numel(cut_lon)
    Vq(i,:) = interp3(X,Y,Z,V,cut_lon(i),cut_lat(i),dep);
end

pcolor(cut_lon,dep,Vq');shading interp;
% hold on
% [c,h]=contour(cut_lon,dep,Vq',7,'color','k');
% clabel(c,h)
c=colorbar('FontSize',15);
% c.Label.String='temp [\circC]';
c.Label.String='velocity (meter/second)';
colormap(flip(othercolor('RdBu11',128),1));
 caxis([-0.0005,0.0005])
