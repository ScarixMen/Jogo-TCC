if (Check_Pause()) exit;

script_execute(state)
//colisão horizontal
if place_meeting(x+hspd,y,obj_Block)
{
    while !place_meeting(x+sign(hspd),y,obj_Block)
    {
        x+=sign(hspd);
    }
    hspd = 0;
}

if place_meeting(x+hspd,y,obj_Base_Niobio)
{
    while !place_meeting(x+sign(hspd),y,obj_Base_Niobio)
    {
        x+=sign(hspd);
    }
    hspd = 0;
}

/*if place_meeting(x+hspd,y,obj_Luana)
{
    while !place_meeting(x+sign(hspd),y,obj_Luana)
    {
        x+=sign(hspd);
    }
    hspd = 0;
}*/

x+=hspd

//Colisão vertical
if place_meeting(x,y+vspd,obj_Block)
{
    while !place_meeting(x,y+sign(vspd),obj_Block)
    {
        y+=sign(vspd);
    }
    vspd = 0;
}

if place_meeting(x,y+vspd,obj_Base_Niobio)
{
    while !place_meeting(x,y+sign(vspd),obj_Base_Niobio)
    {
        y+=sign(vspd);
    }
    vspd = 0;
}


y+=vspd;

//OBS: ESSA COLISÃO INCLUI AS PLATAFORMAS, POIS ELAS SÃO FILHAS DO "obj_Block".

#endregion

vspd+= grv;