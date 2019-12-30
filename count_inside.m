
shapedir='F:\YHQ\DongC_eddy\Model-Output\Ideal0\t12\';
root='F:\YHQ\DongC_eddy\Model-Output\Ideal0\';
load([root,'UVW_Phy.mat'],'rdep')
load([shapedir,'OW_CenterShape',num2str(55),'.mat']);
% load('F:\YHQ\DongC_eddy\loc\3dLOC_n500_idt120_nlayer39_outedge.mat')
%  load('F:\YHQ\DongC_eddy\loc\3dLOC_n100000_merge.mat')
load('F:\YHQ\DongC_eddy\loc\3Ddttest\n500bottom40\3dLOC_n500_bottom40_idt1_cby.mat')
inside=zeros(1,size(LOC,3));
ubry=rdep(55);dbry=rdep(19);
parfor i=1:size(LOC,3)
    loc=squeeze(LOC(:,:,i));
    for j=1:size(loc,1)
        if(loc(j,1)>=dbry&&loc(j,1)<=ubry&&pnpoly(shape,loc(j,2),loc(j,3)))
             inside(i)=inside(i)+1;
        end
    end
end
figure(1);plot(inside(1:1000));
set(gca,'YLim',[1,500])
title('depth-150:10000uniAllLayer');