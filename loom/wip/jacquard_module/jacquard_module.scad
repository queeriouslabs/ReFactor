mm = 1;
cm = 10 * mm;

module _ref_line_x(x) {
    translate([x,0, 0])
    #cube([0.1*mm, 100*cm, 1*cm], center = true);
}

module _ref_line_y(y) {
    translate([0,y, 0])
    #cube([100*cm, 0.1*mm, 1*cm], center = true);
}

module rotate_around_xy(x, y, angle) {
    translate([x,y,0])
    rotate([0,0,angle])
    translate([-x,-y,0])
    children();
}

module sweep(n, delta) {
    for (i = [0:n]) {
        rotate([0,0,i*delta]) children();
    }
}

    

$fn = 128;

SPOKE_HOLE_DIAMETER = 5.8*mm;
SPOKE_HOLE_RADIUS = SPOKE_HOLE_DIAMETER/2;
SPOKE_RADIUS = SPOKE_HOLE_RADIUS - 0.2*mm;
SQUARE_SPOKE_HOLE_SIDE = 6.2*mm;
FRAME_HOLE_DIAMETER = 7.8*mm;
FRAME_HOLE_RADIUS = FRAME_HOLE_DIAMETER/2;
THICKNESS = 3*mm;

HEDDLE_RISE = 1.5*cm;
HEDDLE_WIDTH = 12*cm;
HEDDLE_HEIGHT = 1*cm;
HEDDLE_DROP = 1.5*cm;

// top left corner of heddle is distance = radius of the heddle
HEDDLE_CORNER_DISTANCE = HEDDLE_WIDTH/2;
// y rise is 1/2 h + heddle rise
HEDDLE_CORNER_Y_RISE = HEDDLE_HEIGHT/2 + HEDDLE_RISE;
// this gives an opposite and a hypotheneus so the angle of the corner when its up is
HEDDLE_CORNER_ANGLE_WHEN_UP = -asin(HEDDLE_CORNER_Y_RISE/HEDDLE_CORNER_DISTANCE);
// but the rise angle is the angle the corner moves, so we need the angle when its down too
HEDDLE_CORNER_ANGLE_WHEN_DOWN = -asin((HEDDLE_HEIGHT/2) / HEDDLE_CORNER_DISTANCE);
// the heddle lift angle is therefore the difference
HEDDLE_LIFT_ANGLE = HEDDLE_CORNER_ANGLE_WHEN_UP - HEDDLE_CORNER_ANGLE_WHEN_DOWN;

LATCH_TOOTH_DIAMOND_RADIUS = 3*mm;

CONTROL_LATCH_HUB_THICKNESS = 4*mm;
CONTROL_LATCH_SEPARATION_DISTANCE = 1*mm;
CONTROL_LATCH_SPOKE_CENTER_X = -HEDDLE_WIDTH/2 - SPOKE_HOLE_RADIUS - CONTROL_LATCH_HUB_THICKNESS;
CONTROL_LATCH_SPOKE_CENTER_Y = -HEDDLE_HEIGHT/2 - HEDDLE_DROP - SPOKE_HOLE_RADIUS - CONTROL_LATCH_HUB_THICKNESS - CONTROL_LATCH_SEPARATION_DISTANCE;
CONTROL_LATCH_TOOTH_WIDTH = 5*mm;


SELECT_LATCH_HUB_THICKNESS = 2*mm;
SELECT_LATCH_SPOKE_CENTER_X = HEDDLE_WIDTH/2 + SPOKE_HOLE_RADIUS + SELECT_LATCH_HUB_THICKNESS;
SELECT_LATCH_SPOKE_CENTER_Y = 1.6*cm;
//SELECT_LATCH_VERTICAL_SIZE = SPOKE_RADIUS+HUB_THICKNESS-1;
//SELECT_LATCH_VERTICAL_LENGTH = HEDDLE_HEIGHT+SPOKE_RADIUS+HUB_THICKNESS+1;
//SELECT_WHEEL_TOOTH_SIZE = 5*mm;
//SELECT_LATCH_HEAD_SIZE = 12*mm;
SELECT_LATCH_OPEN_ANGLE = 12;

SELECT_WHEEL_RADIUS = 2*cm;
SELECT_WHEEL_SPOKE_CENTER_X = SELECT_LATCH_SPOKE_CENTER_X
                                + SPOKE_HOLE_RADIUS
                                + SELECT_LATCH_HUB_THICKNESS
                                + SELECT_WHEEL_RADIUS;
SELECT_WHEEL_SPOKE_CENTER_Y = 0;

SPOKE_HEIGHT = 1*cm;

