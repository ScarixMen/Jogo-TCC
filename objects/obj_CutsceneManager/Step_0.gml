if (Check_Pause()) exit;

if (current_cutscene == noone) exit;

var finished = script_execute(current_cutscene, id);  // Passa o próprio obj como argumento "other"
if (finished) {
    instance_destroy();
}
