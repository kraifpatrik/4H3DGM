randomize();
score = 0;
application_surface_draw_enable(false);

mouseLockX = 0;
mouseLockY = 0;
paused = true;
pitch = 0;
z = 1;
floorZ = -512;
clipFar = 8192;
camera = camera_create();
camera2D = camera_create();
matView = matrix_build_identity();
charge = 0;
zspeed = 0;
tridentAngle = 0;
shootDelay = 0;
hp = 100;
gotHit = false;
size = 8;
image_xscale = size / 2;
image_yscale = image_xscale;

////////////////////////////////////////////////////////////////////////////////
// Seaweed
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
vformat = vertex_format_end();

seaweed = vertex_create_buffer();
vertex_begin(seaweed, vformat);

var _s = 4;
var _uv2 = abs(floorZ) / _s;

vertex_position_3d(seaweed, 0, -_s * 0.5, 0);      vertex_texcoord(seaweed, 0, 0);
vertex_position_3d(seaweed, 0,  _s * 0.5, 0);      vertex_texcoord(seaweed, 1, 0);
vertex_position_3d(seaweed, 0, -_s * 0.5, floorZ); vertex_texcoord(seaweed, 0, _uv2);

vertex_position_3d(seaweed, 0,  _s * 0.5, 0);      vertex_texcoord(seaweed, 1, 0);
vertex_position_3d(seaweed, 0,  _s * 0.5, floorZ); vertex_texcoord(seaweed, 1, _uv2);
vertex_position_3d(seaweed, 0, -_s * 0.5, floorZ); vertex_texcoord(seaweed, 0, _uv2);

vertex_end(seaweed);

repeat (200)
{
	var _inst = instance_create_layer(
		random(room_width), random(room_height), layer, OSeaweed);
	_inst.z = random_range(floorZ / 2, -8);
}

repeat (10)
{
	instance_create_layer(0, 0, layer, OOctopus);
}
