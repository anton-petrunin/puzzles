settings.render=0;

import graph3;
import contour;
defaultpen(fontsize(10pt));

size(4cm,0);

currentprojection=perspective(1.3,-1.5,.3);

triple  f(pair z) {return 
(cos(z.y)*(2+cos(z.x)),
sin(z.y)*(2+cos(z.x)),
sin(z.x));}

draw(surface(f,(3*pi/2-1,0),(3*pi/2+1,2*pi), nu=10,nv=30,Spline),
     white,meshpen=black+thick(),nolight);
     
triple l(real t) 
{
return (2*sin(t),2*cos(t),-1);
}
