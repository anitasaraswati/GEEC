function R = geec_calc(dem,geoh,lonmes,latmes,zmes,a,ecc,f,tri,dens)
    [Emes,Nmes,Umes,point]=createmesh(dem,geoh,lonmes,latmes,zmes,a,ecc);
    clear createmesh dem
    
    calcres=f(Emes,Nmes,Umes,point,tri,dens);
    clear f
    
    R=[lonmes latmes zmes calcres];
end