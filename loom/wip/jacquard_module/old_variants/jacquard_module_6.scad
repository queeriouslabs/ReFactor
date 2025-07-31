$fn = 128;

mm = 1;
cm = 10*mm;

REF_SMALL = 1*cm;
REF_MEDIUM = 10*cm;
REF_LARGE = 100*cm;

SELECTOR_DISK_THICKNESS = 4*mm;
SELECTOR_RAISE_HEIGHT = 1*cm;
SELECTOR_HOOK_HEIGHT = 4*mm;
SELECTOR_HOOK_WIDTH = 2*mm;
SELECTOR_CONTROL_HEIGHT = 2*mm;
SELECTOR_CONTROL_SAFETY_MARGIN_HEIGHT = 8*mm;
SELECTOR_CHANNEL_WIDTH = 1*mm;
SELECTOR_HEIGHT = SELECTOR_RAISE_HEIGHT + SELECTOR_HOOK_HEIGHT + SELECTOR_CONTROL_HEIGHT;
SELECTOR_WIDTH = 2*SELECTOR_CHANNEL_WIDTH + SELECTOR_HOOK_WIDTH;
SELECTOR_COUNT = 30;
SELECTOR_SPACING = 2*mm;
SELECTOR_TOTAL_SEGMENT_LENGTH = SELECTOR_SPACING + SELECTOR_WIDTH;
SELECTOR_CIRCUMFERENCE = (2*SELECTOR_COUNT - 2) * SELECTOR_TOTAL_SEGMENT_LENGTH;
SELECTOR_DISK_RADIUS = SELECTOR_CIRCUMFERENCE / (2*PI);
SELECTOR_DISK_SAFETY_RADIUS = SELECTOR_DISK_RADIUS + SELECTOR_CONTROL_SAFETY_MARGIN_HEIGHT;
SELECTOR_DISK_CHANNEL_LOW_RADIUS = SELECTOR_DISK_RADIUS - SELECTOR_CONTROL_HEIGHT - SELECTOR_HOOK_HEIGHT - SELECTOR_RAISE_HEIGHT;
SELECTOR_DISK_CHANNEL_HIGH_RADIUS = SELECTOR_DISK_RADIUS;

SELECTOR_CHANNEL_ANGLE = 360 * SELECTOR_CHANNEL_WIDTH / SELECTOR_CIRCUMFERENCE;
SELECTOR_HOOK_ANGLE = 360 * SELECTOR_HOOK_WIDTH / SELECTOR_CIRCUMFERENCE;
SELECTOR_OFFSET_ANGLE = 360 * SELECTOR_TOTAL_SEGMENT_LENGTH/ SELECTOR_CIRCUMFERENCE;

SHAFT_RADIUS = 5*mm;

GUIDE_DISK_THICKNESS = 3*mm;

LIFT_DISK_SCREW_COUNT = 4;
LIFT_DISK_SCREW_HEAD_DIAMETER_REAL = 6.5*mm;
LIFT_DISK_SCREW_HEAD_DIAMETER = LIFT_DISK_SCREW_HEAD_DIAMETER_REAL + 5*mm;
LIFT_DISK_SCREW_HEAD_HEIGHT = 2.9*mm;
LIFT_DISK_SCREW_SINK = LIFT_DISK_SCREW_HEAD_HEIGHT + 1*mm;
LIFT_DISK_SCREW_SHAFT_DIAMETER = 3.25*mm;
LIFT_DISK_SCREW_SPACING = 5*mm;
LIFT_DISK_ASSEMBLY_SEPARATION = SELECTOR_DISK_THICKNESS/2+0.1*mm;
LIFT_DISK_THICKNESS = 3*mm;
LIFT_DISK_ASSEMBLY_SQUARE_SHAFT_SIDE = 1*cm;
LIFT_DISK_ASSEMBLY_SHAFT_RADIUS = sqrt(2)*LIFT_DISK_ASSEMBLY_SQUARE_SHAFT_SIDE/2 + 2*LIFT_DISK_SCREW_SPACING + LIFT_DISK_SCREW_SHAFT_DIAMETER;
LIFT_DISK_COMPOUND_SHAFT_RADIUS = LIFT_DISK_ASSEMBLY_SHAFT_RADIUS;
LIFT_DISK_COMPOUND_SHAFT_SQUARE_LENGTH = LIFT_DISK_THICKNESS + LIFT_DISK_ASSEMBLY_SEPARATION;
LIFT_DISK_COMPOUND_SHAFT_THICKNESS = GUIDE_DISK_THICKNESS + 2*mm;
LIFT_DISK_COMPOUND_SHAFT_HEIGHT = LIFT_DISK_COMPOUND_SHAFT_THICKNESS + LIFT_DISK_COMPOUND_SHAFT_SQUARE_LENGTH;



