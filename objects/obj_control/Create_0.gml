global.dialog = false;
global.on = false;
randomize();

/*u_texture   = shader_get_uniform(shd_sunset, "u_texture");
u_intensity = shader_get_uniform(shd_sunset, "u_intensity");
intensity   = 0.2; // deixa forte de propósito*/


if (!variable_global_exists("som")) {
    global.som = undefined;
}
if (is_undefined(global.som)) {
    // define tudo aqui (sua estrutura completa que já fizemos antes)
}
