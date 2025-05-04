// Player 1
var target_x1 = obj_Apolo.x - viewport_width / 2;
var target_y1 = obj_Apolo.y - viewport_height / 2;
camera_set_view_pos(camera_1, clamp(target_x1, 0, room_width - viewport_width), clamp(target_y1, 0, room_height - viewport_height));

// Player 2
var target_x2 = obj_Luana.x - viewport_width / 2;
var target_y2 = obj_Luana.y - viewport_height / 2;
camera_set_view_pos(camera_2, clamp(target_x2, 0, room_width - viewport_width), clamp(target_y2, 0, room_height - viewport_height));



