arduino_width = 52.1;
arduino_length = 43.2;
arduino_usb_width = 19.55 - 10.4;
arduino_usb_height = 15;
arduino_usb_x = 10.4;
arduino_power_width = 19.05 - 10.8;
arduino_power_height = 16;
arduino_power_x = 10.8;

wall_thickness = 2;
wall_height = 12;
bottom_thickness = 2;
side_shoulder = 6;

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
		cube([arduino_usb_width,wall_thickness*2,arduino_usb_height], center=true);
	}

	// Power hole
	translate([	((arduino_width/2.0)-(arduino_power_width/2.0)-arduino_power_x),
			-1*(arduino_length/2.0)-(wall_thickness/2.0),
			-1*(wall_height/2.0 - arduino_power_height/2.0)+bottom_thickness/2.0])
	{
		cube([arduino_power_width,wall_thickness*2,arduino_power_height], center=true);
	}
	
}

