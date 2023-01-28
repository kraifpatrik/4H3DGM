if (OMain.paused)
{
	return;
}

x += forwardX * moveSpeed;
y += forwardY * moveSpeed;
z += forwardZ * moveSpeed;

if (x < 0 || x >= room_width
	|| y < 0 || y >= room_height
	|| z < OMain.floorZ || z >= -OMain.floorZ)
{
	instance_destroy();
	return;
}
