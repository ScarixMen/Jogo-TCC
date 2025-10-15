function Pressagio_Follow_Movement() {
    if (!instance_exists(target)) return;

    // --- Posição alvo ---
    var tx = target.x;
    var ty = target.y - 200;

    // Seguir suavemente
    var dir = point_direction(base_x, base_y, tx, ty);

    if (point_distance(base_x, base_y, obj_Pressagio_Spawner.x, obj_Pressagio_Spawner.y) > 1300) {
        image_index = 0;
        sprite_index = spr_Pressagio_Explosion;
        state = Pressagio_State_Reset;
        return;
    }

    if (point_distance(base_x, base_y, tx, ty) < 1300) {
        base_x += lengthdir_x(spd, dir);
        base_y += lengthdir_y(spd, dir);
    }

    // --- Flutuação ---
    osc += 0.12;
    var offset_y = sin(osc) * 20;

    x = base_x;
    y = base_y + offset_y;

    // --- Virar pro alvo ---
    image_xscale = (tx < x) ? 1 : -1;
}

function Pressagio_State_Following() {
    sprite_index = spr_Pressagio;

    Pressagio_Follow_Movement();

    if (instance_exists(target) && distance_to_object(target) < 200) {
        state = Pressagio_State_Attack;
    }
}

function Pressagio_State_Attack() {
    sprite_index = spr_Pressagio_Attack;

    Pressagio_Follow_Movement();

    if (place_meeting(x, y, target)) {
        if (target.object_index == obj_Apollo) {
            with (obj_Apollo) {
                if (state != Apollo_State_Death_Forest) {
                    image_index = 0;
                    damage_Apollo_Forest();
                }
            }
        }
        else if (target.object_index == obj_Luana) {
            with (obj_Luana) {
                if (state != Luana_State_Death_Forest) {
                    image_index = 0;
                    damage_Luana_Forest();
                }
            }
        }

        image_index = 0;
        sprite_index = spr_Pressagio_Explosion;
        state = Pressagio_State_Reset;
    }
}

function Pressagio_State_Reset() {
    sprite_index = spr_Pressagio_Explosion;

    if (image_index >= image_number - 1) {
        instance_destroy();
    }
}