//echo(SELECTOR_CHANNEL_WIDTH, SELECTOR_CIRCUMFERENCE, SELECTOR_CHANNEL_ANGLE);

module selector() {

    //
    // The verticals
    //

    small_delta = 1*cm;

    angle = SELECTOR_CHANNEL_ANGLE/2+SELECTOR_HOOK_ANGLE/2;

    rotate([0,0,-angle])
    translate([
        -SELECTOR_CHANNEL_WIDTH/2,
        SELECTOR_DISK_RADIUS-SELECTOR_HEIGHT,
        0])
    cube([
        SELECTOR_CHANNEL_WIDTH,
        SELECTOR_HEIGHT+small_delta,
        REF_SMALL
    ]);

    rotate([0,0,angle])
    translate([
        -SELECTOR_CHANNEL_WIDTH/2,
        SELECTOR_DISK_RADIUS-SELECTOR_HOOK_HEIGHT-SELECTOR_CONTROL_HEIGHT,
        0])
    cube([
        SELECTOR_CHANNEL_WIDTH,
        SELECTOR_HOOK_HEIGHT+SELECTOR_CONTROL_HEIGHT+small_delta,
        REF_SMALL
    ]);

    //
    // A sector slice to fit between the verticals
    //

    difference() {

        cylinder(
            r = SELECTOR_DISK_RADIUS+small_delta,
            h = REF_SMALL
        );

        translate([0,0,-REF_MEDIUM/2])
        cylinder(
            r = SELECTOR_DISK_RADIUS-SELECTOR_CONTROL_HEIGHT-SELECTOR_HOOK_HEIGHT,
            h  = REF_MEDIUM
        );

        rotate([0,0,-angle])
        translate([
            SELECTOR_CHANNEL_WIDTH/2,
            -REF_LARGE/2,
            -REF_MEDIUM/2])
        cube([REF_LARGE, REF_LARGE, REF_MEDIUM]);

        rotate([0,0,angle])
        translate([
            -REF_LARGE-SELECTOR_CHANNEL_WIDTH/2,
            -REF_LARGE/2,
            -REF_MEDIUM/2])
        cube([REF_LARGE, REF_LARGE, REF_MEDIUM]);
    

        // A separator tine
        translate([
            0,
            SELECTOR_DISK_RADIUS-SELECTOR_HOOK_HEIGHT-SELECTOR_CONTROL_HEIGHT,
            0])
        scale([0.8*SELECTOR_HOOK_WIDTH,SELECTOR_HOOK_HEIGHT,1])
        rotate([0,0,45])
        translate([
            -SELECTOR_HOOK_WIDTH/sqrt(2)/4,
            -SELECTOR_HOOK_WIDTH/sqrt(2)/4,
            0
        ])
        cube([
            SELECTOR_HOOK_WIDTH/sqrt(2)/2,
            SELECTOR_HOOK_WIDTH/sqrt(2)/2,
            10
        ]);
    }

}

module selector_disk() {
    difference() {

        cylinder(
            r = SELECTOR_DISK_SAFETY_RADIUS,
            h = SELECTOR_DISK_THICKNESS
        );

        for (i = [0:SELECTOR_COUNT-1]) {
            rotate([0,0,i*SELECTOR_OFFSET_ANGLE])
            translate([0,0,-REF_SMALL/2])
            #selector();
        }

        translate([
            0,
            0,
            -REF_MEDIUM/2
        ])
        cylinder(
            r = LIFT_DISK_ASSEMBLY_SHAFT_RADIUS+0.3*mm,
            h = REF_MEDIUM
        );

    }

    /* DEBUG
    #cylinder(
        r = SELECTOR_DISK_INSET_RADIUS,
        h = REF_SMALL
    );
    //*/
}

module guide_slot() {

    //
    // The verticals
    //

    small_delta = 1*cm;

    translate([
        -SELECTOR_CHANNEL_WIDTH/2,
        SELECTOR_DISK_RADIUS-SELECTOR_HEIGHT,
        0])
    cube([
        SELECTOR_CHANNEL_WIDTH,
        SELECTOR_HEIGHT+small_delta,
        REF_SMALL
    ]);

}

