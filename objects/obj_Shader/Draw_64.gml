if (Check_Pause()) exit;
if(!instance_exists(obj_Transition_Death))
{
	shader_set(shd_sunset);

	shader_set_uniform_f(shader_get_uniform(shd_sunset, "u_alpha_global"), alpha_global);
	shader_set_uniform_f(shader_get_uniform(shd_sunset, "u_alpha_left"), alpha_camera_left);
	shader_set_uniform_f(shader_get_uniform(shd_sunset, "u_alpha_right"), alpha_camera_right);

	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

	shader_reset();
}