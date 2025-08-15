var _videoData = video_draw();
var _videoStatus = _videoData[0];

video_set_volume(0.1)
if(_videoStatus == 0)
{
	
	draw_surface(_videoData[1],0,0)
}

var _status = video_get_status();

if (keyboard_check_pressed(vk_space))
{
    if (_status == video_status_playing)
    {
        video_pause();
    }
    else if (_status == video_status_paused)
    {	
		
        video_close()
    }
}

if (_status != video_status_playing)
{
	room_goto(rm_Menu)
}