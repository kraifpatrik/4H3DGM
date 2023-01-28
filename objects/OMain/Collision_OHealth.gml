var _otherZMin = other.z - other.size / 2;
var _otherZMax = other.z + other.size / 2;
var _zMin = z - size / 2;
var _zMax = z + size / 2;

if (_otherZMin > _zMax
	|| _otherZMax < _zMin)
{
	return;
}

hp = min(hp + 50, 100);

other.respawn();
