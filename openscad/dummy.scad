/**
 * Martin Egli
 * 2023-03-07
 */

module per23Dummy(loc_res = 64) {
    color("Orange") {
        difference() {
            union() {
                translate([0, 0, 0])
                cylinder(d = 23, h = 4.6, $fn = loc_res);
                translate([0, 0, 0])
                cylinder(d = 17.0, h = 5+4.6, $fn = loc_res);
            }
            translate([0, 0, -1])
            cylinder(d = 13.9, h = 17+2, $fn = loc_res);
        }
    }
}

module per35Dummy(loc_res = 64) {
    color("Orange") {
        difference() {
            union() {
                translate([0, 0, 0])
                cylinder(d = 35.0, h = 4.5, $fn = loc_res);
                translate([0, 0, 0])
                cylinder(d = 28.8, h = 15, $fn = loc_res);
            }
            translate([0, 0, -1])
            cylinder(d = 23.2, h = 17+2, $fn = loc_res);
        }
    }
}

module per58Dummy(loc_res = 64) {
    color("Orange") {
        difference() {
            union() {
                translate([0, 0, 0])
                cylinder(d = 56.5, h = 7.5, $fn = loc_res);
                translate([0, 0, 0])
                cylinder(d = 45.5, h = 10.75, $fn = loc_res);
            }
            translate([0, 0, -1])
            cylinder(d = 40.6, h = 17+2, $fn = loc_res);
        }
    }
}

module per60Dummy(loc_res = 64) {
    color("Orange") {
        difference() {
            union() {
                translate([0, 0, 0])
                cylinder(d = 59.8, h = 7.5, $fn = loc_res);
                translate([0, 0, 0])
                cylinder(d = 49.6, h = 17, $fn = loc_res);
            }
            translate([0, 0, -1])
            cylinder(d = 44.0, h = 17+2, $fn = loc_res);
        }
    }
}

module tft1_28ZollDummy(loc_res = 32) {
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

module caseA(loc_res = 32) {
    difference() {
        hull() {
            translate([0, 0, 0])
            cylinder(d = 50, h = 8, $fn = 16);
            translate([0, 0, 0])
            cylinder(d = 50-2*1.5, h = 8+1.5, $fn = 2*loc_res);
        }
        translate([0, 0, -1])
        cylinder(d = 33, h = 15+2, $fn = 2*loc_res);
        translate([0, 0, -1])
        cylinder(d = 50-3, h = 8+1, $fn = 2*loc_res);
        translate([0, 0, -1])
        *cylinder(d = 65, h = 10+1, $fn = 2*loc_res);
        *translate([0, 0, -1])
        cube(40);
    }
    
}
module caseB(loc_res = 32) {
    difference() {
        hull() {
            translate([0, 0, 0])
            cylinder(d = 49, h = 3, $fn = 2*loc_res);
        }
        translate([0, 0, -1])
        cylinder(d = 49-3, h = 10+1, $fn = 2*loc_res);
        *translate([0, 0, -1])
        cube(40);
    }
}

module latchCoutdent(loc_res = 32) {
    hull() {
        translate([0, 0, 0])
        sphere(d = 1, $fn = loc_res);
        translate([0, 0, -1])
        sphere(d = 1, $fn = loc_res);
    }
}

module latchCcut(loc_res = 32) {
    hull() {
        translate([0, 0, 0])
        rotate([0, 90, -2])
        cylinder(d = 1, h = 40, $fn = loc_res);
        translate([0, 0, -2])
        rotate([0, 90, -2])
        cylinder(d = 1, h = 40, $fn = loc_res);
    }
    hull() {
        translate([0, 0, -2])
        rotate([0, 90, -2])
        cylinder(d = 1, h = 40, $fn = loc_res);
        translate([0, 0, -2])
        rotate([0, 90, 10])
        cylinder(d = 1, h = 40, $fn = loc_res);
    }
}
module caseC(loc_res = 32) {
    difference() {
        union() {
            translate([0, 0, 0])
            cylinder(d = 50, h = 10, $fn = 16);
            /*translate([0, 0, 0])
            cylinder(d = 65-0.5, h = 20+10-1, $fn = 2*loc_res);
            
            // latch outdent
            translate([(65-0.5)/2-0.5, 0, 30-0.5]) {
                latchCoutdent();
            }
            translate([-((65-0.5)/2-0.5), 0, 30-0.5]) {
                latchCoutdent();
            }
            translate([0, (65-0.5)/2-0.5, 30-0.5]) {
                latchCoutdent();
            }
            translate([0, -((65-0.5)/2-0.5), 30-0.5]) {
                latchCoutdent();
            }*/
        }
            /*// latch cut
            translate([0, 0, 29.5])
            rotate([0, 0, 0]) {
                latchCcut(loc_res);
            }
            translate([0, 0, 29.5])
            rotate([0, 0, 90]) {
                latchCcut(loc_res);
            }
            translate([0, 0, 29.5])
            rotate([0, 0, 180]) {
                latchCcut(loc_res);
            }
            translate([0, 0, 29.5])
            rotate([0, 0, 270]) {
                latchCcut(loc_res);
            }*/
            
        // micro USB hole
        #hull() {
            translate([-2, 30, 3])
            rotate([90, 0, 0])
            cylinder(d = 3, h = 15, $fn = loc_res);
            translate([+2, 30, 3])
            rotate([90, 0, 0])
            cylinder(d = 3, h = 15, $fn = loc_res);
        }
        translate([0, 0, 1])
        cylinder(d = 50-3, h = 40, $fn = 2*loc_res);
    }
}

*per23Dummy();
*per58Dummy();
*per60Dummy();





*per35Dummy();
translate([0, 0, 20])
tft1_28ZollDummy();

translate([0, 0, 20-7.5])
caseA();
*translate([0, 0, 20-7.5-3])
caseB();
*translate([0, 0, 0])
caseC();