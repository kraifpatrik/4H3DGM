attribute vec4 in_Position;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying float v_fDepth;

void main()
{
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * in_Position;
	v_vTexcoord = in_TextureCoord;
	v_fDepth = gl_Position.z;
}
