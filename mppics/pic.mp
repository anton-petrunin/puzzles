input macros
input hatching
input mparrows
input fiziko

verbatimtex
%&latex
\documentclass[oneside]{book}
\usepackage{../problems}
\begin{document}

etex

filenametemplate "%j-%1c.mps";
prologues:=3;
setarrows(barbedsharp);
linecap:=butt;
%linejoin:=mitered;

%outputformat := "svg";



beginfig(102);
save u, n, p;
path p[];
u:=.1cm;
n:=30;


z.a=(1,0)*u;
z.b=z.a rotated 180/n;
x.r=abs(z.a-z.b)/2.6;
y.r=3*u;

for i=0 
upto n:
draw circle(z.a rotated (i*360/n),y.r+i*x.r) penhair;
endfor

draw
for i=0 
upto n-1:
(z.a rotated (i*360/n) + (y.r+i*x.r)*unitvector(z.a rotated ((i-1)*360/n)-z.a rotated (i*360/n)))..
endfor
(z.a rotated (n*360/n) + (y.r+n*x.r)*unitvector(z.a rotated ((n-1)*360/n)-z.a rotated (n*360/n)))
;

endfig;



beginfig(104)
save u,p;
u:=1cm;
path p[];

z.x=(1,0)*u;
z.y=(0,1)*u;
z.p=.5[z.x,z.y];
z.q=(x.p,-y.p);


p[1]=
(arc(z.p,z.p rotatedabout(z.x,-10),z.q))
--
arc(z.q,z.q rotatedabout(-z.y,10),-z.p)
--
(arc(-z.p,-z.p rotatedabout(-z.x,-10),-z.q))
--
arc(-z.q,-z.q rotatedabout(z.y,10),z.p)
--
cycle;

p[2]= circle(z.x,.9*(z.p-z.x));

draw p[1];
draw p[2];
hatchfill p[2]  withcolor (20, 1mm, -.5bp);

label (btex $F$ etex, -z.x);
endfig;

beginfig(106)
save u,p;
path p[];
u:=1cm;

z.a1=(0,0)*u;
z.a2=(.5,-.7)*u;
z.a3=(-.6,-.7)*u;

z.b1=(1,.2)*u;
z.b2=(0,-1.3)*u;
z.b3=-z.b1;

p[3]=z.a1{z.b1}..z.a2..z.a3..cycle;
p[2]=z.b1..z.b2..z.b3..cycle;

draw p[3];
draw p[2];
draw z.b1--z.b3;

rimmark(z.a1--z.b1,z.b3--z.a1);

dOt z.a1,z.b1,z.b3;

endfig;

beginfig(107)
save u,p;
path p[];
u:=1cm;

z.a1=origin;
z.a2=(.5,-.7)*u;
z.a3=(-.6,-.7)*u;

z.b1=(1,.2)*u;
z.b2=(0,-1.3)*u;
z.b3=-(1.3)*z.b1;

p[3]=z.a1{z.b1}..z.a2..z.a3..cycle;
p[2]=z.b1..z.b2..z.b3..cycle;

draw p[3];
draw p[2];
draw z.b1--z.b3;
z.u=(.5*z.b1) rotated 90;
drawarrow z.a1--z.u;

%rimmark(z.a1--z.b1,z.b3--z.a1);

dOt z.a1,z.b1,z.b3;

label.top (btex $r$ etex, .5[z.a1,z.b1]);
label.top (btex $l$ etex, .5[z.a1,z.b3]);
label.top (btex $u$ etex, z.u);
label.bot (btex $x_u$ etex, z.a1+(3,-1));
endfig;

beginfig(108)
save u,gap,p;
path p[];
u:=1cm;
gap:=.07*cm;

z.a=(0,.3)*u;
z.b=(.1,-.3)*u;
z.l=(-1,-.1)*u;
z.r=(.7,0)*u;

p1=z.a..z.b..z.l..cycle;
p2=z.b..z.a..z.r..cycle;

draw subpath (arctime gap of p1, arctime ((arclength p1)-gap) of p1) of p1;
draw subpath (arctime gap of p2,arctime ((arclength p2)-gap) of p2) of p2;
endfig;

beginfig(109)
save u,gap,p;
path p[];
u:=1cm;
gap:=.07*u;

z.a=(0,.4)*u;
z.b=(.1,-.6)*u;
z.l=(-1,-.1)*u;
z.r=(.9,0)*u;
z.z=(-.4,-.1)*u;

p1=z.a..z.b..z.l..cycle;
p2=z.b{-1,-.2}..z.z..z.a{1,.2}..z.r..cycle;

z.y=(subpath (0,1) of p1) intersectionpoint (z.z--(4*z.z-3*z.l));

draw subpath (arctime gap of p1, arctime ((arclength p1)-gap) of p1) of p1;
draw subpath (arctime gap of p2,arctime ((arclength p2)-gap) of p2) of p2;

draw z.l--z.y dashed evenly;

dOt z.l,z.z,z.y;

label.lft (btex $x$ etex, z.l);
label.rt (btex $y$ etex, z.y);
label.llft (btex $z$ etex, z.z);
label.rt (btex $\beta$ etex, z.r);
label.top (btex $\alpha$ etex, point 2.5 of p1);
endfig;

beginfig(110)
save u,a,n,p;
path p[];
u:=8cm;
a:=20;
n:=6;

z0=origin;
z1=(1,-.2)*u;
z2=z1+(z1 rotated a);
z3=z2+(z1 rotated -a);
z4=z3+z1;
x.r=abs(z1)/abs(z4);

save p;
path p[];

p0=z0--z1--z2--z3;

for i = 1 upto n : 
p[i]=(p[i-1] scaled x.r)--(p[i-1] scaled x.r rotated a shifted z1)--(p[i-1] scaled x.r  rotated -a shifted z2)--(p[i-1] scaled x.r  shifted z3); 
endfor

draw p[n]--z4;

clip currentpicture to (1cm,-2cm)--(1cm,1cm)--(17cm,1cm)--(17cm,-2cm)--cycle;

endfig;

beginfig(112)
save u,gap,p;
path p[];
u:=1cm;

z.a1=(0,0)*u;
z.b1=(1,0)*u;

z.c1=z.b1 rotatedabout(z.a1, 60);
z.c2=z.c1 rotatedabout(z.a1, 30);
z.c3=z.c2 rotatedabout(z.a1, 60);

z.b2=z.b1 rotatedabout(z.c1, 20);
z.b3=z.b2 rotatedabout(z.c1, 60);

z.a2=z.a1 rotatedabout(z.b1, 40);
z.a3=z.a2 rotatedabout(z.b1, 60);

z.p1=.6[z.a1,z.c1];
z.q2=z.p1 rotatedabout(z.a1, 30/2);
z.p2=z.p1 rotatedabout(z.a1, 30);
z.q3=z.p2 rotatedabout(z.c2, -60/2);
z.p3=z.p2 rotatedabout(z.c2, -60);
z.q4=z.p3 rotatedabout(z.c3, 300/2);
z.p4=z.p3 rotatedabout(z.c3, 300);
z.p5=z.p4 rotatedabout(z.a1, -60);
z.p6=z.p5 rotatedabout(z.a1, -30);

z.r1=z.p6 rotatedabout(z.a1, -60);;
z.s2=z.r1 rotatedabout(z.b1, 40/2);
z.r2=z.r1 rotatedabout(z.b1, 40);
z.s3=z.r2 rotatedabout(z.a2, -60/2);
z.r3=z.r2 rotatedabout(z.a2, -60);
z.s4=z.r3 rotatedabout(z.a3, 300/2);
z.r4=z.r3 rotatedabout(z.a3, 300);
z.r5=z.r4 rotatedabout(z.b1, -60);
z.r6=z.r5 rotatedabout(z.b1, -40);

z.v1=z.r6 rotatedabout(z.b1, -60);;
z.w2=z.v1 rotatedabout(z.c1, 20/2);
z.v2=z.v1 rotatedabout(z.c1, 20);
z.w3=z.v2 rotatedabout(z.b2, -60/2);
z.v3=z.v2 rotatedabout(z.b2, -60);
z.w4=z.v3 rotatedabout(z.b3, 300/2);
z.v4=z.v3 rotatedabout(z.b3, 300);
z.v5=z.v4 rotatedabout(z.c1, -60);
z.v6=z.v5 rotatedabout(z.c1, -20);

p5=
arc(z.p1,z.q2,z.p2)
--arc(z.p2,z.q3,z.p3)
--arc(z.p3,z.q4,z.p4)
--arc(z.p4,z.p5,z.r1)
--arc(z.r1,z.s2,z.r2)
--arc(z.r2,z.s3,z.r3)
--arc(z.r3,z.s4,z.r4)
--arc(z.r4,z.r5,z.v1)
--arc(z.v1,z.w2,z.v2)
--arc(z.v2,z.w3,z.v3)
--arc(z.v3,z.w4,z.v4)
--arc(z.v4,z.v5,z.p1)
--cycle
;

