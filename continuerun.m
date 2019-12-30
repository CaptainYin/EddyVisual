% load('D:\Eddy\loc\scs10\3dLOC_276_eddy2_layer3_dt60.mat')
% load('D:\Eddy\loc\scs10\3dLOC_313_eddy0_layer4_dt60.mat')
% load('E:\his\wbc20\loc\2dLOC_20130916_4453_eddy1_edge.mat')

% load('E:\his\wbc20\loc\3dLOC_20130916_691_eddy1_layer38.mat')
% iniloc=zeros(size(LOC,1),4);
% iniloc(:,1)=LOC(:,2,end);
% iniloc(:,2)=LOC(:,3,end);
% iniloc(:,3)=LOC(:,1,end);
% iniloc(:,4)=0;
% csvwrite('E:\his\wbc20\loc\IPL_20130916_691_eddy1_layer38_continue.csv',iniloc)

% csvwrite('D:\Eddy\loc\scs10\IPL_313_eddy0_layer4_continue.csv',iniloc)
% csvwrite('D:\Eddy\loc\scs10\IPL_276_eddy2_layer3_continue.csv',iniloc)

%% cat
% file='E:\his\wbc20\loc\dttest\3dLOC_20130916_335_eddy2_layer22\3dLOC_20130916_335_eddy2_layer22_dt5';
% load([file,'.mat']);
% LOC0=LOC(:,:,1:720);
% load([file,'_continue.mat']);
% LOC1=LOC;
% LOC=cat(3,LOC0,LOC1);
% save([file,'.mat'],'LOC');

%% seperate ini to layer
% iniloc=csvread('E:\his\wbc20\vgBnd_vietnam\20130916\IPL_20130916_6290_eddy2_0405.csv');
iniloc=csvread('E:\his\wbc20\vgBnd_vietnam\20130916\IPL_20130916_3226_eddy1_0405.csv');

% load('E:\his\wbc20\vgBnd_vietnam\20130916\flag_20130916_6290_eddy2_0405.mat');
load('E:\his\wbc20\vgBnd_vietnam\20130916\flag_20130916_3226_eddy1_0405.mat');
Layer=38;
cpNum=cumsum(pNum_layer);
pstr=cpNum(Layer-1)+1;pend=cpNum(Layer);
iniloc=iniloc(pstr:6:pend,:,:);
csvwrite(['E:\his\wbc20\vgBnd_vietnam\20130916\IPL_20130916_',...
    num2str(size(iniloc,1)),'_eddy1_layer',num2str(Layer),'_0405.csv'],iniloc)

