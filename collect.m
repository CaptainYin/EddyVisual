% rootpath='F:\YHQ\DongC_eddy\Tracks\Ideal\a_07_b_06\';
% for i=1:40
%     file=[rootpath,'layer',num2str(i,'%02d'),'\OWfigure\2166.png'];
%     dstfile=[rootpath,'time12\layer',num2str(i,'%02d'),'.PNG'];
%     movefile(file,dstfile);
% end
 
rootpath='E:\his\all2_1.00\vgBnd\';
for day=1:20
        datetime=datestr(datenum(2013,09,06)+day, 'yyyymmdd');
        file=[rootpath,datetime,'/owEddyBnd.png'];
        dstfile=[rootpath,'bnds\',datetime,'.png'];
        movefile(file,dstfile);
end

% for i=1:40
%     
%     dstfile=[rootpath,'time12\layer',num2str(i,'%02d'),'.PNG'];
%     movefile(file,dstfile);
% end