module guide_disk() {
    difference() {

        cylinder(
            r = SELECTOR_DISK_SAFETY_RADIUS,
            h = GUIDE_DISK_THICKNESS
        );

        for (i = [0:SELECTOR_COUNT-1]) {
            rotate([0,0,i*SELECTOR_OFFSET_ANGLE])
            translate([0,0,-REF_SMALL/2])
            #guide_slot();
        }

        translate([
            0,
            0,
            -REF_MEDIUM/2
        ])
        cylinder(
            r = SHAFT_RADIUS,
            h = REF_MEDIUM
        );

    }
}

module round_disk(r, h) {
    cylinder(
        r = r - h/2,
        h = h
    );

    translate([0,0,h/2])
    rotate_extrude()
    translate([r-h/2,0])
    circle(r = h/2);
}

module lift_disk() {
    d = 2*SELECTOR_DISK_CHANNEL_LOW_RADIUS;
    d2 = SELECTOR_DISK_CHANNEL_HIGH_RADIUS+SELECTOR_DISK_CHANNEL_LOW_RADIUS;
    delta = d2 - d;
   
    difference() {
        round_disk(
            r = d/2,
            h = LIFT_DISK_THICKNESS
        );

        translate([0,-REF_LARGE/2,0])
        cube([
            REF_LARGE,
            REF_LARGE,
            REF_MEDIUM
        ]);
    }

    difference() {
        translate([
            0,
            delta/2,
            0
        ])
        round_disk(
            r = d2/2,
            h = LIFT_DISK_THICKNESS
        );
        
        translate([
            -REF_LARGE,
            -REF_LARGE/2,
            -REF_MEDIUM/2
        ])
        cube([
            REF_LARGE,
            REF_LARGE,
            REF_MEDIUM
        ]);
    }
}

module lift_disk_half() {
    difference() {
        union() {
            lift_disk();

            cylinder(
                r = LIFT_DISK_ASSEMBLY_SHAFT_RADIUS,
                h = LIFT_DISK_THICKNESS+LIFT_DISK_ASSEMBLY_SEPARATION
            );
        }

        #cube([
            LIFT_DISK_ASSEMBLY_SQUARE_SHAFT_SIDE,
            LIFT_DISK_ASSEMBLY_SQUARE_SHAFT_SIDE,
            REF_MEDIUM
        ], center = true);

        for (i = [0:LIFT_DISK_SCREW_COUNT]) {
            rotate([0,0,45+360*i/LIFT_DISK_SCREW_COUNT]) {
                translate([
                    sqrt(2)*LIFT_DISK_ASSEMBLY_SQUARE_SHAFT_SIDE/2 + LIFT_DISK_SCREW_SHAFT_DIAMETER/2 + LIFT_DISK_SCREW_SPACING,
                    0,
                    -REF_MEDIUM/2
                ])
                #cylinder(
                    d = LIFT_DISK_SCREW_SHAFT_DIAMETER,
                    h = REF_MEDIUM
                );
            }
        }
    }

}

module lift_disk_compound_shaft_half() {
    difference() {
        union() {
            translate([
                -LIFT_DISK_ASSEMBLY_SQUARE_SHAFT_SIDE/2,
                -LIFT_DISK_ASSEMBLY_SQUARE_SHAFT_SIDE/2,
                0
            ])
            cube([
                LIFT_DISK_ASSEMBLY_SQUARE_SHAFT_SIDE,
                LIFT_DISK_ASSEMBLY_SQUARE_SHAFT_SIDE,
                LIFT_DISK_COMPOUND_SHAFT_HEIGHT 
            ]);

            cylinder(
                r = LIFT_DISK_COMPOUND_SHAFT_RADIUS,
                h = LIFT_DISK_COMPOUND_SHAFT_THICKNESS 
            );
        }

        for (i = [0:LIFT_DISK_SCREW_COUNT]) {
            rotate([0,0,45+360*i/LIFT_DISK_SCREW_COUNT]) {
                translate([
                    sqrt(2)*LIFT_DISK_ASSEMBLY_SQUARE_SHAFT_SIDE/2 + LIFT_DISK_SCREW_SHAFT_DIAMETER/2 + LIFT_DISK_SCREW_SPACING,
                    0,
                    -REF_MEDIUM/2
                ])
                #cylinder(
                    d = LIFT_DISK_SCREW_SHAFT_DIAMETER,
                    h = REF_MEDIUM
                );
            }
        }
    }
}

#selector_disk();

// projection()
// lift_disk();

// mirror([1,0,0])
// lift_disk_half();

// round_disk(r = 10*cm, h = 1*cm);

// guide_disk();

// translate([
//     0, 0, -LIFT_DISK_COMPOUND_SHAFT_THICKNESS
// ])
// lift_disk_compound_shaft_half();