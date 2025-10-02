function Plataform_Lumini_Portrait()
{
    image_speed = 1;
    	if(obj_Apollo.can_control)script_execute(Input_Apollo);
    
    sprite_index = spr_Plataform_Lumini_Portrait;
    
    if point_distance(x, y, obj_Apollo.x, obj_Apollo.y) < 600
    {
        if (interact_Apollo)
        {
            // só deixa ativar se o Apollo não estiver no espaço da futura colisão
            if !place_meeting(x, y, obj_Player)
            {
                state = Plataform_Lumini_Appear;
            }
        }
    }
}
function Plataform_Lumini_Appear()
{
    if (sprite_index != spr_Plataform_Lumini_Appear) {
        sprite_index = spr_Plataform_Lumini_Appear;
        image_index  = 0;
        image_speed  = 1;
    }
    
    script_execute(Input_Apollo);
	
	 // cria colisão só se ainda não existir
        if (col_inst == noone || !instance_exists(col_inst)) {
            col_inst = instance_create_layer(x, y, "Instances", obj_Plataform_Lumini_Colision);
        }
    
    if (image_index >= image_number - 1)
    {
        image_speed = 0;
        
    }
    
    if point_distance(x, y, obj_Apollo.x, obj_Apollo.y) < 600
    {
        if (interact_Apollo)
        {
            state = Plataform_Lumini_Disappear;
        }
    }
}
function Plataform_Lumini_Disappear()
{
    if (sprite_index != spr_Plataform_Lumini_Disappear) {
        sprite_index = spr_Plataform_Lumini_Disappear;
        image_index  = 0;
        image_speed  = 1;
    }
    
    if (image_index >= image_number - 1)
    {
        // destrói apenas a colisão ligada a esta plataforma
        if (col_inst != noone && instance_exists(col_inst)) {
            with (col_inst) instance_destroy();
            col_inst = noone;
        }
        
        state = Plataform_Lumini_Portrait;
    }
}
