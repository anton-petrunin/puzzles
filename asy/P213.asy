settings.render=32;
import three;
size(2cm);
currentprojection=perspective(4,8,16);
currentlight=light(.1,.2,.4);

path3[] faces={
-X-Y-Z-- -X-Y+Z-- -X+Y+Z-- -X+Y-Z--cycle,
-X-Y-Z-- -X+Y-Z--X+Y-Z-- X-Y-Z--cycle,
-X-Y-Z-- X-Y-Z-- X-Y+Z-- -X-Y+Z--cycle,
X+Y+Z--X-Y+Z-- -X-Y+Z-- -X+Y+Z--cycle,
X+Y+Z-- -X+Y+Z-- -X+Y-Z-- X+Y-Z--cycle,
3*X+Y+Z--3*X+Y-Z--3*X-Y-Z--3*X-Y+Z--cycle,
3*X+Y+Z--3*X-Y+Z-- X-Y+Z-- X+Y+Z--cycle,
3*X+Y+Z-- X+Y+Z-- X+Y-Z-- 3*X+Y-Z--cycle,
3*X-Y-Z-- 3*X+Y-Z-- -X+Y-Z-- -X-Y-Z--cycle,
3*X-Y-Z-- -X-Y-Z-- -X-Y+Z-- 3*X-Y+Z--cycle,
};

draw(faces,.5bp+black+opacity(1));
draw(surface(faces),white+opacity(0.6),light=nolight);
draw(-X-Y-Z-- X+Y+Z,1bp+black+opacity(1));
draw(X+Y-Z-- 3*X-Y+Z,1bp+black+opacity(1));
