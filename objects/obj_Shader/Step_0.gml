if (Check_Pause()) exit;

var apollo_shader = !position_meeting(obj_Apollo.x, obj_Apollo.y, obj_Shader_Detect);
var luana_shader  = !position_meeting(obj_Luana.x, obj_Luana.y, obj_Shader_Detect);


if (!obj_Cam.is_split) {
    var target_global = (apollo_shader && luana_shader) ? 0.0 : 0.13;

    alpha_global       = lerp(alpha_global, target_global, 0.05);
    alpha_camera_left  = alpha_global;
    alpha_camera_right = alpha_global;

} else {
    var target_left  = apollo_shader ? 0.0 : 0.13;
    var target_right = luana_shader ? 0.0 : 0.13;

    alpha_camera_left  = lerp(alpha_camera_left, target_left, 0.05);
    alpha_camera_right = lerp(alpha_camera_right, target_right, 0.05);

    alpha_global = lerp(alpha_global, 0, 0.05);
}
