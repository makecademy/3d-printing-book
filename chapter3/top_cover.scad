arduino_width = 57;
arduino_length = 69;
wall_thickness = 2;

cube([arduino_width,arduino_length,wall_thickness], center=true);

translate([0,0,wall_thickness]){
  cube([arduino_width+wall_thickness*2,arduino_length+wall_thickness*2,wall_thickness], center=true);
}
