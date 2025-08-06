varying vec2 v_vTexCoord;

uniform float u_alpha_global;
uniform float u_alpha_left;
uniform float u_alpha_right;

void main()
{
    vec3 fixedColor = vec3(	0.973, 0.482, 0.106);

    float halfScreen = 0.5;

    float alpha_left  = max(u_alpha_global, u_alpha_left);
    float alpha_right = max(u_alpha_global, u_alpha_right);

    float alpha = (v_vTexCoord.x < halfScreen) ? alpha_left : alpha_right;

    gl_FragColor = vec4(fixedColor, alpha);
}
