%% plot geometry
figure;
trisurf(tri0,point0(:,1),point0(:,2),point0(:,3),2.67);
hold on;
trisurf(tri1,point1(:,1),point1(:,2),point1(:,3),2.67);
hold on;
trisurf(tri2,point2(:,1),point2(:,2),point2(:,3),2.67);
hold on;
trisurf(tri3,point3(:,1),point3(:,2),point3(:,3),1-2.67);
hold on;
trisurf(tri1,point1(:,1),point1(:,2),point1(:,3),1-2.67);
hold on;
trisurf(tri4,point4(:,1),point4(:,2),point4(:,3),1-2.67);