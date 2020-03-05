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
gap:=.07*u;

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
label.top  (btex $\partial B(p,r)$ etex,z.r);
endfig;

end
