/**
 * Martin Egli
 * 2023-04-05
 */

use<parts.scad>

module part1_DisplayCover(loc_res) {
    difference() {
        translate([0, 0, 0])
        cylinder(d = 42, h = 1.8+0.4, $fn = loc_res);
        hull() {
            translate([0, 0, 0])
            cylinder(d = 36, h = 1.8, $fn = loc_res);
            translate([-10.6/2, -40/2, 0])
            cube([10.6, 10, 1.8]);
        }
        translate([0, 0, 0])
        cylinder(d = 35, h = 1.6+1.8+1, $fn = loc_res);
    }
}


module part2_RotaryHandle(loc_res = 32) {
    echo("part2_RotaryHandle(): this will need some rework");
    
    difference() {
        hull() {
            translate([0, 0, 0])
            cylinder(d = 50, h = 13.7-2.5, $fn= 16);
            
            translate([0, 0, 0])
            cylinder(d = 45, h = 13.7, $fn = loc_res);
        }
        translate([0, 0, -1])
        cylinder(d = 22, h = 15, $fn = loc_res);
        #translate([0, 0, 15-6])
        cylinder(d = 42.2, h = 10, $fn = loc_res);
        
        translate([0, 0, -1])
        cube(40);
    }
}

module part4_LightRing(loc_res = 32) {
    difference() {
        hull() {
            translate([0, 0, 0])
            cylinder(d = 50-1, h = 0+6, $fn= loc_res);
            translate([0, 0, 0])
            cylinder(d = 50, h = 0+6-0.5, $fn= loc_res);
        }
        translate([0, 0, -1])
        cylinder(d = 44.2, h = 1.6+1+1.6, $fn = loc_res);
        translate([0, 0, -1])
        cylinder(d = 29, h = 1.6+1+6+1, $fn = loc_res);
        // champfer to direct light
        translate([0, 0, 6-2])
        cylinder(d1 = 32, d2 = 32+15, h = 3+1, $fn = loc_res);
        
        translate([-12.6/2, -28.6/2, 0])
        cube([12.6, 28.6, 6]);
        translate([-28.6/2, -(2.5+.6)/2, 0])
        cube([28.6, 2.5+.6, 6]);
    }
}



module pcbR01(loc_res = 32, show = 1) {
    if(show) {
        rled = 18;
        nbleds = 8;
        translate([0, 0, 1.6])
        for(n = [0:1:nbleds-1]) {
            translate([rled*cos(360/nbleds*n), rled*sin(360/nbleds*n), 0])
            rotate([0, 0, 360/nbleds*n])
            ledSK6812();
        }
    }
    color("Green")
    translate([0, 0, 0])
    cylinder(d = 44, h = 1.6, $fn = loc_res);
}

module pcbR02(loc_res = 32, show = 1) {
    if(show) {
        translate([0, 0, 1.6])
        oled1_28ZollRound();
    }
    difference() {
        color("Green")
        translate([0, 0, 0])
        cylinder(d = 40, h = 1.6, $fn = loc_res);
        
        translate([0, -21, -0.5])
        hull() {
            translate([+10, 0, 0])
            cylinder(d = 3, h = 1.6+1, $fn = 8);
            translate([-10, 0, 0])
            cylinder(d = 3, h = 1.6+1, $fn = 8);
        }
    }
}

module puttogether() {
    translate([0, 0, 16+1.6])
    part1_DisplayCover();
    
    translate([0, 0, 16])
    pcbR02();
    
    translate([0, 0, 6.1])
    part2_RotaryHandle();
    
    translate([0, 0, 0])
    rotaryEVQ_V5B00215B();
    
    translate([0, 0, -1.6])
    pcbR01();
    
    // use % for transparency
    // because it will be printed transparent
    % translate([0, 0, 0])
    part4_LightRing();
}
puttogether();

// test/print parts
*part1_DisplayCover(256);
*part2_RotaryHandle();
*part4_LightRing(256);