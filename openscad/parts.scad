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
                cylinder(d = 26.5, h = 6, $fn = loc_res);
                translate([-14/2, -28/2, 0])
                cube([14, 28, 6]);
                translate([-28/2, -2.5/2, 0])
                cube([28, 2.5, 6]);
            }
        }        
        translate([0, 0, -1])
        cylinder(d = 17.6, h = 15+2, $fn = loc_res);
    }
}

//rotaryEVQ_V5B00215B();

module oled1_28ZollRound(loc_res = 32) {
    color("White")
    translate([0, 0, 0.1])
    cylinder(d = 32.4, h = 1.5, $fn = loc_res);
    color("DarkGray")
    hull() {
        translate([0, 0, 0])
        cylinder(d = 35.6, h = 1.5, $fn = loc_res);
        translate([-14/2, -38.1/2, 0])
        cube([14, 10, 1.5]);
    }
}
oled1_28ZollRound();

module buttonPTS526SK_SMTR2(loc_res = 32, h1 = 1.5) {
    // button
    color("Gold")
    translate([0, 0, 0])
    cylinder(d = 2, h = h1, $fn = loc_res);
    // leads
    color("Silver") {
        translate([-6.4/2, -3.7/2-0.5/2, 0])
        cube([6.4, 0.5, 0.1]);
        translate([-6.4/2, 3.7/2-0.5/2, 0])
        cube([6.4, 0.5, 0.1]);
    }
    // body
    color("Black")
    hull() {
        translate([-5.2/2, -2.6/2, 0])
        cube([5.2, 2.6, 0.9]);
        translate([-2.6/2, -5.2/2, 0])
        cube([2.6, 5.2, 0.9]);
    }
    color("Silver")
    hull() {
        translate([-5.2/2, -2.6/2, 0.9])
        cube([5.2, 2.6, 0.1]);
        translate([-2.6/2, -5.2/2, 0.9])
        cube([2.6, 5.2, 0.1]);
    }
    // middle part
    color("Silver")
    translate([0, 0, 1])
    cylinder(d1 = 4, d2 = 3.5, h = 0.15, $fn = loc_res);
}

module buttonPTS526SK15SMTR2(loc_res = 32) {
    buttonPTS526SK_SMTR2(loc_res, 1.5);
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
///ledSK6812();