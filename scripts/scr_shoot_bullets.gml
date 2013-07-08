///Shoot bullets
{
    var shot_direction_x = argument0;
    var shot_direction_y = argument1;
    
    var shot_start_x = argument2;
    var shot_start_y = argument3;
    
    var bullet_type = argument4;

    bulletInstance = instance_create(shot_start_x, shot_start_y, bullet_type);
    bulletInstance.direction =  point_direction( shot_start_x, shot_start_y, shot_direction_x, shot_direction_y);
}
