///Player Movement
//argument0 = Movement to the right
//argument1 = Jumping
//argument2 = Crouching
Key_Right   = argument0;
Key_Space   = argument1;
Key_Down    = argument2;

if(Key_Right && false){
    hspeed  += 1;
}

//See that the speed is ALWAYS within the speed boundaries
hspeed = min(hspeed, player_max_speed);
hspeed = max(hspeed, player_min_speed);

//Jump key pressed
if(Key_Space)
{
    if(grounded){
        audio_play_sound(snd_Jump, 10, false);
        vspeed = -1 * player_jump_force;
        gravity = player_grav;
        grounded = false;
        double_jump = false;
        sprite_index = spr_Player_Jumping;
        
    } else if(!double_jump){
        audio_play_sound(snd_Jump, 10, false);
        vspeed = -1 * player_jump_force;
        double_jump = true;
        gravity = player_grav;
        sprite_index = spr_Player_Jumping;
    }
}

//Check if we hit something on the y-Axis while flying
var spr_ind = sprite_index;
sprite_index = spr_Player;

if(!grounded && place_meeting(x, y + vspeed + player_grav, par_Enviroment) ){

    if( sign(vspeed) > 0 ){
        move_to_contact(270, vspeed);
        
        grounded = true;
        double_jump = false;
        gravity = 0;
        spr_ind = spr_Player;
    } else {
        move_to_contact(90, vspeed);
        gravity = player_grav;
    }
    vspeed = 0;
}

//Check if we hit something on the x-Axis
if(place_meeting( x + hspeed, y, par_Enviroment)){
    move_to_contact(0, hspeed);
    hspeed = 0;
}

sprite_index = spr_ind;

//Check if we stepped of a platform
if(grounded && !place_meeting(x, y+1, par_Enviroment) ){
    gravity = player_grav;
    grounded = false;
}

//Check if we want to lay down
if(Key_Down && grounded){
    hspeed = 0;
    sprite_index = spr_Player_Ducking;
    move_contact_all(270, -1);
} else if(sprite_index == spr_Player_Ducking) {
    sprite_index = spr_Player;
    move_outside_all(90, -1);
}

//If we're in the air, set our sprite to jumping
if(!grounded){
    sprite_index = spr_Player_Jumping;
}

if(y+vspeed > room_height){
    vspeed = 0;
    grounded = true;
    gravity = 0;
}