//LATCHED_UP = "latched_up";
//LATCHED_DOWN = "latched_down";
//RESETTING = "resetting";
//UNLATCHED_DOWN = "unlatched_down";
//SYSTEM_STATE = LATCHED_DOWN;
//
//HEDDLE_UP = SYSTEM_STATE == LATCHED_UP   ? true :
//            SYSTEM_STATE == LATCHED_DOWN ? false :
//            SYSTEM_STATE == RESETTING    ? true :
//            SYSTEM_STATE == UNLATCHED_DOWN ? false :
//            false;
//HEDDLE_RISE_ANGLE = -14;
//HEDDLE_ANGLE = SYSTEM_STATE == LATCHED_UP   ? HEDDLE_RISE_ANGLE :
//               SYSTEM_STATE == LATCHED_DOWN ? 0 :
//               SYSTEM_STATE == RESETTING    ? HEDDLE_RISE_ANGLE :
//               SYSTEM_STATE == UNLATCHED_DOWN ? 0 :
//               0;
//
//CONTROL_LATCH_CLOSED_ANGLE = 0;
//CONTROL_LATCH_OPEN_ANGLE = 20;
//CONTROL_LATCH_RESET_ANGLE = 75;
//CONTROL_LATCH_ANGLE = SYSTEM_STATE == LATCHED_UP   ? CONTROL_LATCH_CLOSED_ANGLE :
//                      SYSTEM_STATE == LATCHED_DOWN ? CONTROL_LATCH_CLOSED_ANGLE :
//                      SYSTEM_STATE == RESETTING    ? CONTROL_LATCH_RESET_ANGLE :
//                      SYSTEM_STATE == UNLATCHED_DOWN ? CONTROL_LATCH_OPEN_ANGLE :
//                      CONTROL_LATCH_CLOSED_ANGLE;
//
//SELECT_LATCH_CLOSED_ANGLE = 0;
//SELECT_LATCH_OPEN_ANGLE = -10;
//SELECT_LATCH_ANGLE = SELECT_LATCH_CLOSED_ANGLE;
//
//SELECT_WHEEL_ANGLE = 0;


module spoke() {
    cylinder(h = 100*cm, r = SPOKE_RADIUS, center = true);
}

module spoke_hole() {
    cylinder(h = 100*cm, r = SPOKE_HOLE_RADIUS, center = true);
}

module square_spoke_hole() {
    cube([SQUARE_SPOKE_HOLE_SIDE, SQUARE_SPOKE_HOLE_SIDE, 100*cm],
         center = true);
}

module square_spoke_round_hole() {
    r = sqrt(SQUARE_SPOKE_HOLE_SIDE*SQUARE_SPOKE_HOLE_SIDE / 2);
    cylinder(r = r, h=100*cm, center=true);
}

module heddle() {
    diamond_side = sqrt(2*LATCH_TOOTH_DIAMOND_RADIUS*LATCH_TOOTH_DIAMOND_RADIUS);
    
    difference() {
        // main body
        intersection() {
            translate([0,-HEDDLE_DROP/2,0])
            cube([
                HEDDLE_WIDTH,
                HEDDLE_HEIGHT + HEDDLE_DROP,
                THICKNESS
            ], center = true);
            
            cylinder(h = THICKNESS, r = HEDDLE_WIDTH/2, center = true);
        }
        
        // control latch detents
//        translate([-HEDDLE_WIDTH/2,0,0])
//        rotate([0,0,45])
//        #cube([diamond_side, diamond_side, 100], center = true);
        
        rotate([0,0,-HEDDLE_LIFT_ANGLE/2 - 2.9])
        translate([-HEDDLE_WIDTH/2 - 6*mm,0,0])
        rotate([0,0,45])
        cube([2*cm, 2*cm, 100], center = true);
        
        rotate([0,0,-HEDDLE_LIFT_ANGLE])
        translate([-HEDDLE_WIDTH/2,0,0])
        rotate([0,0,45])
        cube([diamond_side, diamond_side, 100], center = true);
    
        // select latch dedents
        translate([HEDDLE_WIDTH/2,0,0])
        rotate([0,0,45])
        cube([diamond_side, diamond_side, 100*cm], center = true);
        
//        rotate([0,0,HEDDLE_LIFT_ANGLE])
//        translate([HEDDLE_WIDTH/2,0,0])
//        rotate([0,0,45])
//        #cube([diamond_side, diamond_side, 100*cm], center = true);
        
        translate([50*cm + 1*cm,-50*cm-LATCH_TOOTH_DIAMOND_RADIUS,0])
        cube(100*cm, center = true);
    
        // spoke hole
        spoke_hole();
    }
}

