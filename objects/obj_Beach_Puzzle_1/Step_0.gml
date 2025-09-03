script_execute(state)

if(!global.cam_override) Input_Apollo()

if(place_meeting(x,y,obj_Apollo) and interact_Apollo and !draw)
{

	obj_Apollo.state = Apollo_State_Book
	draw = true

}
if(draw and frame <sprite_get_number(spr_Bookmark)-1){
	frame = (frame + spd) mod sprite_get_number(spr_Bookmark);
}