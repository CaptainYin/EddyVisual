%ClassParticle2Eddy
%before:joinEddy.m
%after:plot_bnd_particle_distinguish.m
clear all;
ini_loc=csvread('Initial_16-Sep_4873_locations.csv');
load(['..\Tracks\scs10\OWfigure\20130916\bnds_layers.mat']);
load('pNum_layer_16-Sep_4873.mat')
AccpNum_layer=cumsum(pNum_layer);
ind=0;flag=zeros(size(ini_loc,1),1);
for layer=1:24
    if(pNum_layer(layer)==0);continue;end
      bndx=bnds_layers{layer}.xc;bndy=bnds_layers{layer}.yc;
      N_bnd=numel(bnds_layers{layer}.yc);EddyFlag=bnds_layers{layer}.EddyFlag;
    while ind<AccpNum_layer(layer)
        ind=ind+1;
        xp=ini_loc(ind,1);yp=ini_loc(ind,2);
        for j=1:N_bnd
            if(inpolygon(xp,yp,bndx{j},bndy{j}))
                flag(ind)=EddyFlag(j);break;
            end
        end
    end
end

