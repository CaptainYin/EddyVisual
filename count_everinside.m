
%the number of partical have ever been in the eddy
load('F:\YHQ\DongC_eddy\Model-Output\Ideal0\t12\OW_CenterShape55.mat')
load('F:\YHQ\DongC_eddy\Model-Output\Ideal0\UVW_Phy.mat','rdep','h')
ubry=rdep(55);dbry=rdep(19);
tl=1170;
load('F:\YHQ\DongC_eddy\loc\3Ddttest\n500bottom40\3dLOC_n500_bottom40_idt1_cby.mat')
c=0;
parfor i=1:size(LOC,1)
    for j=1:tl
        if(LOC(i,1,j)>=dbry&&LOC(i,1,j)<=ubry&&pnpoly(shape,LOC(i,2,j),LOC(i,3,j)))
             c=c+1;
             break;
        end
    end
end

