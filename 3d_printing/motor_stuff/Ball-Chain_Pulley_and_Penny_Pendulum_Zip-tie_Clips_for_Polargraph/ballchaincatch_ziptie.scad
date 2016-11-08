// Penny weights for ball chain
// a Parametric re-design of "Weight for swinging pendulum" by Bre (http://www.thingiverse.com/thing:17016)
// Using parts of "Parametric Ball Pulley" by zignig (http://www.thingiverse.com/thing:1322)
// Designed for use with the polorgraph

// Quality of cylinders/spheres
$fa = 10;
$fs = 0.4;

// General options
ball_diameter = 5.5;
ball_spacing = 69.5/11; // The distance from the centre of one ball to the next
link_diameter = 2;
roll_diameter = 20.25;
roll_height = 0;
wall = 6;
clip_height = 15;
block_height = 25;

zip_h= 5;
zip_w = 2;

// Calculate dimensions
PI = 3.1415927;
link_length = ball_spacing - ball_diameter ;
slotwidth = ball_diameter+2*link_length;
module slot(){
union(){
	translate ([0, 0, ball_diameter]) sphere (r = ball_diameter/2);
	rotate([0,90,0]) cylinder(h = wall*4, r = ball_diameter/2, center=true);
	cylinder(h = ball_diameter, r = ball_diameter/2);
	translate ([0, 0, ball_diameter/2]) cube([wall*4, link_diameter, ball_diameter], center=true);
}
}

module zip(){
cube([wall*4, zip_w, zip_h], center=true);
}


translate ([0, 0, wall/2]) rotate([0,90,0]) {
difference(){
	union(){
		translate ([-slotwidth/2, -wall, 0]) cube([slotwidth,2*wall, block_height]);
	}
	translate ([0, 0, roll_height+clip_height]) slot();
	translate ([0, wall/2, wall]) zip();
	translate ([0, -wall/2, wall]) zip();
}
}