draw p5;

z.z=(z.a1+z.b1+z.c1)/3;
z.ac1=.5[z.a1,z.c1];
z.ac2=z.ac1 rotatedabout(z.a1,10);
z.ac3=z.ac1 rotatedabout(z.a1,30);

draw z.z--arc(z.ac1,z.ac2,z.ac3)--z.c3;

z.ba1=.5[z.a1,z.b1];
z.ba2=z.ba1 rotatedabout(z.b1,10);
z.ba3=z.ba1 rotatedabout(z.b1,40);

draw z.z--arc(z.ba1,z.ba2,z.ba3)--z.a3;

z.cb1=.5[z.c1,z.b1];
z.cb2=z.cb1 rotatedabout(z.c1,10);
z.cb3=z.cb1 rotatedabout(z.c1,20);

draw z.z--arc(z.cb1,z.cb2,z.cb3)--z.b3;

p[1]=circle(z.a3,.5*(z.a1-z.b1));

hatchfill p[1]  withcolor (20, 1mm, -.5bp);
draw p[1];

dOt z.a3;

whitelabel.bot (btex $z$ etex, z.a3+(0,-1));
label.lft (btex $T$ etex, z.c3);
label.top (btex $\partial F$ etex, point 29.9 of p5);

endfig;

beginfig(113)
save u,gap,p;
path p[];
u:=1.4cm;

z.shift=(2,0)*u;

p0=(0,0)*u--(1,0)*u--(1,1)*u--(0,1)*u--cycle;

p1=(0,0)*u--(1,1)*u;

z1=point length p1 of p1;

p2=(0,0)*u--(2,2)*u;

z2=point length p2 of p2;

p3= p2--(p1 yscaled (-1) shifted z2)--(p2 shifted (z2+(x1,-y1))); 
 
z3=point length p3 of p3;

p4= p3--(p2 yscaled (-1) shifted z3)--(p3 shifted (z3+(x2,-y2))); 
 
z4=point length p4 of p4;

p5= p4--(p3 yscaled (-1) shifted z4)--(p4 shifted (z4+(x3,-y3))); 
 
z5=point length p5 of p5;

draw p2 xscaled (u/x2) yscaled (u/y2) shifted z.shift pensemibold;
draw p3 xscaled (u/x3) yscaled (u/y3) shifted (2*z.shift) pensemibold;
draw p4 xscaled (u/x4) yscaled (u/y4) shifted (3*z.shift) pensemibold;
draw p5 xscaled (u/x5) yscaled (u/y5) shifted (4*z.shift) pensemibold;

draw p0 shifted z.shift penhair;
draw p0 shifted (2*z.shift) penhair;
draw p0 shifted (3*z.shift) penhair;
draw p0 shifted (4*z.shift) penhair;

label.bot (btex $\eps=\tfrac12$ etex, ((.5,0)*u+1*z.shift));
label.bot (btex $\eps=\tfrac13$ etex, ((.5,0)*u+2*z.shift));
label.bot (btex $\eps=\tfrac14$ etex, ((.5,0)*u+3*z.shift));
label.bot (btex $\eps=\tfrac15$ etex, ((.5,0)*u+4*z.shift));
endfig;

beginfig(114)
save u,a,n,p;
path p[];
u:=1.2cm;
a:=20;
n:=6;

path p,q;
p = (0,0){right} .. (4*u,1*u){right} .. (8*u,-.5*u){right};

s = 2.5*u;
q=
(point arctime 0 of p of p)
for t=1 step s until arclength p: 
..{(direction arctime t of p of p) zscaled (1,.4)}(point arctime t of p of p) 
endfor
..{(direction 2 of p) zscaled (1,-.4)}(point 2 of p)
;


for t=1 step s/30 until arclength q: 
draw 
(point arctime t of q of q)+(unitvector(direction arctime t of q of q) zscaled (0,7))
--
(point arctime t of q of q)-(unitvector(direction arctime t of q of q) zscaled (0,7)) penhair withcolor .6;
endfor

draw p;
draw q withcolor .3;

label.bot (btex $L_{n-1}$ etex, point arctime s/4 of p of p);
label.top (btex $L_n$ etex, point arctime s/4 of q of q) withcolor .3;
endfig;

beginfig(116)
save u, gap, p;
path p[];
u:=1cm;

z.o=(0,0)*u;
z.r=(2,0)*u;
z.o1=.4[z.o,z.r];
z.o2=.25[z.o,z.r];
z.r0=z.r rotatedabout(z.o2,-40);
z.r1=z.r rotatedabout(z.o2,60);

p0=reverse (arc(z.r0,z.r,z.r1)..cycle);


draw circle(z.o,z.r-z.o) dashed evenly;
draw circle(z.o1,z.r-z.o1) dashed evenly;
draw p0 pensemibold;

label.lft (btex $\gamma$ etex, point .5 of p0);

endfig;

beginfig(202)
save u,p;
path p[];
u:=1.4cm;

z.a=(0,0)*u;
z.b=(1,0)*u;

p0=z.a{.7,1}..z.b{.6,-1}..cycle;

draw p0;
draw subpath(0,1) of p0 reflectedabout (z.a,z.b) dashed evenly;
draw ddline(z.a,z.b)(.4,.4);

label.top (btex $\Delta$ etex, point .5 of p0);
label.top (btex $\Sigma$ etex, point 1.5 of p0);
label.ulft (btex $\Pi$ etex, 1.4[z.a,z.b]);

endfig;

beginfig(204)
save u,p;
path p[];
u:=2.8cm;

z.a=(0,0)*u;
z.b=(1,0)*u;

z.p=(.05,-.05)*u;
z.q=(.8,.1)*u;
z.pq=(.6,.15)*u;
z.v=unitvector(-1,.1);

p0=z.a{.7,1}..z.b{.6,-1}..cycle;
p1=z.q..z.pq{z.v}..z.p;

z.pp=z.pq+(arclength subpath (1,2) of p1)*z.v;

draw p0;
draw p1;
draw z.pq--z.pp dashed evenly;

rimmark(z.pq--z.pp, subpath (1,2) of p1);

dOt z.p,z.q,z.pq,z.pp;

label.top (btex {\Large $\Sigma$} etex, (0,10)+point 1.5 of p0);
label.bot (btex $p$ etex, z.p);
label.bot (btex $q$ etex, z.q);
label.bot (btex $\gamma(t)$ etex, z.pq);
label.top (btex $p_t$ etex, z.pp);
endfig;

beginfig(205)
save u,p;
path p[];
u:=2.8cm;


z.p=(.2,-.1)*u;
z.q=(1,-.2)*u;
z.pq=(.6,.15)*u;
z.v=unitvector(-1,.1);

p1=z.q..z.pq{z.v}..z.p..cycle;

z.pp=z.pq+(arclength subpath (1,2) of p1)*z.v;

draw p1;
draw z.pq--z.pp;
draw ddline(z.pq,z.pp)(.8,-1) dashed evenly; 
draw ddline(z.pq,z.pp)(-1,.8) dashed evenly;
draw z.p{(direction 2 of p1) rotated -90}..{z.v rotated -90}z.pp dashed evenly;

z.u=z.pp+15*(z.v rotated -90);
drawarrow z.pp--z.u;

rimmark(z.pq--z.pp, subpath (1,2) of p1);

dOt z.p,z.q,z.pq,z.pp;

