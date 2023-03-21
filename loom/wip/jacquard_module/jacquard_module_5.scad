$fn = 64;

mm = 1;
cm = 10*mm;
in = 25.4*mm;

module rotate_around_xy(deg, x, y) {
    translate([x,y,0])
    rotate([0,0,deg])
    translate([-x,-y, 0]) {
        children();
    }
}

REFERENCE = 100*cm;

ACRYLIC_THICKNESS = 1*in / 8;
THREAD_COUNT = 4;
THREAD_SEPARATION = 4*mm;

CAM_AXLE_SQUARE_SIDE = 5*mm;
CAM_AXLE_DIAMETER = sqrt(2)*CAM_AXLE_SQUARE_SIDE;
CAM_RESET_FRACTION = 1/4;
CAM_DROP_FRACTION = 1 - CAM_RESET_FRACTION;
CAM_DROP_LENGTH = (THREAD_COUNT - 1)*THREAD_SEPARATION;
// circumference = 2*pi*r = cam_drop_length * 1/cam_drop_fraction
// r = (cam_drop_length / cam_drop_fraction) / (2*pi)
//   = cam_drop_length / (2 * pi * cam_drop_fraction)
BASE_CAM_RADIUS = max(1*cm, CAM_DROP_LENGTH / (2 * PI * CAM_DROP_FRACTION));
CAM_THICKNESS = ACRYLIC_THICKNESS;
CAM_LIFT = 1.5*cm;
CAM_LIFT_HEIGHT = CAM_LIFT + BASE_CAM_RADIUS;

TRIP_LEVER_INNER_RADIUS = CAM_LIFT_HEIGHT;
TRIP_LEVER_RADIUS_DELTA = 1*cm;
TRIP_LEVER_OUTER_RADIUS = TRIP_LEVER_INNER_RADIUS + TRIP_LEVER_RADIUS_DELTA;
TRIP_LEVER_THICKNESS = ACRYLIC_THICKNESS;
/*
    y = clh + cl/2
    clh^2 = x^2 + y^2
    clh^2 - y^2 = x^2
    sqrt(clh^2 - y^2) = x 
*/
TRIP_LEVER_PIVOT_Y = -(BASE_CAM_RADIUS + 0.5 * CAM_LIFT);
TRIP_LEVER_PIVOT_X = sqrt((CAM_LIFT_HEIGHT+0.5*TRIP_LEVER_RADIUS_DELTA)^2 - TRIP_LEVER_PIVOT_Y^2);
TRIP_LEVER_PIVOT_ANGLE = atan(TRIP_LEVER_PIVOT_X/-TRIP_LEVER_PIVOT_Y);
TRIP_LEVER_LIFT_ARM_HEIGHT = TRIP_LEVER_RADIUS_DELTA;
TRIP_LEVER_LIFT_ARM_LENGTH = TRIP_LEVER_PIVOT_X;
TRIP_LEVER_AXLE_RADIUS = 2*mm;

FRAME_SIDE_HEIGHT = 7*cm;
FRAME_SIDE_WIDTH = (TRIP_LEVER_PIVOT_X+2*cm+CAM_AXLE_DIAMETER/2);
FRAME_SIDE_THICKNESS = ACRYLIC_THICKNESS;

PAPER_THICKNESS = 0.1*mm;
SEGMENT_SIZE = CAM_THICKNESS + 2*PAPER_THICKNESS;
SEGMENT_SEPARATOR_SIZE = 1*mm;

FRAME_BASE_WIDTH = FRAME_SIDE_WIDTH;
FRAME_BASE_LENGTH = THREAD_COUNT*SEGMENT_SIZE + (THREAD_COUNT-1)*SEGMENT_SEPARATOR_SIZE;
FRAME_BASE_THICKNESS = ACRYLIC_THICKNESS;


module cam_axle_square_hole() {
    cube([CAM_AXLE_SQUARE_SIDE, CAM_AXLE_SQUARE_SIDE, REFERENCE], center = true);
}

module cam_axle_round_hole() {
    translate([0,0,-REFERENCE/2])
    cylinder(d = CAM_AXLE_DIAMETER, h = REFERENCE);
}

module trip_lever_axle_hole() {
    translate([0,0,-REFERENCE/2])
    cylinder(r = TRIP_LEVER_AXLE_RADIUS, h = REFERENCE);
}


module reference_drop_positions() {
    for (i = [0:THREAD_COUNT-1]) {
        rotate([0,0,360*i/(THREAD_COUNT/CAM_DROP_FRACTION)])
        translate([-THREAD_SEPARATION,0,0])
        %cube([THREAD_SEPARATION,REFERENCE,2]);
    }
}

module sector(r,h,deg) {
    if (0 <= deg && deg <= 180) {
        intersection() {
            cylinder(r = r, h = h);

            translate([-2*r, 0, -2*r])
            cube([4*r, 4*r, 4*r]);

            rotate([0,0,deg])
            translate([-2*r, -4*r, -2*r])
            cube([4*r, 4*r, 4*r]);
        }
    } else {
        intersection() {
            cylinder(r = r, h = h);

            union() {
                translate([-2*r, 0, -2*r])
                cube([4*r, 4*r, 4*r]);

                rotate([0,0,deg])
                translate([-2*r, -4*r, -2*r])
                cube([4*r, 4*r, 4*r]);
            }
        }
    }
}

module base_cam_disk() {
    cylinder(r = BASE_CAM_RADIUS, h = CAM_THICKNESS);
}

module cam_lift_segment() {
    intersection() {
        scale([1,CAM_LIFT_HEIGHT/BASE_CAM_RADIUS,1])
        base_cam_disk();

        translate([0,0,-REFERENCE/2])
        cube([REFERENCE, REFERENCE, REFERENCE]);
    }
}

