/**
 * Martin Egli
 * 2023-04-04
 */

module rotaryEVQ_V5B00215B(loc_res = 32) {
    difference() {
        union() {
            color("LightGray")
            translate([0, 0, 0])
            cylinder(d = 21.9, h = 15, $fn = loc_res);
            color("DarkGray") {
                translate([0, 0, 0])
                cylinder(d = 27.5, h = 6, $fn = loc_res);
                translate([-12/2, -28/2, 0])
                cube([12, 28, 6]);
                translate([-28/2, -2.5/2, 0])
                cube([28, 2.5, 6]);
            }
        }        
        translate([0, 0, -1])
        cylinder(d = 17.6, h = 15+2, $fn = loc_res);
    }
}

module oled1_28ZollRound(loc_res = 32) {
    color("White")
    translate([0, 0, 0.1])
    cylinder(d = 32.4, h = 1.5, $fn = loc_res);
    color("DarkGray")
    hull() {
        translate([0, 0, 0])
        cylinder(d = 35.6, h = 1.5, $fn = loc_res);
        translate([-10/2, -38.1/2, 0])
        cube([10, 10, 1.5]);
    }
}

module led0505(loc_res = 32) {
    difference() {
        union() {
            color("White")
            translate([-5/2, -5/2, 0])
            cube([5, 5, 1.6]);
            color("Gray")
            translate([0, 0, 1.5])
            cylinder(d = 4, h = 0.2, $fn = loc_res);
        }
        translate([5/2, -5/2-1.5, 1.6-0.2])
        rotate([0, 0, 45])
        cube([2, 2, 0.3]);
    }
}

module ledWS2812B(loc_res = 32) {
    led0505(loc_res);
}

module ledSK6812(loc_res = 32) {
    led0505(loc_res);
}

//rotaryEVQ_V5B00215B();
//oled1_28ZollRound();
//ledWS2812B();
