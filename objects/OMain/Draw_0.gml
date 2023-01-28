draw_clear(c_navy);

gpu_push_state();
gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);

camera_set_view_mat(camera, matView);
camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(
	-60,
	-window_get_width() / window_get_height(),
	0.1,
	clipFar
));
camera_apply(camera);

var _fogColor = c_navy;
var _fogStart = 0;
var _fogEnd = abs(floorZ);

gpu_set_alphatestenable(true);
gpu_set_alphatestref(1.0);
gpu_set_fog(true, _fogColor, _fogStart, _fogEnd);
gpu_set_tex_repeat(true);

////////////////////////////////////////////////////////////////////////////////
// Seaweed
var _shader = ShBillboardCyllindrical;
shader_set(_shader);
shader_set_uniform_f(
	shader_get_uniform(_shader, "u_vFogColor"),
	color_get_red(_fogColor) / 255,
	color_get_green(_fogColor) / 255,
	color_get_blue(_fogColor) / 255);
shader_set_uniform_f(
	shader_get_uniform(_shader, "u_vFogStart"),
	_fogStart);
shader_set_uniform_f(
	shader_get_uniform(_shader, "u_vFogEnd"),
	_fogEnd);

var _matBillboard = matrix_build(0, 0, 0, 0, 0, direction, 1, 1, 1);
var _seaweed = seaweed;

with (OSeaweed)
{
	_matBillboard[@ 12] = x;
	_matBillboard[@ 13] = y;
	_matBillboard[@ 14] = z;
	matrix_set(matrix_world, _matBillboard);
	vertex_submit(_seaweed, pr_trianglelist, sprite_get_texture(SprSeaweed, 0));
}

shader_reset();

////////////////////////////////////////////////////////////////////////////////
//

var _matBillboard = matrix_multiply(
	matrix_build(0, 0, 0, 90 + pitch, 0, 0, 1, 1, 1),
	matrix_build(0, 0, 0, 0, 0, direction - 90, 1, 1, 1),
);

with (OOctopus)
{
	_matBillboard[@ 12] = x;
	_matBillboard[@ 13] = y;
	_matBillboard[@ 14] = z;
	matrix_set(matrix_world, _matBillboard);
	draw_sprite_stretched(SprOctopus, 0, 0, 0, size, size);
}

with (ORainbowShot)
{
	_matBillboard[@ 12] = x;
	_matBillboard[@ 13] = y;
	_matBillboard[@ 14] = z;
	matrix_set(matrix_world, _matBillboard);
	draw_sprite_stretched(SprRainbowShot, 0, 0, 0, size, size);
}

gpu_push_state();
gpu_set_fog(false, 0, 0, 0);

with (OHealth)
{
	_matBillboard[@ 12] = x;
	_matBillboard[@ 13] = y;
	_matBillboard[@ 14] = z;
	matrix_set(matrix_world, _matBillboard);
	draw_sprite_stretched(SprHealth, 0, 0, 0, size, size);
}

gpu_pop_state();

////////////////////////////////////////////////////////////////////////////////
// Floor
matrix_set(matrix_world, matrix_build(0, 0, floorZ, 0, 0, 0, 1, 1, 1));
draw_sprite_stretched(SprFloor, 0, 0, 0, room_width, room_height);

////////////////////////////////////////////////////////////////////////////////
// Water level
gpu_set_alphatestenable(false);

if (z >= 0)
{
	gpu_set_fog(false, 0, 0, 0);
}

matrix_set(matrix_world, matrix_build_identity());
draw_sprite_stretched_ext(SprWater, 0, 0, 0, room_width, room_height, c_white, 0.5);

gpu_pop_state();

////////////////////////////////////////////////////////////////////////////////
// 2D
var _windowWidth = window_get_width();
var _windowHeight = window_get_height();

camera_set_view_size(camera2D, _windowWidth, _windowHeight);
camera_apply(camera2D);

var _tridentHeight = sprite_get_height(SprTrident);

draw_sprite_ext(SprTrident, 0, _windowWidth * 0.75, _windowHeight + _tridentHeight * 0.2,
	1, 1, tridentAngle, c_white, 1);
