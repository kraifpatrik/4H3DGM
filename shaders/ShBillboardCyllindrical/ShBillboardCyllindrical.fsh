varying vec2 v_vTexcoord;
varying float v_fDepth;

uniform vec3 u_vFogColor;
uniform float u_vFogStart;
uniform float u_vFogEnd;

void main()
{
	gl_FragColor = texture2D(gm_BaseTexture, v_vTexcoord);

	if (gl_FragColor.a < 0.8)
	{
		discard;
	}

	gl_FragColor.rgb = mix(
		gl_FragColor.rgb,
		u_vFogColor,
		clamp((v_fDepth - u_vFogStart) / (u_vFogEnd - u_vFogStart), 0.0, 1.0)
	);
	gl_FragColor.a = 1.0;
}
