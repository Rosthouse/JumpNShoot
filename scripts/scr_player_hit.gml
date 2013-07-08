///Player was hit
if(!post_hit){
    health--;
    timeline_index = tml_Post_Hit;
    timeline_position = 0;
    timeline_running = true;
    timeline_loop = false;
}

//The next line is not the responsibility of this script
//with(other) instance_destroy();
