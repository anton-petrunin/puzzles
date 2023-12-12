settings.render=0;
import solids;
import three;
size(4cm,0);
currentprojection=orthographic((0, 1, .3));

revolution r1=cylinder((-4, 0, 0), 1, pi, Z);

draw(r1);

revolution r2=cylinder((0, 0, 0), 1, pi, Z);

draw(r2);


path3 up =(0,1,0)--(0,1,pi);

triple  f(real t) {return (-sin(t)-4,cos(t),t/2);}

path3 twist1=graph(f,0,pi/2);
path3 twist2=graph(f,pi/2,3*pi/2);
path3 twist3=graph(f,3*pi/2,2*pi);

draw(twist1);
draw(twist2,dashed);
draw(twist3);


draw(up);

