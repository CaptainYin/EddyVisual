% clear all
% % wfile='F:\YHQ\DongC_eddy\Model-Output\Ideal\w.nc';
% romsfile='F:\YHQ\roms_his.0000.nc';
% w=ncread(romsfile,'w');
% time=12;
% layer=4;
% w=w(:,:,layer,time)';
% % w(w>0)=0.1
% %w(w<0)=0;
% figure(3);pcolor(1:202,1:102,squeeze(w));shading interp;colorbar;title('w in layer=40 plane');
% load(['F:\YHQ\DongC_eddy\Tracks\Ideal\a_07_b_06\layer',num2str(layer),'\OW_CenterShape.mat']);
% X=shape(1,:);
% Y=shape(2,:);
% hold on
% plot(X,Y,'r');
% caxis([-0.0002,0.0002]);
% colormap(jet);
%
% cun=[];
% for i=1:202
%     for j=1:102
%         if(pnpoly(shape,i,j))
%             cun=[cun,w(j,i)];
%         end
%     end
% end

root='E:\his\wbc20';
historylist=cell(1,10);
for i=1:10
    historylist{i}=[root,'\scswbc20_his_zlevs_',num2str(i,'%04d'),'.nc'];
end
eddy2down=zeros(30,1);
for fid=1:10
    for tid=1:3
        % fid=5;tid=3;
        layer=26;
        day=squeeze(ncread(historylist{fid},'ocean_time',tid,1,1))/86400;
        datetime=datestr(datenum(2000,01,01)+day, 'yyyymmdd');
        w=squeeze(ncread(historylist{fid},'w',[1 1 layer tid],[inf inf 1 1],[1 1 1 1]));
        wdep=ncread('E:\his\wbc20\scswbc20_his_zlevs_0001.nc','wdep');
        
%         wdep(layer)
        load('E:\his\wbc20\vgBnd_vietnam\20130916\bnds_layers_eddymark.mat');
        EddyFlag=bnds_layers{layer}.EddyFlag;
        bndx=bnds_layers{layer}.xc{find(EddyFlag==2,1)};
        bndy=bnds_layers{layer}.yc{find(EddyFlag==2,1)};
        grd_file='E:\his\wbc20\scswbc20_grd.nc';
        lat=ncread(grd_file,'lat_rho');
        lon=ncread(grd_file,'lon_rho');
        lat=lat(1,:);lon=lon(:,1);
        
        for i=1:numel(lon)
            for j=1:numel(lat)
                if(~inpolygon(lon(i),lat(j),bndx,bndy)||w(i,j)>0)
                    w(i,j)=nan;
                end
            end
        end
        eddy2down((fid-1)*3+tid)=nanmean(nanmean(w));
%         pcolor(lon,lat,w');shading interp;colorbar
    end
end