module cam_drop_segment(i) {
    // s = CAM_LIFT_HEIGHT/BASE_CAM_RADIUS;
    theta = 270*i/(THREAD_COUNT-1);
    rotate([0,0,90])
    sector(CAM_LIFT_HEIGHT, CAM_THICKNESS, theta);
    // difference() {
    //     scale([s,s,1])
    //     base_cam_disk();

    //     if (theta <= 180) {
    //         translate([0,-REFERENCE/2,-REFERENCE/2])
    //         cube([REFERENCE, REFERENCE, REFERENCE]);

    //         rotate([0,0,theta])
    //         translate([-REFERENCE,-REFERENCE/2,-REFERENCE/2])
    //         cube([REFERENCE, REFERENCE, REFERENCE]);
    //     } else {
    //         translate([0,0,-REFERENCE/2])
    //         cube([REFERENCE, REFERENCE, REFERENCE]);

    //         rotate([0,0,theta-180])
    //         translate([0,-REFERENCE,-REFERENCE/2])
    //         cube([REFERENCE, REFERENCE, REFERENCE]);
    //     }
    // }
}

module cam(i) {
    difference() {
        union() {
            base_cam_disk();
            cam_lift_segment();
            cam_drop_segment(i);
        }
        cam_axle_square_hole();
    }
}

module trip_lever() {
    difference() {
        union() {
            translate([TRIP_LEVER_PIVOT_X,TRIP_LEVER_PIVOT_Y-0.5*TRIP_LEVER_LIFT_ARM_HEIGHT,0])
            cube([TRIP_LEVER_LIFT_ARM_LENGTH, TRIP_LEVER_LIFT_ARM_HEIGHT, TRIP_LEVER_THICKNESS]);

            translate([TRIP_LEVER_PIVOT_X,TRIP_LEVER_PIVOT_Y,0])
            cylinder(d = TRIP_LEVER_LIFT_ARM_HEIGHT, h = TRIP_LEVER_THICKNESS);
            

            translate([TRIP_LEVER_PIVOT_X,-CAM_LIFT_HEIGHT-0.5*TRIP_LEVER_LIFT_ARM_HEIGHT,0])
            cylinder(d = TRIP_LEVER_LIFT_ARM_HEIGHT, h = TRIP_LEVER_THICKNESS);

            h = CAM_LIFT_HEIGHT+TRIP_LEVER_PIVOT_Y + 0.5*TRIP_LEVER_LIFT_ARM_HEIGHT;
            translate([TRIP_LEVER_PIVOT_X-0.5*TRIP_LEVER_LIFT_ARM_HEIGHT,
                       -h+TRIP_LEVER_PIVOT_Y,
                       0])
            cube([TRIP_LEVER_LIFT_ARM_HEIGHT, h, TRIP_LEVER_THICKNESS]);
            
            difference() {
                translate([0,-TRIP_LEVER_LIFT_ARM_HEIGHT-CAM_LIFT_HEIGHT,0])
                cube([TRIP_LEVER_PIVOT_X, TRIP_LEVER_LIFT_ARM_HEIGHT, TRIP_LEVER_THICKNESS]);
            //     cylinder(r = TRIP_LEVER_OUTER_RADIUS, h = TRIP_LEVER_THICKNESS);

            //     translate([0,0,-REFERENCE/2])
            //     cylinder(r = TRIP_LEVER_INNER_RADIUS, h = REFERENCE);

            //     translate([-REFERENCE,-REFERENCE/2,-REFERENCE/2])
            //     cube([REFERENCE, REFERENCE, REFERENCE]);

            //     rotate([0,0,TRIP_LEVER_PIVOT_ANGLE])
            //     translate([0,-REFERENCE/2,-REFERENCE/2])
            //     cube([REFERENCE, REFERENCE, REFERENCE]);
                
                translate([0,-TRIP_LEVER_INNER_RADIUS,-10])
                rotate([0,0,-135])
                cube([20,20,20]);

            }
        }
        translate([TRIP_LEVER_PIVOT_X, TRIP_LEVER_PIVOT_Y, 0])
        trip_lever_axle_hole();
    }
}

module frame_side() {
    translate([0,FRAME_SIDE_THICKNESS,0])
    rotate([90,0,0])
    translate([1*cm,FRAME_SIDE_HEIGHT-1*cm,0])
    difference() {
        translate([-1*cm,1*cm-FRAME_SIDE_HEIGHT,0])
        cube([FRAME_SIDE_WIDTH, FRAME_SIDE_HEIGHT, FRAME_SIDE_THICKNESS]);
        
        cam_axle_round_hole();

        translate([TRIP_LEVER_PIVOT_X, TRIP_LEVER_PIVOT_Y, 0])
        trip_lever_axle_hole();

        // translate([1.4*cm,0,0])
        // rotate([0,0,-45])
        // translate([-REFERENCE/2,0,-REFERENCE/2])
        // cube([REFERENCE, REFERENCE, REFERENCE]);
    }
}

module frame_base() {
    cube([FRAME_BASE_WIDTH, FRAME_BASE_LENGTH, FRAME_BASE_THICKNESS]);
}

module frame() {
    frame_side();
    
    translate([0,ACRYLIC_THICKNESS,0])
    frame_base();

    translate([0,ACRYLIC_THICKNESS+FRAME_BASE_LENGTH,0])
    frame_side();
}

// rotate_around_xy(-140, 0, 0)
// cam(20);

// projection()
// rotate_around_xy(-15, TRIP_LEVER_PIVOT_X, TRIP_LEVER_PIVOT_Y)
// trip_lever();

// projection()
// frame_side();
frame();