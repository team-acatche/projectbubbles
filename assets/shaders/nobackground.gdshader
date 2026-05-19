shader_type canvas_item;

void fragment() {
	vec4 tex_color = texture(TEXTURE, UV);
	
	// If the pixel is pure white, set the alpha to 0 (transparent)
	if (tex_color.r > 0.99 && tex_color.g > 0.99 && tex_color.b > 0.99) {
		tex_color.a = 0.0;
	}
	
	COLOR = tex_color;
}