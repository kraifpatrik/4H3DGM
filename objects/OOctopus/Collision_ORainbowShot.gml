var _otherZMin = other.z - other.size / 2;
var _otherZMax = other.z + other.size / 2;
var _zMin = z - size / 2;
var _zMax = z + size / 2;

if (_otherZMin > _zMax
	|| _otherZMax < _zMin)
{
	return;
}

instance_destroy(other);

hp -= 5;

if (hp <= 0)
{
	respawn();
	++score;
}
