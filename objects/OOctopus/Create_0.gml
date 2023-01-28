sizeMax = 64;

respawn = function () {
	x = random(room_width);
	y = random(room_height);
	z = random_range(OMain.floorZ, 0);
	size = random_range(32, sizeMax);
	image_xscale = size / 2;
	image_yscale = image_xscale;
	hp = size;
	moveSpeed = (1 - (size / sizeMax)) * 4;
	attackRange = size * 2;
	attackDelay = 0;
};

respawn();
