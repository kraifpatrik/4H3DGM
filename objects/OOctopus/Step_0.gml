if (OMain.paused)
{
	return;
}

var _mainX = OMain.x;
var _mainY = OMain.y;
var _mainZ = OMain.z;
var _dirX = _mainX - x;
var _dirY = _mainY - y;
var _dirZ = _mainZ - z;
var _dist = point_distance_3d(x, y, z, _mainX, _mainY, _mainZ);

if (_dist > attackRange)
{
	x += _dirX / _dist * moveSpeed;
	y += _dirY / _dist * moveSpeed;
	z += _dirZ / _dist * moveSpeed;
}
else
{
	if (attackDelay <= 0)
	{
		OMain.hp -= 1;
		OMain.gotHit = true;
		attackDelay = size * 20;
	}
}

if (attackDelay > 0)
{
	attackDelay -= delta_time * 0.001;
}
