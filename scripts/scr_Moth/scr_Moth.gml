function Moth_Follow_Movement(){
    if (!instance_exists(target)) return;
	
    // Posição alvo
    var tx = target.x;
    var ty = target.y - 230;

    // Direção de movimento
    var dir = point_direction(base_x, base_y, tx, ty);

    // Seguir
    if (point_distance(base_x, base_y, tx, ty) < 1300) {
        base_x += lengthdir_x(spd, dir);
        base_y += lengthdir_y(spd, dir);
    }

    // Flutuação
    osc += 0.12;
    var offset_y = sin(osc) * 20;

    x = base_x;
    y = base_y + offset_y;

    // Virar
    image_xscale = (tx < x) ? 1 : -1;
}
function Moth_State_Idle(){

    sprite_index = spr_Moth;

    if (!instance_exists(target)) exit;

    // Flutuação
    osc += 0.12;
    var offset_y = sin(osc) * 20;

    x = base_x;
    y = base_y + offset_y;

    // Ativar follow
    if (point_distance(x, y, target.x, target.y) <= 700){
        state = Moth_State_Follow;
    }
}
function Moth_State_Follow() {
    sprite_index = spr_Moth;

    if (!instance_exists(target)) {
        state = Moth_State_Idle;
        exit;
    }

    Moth_Follow_Movement();

    // Pegou Apollo
    if (place_meeting(x, y, obj_Apollo)) {

        target = obj_Apollo;
        global.apollo_pego = true;

        obj_Apollo.state = Apollo_State_Moth_Attack;
        state = Moth_State_Attack;
        exit;
    }

    // Pegou Luana
    if (place_meeting(x, y, obj_Luana)) {

        target = obj_Luana;
        global.luana_pego = true;

        obj_Luana.state = Luana_State_Moth_Attack;

        state = Moth_State_Attack;
        exit;
    }
}
function Moth_State_Attack() {

    sprite_index = spr_Noone;

    // ----------------------------------
    // TENTAR PEGAR O SEGUNDO PLAYER
    // ----------------------------------

    // Já pegou Apollo → tentar pegar Luana
    if (global.apollo_pego && !global.luana_pego) {
        if (point_distance(x, y, obj_Luana.x, obj_Luana.y) < 60) {
            global.luana_pego = true;
            obj_Luana.state = Luana_State_Moth_Attack;
        }
    }

    // Já pegou Luana → tentar pegar Apollo
    if (global.luana_pego && !global.apollo_pego) {
        if (point_distance(x, y, obj_Apollo.x, obj_Apollo.y) < 60) {
            global.apollo_pego = true;
            obj_Apollo.state = Apollo_State_Moth_Attack;
        }
    }

    // ----------------------------------
    // SE OS DOIS ESTÃO PEGOS → MATAR
    // ----------------------------------
    if (global.apollo_pego && global.luana_pego) {

        // Mata os players
        with (obj_Apollo) state = Apollo_State_Death;
        with (obj_Luana)  state = Luana_State_Death;

        // Destrói este moth
        instance_destroy();
        exit;
    }

    // ----------------------------------
    // SE O PLAYER FOI SALVO → DAR RESET
    // (Apollo salvo)
    // ----------------------------------

    if (instance_exists(target)) {

        if (target.object_index == obj_Apollo && !global.apollo_pego) {
            sprite_index = spr_Apollo_Moth_Reset;
            image_index = 0;
            target.state = Apollo_State_Moth_Reset;

            instance_destroy();
            exit;
        }

        if (target.object_index == obj_Luana && !global.luana_pego) {
            sprite_index = spr_Luana_Moth_Reset;
            image_index = 0;
            target.state = Luana_State_Moth_Reset;

            instance_destroy();
            exit;
        }
    }
}
