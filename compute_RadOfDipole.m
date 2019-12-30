% compute radius of dipole of Vietnam

R_ae=zeros(48,1);
R_ce=zeros(48,1);
for layer=1:numel(bnds_layers)
    if(numel(bnds_layers{layer})==0)
        continue;
    end
    bndx=bnds_layers{layer}.xc;bndy=bnds_layers{layer}.yc;N_bnd=numel(bnds_layers{layer}.yc);
    EddyFlag=bnds_layers{layer}.EddyFlag;
    for  j=1:N_bnd
        if(EddyFlag(j)==1)
            R_ce(layer)=get_rad_wbc(bndx{j},bndy{j},bnds_layers{layer}.xp(j),bnds_layers{layer}.yp(j));
        elseif(EddyFlag(j)==2)
            R_ae(layer)=get_rad_wbc(bndx{j},bndy{j},bnds_layers{layer}.xp(j),bnds_layers{layer}.yp(j));
        end
    end
end
max(R_ce)
max(R_ae)
sum(R_ce)/sum(R_ce~=0)
sum(R_ae)/sum(R_ae~=0)
