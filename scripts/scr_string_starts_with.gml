///Checks if a string starts with a certain pattern
pattern = argument0;
string_to_check = argument1;

for(i=0;i<string_length(pattern);i++){
    if(string_char_at(pattern, i) != string_char_at(string_to_check, i)){
        return false;
    }   
}

return true;
