function calcres = gravity_calc_topo(Emes,Nmes,Umes,point0,point1,point2,point3,point4,tri0_land,tri0_water,tri1,tri2,tri3,tri4)
% digitold=digits(100);
graviterre;
gravimer;
graviterrainx=-(gravixterre+gravixmer);
graviterrainy=-(graviyterre+graviymer);
graviterrainz=-(gravizterre+gravizmer);   

calcres=[graviterrainx,graviterrainy,graviterrainz];
% digits(digitold);