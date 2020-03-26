settings.render=32;
import three;
size(4cm);
currentprojection=perspective(8,4,12);
currentlight=light(.1,.2,.4);

real
n=8,
phi=pi/n,
  p=2,
  P=3.35,
  q=p*cos(phi)-(1-(p*sin(phi)^2)^.5),
  Q=P*cos(phi)-(1-(P*sin(phi)^2)^.5),
  a=Q-q,
  b=P-p,
  l=(p^2+Q^2-2*p*Q*cos(phi))^.5,
  
  x=.45662,//from octave
  y=.73098//from octave
;

triple 
qq=(q,0,0),
QQ=(Q,0,0),
pp=(p*cos(phi),p*sin(phi),0),
PP=(P*cos(phi),P*sin(phi),0),
xx=QQ+(0,0,x),
xxx=QQ-(0,0,x),

yy=pp+(0,0,y),
yyy=pp-(0,0,y)
;

path3[] faces;

for (int i=0; i<n; i+=1)
{faces.push(rotate(360*i/n, Z)*(xxx--xx--PP--PP--cycle));
faces.push(rotate(360*i/n, Z)*(xx--PP--yy--yy--cycle));
faces.push(rotate(360*i/n, Z)*(xx--yy--qq--qq--cycle));
faces.push(rotate(360*i/n, Z)*(yy--qq--yyy--yyy--cycle));
faces.push(rotate(360*i/n, Z)*(xxx--PP--yyy--yyy--cycle));
faces.push(rotate(360*i/n, Z)*(xxx--yyy--qq--qq--cycle));
faces.push(rotate(360*i/n, Z)*reflect(yyy, yy, PP)*(xxx--xx--PP--PP--cycle));
faces.push(rotate(360*i/n, Z)*reflect(yyy, yy, PP)*(xx--PP--yy--yy--cycle));
faces.push(rotate(360*i/n, Z)*reflect(yyy, yy, PP)*(xx--yy--qq--qq--cycle));
faces.push(rotate(360*i/n, Z)*reflect(yyy, yy, PP)*(yy--qq--yyy--yyy--cycle));
faces.push(rotate(360*i/n, Z)*reflect(yyy, yy, PP)*(xxx--PP--yyy--yyy--cycle));
faces.push(rotate(360*i/n, Z)*reflect(yyy, yy, PP)*(xxx--yyy--qq--qq--cycle));
}

draw(faces,.5bp+black+opacity(1));
draw(surface(faces),white+opacity(.6),light=nolight);

//calculations for octave:
//
//function y = f (x)
//  y = zeros (2, 1);
//  phi=pi/8;
//  p=2;
//  P=3.35;
//  q=p*cos(phi)-(1-(p*sin(phi)^2)^.5);
//  Q=P*cos(phi)-(1-(P*sin(phi)^2)^.5);
//  a=Q-q;
//  b=P-p;
//  l=(p^2+Q^2-2*p*Q*cos(phi))^.5;
//  y(1) = a+(a^2+x(1)^2)^.5-(b+(b^2+x(2)^2)^.5);
//  y(2) = ((a^2+x(1)^2)^.5-x(2))^2+1-(l^2+(x(1)-x(2))^2);
//endfunction
//
//[x, fval, info] = fsolve (@f, [1; 1])
