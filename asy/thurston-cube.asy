settings.render=32;
import three;
size(2cm);
currentprojection=perspective(4,8,16);
currentlight=light(.1,.2,.4);

path3[] faces={
X+Y+Z--X+Y-Z--X-Z--X+Z--cycle,
X-Y+Z--X-Y-Z--X-Z--X+Z--cycle,
X+Y+Z--X-Y+Z--Z-Y--Y+Z--cycle,
-X+Y+Z-- -X-Y+Z--Z-Y--Y+Z--cycle,
X+Y+Z-- -X+Y+Z-- -X+Y-- X+Y--cycle,
X+Y-Z-- -X+Y-Z-- -X+Y-- X+Y--cycle,

-X-Y-Z-- -X-Y+Z-- -X+Z-- -X-Z--cycle,
-X+Y-Z-- -X+Y+Z-- -X+Z-- -X-Z--cycle,
-X-Y-Z-- -X+Y-Z-- -Z+Y-- -Y-Z--cycle,
X-Y-Z-- X+Y-Z-- -Z+Y-- -Y-Z--cycle,
-X-Y-Z-- X-Y-Z-- +X-Y-- -X-Y--cycle,
-X-Y+Z-- X-Y+Z-- X-Y-- -X-Y--cycle,
};


draw(faces,.5bp+black+opacity(1));
draw(surface(faces),white+opacity(.6),light=nolight);
