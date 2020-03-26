settings.render=32;
import three;
size(4cm);
currentprojection=perspective(20,9,10);
currentlight=light(.1,.2,.4);

real
n=6,
phi=pi/n,
psi=pi/n,
k=2
;

triple 
o=(0,0,0),
e=(0,0,1),
a=(1,tan(psi),-k*tan(psi)),
b=(1,tan(phi+psi),-k*tan(phi+psi))
;

path3[] faces;

for (int i=0; i<n; i+=1)
{faces.push(rotate(360*i/n, Z)*(a--b--o--o--cycle));
faces.push(rotate(360*i/n, Z)*reflect(o,a,e)*(a--b--o--o--cycle));
}


draw(faces,.5bp+black+opacity(1));
draw(surface(faces),white+opacity(.6),light=nolight);
