size = 32;
image_xscale = size / 2;
image_yscale = image_xscale;

respawn = function () {
	x = random(room_width);
	y = random(room_height);
	z = 50;
};

respawn();
