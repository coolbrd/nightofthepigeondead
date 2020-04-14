var _collider = argument[0];

if (_collider != noone) {
	if (place_meeting(x + xspeed, y, _collider)) {
		while (!place_meeting(x + sign(xspeed), y, _collider)) {
			x += sign(xspeed);
		}
		xspeed = 0;
	}
}
x += xspeed;

if (_collider != noone) {
	if (place_meeting(x, y + yspeed, _collider)) {
		while (!place_meeting(x, y + sign(yspeed), _collider)) {
			y += sign(yspeed);
		}
		yspeed = 0;
	}
}
y += yspeed;