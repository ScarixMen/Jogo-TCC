if (Check_Pause()) exit;
var apollo_right = (obj_Apollo.x > 4700);
var luana_right  = (obj_Luana.x  > 4700);

if (!obj_Cam.is_split) {
    var target_global = (apollo_right && luana_right) ? 0.0 : 0.13;

    // Transição suave
    alpha_global = lerp(alpha_global, target_global, 0.05);

    // Ambos os lados seguem o global
    alpha_camera_left = lerp(alpha_camera_left, alpha_global, 0.05);
    alpha_camera_right = lerp(alpha_camera_right, alpha_global, 0.05);

} else {
    // Split screen
    var target_left = apollo_right ? 0.0 : 0.13;
    var target_right = luana_right ? 0.0 : 0.13;

    // Transição suave
    alpha_camera_left = lerp(alpha_camera_left, target_left, 0.05);
    alpha_camera_right = lerp(alpha_camera_right, target_right, 0.05);

    // Global fica zerado (ou pode manter zero)
    alpha_global = lerp(alpha_global, 0, 0.05);
}
