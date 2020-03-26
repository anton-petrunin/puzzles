settings.render=32;
import three;
size(4cm);
currentprojection=perspective(4,8,80);
currentlight=light(.1,.2,.4);


real h, k;
h=.5;
k=.8;

triple 
xy=(1,h,0),
xY=(1,-h,0),
Xy=(-1,h,0),
XY=(-1,-h,0),
xz=(1,0,h),
xZ=(1,0,-h),
Xz=(-1,0,h),
XZ=(-1,0,-h),
yx=(h,1,0),
yX=(-h,1,0),
Yx=(h,-1,0),
YX=(-h,-1,0),
yx=(h,1,0),
yX=(-h,1,0),
Yx=(h,-1,0),
YX=(-h,-1,0),
yz=(0,1,h),
yZ=(0,1,-h),
Yz=(0,-1,h),
YZ=(0,-1,-h),
zy=(0,h,1),
zY=(0,-h,1),
Zy=(0,h,-1),
ZY=(0,-h,-1),
zx=(h,0,1),
zX=(-h,0,1),
Zx=(h,0,-1),
ZX=(-h,0,-1)
;

path3[] faces={
xy--yx--yz--zy--zx--xz--cycle,
xY--Yx--Yz--zY--zx--xz--cycle,
xy--yx--yZ--Zy--Zx--xZ--cycle,
xY--Yx--YZ--ZY--Zx--xZ--cycle,
Xy--yX--yz--zy--zX--Xz--cycle,
XY--YX--Yz--zY--zX--Xz--cycle,
Xy--yX--yZ--Zy--ZX--XZ--cycle,
XY--YX--YZ--ZY--ZX--XZ--cycle,
xy--yx--yz--zy--zx--xz--cycle,

k*xy--k*yx--k*yz--k*zy--k*zx--k*xz--cycle,
k*xY--k*Yx--k*Yz--k*zY--k*zx--k*xz--cycle,
k*xy--k*yx--k*yZ--k*Zy--k*Zx--k*xZ--cycle,
k*xY--k*Yx--k*YZ--k*ZY--k*Zx--k*xZ--cycle,
k*Xy--k*yX--k*yz--k*zy--k*zX--k*Xz--cycle,
k*XY--k*YX--k*Yz--k*zY--k*zX--k*Xz--cycle,
k*Xy--k*yX--k*yZ--k*Zy--k*ZX--k*XZ--cycle,
k*XY--k*YX--k*YZ--k*ZY--k*ZX--k*XZ--cycle,
k*xy--k*yx--k*yz--k*zy--k*zx--k*xz--cycle,

xy--xz--k*xz--k*xy--cycle,
xY--xz--k*xz--k*xY--cycle,
xy--xZ--k*xZ--k*xy--cycle,
xY--xZ--k*xZ--k*xY--cycle,
Xy--Xz--k*Xz--k*Xy--cycle,
XY--Xz--k*Xz--k*XY--cycle,
Xy--XZ--k*XZ--k*Xy--cycle,
XY--XZ--k*XZ--k*XY--cycle,

yx--yz--k*yz--k*yx--cycle,
yX--yz--k*yz--k*yX--cycle,
yx--yZ--k*yZ--k*yx--cycle,
yX--yZ--k*yZ--k*yX--cycle,
Yx--Yz--k*Yz--k*Yx--cycle,
YX--Yz--k*Yz--k*YX--cycle,
Yx--YZ--k*YZ--k*Yx--cycle,
YX--YZ--k*YZ--k*YX--cycle,

zy--zx--k*zx--k*zy--cycle,
zY--zx--k*zx--k*zY--cycle,
zy--zX--k*zX--k*zy--cycle,
zY--zX--k*zX--k*zY--cycle,
Zy--Zx--k*Zx--k*Zy--cycle,
ZY--Zx--k*Zx--k*ZY--cycle,
Zy--ZX--k*ZX--k*Zy--cycle,
ZY--ZX--k*ZX--k*ZY--cycle,
};


draw(faces,.5bp+black+opacity(1));
draw(surface(faces),white+opacity(.6),light=nolight);