label.top (btex $\Sigma$ etex, (0,2)+point 2.5 of p1);
label.top (btex $W$ etex, (-.6*u,2)+point 2.5 of p1);
label.top (btex $\Pi$ etex, 1.7[z.pp,z.pq]);
label.rt (btex $p$ etex, z.p);
label.lft (btex $q$ etex, z.q);
label.bot (btex $\gamma(t)$ etex, z.pq);
label.llft (btex $p_t$ etex, z.pp);
label.urt (btex $\alpha'(t)$ etex, z.u);
endfig;

beginfig(206)
save u,p;
path p[];
u:=.7cm;

z.a=(-1,1)*u;
z.b=(0,-1)*u;
z.bb=(0,-.3)*u;
z.bbb=(0,.3)*u;
z.c=(1,1)*u;

draw z.a{1,0}...z.b{-1,.6}..z.bb{1,0}..z.b{-1,-.6}...{1,0}z.c;
draw (z.a{0,-1}...z.b{1,-.6}..z.bbb{-1,0}..z.b{1,.6}...{0,1}z.c) shifted ((3,0)*u);
endfig;

beginfig(208)
save u,p;
path p[];
u:=.5cm;

z.a0=(0,2)*u;
z.a1=(1,3)*u;
z.a2=(2,2.1)*u;
z.a3=(3,2.5)*u;
z.a4=(4,3)*u;
z.a5=(5,2.9)*u;

path p.a;
p.a=z.a0{.2,1}..z.a1..z.a2..z.a3..z.a4..z.a5;

draw p.a pensemibold;
draw z.a1--z.a3 dashed evenly pensemibold;
draw (x.a1,0)--z.a1 penhair;
draw (x.a2,0)--.5[z.a1,z.a3] penhair;
draw (x.a3,0)--z.a3 penhair;
draw (x.a4,0)--z.a4 penhair;
draw (x.a5,0)--z.a5 penhair;
drawarrow (0,0)*u--(0,4.5)*u;
drawarrow (0,0)*u--(6,0)*u;

dOt (x.a2,0);

label.bot (btex $s_0$ etex, (x.a2,0));
label.rt (btex $s$ etex, (6,0)*u);
label.top (btex $z$ etex, (0,4.5)*u);
endfig;

beginfig(302)
save u,gap,p,n;
path p[];
u:=.7cm;
n:=25;

z.a0=(0,0)*u;
z.a1=(-.5,-2)*u;
z.a2=(0,-1)*u;
z.a3=(.5,-2)*u;

z.z=(-.5,-.5)*u;

p0=z.a0{left}..z.a1{right}..z.a2{left}..z.a3{right}..cycle;

p1=
for i=.1 step .1 until length p0:
(point i of p0) + 3*u*(unitvector(direction i of p0) rotated -90)..
endfor
cycle;

z.p0= point n*.1 of p0;
z.p1= (point n*.1 of p0) + 3*u*(unitvector(direction n*.1 of p0) rotated -90);

z.q0= point 3.7 of p0;
z.q1= (point 3.7 of p0) + 3*u*(unitvector(direction 3.7 of p0) rotated -90);

draw p0 pensemibold;
draw p1 pensemibold;
draw z.p0--z.p1--z.z;

fill_angle(z.z, z.p1, z.p0, 10);


dOt z.p0,z.p1,z.z;

label.rt (btex $p$ etex, z.p0);
label.lft (btex $p_r$ etex, z.p1);
label.rt (btex $z$ etex, z.z);

label.urt (btex $\Sigma$ etex, z.q0);
label.urt (btex $\Sigma_r$ etex, z.q1);

endfig;

beginfig(304)
save u,p;
path p[];
u:=.5cm;


p0=
for i=1 step 1 until 360:
((0,1)*u rotated i)+((0,2)*u rotated (2*i))..
endfor
cycle;

p1=
for i=1 step 1 until 360:
((0,1)*u rotated i)+((0,2)*u rotated (2*i))-1.5*u*unitvector(((0,1)*u rotated i)+((0,2)*u rotated (2*i))-((0,1)*u rotated (i-1))+((0,2)*u rotated ((2*i)-1)))..
endfor
cycle;

draw p0 pensemibold;
draw p1 dashed evenly;

endfig;

beginfig(306)
save u,p,eps,upp,del;
path p[];
u:=1cm;
eps=.1;
del=.15;
upp:=2.5;

z.q0=(-1,0)*u;
z.q1=z.q0+(1*(1+eps),0)*u;
z.q2=z.q0+(2*(1+eps),0)*u;
z.q3=z.q0+(3*(1+eps),0)*u;
z.q4=z.q0+(4*(1+eps),0)*u;
z.q5=z.q0+(5*(1+eps),0)*u;
z.q6=z.q0+(6*(1+eps),0)*u;

z.x0=z.q0+(0,upp-0*del)*u;
z.x1=z.q1+(0,upp-1*del)*u;
z.x2=z.q2+(0,upp-2*del)*u;
z.x3=z.q3+(0,upp-3*del)*u;
z.x4=z.q4+(0,upp-4*del)*u;

z.p0=(0,0)*u;
z.p1=(1,0)*u;
z.p2=(2,0)*u;
z.p3=(3,0)*u;
z.p4=(4,0)*u;

mark_rt_angle(z.p0,z.q0,z.x0);
mark_rt_angle(z.p1,z.q1,z.x1);
mark_rt_angle(z.p2,z.q2,z.x2);
mark_rt_angle(z.p3,z.q3,z.x3);
mark_rt_angle(z.p4,z.q4,z.x4);

draw ddline(z.q0,z.p4)(.2,.4);
draw z.p0{up}..z.x0;
draw z.p1{up}..z.x1;
draw z.p2{up}..z.x2;
draw z.p3{up}..z.x3;
draw z.p4{up}..z.x4;

draw z.q0{up}--z.x0 dashed evenly;
draw z.q1{up}--z.x1 dashed evenly;
draw z.q2{up}--z.x2 dashed evenly;
draw z.q3{up}--z.x3 dashed evenly;
draw z.q4{up}--z.x4 dashed evenly;

dOt 
z.p0,z.p1,z.p2,z.p3,z.p4,
z.q0,z.q1,z.q2,z.q3,z.q4,
z.x0,z.x1,z.x2,z.x3,z.x4;

label.bot (btex $p_0$ etex, z.p0+(-3,0));
label.bot (btex $p_1$ etex, z.p1+(-2,0));
label.bot (btex $p_2$ etex, z.p2+(-1,0));
label.bot (btex $p_3$ etex, z.p3);
label.bot (btex $p_4$ etex, z.p4);

label.bot (btex $q_0$ etex, z.q0);
label.bot (btex $q_1$ etex, z.q1+(4,0));
label.bot (btex $q_2$ etex, z.q2+(3,0));
label.bot (btex $q_3$ etex, z.q3+(2,0));
label.bot (btex $q_4$ etex, z.q4+(1,0));
label.bot (btex $\dots$ etex, z.q5);
label.top (btex $M$ etex, z.q6);

label.top (btex $x_0$ etex, z.x0);
label.top (btex $x_1$ etex, z.x1);
label.top (btex $x_2$ etex, z.x2);
label.top (btex $x_3$ etex, z.x3);
label.top (btex $x_4$ etex, z.x4);
endfig;

beginfig(308)
save u,p;
path p[];
u:=.5cm;

z.p=origin;
z.pp=(.4,.6)*u;
z.q=(4,0)*u;
z.r=(0,2)*u;

p1=circle(z.p,z.r/2);
p2=circle(z.p,z.r);

hatchfill p1  withcolor (20, 1mm, -.5bp);
draw p1;
draw p2;
draw z.pp{right}..z.q;

dOt z.p,z.pp,z.q;

whitelabel.lft (btex $p$ etex,z.p);
label.rt  (btex $q$ etex,z.q);
label.top  (btex $S$ etex,z.r);
endfig;

beginfig(402)
save u,p,k;
path p[];
u:=1cm;
k=.2;

z.a0=(0,1)*u;
z.a1=k*z.a0 rotated 60;
z.a2=z.a0 rotated 120;
z.a3=k*z.a0 rotated 180;
z.a4=z.a0 rotated -120;
z.a5=k*z.a0 rotated -60;

p1=z.a0..z.a1..z.a2..z.a3..z.a4..z.a5..cycle;

hatchfill p1  withcolor (20, 1mm, -.5bp);
draw p1;

endfig;

beginfig(404)
save u,p,k;
path p[];
u:=.8cm;
k:=1.01;

z.a=(-1,0)*u;
z.b=(-.1,0)*u;

draw
z.a+z.b
for i=1 step 1 until 200:
..(z.a+(k**i)*z.b) rotated (10*i)
endfor;

dOt origin;

endfig;

beginfig(406)
save u,p;
path p[];
u:=.3cm;

z.o=origin;
z.a=(-1,0)*u;
z.b=z.a rotated 120;
z.c=z.a rotated -120;

z.ar=z.o rotatedabout(z.a,130);
z.al=z.o rotatedabout(z.a,-130);
z.arr=z.a rotatedabout(z.ar,130);
z.arl=z.a rotatedabout(z.ar,-130);
z.arrr=z.ar rotatedabout(z.arr,130);
z.arrl=z.ar rotatedabout(z.arr,-130);
z.arlr=z.ar rotatedabout(z.arl,130);
z.arll=z.ar rotatedabout(z.arl,-130);

z.br=z.o rotatedabout(z.b,130);
z.bl=z.o rotatedabout(z.b,-130);
z.brr=z.b rotatedabout(z.br,130);
z.brl=z.b rotatedabout(z.br,-130);
z.brrr=z.br rotatedabout(z.brr,130);
z.brrl=z.br rotatedabout(z.brr,-130);
z.brlr=z.br rotatedabout(z.brl,130);
z.brll=z.br rotatedabout(z.brl,-130);

z.cr=z.o rotatedabout(z.c,130);
z.cl=z.o rotatedabout(z.c,-130);
z.crr=z.c rotatedabout(z.cr,130);
z.crl=z.c rotatedabout(z.cr,-130);
z.crrr=z.cr rotatedabout(z.crr,130);
z.crrl=z.cr rotatedabout(z.crr,-130);
z.crlr=z.cr rotatedabout(z.crl,130);
z.crll=z.cr rotatedabout(z.crl,-130);

z.shift2=(.5*u+abs(z.o-z.a)+.5*u+1*u,0);
z.shift3=z.shift2+(abs(z.o-z.a)+.5*u+abs(z.o-z.ar)+.5*u+1*u,0);
z.shift4=z.shift3+(abs(z.o-z.ar)+abs(z.o-z.arlr)+.5*u+.5*u+1*u,0);


draw (z.o--z.a) pensemibold;

p1=circle(.5[z.o,z.a], abs(z.o-z.a)/2+.5*u);
draw p1;

draw (z.o--z.a) shifted z.shift2 pensemibold;
draw (z.o--z.b) shifted z.shift2 pensemibold;
draw (z.o--z.c) shifted z.shift2 pensemibold;

p2=circle(z.o, abs(z.o-z.a)+.5*u) shifted z.shift2;
draw p2;

draw (z.o--z.a--z.ar) shifted z.shift3 pensemibold;
draw (z.a--z.al) shifted z.shift3 pensemibold;

draw (z.o--z.b--z.br) shifted z.shift3 pensemibold;
draw (z.b--z.bl) shifted z.shift3 pensemibold;

draw (z.o--z.c--z.cr) shifted z.shift3 pensemibold;
draw (z.c--z.cl) shifted z.shift3 pensemibold;

p3=circle(z.o, abs(z.o-z.ar)+.5*u) shifted z.shift3;
draw p3; 

draw (z.o--z.a--z.ar--z.arr--z.arrr) shifted z.shift4 pensemibold;
draw (z.arr--z.arrl) shifted z.shift4 pensemibold;
draw (z.ar--z.arl--z.arlr) shifted z.shift4 pensemibold;
draw (z.arl--z.arll) shifted z.shift4 pensemibold;
draw (z.a--z.al) shifted z.shift4 pensemibold;

draw (z.o--z.b--z.br--z.brr--z.brrr) shifted z.shift4 pensemibold;
draw (z.brr--z.brrl) shifted z.shift4 pensemibold;
draw (z.br--z.brl--z.brlr) shifted z.shift4 pensemibold;
draw (z.brl--z.brll) shifted z.shift4 pensemibold;
draw (z.b--z.bl) shifted z.shift4 pensemibold;

draw (z.o--z.c--z.cr--z.crr--z.crrr) shifted z.shift4 pensemibold;
draw (z.crr--z.crrl) shifted z.shift4 pensemibold;
draw (z.cr--z.crl--z.crlr) shifted z.shift4 pensemibold;
draw (z.crl--z.crll) shifted z.shift4 pensemibold;
draw (z.c--z.cl) shifted z.shift4 pensemibold;

p4= circle(z.o, abs(z.o-z.arlr)+.5*u) shifted z.shift4;
draw p4;

label.llft (btex $T_1$ etex, point 2.9 of p1);
label.llft (btex $T_2$ etex, point 2.8 of p2);
label.llft (btex $T_3$ etex, point 2.7 of p3);
label.llft (btex $T_4$ etex, point 2.6 of p4);

endfig;

beginfig(408)
save u,p;
path p[];
u:=1cm;

z.p=origin;
z.q=(1,2)*u;
z.v=(-1,0)*u;
z.w=(1,-1)*u;

p1=z.p{z.v}..z.q{z.w}..cycle;

z.lam= (point .7 of p1) scaled .7;

p2=z.p{z.v rotated -20}..z.lam{1,.7}..{(z.p-z.q) rotated 20}z.p;

draw p1;
draw p2;
draw z.p--z.q;

dOt z.p,z.q;

label.bot (btex $p$ etex, z.p);
label.urt (btex $\gamma(t_0)$ etex, z.q);
label.lrt (btex $\lambda_1$ etex, point .7 of p2);
label.lrt (btex $\sigma$ etex, .5[z.p,z.q]);

endfig;

beginfig(502)
save u,p;
path p[];
u:=.5cm;

z.p=origin;
z.x=(5,0)*u;
z.m=.6[z.p,z.x];
z.y=z.x zscaled (0,1);
z.x1=z.x rotated 10;
z.x2=z.x rotated 25;
z.x3=z.x rotated 40;
z.x4=z.x rotated 50;
z.x5=z.x rotated 65;
z.x6=z.x rotated 80;

p1=z.p--z.x..z.x1{-z.x1}..z.x2{z.x2}..z.x3{-z.x3}..z.x4{z.x4}..z.x5{-z.x5}..z.x6{z.x6}..z.y--cycle;

draw p1;

dOt z.p,z.m,z.x,z.y;

label.llft (btex $\tau$ etex, point 4.5 of p1);
label.llft (btex $p$ etex, z.p);
label.bot (btex $x$ etex, z.x);
label.lft (btex $y$ etex, z.y);
label.bot (btex $m$ etex, z.m);

endfig;

beginfig(504)
save u,gap,p;
path p[];
u:=1cm;
gap:=.07*u;

z.a=(1,0)*u;
z.b=(0,.5)*u;

p1=origin{1,-1}..z.a{1,1}..z.a+z.b{-1,1}..z.b{-1,-1}..cycle;

draw subpath (0, arctime ((arclength subpath (0,1) of p1)-gap) of p1) of p1;
draw subpath (arctime ((arclength subpath (0,1) of p1)+gap) of p1,4) of p1;

draw subpath (0, arctime ((arclength subpath (0,2) of p1)-gap) of p1) of p1 shifted z.a;
draw subpath (arctime ((arclength subpath (0,2) of p1)+gap) of p1,arctime ((arclength subpath (0,3) of p1)-gap) of p1) of p1 shifted z.a;
draw subpath (arctime ((arclength subpath (0,3) of p1)+gap) of p1,4) of p1 shifted z.a;

draw subpath (arctime gap of p1, arctime ((arclength subpath (0,1) of p1)-gap) of p1) of p1 shifted (2*z.a);
draw subpath (arctime ((arclength subpath (0,1) of p1)+gap) of p1, arctime ((arclength subpath (0,4) of p1)-gap) of p1) of p1 shifted (2*z.a);

draw subpath (0, arctime ((arclength subpath (0,2) of p1)-gap) of p1) of p1 shifted (3*z.a);
draw subpath (arctime ((arclength subpath (0,2) of p1)+gap) of p1,arctime ((arclength subpath (0,3) of p1)-gap) of p1) of p1 shifted (3*z.a);
draw subpath (arctime ((arclength subpath (0,3) of p1)+gap) of p1,4) of p1 shifted (3*z.a);

draw subpath (arctime gap of p1, arctime ((arclength subpath (0,1) of p1)-gap) of p1) of p1 shifted (4*z.a);
draw subpath (arctime ((arclength subpath (0,1) of p1)+gap) of p1, arctime ((arclength subpath (0,4) of p1)-gap) of p1) of p1 shifted (4*z.a);

draw subpath (0, arctime ((arclength subpath (0,2) of p1)-gap) of p1) of p1 shifted (5*z.a);
draw subpath (arctime ((arclength subpath (0,2) of p1)+gap) of p1,arctime ((arclength subpath (0,3) of p1)-gap) of p1) of p1 shifted (5*z.a);
draw subpath (arctime ((arclength subpath (0,3) of p1)+gap) of p1,4) of p1 shifted (5*z.a);

draw subpath (arctime gap of p1, arctime ((arclength subpath (0,1) of p1)-gap) of p1) of p1 shifted (6*z.a);
draw subpath (arctime ((arclength subpath (0,1) of p1)+gap) of p1, arctime ((arclength subpath (0,4) of p1)-gap) of p1) of p1 shifted (6*z.a);

draw subpath (0,arctime ((arclength subpath (0,3) of p1)-gap) of p1) of p1 shifted (7*z.a);
draw subpath (arctime ((arclength subpath (0,3) of p1)+gap) of p1,4) of p1 shifted (7*z.a);

label.bot (btex $c_0$ etex, point .5 of p1);
label.bot (btex $c_1$ etex, z.a+point .5 of p1);
label.bot (btex $\dots$ etex, 4*z.a+point .5 of p1);
label.bot (btex $c_n$ etex, 7*z.a+point .5 of p1);
endfig;

beginfig(505)
save u,p;
path p[];
u:=1cm;

z.a=origin;
z.b=(1,0)*u;
z.c=z.b rotated 60;
z.aa=z.b+z.c;
z.bb=z.c-z.b;
z.cc=-z.bb;

p1=z.cc..z.a..z.c..z.aa..cycle;
p2=z.aa..z.b..z.a..z.bb..cycle;
p3=z.bb..z.c..z.b..z.cc..cycle;

p4=
subpath (3,4) of p1
--
reverse(subpath (1,3) of p3)
--
reverse(subpath (1,2) of p1)
--
(subpath (2,4) of p2)
--
cycle;

p5=subpath(3,4) of p2--subpath(0,1) of p2
--
reverse(subpath (0,2) of p3)
--
cycle;

hatchfill p4  withcolor (20, 1mm, -.5bp);
hatchfill p5  withcolor (120, 1mm, -.5bp);
draw p1;
draw p2;
draw p3;

endfig;

beginfig(506)
save u,p;
path p[];
u:=.03cm;

for n=1 step 1 until 6:
for i=2**n step 2*(2**n) until 100:
draw (i,0)*u--(i,2*(2**n))*u;
endfor
endfor

draw (0,0)*u--(100.5,0)*u;

p1=(3.5,-1)*u--(100.5,-1)*u--(100.5,128.5)*u--(3.5,128.5)*u--cycle;
clip currentpicture to p1;

endfig;

beginfig(602)
save u,p;
path p[];
u:=.7cm;


draw lemniscate_of_bernoulli((-1,0)*u, (1,0)*u);

endfig;

beginfig(604)
save u,p,pi;
path p[];
u:=.7cm;
pi:=3.141592;

z.a=origin;
z.b=(0,1)*u;
z.a4=z.a+4*z.b zscaled (0,pi/2);
z.b4=z.a4+z.b;
z.k=z.b zscaled (0,pi/2);
z.shift =(3,0)*u;

p1=z.a..z.b..cycle;
p5=z.a{right}..{left}z.b--z.b4{left}..{right}z.a4--cycle;

draw p1 shifted z.shift;
draw (z.a--z.b) shifted z.shift;

draw p5;

draw (z.a--z.b);
draw (z.a--z.b) shifted (1*z.k);
draw (z.a--z.b) shifted (2*z.k);
draw (z.a--z.b) shifted (3*z.k);
draw (z.a--z.b) shifted (4*z.k);

dOt z.a,z.b+z.k,z.a+2*z.k,z.b+3z.k,z.a+4*z.k, z.a+z.shift;
Dot z.b,z.a+z.k,z.b+2*z.k,z.a+3z.k,z.b+4*z.k, z.b+z.shift;

label (btex $\longrightarrow$ etex, .5*z.b+.5*z.shift);
endfig;

beginfig(606)
save u,p;
path p[];
u:=2cm;

z.o=origin;
z.a=(1,0)*u;
z.b=z.a rotated 60;

picture triangle[];
triangle1=image( fill z.o--z.a--z.b--cycle withcolor 0);
triangle2=image(
draw triangle1 scaled .5;
draw triangle1 shifted z.a scaled .5;
draw triangle1 shifted z.b scaled .5;
);
triangle3=image(
draw triangle2 scaled .5;
draw triangle2 shifted z.a scaled .5;
draw triangle2 shifted z.b scaled .5;
);
triangle4=image(
draw triangle3 scaled .5;
draw triangle3 shifted z.a scaled .5;
draw triangle3 shifted z.b scaled .5;
);
triangle5=image(
draw triangle4 scaled .5;
draw triangle4 shifted z.a scaled .5;
draw triangle4 shifted z.b scaled .5;
);

draw triangle5;

endfig;

beginfig(607)
save u,p;
path p[];
u:=2cm;

z.o=origin;
z.a=(1,0)*u;
z.b=z.a rotated 60;

picture triangle[];
triangle1=image( fill z.o--z.a--z.b--cycle withcolor 0);
triangle2=image(
draw triangle1 scaled .5;
draw triangle1 shifted z.a scaled .5;
draw triangle1 shifted z.b scaled .5;
);
triangle3=image(
draw triangle2 scaled .5;
draw triangle2 shifted z.a scaled .5;
draw triangle2 shifted z.b scaled .5;
);
triangle4=image(
draw triangle3 scaled .5;
draw triangle3 shifted z.a scaled .5;
draw triangle3 shifted z.b scaled .5;
);
triangle5=image(
draw triangle4 scaled .5;
draw triangle4 shifted z.a scaled .5;
draw triangle4 shifted z.b scaled .5;
);

draw triangle5;

z.x=.5[z.b,z.o];
z.y=.5[z.o,z.a];
z.z=.5[z.a,z.b];
dOt z.x,z.y,z.z;

label.ulft (btex $x$ etex, z.x);
label.bot (btex $y$ etex, z.y);
label.urt (btex $z$ etex, z.z);
endfig;

beginfig(610)
save u,p;
path p[];
u:=.3cm;


z.o=origin;
z.a=(-1,0)*u;
z.b=(0,1)*u;
z.c=z.b rotated -60;
z.b2=z.o rotatedabout(z.c, -120);
z.b3=z.o rotatedabout(z.c, -180);
z.b4=z.o rotatedabout(z.c, 120);
z.b5=z.o rotatedabout(z.c, 60);

z.shift1= (0,-7)*u+3*z.a;

p1=(z.o..z.a..z.a+z.b..z.b..cycle) shifted -z.a;
p2=z.o..z.b..z.b2..z.b3..z.b4..z.b5..cycle;

draw subpath (.5,2.5) of p1;
draw p1 shifted z.a;
draw p1 shifted (2*z.a);
draw p1 shifted (3*z.a);
draw p1 shifted (4*z.a);
draw p1 shifted (5*z.a);
draw p1 shifted (6*z.a);
draw subpath (0,.5) of p1 shifted (7*z.a);
draw subpath (2.5,4) of p1 shifted (7*z.a);

draw p2  shifted z.shift1;

draw p1 shifted z.a shifted z.shift1;
draw p1 shifted (2*z.a) shifted z.shift1;
draw p1 shifted (3*z.a) shifted z.shift1;
draw subpath (0,.5) of p1 shifted (4*z.a) shifted z.shift1;
draw subpath (2.5,4) of p1 shifted (4*z.a) shifted z.shift1;

draw p1 shifted z.a rotatedabout(z.c,120) shifted z.shift1;
draw p1 shifted (2*z.a) rotatedabout(z.c,120) shifted z.shift1;
draw p1 shifted (3*z.a) rotatedabout(z.c,120) shifted z.shift1;
draw subpath (0,.5) of p1 shifted (4*z.a) rotatedabout(z.c,120) shifted z.shift1;
draw subpath (2.5,4) of p1 shifted (4*z.a) rotatedabout(z.c,120) shifted z.shift1;

draw p1 shifted z.a rotatedabout(z.c,-120) shifted z.shift1;
draw p1 shifted (2*z.a) rotatedabout(z.c,-120) shifted z.shift1;
draw p1 shifted (3*z.a) rotatedabout(z.c,-120) shifted z.shift1;
draw subpath (0,.5) of p1 shifted (4*z.a) rotatedabout(z.c,-120) shifted z.shift1;
draw subpath (2.5,4) of p1 shifted (4*z.a) rotatedabout(z.c,-120) shifted z.shift1;


endfig;

beginfig(612)
save u,p;
path p[];
u:=1cm;

z.x0=origin;
z.a=(0,2)*u;
z.b=(.6,1.2)*u;
z.c=(2,1)*u;
z.x1=1.3[z.a,z.c];
z.x2=(-.3)[z.a,z.c];

p0=z.x0{z.c rotated -40}..z.x1..tension 1.3..z.x2..{-z.a rotated 30}z.x0;
p1=z.x0{z.a rotated 20}..tension 4..1.1[z.x0,z.a]..tension 4..{-z.a rotated -15}z.x0;
p2=z.x0{z.b rotated 15}..tension 4..1.14[z.x0,z.b]..tension 4..{-z.b rotated -15}z.x0;
p3=z.x0{z.c rotated 15}..tension 4..1.1[z.x0,z.c]..tension 4..{-z.c rotated -16}z.x0;

draw p0;
draw p1;
draw p2;
draw p3;

draw z.a--z.b--z.c--cycle dashed evenly;
draw point 1.6 of p0 --z.a--point 2.2 of p0 dashed evenly;
draw point .2 of p0 --z.b--point 2.7 of p0 dashed evenly;
draw point .7 of p0 --z.c--point 1.2 of p0 dashed evenly;
draw z.c--point 1.4 of p0 dashed evenly;

dOt z.x0,z.a,z.b,z.c;

label.urt (btex $\ell$ etex, point 1.5 of p0);
label (btex the disc etex rotated angle(z.c-z.a), (.5[z.a,z.c]+(4,8)));
label.llft (btex $x_0$ etex, z.x0);
endfig;

beginfig(614)
save u,p,a;
path p[];
u:=1cm;
a:=360/24;

z.o=origin;
z.r1=(0,1)*u;
z.r2=(0,sqrt(2))*u;
z.r3=(0,sqrt(3))*u;

p1=z.r3 rotated (2*a-a/2)..z.r2 rotated (2*a-a/2)..z.r1..z.o..z.r1 rotated (8*a-a/2)..z.r2 rotated (8*a-a/2)..z.r3 rotated (8*a-a/2);
p2=z.r3 rotated -(2*a-a/2)..z.r2 rotated -(2*a-a/2)..z.r1..z.o..z.r1 rotated -(8*a-a/2)..z.r2 rotated -(8*a-a/2)..z.r3 rotated -(8*a-a/2);
p3=z.r3 rotated (a-a/2)..z.r2 rotated (2*a-a/2)..z.r3 rotated (3*a-a/2);
p4=z.r3 rotated -(a-a/2)..z.r2 rotated -(2*a-a/2)..z.r3 rotated -(3*a-a/2);
p5=z.r3 rotated (5*a-a/2)..z.r2 rotated (5*a-a/2)..z.r1 rotated (8*a-a/2)..z.r2 rotated (11*a-a/2)..z.r3 rotated (11*a-a/2);
p6=z.r3 rotated -(5*a-a/2)..z.r2 rotated -(5*a-a/2)..z.r1 rotated -(8*a-a/2)..z.r2 rotated -(11*a-a/2)..z.r3 rotated -(11*a-a/2);
p7=z.r3 rotated (4*a-a/2)..z.r2 rotated (5*a-a/2)..z.r3 rotated (6*a-a/2);
p8=z.r3 rotated -(4*a-a/2)..z.r2 rotated -(5*a-a/2)..z.r3 rotated -(6*a-a/2);
p9=z.r3 rotated (7*a-a/2)..z.r2 rotated (8*a-a/2)..z.r3 rotated (9*a-a/2);
p10=z.r3 rotated -(7*a-a/2)..z.r2 rotated -(8*a-a/2)..z.r3 rotated -(9*a-a/2);
p11=z.r3 rotated (10*a-a/2)..z.r2 rotated (11*a-a/2)..z.r3 rotated (12*a-a/2);
p12=z.r3 rotated -(10*a-a/2)..z.r2 rotated -(11*a-a/2)..z.r3 rotated -(12*a-a/2);

draw p1;
draw p2;
draw p3;
draw p4;
draw p5;
draw p6;
draw p7;
draw p8;
draw p9;
draw p10;
draw p11;
draw p12;
draw circle (z.o,z.r3) dashed evenly;

label.bot (btex $\tilde p$ etex, z.o+(0,-1));
label.bot (btex $\bar B(\tilde p,2\tfrac12)$ etex, -z.r3);

endfig;

beginfig(616)
save u,p;
path p[];
u:=1cm;

z.p=origin;
z.q=(0,2)*u;

p0=z.p{z.q rotated 60}..z.q{right}..{-z.q rotated -60}z.p;

z.p1=point (1/3) of p0;
z.p2=point (2/3) of p0;
z.p3=point (1) of p0;
z.p4=point (4/3) of p0;
z.p5=point (5/3) of p0;

p1=z.p{z.q rotated 20}..z.p1;
p2=z.p{z.q rotated 10}..z.p2;
p3=z.p{z.q rotated 0}..z.p3;
p4=z.p{z.q rotated -10}..z.p4;
p5=z.p{z.q rotated -20}..z.p5;

draw p0;
draw p1;
draw p2;
draw p3;
draw p4;
draw p5;

dOt z.p,z.p1,z.p2,z.p3,z.p4,z.p5;

label.bot (btex $p$ etex, z.p);
label.lft (btex $p_1$ etex, z.p1);
label.urt (btex $p_i$ etex, z.p4);
label (btex $\dots$ etex rotated angle(direction (2/3) of p0), z.p2+(-2,4));
whitelabel (btex $\gamma_i$ etex rotated angle(direction (7/6) of p0), (point (7/6) of p0)+(0,5));
endfig;

beginfig(702)
save u,p;
path p[];
u:=1cm;

z.b0=(-2,1)*u;
z.b1=(-1,2.2)*u;

p1=(x.b0,0)--(x.b1,0);
p2=z.b0{1,.3}..{.8,.2}z.b1;
p3=(0,y.b0)--(0,y.b1);
p4=p3 rotated -90;

draw p1 penbold;
draw p2 penbold;
draw p3 penbold;
draw p4 penbold;

draw (x.b0,0)--z.b0--arc((0,y.b0),(0,y.b0) rotated -45,(0,y.b0) rotated -90) penhair dashed evenly;
draw (x.b1,0)--z.b1--arc((0,y.b1),(0,y.b1) rotated -45,(0,y.b1) rotated -90) penhair dashed evenly;

draw ddline((x.b0,0),(0,y.b1) rotated -90)(.2,.2) penhair;
draw ddline((0,0),(0,y.b1))(.2,.4) penhair;

z.a0=.5[(x.b0,0),(x.b1,0)]+(0,.3)*u;
z.a1=.5[(x.b0,0),(x.b1,0)]+(0,1.2)*u;
drawarrow z.a0--z.a1;

z.a2=.5[(0,y.b0),(0,y.b1)]+(-1.2,0)*u;
z.a3=.5[(0,y.b0),(0,y.b1)]+(-.3,0)*u;
drawarrow z.a2--z.a3;

z.a4=.5[(0,y.b0),(0,y.b1)];
z.a5=z.a4 rotated -45;
z.a6=z.a4 rotated -90;

drawarrow ddarc(z.a4,z.a5,z.a6)(-15,-15);

label.top (btex $\RR^m$ etex, (0,y.b1) rotated -90 scaled 1.3);
label.rt (btex $\RR^m$ etex, (0,y.b1) scaled 1.3);
label.bot (btex $K_1$ etex, .5[(x.b0,0),(x.b1,0)]);
label.bot (btex $K_2$ etex, .5[(0,y.b0),(0,y.b1)] rotated -90);
label.rt (btex $h_1$ etex, .5[z.a0,z.a1]);
label.top (btex $h_2$ etex, .5[z.a2,z.a3]);
label.urt (btex $h_3$ etex, z.a5);
endfig;

beginfig(704)
save u,p;
path p[];
u:=.5cm;

z0=(0,1.2)*u;
z1=(.5,0)*u;
z2=(1.5,0)*u;
z3=(2.5,0)*u;


p0=
z0{left}
..-z3{1,-1}
..z1{1,1}
..z2{down}
..z1{-1,1}
..-z3{-1,-1}
..-z0{right}
..z3{-1,1}
..-z1{-1,-1}
..-z2{up}
..-z1{1,-1}
..z3{1,1}
..cycle;

draw p0;

draw point 3.2 of p0--point 10.9 of p0 dashed evenly;
draw point 4.9 of p0--point 9.2 of p0 dashed evenly;

endfig;

beginfig(706)
save u,p;
path p[];
u:=.47cm;

z.a1=(.5,0)*u;
z.a2=(1.5,0)*u;
z.a3=(2,-.2)*u;
z.a4=(2.5,0)*u;
z.a5=(3,.2)*u;

z.b1=z.a1 rotated 120;
z.b2=z.a2 rotated 120;
z.b3=z.a3 rotated 120;
z.b4=z.a4 rotated 120;
z.b5=z.a5 rotated 120;

z.c1=z.a1 rotated -120;
z.c2=z.a2 rotated -120;
z.c3=z.a3 rotated -120;
z.c4=z.a4 rotated -120;
z.c5=z.a5 rotated -120;

p0=
z.a1{z.a1 rotated 60}..
z.a2{z.a1 rotated -90}..
z.a1{z.a1 rotated 120}..
z.b3{z.b1 rotated 90}..
z.c4{z.c1 rotated 90}..
z.a5{z.a1 rotated 90}..
z.b1{z.b1 rotated 60}..
z.b2{z.b1 rotated -90}..
z.b1{z.b1 rotated 120}..
z.c3{z.c1 rotated 90}..
z.a4{z.a1 rotated 90}..
z.b5{z.b1 rotated 90}..
z.c1{z.c1 rotated 60}..
z.c2{z.c1 rotated -90}..
z.c1{z.c1 rotated 120}..
z.a3{z.a1 rotated 90}..
z.b4{z.b1 rotated 90}..
z.c5{z.c1 rotated 90}..
cycle;

draw p0;
endfig;

beginfig(708)
save u,p;
path p[];
u:=.4cm;

z0=(-3.5,0)*u;
z1=(-2.5,0)*u;
z2=(-1.5,0)*u;
z3=(-.5,0)*u;
z4=-z3;
z5=-z2;
z6=-z1;
z7=-z0;


p0=z0{up}..z7{down}..z1{up}..z6{down}..cycle;
p1=z2{up}..z5{down}..z3{up}..z4{down}..cycle;

draw p0;
draw p1;

endfig;

beginfig(710)
save u,p;
path p[];
u:=.9cm;

z.size=(3,1.4)*u;

p0=(0,0)*u--(x.size,0)--z.size--(0,y.size)--cycle;
p1=
point .15 of p0{.2,-1}..
point .35 of p0{.2,1}..
point .66 of p0{.2,-1}..
point .85 of p0{.2,1}..
point 1.3 of p0{right}..
point 1.6 of p0{left}..
point 2.4 of p0{up}..
point 2.8 of p0{down}..
point 3.4 of p0{left}..
point 3.8 of p0{right}..
cycle;

z.x0=point 1.4 of p1;
z.vx0= direction 1.4 of p1;
z.z=point 7.6 of p1;
z.vz= direction 7.6 of p1;
z.y=point 5.4 of p1;

hatchfill p1  withcolor (120, 1mm, -.5bp);
draw p1 pensemibold;
clip currentpicture to p0;

draw z.x0{z.vx0 rotated 90}..{z.vz rotated -90}z.z pensemibold;

dOt z.x0,z.y,z.z;


label.bot (btex $x_0$ etex, z.x0+(2,0));
label.ulft (btex $z$ etex, z.z);
label.urt (btex $y$ etex, z.y);

whitelabel.bot (btex $\Sigma$ etex, z.size xscaled .4);
endfig;

beginfig(712)
save u,p;
path p[];
u:=1cm;

z.size =(6,3)*u;

z.ll=(-1,.1)*u;
z.ur=(7,2.9)*u;

z.ll2=.35[z.ll,(x.ll,y.ur)];
z.ur2=.35[z.ur,(x.ur,y.ll)];

z.ll3=.5[z.ll,(x.ll,y.ur)];
z.ur3=.5[z.ur,(x.ur,y.ll)];


p0=origin--(x.size,0)--z.size--(0,y.size)--cycle;
p1=z.ll--(x.ur,y.ll)--z.ur--(x.ll,y.ur)--cycle;
p2=z.ll2--(x.ur2,y.ll2)--z.ur2--(x.ll2,y.ur2)--cycle;
p3=z.ll3--z.ur3;

z.x0=point .5 of p1;
z.x=point 2.8 of p1;

z.x1=whatever[z.x0,z.x]=z.ll2+whatever*(1,0);
z.x2=whatever[z.x0,z.x]=z.ur2+whatever*(1,0);
z.shift=(3,0)*u;

labelarcsprof((x.ur,y.ll), z.x0, z.x, 14, 12, btex $\phi(x)$ etex rotated -(90-angle(z.x-z.x0)/2));

hatchfill p2  withcolor (90, 1.4mm, -.5bp);
draw p1 pensemibold;
draw p3  pensemibold;
draw z.x0--z.x pensemibold;
draw z.x1--z.x2+z.shift--z.x+z.shift dashed evenly pensemibold;

clip currentpicture to p0;

dOt z.x0,z.x,z.x+z.shift;


label.bot (btex $x_0$ etex, z.x0+(2,0));
label.top (btex $x$ etex, z.x);
label.top (btex $\tilde h(x)$ etex, z.x+z.shift);

whitelabel (btex $f^{-1}(U_\gamma)$ etex, (0,1)+point .25 of p3);
whitelabel.top (btex $f^{-1}(\gamma)$ etex, point .8 of p3);

endfig;

beginfig(714)
save u,gap,p, k,l;
path p[];
u:=.2cm;
gap:=.07cm;
k:=.5;
l:=.25;

z.a0=(-3,-1)*u;
z.a1=(-1,-1)*u;
z.a2=-z.a0;
z.a3=-z.a1;
z.a4=z.a1;
z.a5=z.a0;
z.a6=z.a3;
z.a7=z.a2;
z.a8=(3,3)*u;
z.a9=(0,6)*u;
z.a10=(-3,3)*u;

z.a=(0,.3)*u;
z.b=(.1,-.3)*u;
z.l=(-1,-.1)*u;
z.r=(.7,0)*u;

p1=z.a0..z.a1..z.a2{up}..z.a3..z.a4..z.a5{up}..z.a6..z.a7..z.a8..z.a9..z.a10..cycle;

p2=(k*z.a0..k*z.a1..k*z.a2{up}..k*z.a3..k*z.a4..k*z.a5{up}..k*z.a6..k*z.a7..z.a8..z.a9..z.a10..cycle) shifted ((10,0)*u);

p3=(l*z.a0..l*z.a1..l*z.a2{up}..l*z.a3..l*z.a4..l*z.a5{up}..l*z.a6..l*z.a7..z.a8..z.a9..z.a10..cycle) shifted ((20,0)*u);

p4=(origin..z.a8..z.a9..z.a10..cycle) shifted ((30,0)*u);

draw subpath (arctime gap of p1, arctime ((arclength subpath (0,2) of p1)-gap) of p1) of p1;
draw subpath (arctime ((arclength subpath (0,2) of p1)+gap) of p1, arctime ((arclength subpath (0,4) of p1)-gap) of p1) of p1;
draw subpath (arctime ((arclength subpath (0,4) of p1)+gap) of p1, arctime ((arclength subpath (0,6) of p1)-gap) of p1) of p1;
draw subpath (arctime ((arclength subpath (0,6) of p1)+gap) of p1, arctime ((arclength subpath (0,11) of p1)-gap) of p1) of p1;

draw subpath (arctime gap of p2, arctime ((arclength subpath (0,2) of p2)-gap) of p2) of p2;
draw subpath (arctime ((arclength subpath (0,2) of p2)+gap) of p2, arctime ((arclength subpath (0,4) of p2)-gap) of p2) of p2;
draw subpath (arctime ((arclength subpath (0,4) of p2)+gap) of p2, arctime ((arclength subpath (0,6) of p2)-gap) of p2) of p2;
draw subpath (arctime ((arclength subpath (0,6) of p2)+gap) of p2, arctime ((arclength subpath (0,11) of p2)-gap) of p2) of p2;

draw subpath (arctime gap of p3, arctime ((arclength subpath (0,2) of p3)-gap) of p3) of p3;
draw subpath (arctime ((arclength subpath (0,2) of p3)+gap) of p3, arctime ((arclength subpath (0,4) of p3)-gap) of p3) of p3;
draw subpath (arctime ((arclength subpath (0,4) of p3)+gap) of p3, arctime ((arclength subpath (0,6) of p3)-gap) of p3) of p3;
draw subpath (arctime ((arclength subpath (0,6) of p3)+gap) of p3, arctime ((arclength subpath (0,11) of p3)-gap) of p3) of p3;

draw p4; 

endfig;

beginfig(716)
save u,p;
path p[];
u:=.5cm;

z.o=origin;
z.r=(.5,.5)*u;
z.R=2*(.7,.7)*u;
z.x=(.7,.7)*u;
z.shift= 2*z.R zscaled (1,-1);

p0=circle(z.o,z.r);
p1=circle(z.o,z.R);

fill p0--reverse(p1)--cycle withcolor 0;
draw p0;
draw p1;
draw -z.r--(-z.r+z.x) penbold;
draw z.R--z.R+z.x penbold;

fill (p0--reverse(p1)--cycle) shifted z.shift withcolor 0;
draw p0 shifted z.shift;
draw p1 shifted z.shift;
draw (-z.R--(-z.R-z.x)) shifted z.shift penbold;
draw (z.R--z.R+z.x) shifted z.shift penbold;

label (btex {\color{white} $K_1$} etex, .5[z.r,z.R]);
label (btex {\color{white} $K_2$} etex, .5[z.r,z.R]+z.shift);
endfig;

beginfig(718)
save u,p;
path p[];
u:=.8cm;

z.shift=(4.5,0)*u;

p1=(-1,-.5)*u{right}..(0,0)*u{1,1}..(0,1)*u..(0,0)*u{1,-1}..(01,0)*u{1,1}..(1,1)*u..(1,0)*u{1,-1}..{right}(2,-.5)*u;

p2= subpath (0,3.4) of p1..
for i=6.2 step .1 until 7:
point i of p1-12*unitvector((direction i of p1) rotated 90)..
endfor
for i=7 step -.1 until 6.2:
(point i of p1)+ 12*unitvector((direction i of p1) rotated 90)..
endfor
subpath (4.6,7) of p1;

p3= subpath (0,.8) of p2..
for i=3.1 step .1 until length p2:
point i of p2-3.5*unitvector((direction i of p2) rotated 90)..
endfor
for i=length p2 step -.1 until 3.1:
(point i of p2)+ 3.5*unitvector((direction i of p2) rotated 90)..
endfor
subpath (1.2, length p2) of p2;

%draw  p1;
%draw p2;
draw subpath(0,length p1 -.1) of p1;
Dot point 0  of p1, point length p1 -.1  of p1;
draw subpath(0,length p2 -.1) of p2 shifted (z.shift);
Dot point 0  of p2 shifted (z.shift), point length p2 -.1  of p2 shifted (z.shift);
draw subpath(0,length p3 -.1) of p3 shifted (2*z.shift);
Dot point 0  of p3 shifted (2*z.shift), point length p3 -.1  of p3 shifted (2*z.shift);

endfig;

beginfig(802)
save u,p;
path p[];
u:=1.4cm;

z.b=(.5,1)*u;
z.a=(1,-1)*u;
z.v=(-.3,0)*u;
z.w= z.v reflectedabout(z.a,z.b);

z.a1=(-.2,-1.1)*u;
z.a2=(-1,-.2)*u;
z.a3=(-.8,1)*u;

z.b1=(1.9,1.2)*u;
z.b2=(2.2,0)*u;

z.x=.7[z.v,.4[z.b,z.a]];

p0=z.a--z.b--z.v--cycle;

hatchfill p0  withcolor (-50, 1mm, -.5bp);
labelarcsprof(z.b, z.v, z.x, 18, 5, btex $\theta$ etex);

draw p0;
draw z.a--z.w--z.b;
draw z.a--z.a1--z.a2--z.a3--z.b;
draw z.b--z.b1--z.b2--z.a;

draw z.v--z.a1 dashed evenly;
draw z.v--z.a2 dashed evenly;
draw z.v--z.a3 dashed evenly;

draw z.w--z.b1 dashed evenly;
draw z.w--z.b2 dashed evenly;

draw z.v--z.x;

rimmark(z.v--z.a,z.w--z.a);
rimmark2(z.v--z.b,z.w--z.b);

dOt z.v,z.w,z.a,z.b,z.x;


label.bot (btex $a$ etex, z.a);
label.top (btex $b$ etex, z.b);
whitelabel.rt (btex $x$ etex, z.x);
whitelabel (btex $\triangle$ etex, .6[.5[z.v,z.b],z.a]);
whitelabel.ulft (btex $v$ etex, z.v);
whitelabel.rt (btex $w$ etex, z.w);
whitelabel (btex $V_v$ etex, .5[z.v,z.a1]+(-1,0));
whitelabel (btex $V_w$ etex, z.w+(3,-20));
endfig;

beginfig(804)
save u,p;
path p[];
u:=1cm;

z.a1=origin;

z.e0=(.8,1)*u;
z.e1=(-1.2,2)*u;
z.e2=(-1.3,.5)*u;
z.e3=(-2,-.5)*u;
z.e4=(-.7,-.5)*u;
z.e5=(.5,-1)*u;
z.e6=(1.5,-.3)*u;
z.e7=(1,.4)*u;
z.e8=(2,1.5)*u;

p0=z.e0--z.e1--z.e2--z.e3--z.e4--z.e5--z.e6--z.e7--z.e8--cycle;
p1=z.e0--z.a1--z.e1--cycle;
p2=(.8*z.e1..tension 2..(.8)*z.e3..tension 2..z.e5..tension 2..z.e6..tension 2..(.8)*z.e8..tension 2..cycle) scaled 1.4;

%hatchfill p1  withcolor (-50, 1mm, -.5bp);
hatchfill p0--reverse(p2)--cycle  withcolor (40, 1mm, -.5bp);
draw p0;
draw z.e0--z.a1--z.e1 dashed evenly;

dOt z.a1;

label.bot (btex $a_1$ etex, z.a1);
label (btex $\Omega$ etex, (1/3)[.5[z.e2,z.e3],z.a1]);
label (btex $T_i$ etex, (.3)[.4[z.e0,z.e1],z.a1]);
whitelabel (btex $E_i$ etex rotated angle(z.e0-z.e1), .5[z.e0,z.e1]+12*(unitvector(z.e0-z.e1) rotated 90));
endfig;

beginfig(806)
save u,p;
path p[];
u:=.8cm;

z.shift=(2.5,0)*u;

z.p=(-.1,0)*u;
z.q=(1,-.7)*u;
z.v=(.1,-.8)*u;
z.w=(.6,.4)*u;
z.q1=(.4,-1.4)*u;
z.q2=(-.4,-1.1)*u;
z.q3=(-.7,.2)*u;
z.q4=(.1,.7)*u;
z.q5=(-.2,1.1)*u;
z.q6=(1.2,.7)*u;

p0=z.q--z.q1--z.q2--z.q3--z.q4--z.q5--z.q6--cycle;
p1=z.q1--z.v--z.q2--z.p--z.q3--z.q5;
p2=z.p--z.q4--z.q6--z.w--z.p--z.v--z.q--z.w--z.q4;

draw p0;
draw p1;
draw p2;
draw z.v--z.w penbold;

draw p0 shifted z.shift;
draw p1 shifted z.shift;
draw p2 shifted z.shift;
draw (z.p--z.q) shifted z.shift penbold;

dOt z.p,z.q,z.v,z.w,z.q1,z.q2,z.q3,z.q4,z.q5,z.q6,
z.p+z.shift,z.q+z.shift,z.v+z.shift,z.w+z.shift,z.q1+z.shift,z.q2+z.shift,z.q3+z.shift,z.q4+z.shift,z.q5+z.shift,z.q6+z.shift;

label.lrt (btex $q$ etex, z.q);
label.llft (btex $p$ etex, z.p+(-1,1));
label.bot (btex $v$ etex, z.v+(-2,-1));
label.rt (btex $w$ etex, z.w+(0,-2));

label.lrt (btex $q$ etex, z.q+z.shift);
label.llft (btex $p$ etex, z.p+(-1,1)+z.shift);
label.bot (btex $v$ etex, z.v+(-2,-1)+z.shift);
label.rt (btex $w$ etex, z.w+(0,-2)+z.shift);
endfig;

beginfig(808)
save u,p;
path p[];
u:=.7cm;

z.z=(0,.7)*u;
z.x=z.z rotated 120;
z.y=z.z rotated -120;

z.zscale=(2.8,-.1);

z.zz=z.z zscaled z.zscale;
z.yy=z.y zscaled z.zscale;
z.xx=z.x zscaled z.zscale;

draw z.x--z.y--z.z--cycle;
draw z.xx--z.yy--z.zz--cycle;
draw z.x--z.xx--z.y--z.yy--z.z--z.zz--cycle;

dOt z.x,z.y,z.z,z.xx,z.yy,z.zz;

label.urt (btex $z$ etex, z.z);
label.top (btex $z'$ etex, z.zz);
label.ulft (btex $x$ etex, z.x);
label.lft (btex $x'$ etex, z.xx);
label.bot (btex $y$ etex, z.y);
label.rt (btex $y'$ etex, z.yy);
endfig;

beginfig(810)
save u,p;
path p[];
u:=1cm;

z.a=(2,0)*u;
z.b=(.5,1.5)*u;

p0=origin--z.a--z.a+z.b--z.b--cycle;

arcs(z.a,origin,z.b,10);
arcs(z.a,z.a+z.b,z.b,10);
arcs2(origin,z.a,z.a+z.b,10);
arcs2(origin,z.b,z.a+z.b,10);
rimmark(origin--z.a,z.b--z.a+z.b);
rimmark2(origin--z.b,z.a--z.a+z.b);

z5=.4*z.a+.2*z.b;
z7=.7*z.a+.7*z.b;

draw p0;
draw z5{(z7-z5) rotated 30}..{(z7-z5) rotated -30}z7;
draw z5{(z7-z5) rotated -30}..{(z7-z5) rotated 30}z7;

dOt z5,z7;

label.lft (btex $z_5$ etex, z5);
label.rt (btex $z_7$ etex, z7);

endfig;

beginfig(812)
save u,p;
path p[];
u:=1cm;

z0=origin;
z1=(1,0)*u;
z2=z1+(z1 rotated 75);
z3=z2+(z1 rotated 105);
z4=z3-z1;
z5=z1 rotated 105;

draw z0--z1--z2--z3--z4--z5--cycle;
parallel_mark(z0--z1);
parallel_mark(z4--z3);
parallel_mark2(z1--z2);
parallel_mark2(z0--z5);
parallel_mark3(z2--z3);
parallel_mark3(z5--z4);
endfig;
end
