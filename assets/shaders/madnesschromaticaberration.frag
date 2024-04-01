#pragma header


  uniform float intensity;
  void main(void)
  {
    vec2 uv = openfl_TextureCoordv.xy;

	float amount = 0.0;
	
	amount = (1.0 + sin(6.0)) * 0.5;
	amount *= 1.0 + sin(16.0) * 0.5;
	amount *= 1.0 + sin(19.0) * 0.5;
	amount *= 1.0 + sin(27.0) * 0.5;
	amount = pow(amount, 3.0);

	amount *= intensity;
	
    vec3 col;
    col.r = flixel_texture2D(bitmap, vec2(uv.x+amount,uv.y) ).r;
    col.g = flixel_texture2D(bitmap, uv ).g;
    col.b = flixel_texture2D(bitmap, vec2(uv.x-amount,uv.y) ).b;

	col *= (1.0 - amount * 0.5);
  vec4 color = flixel_texture2D(bitmap, openfl_TextureCoordv);

   
    gl_FragColor = vec4(col*color.a, color.a);
  }