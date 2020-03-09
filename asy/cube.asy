settings.render=0;
import solids;
import three;
size(3cm,0);
currentprojection=orthographic((2, 1, .4));

revolution rx=cylinder((0, 1, 3), .7, 4, X);
revolution ry=cylinder((1, 0, 1), .7, 4, Y);
revolution rz=cylinder((3, 3, 0), .7, 4, Z);

path3 circlex =circle(c=(4, 1, 3), r=.7,normal=X);
path3 circley =circle(c=(1, 4, 1), r=.7,normal=Y);
path3 circlez =circle(c=(3, 3, 4), r=.7,normal=Z);

draw(rx,dashed);
draw(ry,dashed);
draw(rz,dashed);

draw(circlex);
draw(circley);
draw(circlez);

draw((4,0,0)--(0,0,0),dashed);
draw((0,4,0)--(0,0,0)--(0,0,4),dashed);
draw((4,0,0)--(4,4,0)--(0,4,0)--(0,4,4)--(0,0,4)--(4,0,4)--cycle);
draw((4,4,4)--(0,4,4));
draw((4,4,0)--(4,4,4)--(4,0,4));
