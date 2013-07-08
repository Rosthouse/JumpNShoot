///Sets or gets the master gain
//Give no arguments to get the master gain
//Give a number between 0 and 100 to set the master gain
if(argument_count == 0){
    return mgr_Options.music_gain * 100;
} else if(argument_count = 1){
    gain = clamp( argument0, 0, 100)/100;
    audio_music_gain( gain, 500 );
    mgr_Options.music_gain = gain;
}


