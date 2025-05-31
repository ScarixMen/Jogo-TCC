// Inherit the parent event
event_inherited();

script_execute(state)

var push_list = ds_list_create();
var is_block = instance_place_list(x + hspd, y, obj_Box, push_list, false);

if(is_block)
{
	
	if(ds_list_size(push_list) > 0)	{
		for(var i = 0; i < ds_list_size(push_list);i++){
			var block = push_list [| i];
			with(block){
				if(!place_meeting(x+other.hspd,y,obj_Block)){
					x+=other.hspd;
				}
			}
		}
	}
}

ds_list_destroy(push_list);