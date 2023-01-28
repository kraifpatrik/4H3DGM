var _mouseX = window_mouse_get_x();
var _mouseY = window_mouse_get_y();
var _mousePressed = mouse_check_button(mb_left);

matView = matrix_build_lookat(
	x, y, z,
	x + dcos(direction), y - dsin(direction), z + dtan(pitch),
	0, 0, 1
);

////////////////////////////////////////////////////////////////////////////////
// Game paused
if (paused)
{
	if (_mousePressed)
	{
		paused = false;
		_mousePressed = false;
		mouseLockX = _mouseX;
		mouseLockY = _mouseY;
		window_set_cursor(cr_none);
	}
	else
	{
		return;
	}
}

////////////////////////////////////////////////////////////////////////////////
// Game playing
var _diffX = mouseLockX - _mouseX;
var _diffY = mouseLockY - _mouseY;

direction += _diffX;
pitch = clamp(pitch + _diffY, -89, 89);

window_mouse_set(mouseLockX, mouseLockY);

var _forwardX = matView[2];
var _forwardY = matView[6];
var _forwardZ = matView[10];

if (charge != 0)
{
	x += _forwardX * charge;
	y += _forwardY * charge;
	z = max(z + _forwardZ * charge, floorZ + 1);
	charge -= sign(charge);
	zspeed = 0;
}
else
{
	var _moveSpeed = keyboard_check(vk_shift) ? 2 : 1;
	var _forward = (keyboard_check(ord("W")) - keyboard_check(ord("S"))) * _moveSpeed;
	var _moving = _forward;

	x += _forwardX * _forward;
	y += _forwardY * _forward;

	if (z > 1)
	{
		z += zspeed;
		zspeed -= 0.25;
	}
	else
	{
		z += (_forward != 0) ? (_forwardZ * _forward) : 0;
		z = clamp(z, floorZ + 1, 1);
	}

	if (keyboard_check(ord("A")))
	{
		x += lengthdir_x(_moveSpeed, direction + 90);
		y += lengthdir_y(_moveSpeed, direction + 90);
		_moving = true;
	}
	else if (keyboard_check(ord("D")))
	{
		x += lengthdir_x(_moveSpeed, direction - 90);
		y += lengthdir_y(_moveSpeed, direction - 90);
		_moving = true;
	}

	tridentAngle = _moving ? dcos(current_time) : 0;

	if (keyboard_check_pressed(vk_space))
	{
		charge = 50 * ((_forward != 0) ? sign(_forward) : 1);
	}
}

if (_mousePressed && shootDelay <= 0)
{
	var _inst = instance_create_layer(x, y, layer, ORainbowShot);
	_inst.z = z;
	_inst.forwardX = _forwardX;
	_inst.forwardY = _forwardY;
	_inst.forwardZ = _forwardZ;
	shootDelay = 100;
}

if (shootDelay > 0)
{
	shootDelay -= delta_time * 0.001;
}

x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

if (hp <= 0)
{
	show_message("Your score is " + string(score));
	room_restart();
}

if (keyboard_check_pressed(vk_escape))
{
	paused = true;
	window_set_cursor(cr_default);
}
