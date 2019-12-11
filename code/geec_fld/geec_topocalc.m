function R = geec_topocalc(dem,geoh,lonmes,latmes,zmes,meshdist,a,ecc,f,k0,iland,iwater,k1,k3)

[Emes,Nmes,Umes,point0,point1,point2,point3,point4,tri0_land,tri0_water,tri1,tri2,tri3,tri4]=createmesh_topo(dem,geoh,lonmes,latmes,zmes,meshdist,a,ecc,iland,iwater,k0,k1,k3);
clear createmesh_topo dem

calcres=f(Emes,Nmes,Umes,point0,point1,point2,point3,point4,tri0_land,tri0_water,tri1,tri2,tri3,tri4);
clear f

R = [lonmes latmes zmes calcres];
end