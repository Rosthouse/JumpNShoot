///Checks a rectangle for all instances of type obj
//Returns a ds_list with all found ids

x0 = argument0; //upper left corner
y0 = argument1; //upper left corner
x1 = argument2; //lower right corner
y1 = argument3; //lower right corner

obj = argument4;    //the object to check for
prec = argument5;   //If precise collision detection should be used, where possible
notme = argument6;  //If the calling object should be excluded from the collision check

//show_debug_message("Arguments; x0: " + string(x0) + "; y0: " + string(y0) + "; x1: " + string(x1) + "; y1: " + string(y1));

disabled_list = ds_list_create();
//Find the first instance. When not found, the while-loop will be ignored
current_collider = collision_rectangle(x0, y0, x1, y1, obj, prec, notme);
    

while(current_collider != noone){
    //If we found an instance, add it to the list
    ds_list_add(disabled_list, current_collider);
    //deactivate it to exclude it from collision detection
    instance_deactivate_object(current_collider);
    
    //Find next collider
    current_collider = collision_rectangle(x0, y0, x1, y1, obj, prec, notme);
}

//reactivate all found instances
for(i=0; i< ds_list_size(disabled_list); i++){
    instance_activate_object(ds_list_find_value(disabled_list, i));
}

return disabled_list;
