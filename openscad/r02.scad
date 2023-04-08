/**
 * Martin Egli
 * 2023-04-05
 */

use<parts.scad>

// - 3d printed parts ----------------------------------------
module part1_DisplayCover(loc_res) {
    difference() {
        translate([0, 0, 0])
        cylinder(d = 42, h = 1.8+0.4, $fn = loc_res);
        hull() {
            translate([0, 0, -0.5])
            cylinder(d = 36, h = 1.8+0.5, $fn = loc_res);
            translate([-10.6/2, -40/2, -0.5])
            cube([10.6, 10, 1.8+0.5]);
        }
        translate([0, 0, -1])
        cylinder(d = 35, h = 1.6+1.8+1, $fn = loc_res);
    }
}


module part2_RotaryHandle(loc_res = 32, see_into = 1) {
    difference() {
        hull() {
            translate([0, 0, 0])
            cylinder(d = 50, h = 12.7-2.5-.8, $fn= 16);
            translate([0, 0, 0])
            cylinder(d = 45, h = 12.7-1.8, $fn = loc_res);
        }
        // middle/axis cutout
        translate([0, 0, -1])
        cylinder(d = 22, h = 15, $fn = loc_res);
        // upper display cutout
        translate([0, 0, 15-6-1.8])
        cylinder(d = 42.4, h = 10, $fn = loc_res);
        // lower cutout for buttons + slip ring (pcbR03)
        translate([0, 0, -1])
        cylinder(d = 35, h = 1+1.6+1.2, $fn = loc_res);
        // + not to touch buttons
        translate([0, 0, -1])
        cylinder(d = 40, h = 1+1.6, $fn = loc_res);
        
        // cutout to see into
        if(see_into) {
            translate([0, 0, -1])
            cube(40);
        }
    }
}

module part4_LightRing(loc_res = 32) {
    difference() {
        // outside dimensions
        hull() {
            translate([0, 0, 0])
            cylinder(d = 50-1, h = 6+1.6, $fn= loc_res);
            translate([0, 0, 0.5])
            cylinder(d = 50, h = 6+1.6-0.5*2, $fn= loc_res);
        }
        // pcb cutout, placed onto LEDs
        translate([0, 0, 6-1.6])
        cylinder(d = 44.2, h = 1.6+1+1.6, $fn = loc_res);
        // middle cutout
        translate([0, 0, -1])
        cylinder(d = 29, h = 1.6+1+6+1, $fn = loc_res);
        translate([-12.6/2, -28.6/2, -0.5])
        cube([12.6, 28.6, 6+1]);
        translate([-28.6/2, -(2.5+.6)/2, -0.5])
        cube([28.6, 2.5+.6, 6+1]);
        
        // do not use for a start: champfer to direct light
        *translate([0, 0, -1])
        cylinder(d2 = 32, d1 = 32+15, h = 3+1, $fn = loc_res);
    }
}

module part5_Bottom(loc_res = 32) {
    difference() {
        hull() {
            translate([0, 0, 0])
            cylinder(d = 50-1, h = 12, $fn= loc_res);
            translate([0, 0, 0.5])
            cylinder(d = 50, h = 11.5, $fn= loc_res);
        }
        translate([0, 0, 1])
        hull() {
            translate([0, 0, 0])
            cylinder(d = 50-1-2, h = 12, $fn= loc_res);
            translate([0, 0, 0.5])
            cylinder(d = 50-2, h = 12, $fn= loc_res);
        }
        hull() {
            translate([2, 28, 2])
            rotate([90, 0, 0])
            cylinder(d = 2, h = 10, $fn = loc_res);
            translate([-2, 28, 2])
            rotate([90, 0, 0])
            cylinder(d = 2, h = 10, $fn = loc_res);
        }
        // addon connector cut out
        translate([0, -18, -1])
        hull() {
            translate([-3/2*2.54, 0, 0])
            cylinder(d = 2, h = 3, $fn = loc_res);
            translate([+3/2*2.54, 0, 0])
            cylinder(d = 2, h = 3, $fn = loc_res);
        }
    }
    // addon connector
    *translate([0, -18, -1]) {
        translate([-7, 0, 0])
        cylinder(d = 3, h = 3, $fn = loc_res);
        translate([-3/2*2.54, 0, 0])
        cylinder(d = 1.5, h = 3, $fn = loc_res);
        translate([-1/2*2.54, 0, 0])
        cylinder(d = 1.5, h = 3, $fn = loc_res);
        translate([+1/2*2.54, 0, 0])
        cylinder(d = 1.5, h = 3, $fn = loc_res);
        translate([+3/2*2.54, 0, 0])
        cylinder(d = 1.5, h = 3, $fn = loc_res);
        translate([7, 0, 0])
        cylinder(d = 3, h = 3, $fn = loc_res);
    }
}

