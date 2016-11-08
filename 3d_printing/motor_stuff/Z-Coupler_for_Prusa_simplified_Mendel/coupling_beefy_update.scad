// PRUSA Mendel  
// motor/leadscrew coupling
// Used for connecting motor to leadscrew
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel
include <configuration.scad>

/**
 * @name Coupling
 * @category Printed
 * @using 1 m3x25
 * @using 1 m3nut
 * @using 2 m3washer
 */

// ////////////////////////////// 
// Includes
// //////////////////////////////
<teardrop.scad>
// See the bottom of the script to comment it out if you don't want to use this include!
//

// //////////////////////////////
// OpenSCAD SCRIPT
// //////////////////////////////

PI = 3.14159265;
$fs=0.2; // def 1, 0.2 is high res
$fa=3;//def 12, 3 is very nice

hubDiameter = 24; // if the hub or timing pulley is big enough to fit a nut, this will be embedded. 
hubHeight = 8; // the hub is the thick cylinder connected to the pulley to allow a set screw to go through or as a collar for a nut.
hubSetScewDiameter = 3; // use either a set screw or nut on a shaft. Set to 0 to not use a set screw. 
numSetScrews = 1;
motor_shaft=5;

module coupling(){
difference(){
	union(){
		cylinder(h = 30, r=10);
		translate(v = [0, 6, 15]) cube(size = [14,12,30], center = true);
	}

	// inside diameter
	translate(v = [0, 0, -1])cylinder(h = 16, r=motor_shaft/2);
	translate(v = [0, 0, 14.5])cylinder(h = 16, r=7.5/2);

	// screw holes
	rotate ([0,0,90]) translate(v = [7, 15, 7.5]) rotate ([90,0,0]) cylinder(h = 30, r=m3_diameter/2, $fn=16);
	rotate ([0,0,90]) translate(v = [7, 15, 22.5]) rotate ([90,0,0]) cylinder(h = 30, r=m3_diameter/2, $fn=16);
	rotate ([0,0,90]) translate(v = [7, 15, 7.5]) rotate ([90,0,0])  cylinder(h = 10, r=m3_nut_diameter/2, $fn=6);
	rotate ([0,0,90]) translate(v = [7, 15, 22.5]) rotate ([90,0,0])  cylinder(h = 10, r=m3_nut_diameter/2, $fn=6);

	//main cut
	translate(v = [0, 10, 14]) cube(size = [2,20,35], center = true);

	//difference cut
	translate(v = [0, 7, 15])  cube(size = [20,8,1], center = true);

	// setscrew
	translate([0,0.5,5]) rotate([90,-90,0]) union() {
		translate([0,0,hubDiameter/4]) teardrop(hubSetScewDiameter/2, hubDiameter/2+1,true); 
		translate([-1,0,hubDiameter*9/32]) cube(size=[hubHeight/2+1+3.5,5.9,2.5],center=true);
	}

	}
}
coupling();
