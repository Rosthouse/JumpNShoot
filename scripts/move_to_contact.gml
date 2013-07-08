///move_to_contact
{
    var travel_dir = argument0;
    var dir = argument1;
    
    if(sign(dir) > 0){ 
        //travel_dir += 180;
        if(travel_dir >=360){
            travel_dir -= 360;
        }
    }
        
    move_contact_all(travel_dir, -1);
}
