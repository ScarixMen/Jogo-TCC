var up = keyboard_check_pressed(vk_up)
var down = keyboard_check_pressed(vk_down)
var enter = keyboard_check(vk_enter)

var input = down - up

if input != 0
{

	indice += input
	larg = larg_ini
	alt = alt_ini
		
}
if indice > opc_max -1
{
	
	indice = 0
	
} 
if indice < 0
{
	
	indice = opc_max -1
	
}
/*if alpha = 0
{
	alpha += fade_speed

	if alpha >= 1
	{
	
		alpha = 1
	
	}
}*/


larg = lerp(larg, larg_fim,.2)

if larg > larg_fim -2
{
	
	alt = lerp(alt, alt_fim,.2)

}
if(enter)
{
	switch indice
	{
		
		case 0:
			
			room_goto(rm_Beach)
		
		break;
		
		case 4:
			
			game_end();
		
		break;
		
	}
	
}
