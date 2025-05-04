function draw_layer_at(layer_name, x, y) {
    var layer_id = layer_get_id(layer_name);
    var tilemap = layer_tilemap_get_id(layer_id);
    tilemap_set_position(tilemap, x, y);
    tilemap_draw(tilemap);
}
