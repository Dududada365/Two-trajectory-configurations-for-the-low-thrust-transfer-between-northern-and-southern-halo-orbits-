map = imread('moonmap.jpg'); % 读取地图文件
[xx,y,z] = sphere(20);
r=0.00452133;p = surf(-r*xx+0.98785,r*y,r*z); % 绘制球体载体，用于贴图
p.CData = map; p.FaceColor = "texturemap"; % 纹理贴图
p.LineStyle = "none"; % 去除网格线
axis equal

xlabel('\itx')
ylabel('\ity','Rotation',0)
zlabel('\itz','Rotation',0)