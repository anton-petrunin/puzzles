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





beginfig(2)
save u,a,n;
u:=8cm;
a:=20;
n:=6;

z0=origin;
z1=(1,0)*u;
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

clip currentpicture to circle(.4[z0,z4], .3abs(z4));

endfig;

beginfig(11);
save u, n;
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


end