module control_latch() {
    latch_height = LATCH_TOOTH_DIAMOND_RADIUS - CONTROL_LATCH_SPOKE_CENTER_Y;
    diamond_side = sqrt(2*LATCH_TOOTH_DIAMOND_RADIUS*LATCH_TOOTH_DIAMOND_RADIUS);
    hub_or = SPOKE_HOLE_RADIUS + CONTROL_LATCH_HUB_THICKNESS;
    
    difference() {
        union() {
            translate([CONTROL_LATCH_SPOKE_CENTER_X,
                       CONTROL_LATCH_SPOKE_CENTER_Y + latch_height/2,
                       0])
            cube([
                2*(SPOKE_HOLE_RADIUS + CONTROL_LATCH_HUB_THICKNESS),
                latch_height,
                THICKNESS
            ], center = true);       
            
            translate([CONTROL_LATCH_SPOKE_CENTER_X + hub_or,0,0])
            rotate([0,0,45])
            cube([diamond_side, diamond_side, THICKNESS], center = true);
            
            translate([CONTROL_LATCH_SPOKE_CENTER_X, CONTROL_LATCH_SPOKE_CENTER_Y, 0])
            cylinder(h = THICKNESS, r = SPOKE_HOLE_RADIUS + CONTROL_LATCH_HUB_THICKNESS, center = true);
        }
        
        translate([CONTROL_LATCH_SPOKE_CENTER_X, CONTROL_LATCH_SPOKE_CENTER_Y, 0])
        square_spoke_hole();
    }
}





module select_latch() {
    latch_height = SELECT_LATCH_SPOKE_CENTER_Y - LATCH_TOOTH_DIAMOND_RADIUS;
    diamond_side = sqrt(2*LATCH_TOOTH_DIAMOND_RADIUS*LATCH_TOOTH_DIAMOND_RADIUS);
    hub_or = SPOKE_HOLE_RADIUS + SELECT_LATCH_HUB_THICKNESS;
    
    rotate([0,0,HEDDLE_LIFT_ANGLE])
    rotate_around_xy(SELECT_LATCH_SPOKE_CENTER_X,
                     SELECT_LATCH_SPOKE_CENTER_Y,
                     SELECT_LATCH_OPEN_ANGLE)
    difference() {
        union() {
            translate([SELECT_LATCH_SPOKE_CENTER_X, SELECT_LATCH_SPOKE_CENTER_Y, 0])
            cylinder(h = THICKNESS, r = SPOKE_HOLE_RADIUS + SELECT_LATCH_HUB_THICKNESS, center = true);
            
            translate([SELECT_LATCH_SPOKE_CENTER_X, +latch_height/2, 0])
            cube([
                2*(SPOKE_HOLE_RADIUS + SELECT_LATCH_HUB_THICKNESS),
                SELECT_LATCH_SPOKE_CENTER_Y + LATCH_TOOTH_DIAMOND_RADIUS,
                THICKNESS
            ], center = true);
            
            translate([SELECT_LATCH_SPOKE_CENTER_X - hub_or,0,0])
            rotate([0,0,45])
            cube([diamond_side, diamond_side, THICKNESS], center = true);
            
            translate([SELECT_LATCH_SPOKE_CENTER_X + hub_or,0,0])
            rotate([0,0,45])
            cube([diamond_side, diamond_side, THICKNESS], center = true);
        }
        
        translate([SELECT_LATCH_SPOKE_CENTER_X, SELECT_LATCH_SPOKE_CENTER_Y, 0])
        spoke_hole();
    }
   
}

module select_wheel() {
    diamond_side = sqrt(2*LATCH_TOOTH_DIAMOND_RADIUS*LATCH_TOOTH_DIAMOND_RADIUS);
    hub_or = SPOKE_HOLE_RADIUS + SELECT_LATCH_HUB_THICKNESS;

    rotate([0,0,HEDDLE_LIFT_ANGLE])
    rotate_around_xy(SELECT_LATCH_SPOKE_CENTER_X,
                     SELECT_LATCH_SPOKE_CENTER_Y,
                     SELECT_LATCH_OPEN_ANGLE)
    difference() {
        translate([SELECT_WHEEL_SPOKE_CENTER_X, SELECT_WHEEL_SPOKE_CENTER_Y, 0])
        cylinder(h = THICKNESS, r = SELECT_WHEEL_RADIUS, center = true);
    
        translate([SELECT_LATCH_SPOKE_CENTER_X + hub_or,0,0])
        rotate([0,0,45])
        cube([diamond_side, diamond_side, 100*cm], center = true);
    
        translate([SELECT_WHEEL_SPOKE_CENTER_X,
                   SELECT_WHEEL_SPOKE_CENTER_Y,
                   0])
        square_spoke_hole();
    }
   
}