// - PCBs and electronics -----------------------------
module pcbR01(loc_res = 32, show = 1) {
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

module pcbR02(loc_res = 32, show = 1) {
    if(show) {
        rled = 18;
        nbleds = 8;
        translate([0, 0, 0])
        for(n = [0:1:nbleds-1]) {
            translate([rled*cos(360/nbleds*n), rled*sin(360/nbleds*n), 0])
            rotate([0, 180, 360/nbleds*n])
            ledSK6812();
        }
        rbutton = 14.5;
        nbbuttons = 3;
        translate([0, 0, 1.6])
        for(n = [0:1:nbbuttons-1]) {
            translate([rbutton*cos(360/nbbuttons*n), rbutton*sin(360/nbbuttons*n), 0])
            rotate([0, 0, 90+360/nbbuttons*n])
            buttonPTS526SK15SMTR2();
        }
    }
    
    
    color("Green")
    difference() {
        translate([0, 0, 0])
        cylinder(d = 44, h = 1.6, $fn = loc_res);
        translate([0, 0, -1])
        cylinder(d = 23, h = 1.6+2, $fn = loc_res);
    }
}

// slip ring (pcbR03), clear surface which glides abobe buttons + press down on buttons
module pcbR03(loc_res = 32) {
    color("Green")
    difference() {
        translate([0, 0, 0])
        cylinder(d = 35, h = 1.6, $fn = loc_res);
        translate([0, 0, -1])
        cylinder(d = 23, h = 1.6+2, $fn = loc_res);
    }
}

// connect rotary encoder to this
// connect pcbR02 to this -> sandwich this together using 100 mil pins
module pcbR04(loc_res = 32) {
    color("Green")
    difference() {
        translate([0, 0, 0])
        cylinder(d = 44, h = 1.6, $fn = loc_res);
        translate([0, 0, -1])
        cylinder(d = 20, h = 1.6+2, $fn = loc_res);
    }
}

// - put it all together ------------------------------------
module puttogether() {
    translate([0, 0, 15+1.6])
    part1_DisplayCover();
    translate([0, 0, 15])
    pcbR01();
    // no part3 between pcbR01() and rotaryEVQ_V5B00215B()
    
    translate([0, 0, 6.1+1.8])
    part2_RotaryHandle();
    
    translate([0, 0, 0])
    rotaryEVQ_V5B00215B();
    
    translate([0, 0, 6])
    pcbR02();
    
    // may belong to part2
    translate([0, 0, 6+1.6+1.5])
    pcbR03();
    
    translate([0, 0, -1.6])
    pcbR04();
    
    // use % for transparency
    // because it will be printed transparent
    %translate([0, 0, 0])
    part4_LightRing();
    
    translate([0, 0, -12])
    part5_Bottom();
}
puttogether();

// test/print parts
//translate([0, 0, 16+1.6])
*part1_DisplayCover(256);
//translate([0, 0, 6.1+1.8])
*part2_RotaryHandle(256, 0);
*part4_LightRing(256);
*part5_Bottom(256);
