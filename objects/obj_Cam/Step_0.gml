if (target_ != noone)
{
	xTo = target_.x
	yTo = target_.y
}

x += (xTo - x )/25
y += (yTo - y )/17

camera_set_view_pos(view_camera[0], x-(width_/2), y-(heigth_/1.53));