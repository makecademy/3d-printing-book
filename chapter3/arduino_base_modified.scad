arduino_width = 57;
arduino_length = 69;
arduino_usb_width = 13;
arduino_usb_height = 50;
arduino_usb_x = 9.5;
arduino_power_width = 9.5;
arduino_power_height = 50;
arduino_power_x = 6.5;

wall_thickness = 2;
wall_height = 50;
bottom_thickness = 1;
side_shoulder = 6;

side_hole_width = 5;
side_hole_height = 30;

difference()
{
	// Exterior box
	cube([arduino_width+(2*wall_thickness),arduino_length+(2*wall_thickness),wall_height+bottom_thickness], center=true);

	// Interior recess
	translate([0,0,bottom_thickness/2.0])
		cube([arduino_width,arduino_length,wall_height], center=true);

	// Bottom hole
	cube([arduino_width-(2*side_shoulder),arduino_length-(2*side_shoulder),wall_height+bottom_thickness], center=true);

	// USB hole
	translate([	-1*((arduino_width/2.0)-(arduino_usb_width/2.0)-arduino_usb_x),
			-1*(arduino_length/2.0)-(wall_thickness/2.0),
			-1*(wall_height/2.0 - arduino_usb_height/2.0)+bottom_thickness/2.0])
	{
		cube([arduino_usb_width,wall_thickness,arduino_usb_height], center=true);
	}

	// Power hole
	translate([	((arduino_width/2.0)-(arduino_power_width/2.0)-arduino_power_x),
			-1*(arduino_length/2.0)-(wall_thickness/2.0),
			-1*(wall_height/2.0 - arduino_power_height/2.0)+bottom_thickness/2.0])
	{
		cube([arduino_power_width,wall_thickness,arduino_power_height], center=true);
	}
    
    
}

// Side holes
    for ( i = [0 : 1 : 6] ){
      translate([arduino_width/2.0,side_hole_width-arduino_length/2 + i*10,0]){
        cube([200,side_hole_width,side_hole_height], center=true);
      }
    }




