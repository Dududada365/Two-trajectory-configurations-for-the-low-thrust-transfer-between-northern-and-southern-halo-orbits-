map = imread('moonmap.jpg'); % ��ȡ��ͼ�ļ�
[xx,y,z] = sphere(20);
r=0.00452133;p = surf(-r*xx+0.98785,r*y,r*z); % �����������壬������ͼ
p.CData = map; p.FaceColor = "texturemap"; % ������ͼ
p.LineStyle = "none"; % ȥ��������
axis equal

xlabel('\itx')
ylabel('\ity','Rotation',0)
zlabel('\itz','Rotation',0)