module base() {
    
    translate([1.3*cm,-1.2*cm,-THICKNESS/2])
    cube([17*cm,
          4*cm,
          THICKNESS],
         center = true);
    
    translate([0,0,SPOKE_HEIGHT/2])
    cylinder(r = SPOKE_RADIUS, h = SPOKE_HEIGHT, center = true);
    
    translate([CONTROL_LATCH_SPOKE_CENTER_X,CONTROL_LATCH_SPOKE_CENTER_Y,SPOKE_HEIGHT/2])
    cylinder(r = SPOKE_RADIUS, h = SPOKE_HEIGHT, center = true);
    
    rotate([0,0,HEDDLE_LIFT_ANGLE])
    translate([SELECT_LATCH_SPOKE_CENTER_X,SELECT_LATCH_SPOKE_CENTER_Y,SPOKE_HEIGHT/2])
    cylinder(r = SPOKE_RADIUS, h = SPOKE_HEIGHT, center = true);
    
    rotate([0,0,HEDDLE_LIFT_ANGLE])
    translate([SELECT_LATCH_SPOKE_CENTER_X,SELECT_LATCH_SPOKE_CENTER_Y,0])
    rotate([0,0,SELECT_LATCH_OPEN_ANGLE])
    translate([-SELECT_LATCH_SPOKE_CENTER_X,-SELECT_LATCH_SPOKE_CENTER_Y,0])
    translate([SELECT_WHEEL_SPOKE_CENTER_X,SELECT_WHEEL_SPOKE_CENTER_Y,SPOKE_HEIGHT/2])
    cylinder(r = SPOKE_RADIUS, h = SPOKE_HEIGHT, center = true);

    translate([-25, -HEDDLE_HEIGHT/2 - HEDDLE_DROP - 2*mm, THICKNESS/2])
    cylinder(r=2*mm, h = 2*THICKNESS, center = true);

    rotate([0,0,HEDDLE_LIFT_ANGLE])
    translate([+25, -HEDDLE_HEIGHT/2 - HEDDLE_DROP - 2*mm, THICKNESS/2])
    cylinder(r=2*mm, h = 2*THICKNESS, center = true);
}

module frame() {
    translate([20*mm,-15*mm, 0])
    cube([250*mm, 50*mm, THICKNESS], center=true);
    
    #spoke_hole();
    
    rotate([0,0,HEDDLE_LIFT_ANGLE])
    rotate_around_xy(SELECT_LATCH_SPOKE_CENTER_X,
                     SELECT_LATCH_SPOKE_CENTER_Y,
                     SELECT_LATCH_OPEN_ANGLE)
    translate([SELECT_LATCH_SPOKE_CENTER_X,SELECT_LATCH_SPOKE_CENTER_Y,0])
    #spoke_hole();
    
    rotate([0,0,HEDDLE_LIFT_ANGLE])
    rotate_around_xy(SELECT_LATCH_SPOKE_CENTER_X,
                     SELECT_LATCH_SPOKE_CENTER_Y,
                     SELECT_LATCH_OPEN_ANGLE)
    translate([SELECT_WHEEL_SPOKE_CENTER_X,SELECT_WHEEL_SPOKE_CENTER_Y,0])
    #square_spoke_round_hole();
    
    translate([CONTROL_LATCH_SPOKE_CENTER_X,CONTROL_LATCH_SPOKE_CENTER_Y,0])
    #square_spoke_round_hole();
}



//_ref_line_y(HEDDLE_HEIGHT/2 + HEDDLE_RISE);
//_ref_line_y(HEDDLE_HEIGHT/2);
//
//rotate([0,0,HEDDLE_LIFT_ANGLE])
//_ref_line_y(HEDDLE_HEIGHT/2);
//rotate([0,0,HEDDLE_LIFT_ANGLE])
//_ref_line_y(-HEDDLE_HEIGHT/2);
//
//rotate([0,0,-HEDDLE_LIFT_ANGLE])
//_ref_line_y(HEDDLE_HEIGHT/2);
//rotate([0,0,-HEDDLE_LIFT_ANGLE])
//_ref_line_y(-HEDDLE_HEIGHT/2);
//
//_ref_line_x(HEDDLE_WIDTH/2);


//rotate([0,0,HEDDLE_LIFT_ANGLE])
//projection(cut = false)
heddle();

//projection(cut = false)
control_latch();

//projection(cut = false)
select_latch();

//projection(cut = false)
select_wheel();

//base();

translate([0,0,-THICKNESS])
frame();