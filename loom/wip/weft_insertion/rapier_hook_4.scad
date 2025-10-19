$fn = 64;
mm = 1;
cm = 10*mm;

SHAFT_RADIUS = 7*mm;
SHAFT_DIAMETER = 2*SHAFT_RADIUS;
SHAFT_LENGTH = 7*cm;
SHAFT_POINT_LENGTH = SHAFT_RADIUS;
SHAFT_POINT_LAYERS = 1;
RAPIER_LENGTH = SHAFT_LENGTH + 2*SHAFT_POINT_LENGTH;
GRIPPER_FLEXURE_STIFFNESS = 2.5*mm;
GRIPPER_FLEXURE_LENGTH = 5*cm;
GRIPPER_CLOSURE_INSET = 15*mm;
GRIPPER_CLOSURE_LENGTH = 5*mm;

module rapier_body() {
  // cylindrical shaft
  cube
    ( [ SHAFT_DIAMETER
      , SHAFT_DIAMETER
      , SHAFT_LENGTH
      ]
    , center = true
    );
  
  // top point
  translate([0,0,0.5*SHAFT_LENGTH])
  cap_body();

  // bottom point
  translate([0,0,-0.5*SHAFT_LENGTH])
  mirror([0,0,1])
  cap_body();
}

module cap_body() {
  translate([0,0,0.5*SHAFT_POINT_LENGTH])
  rotate([0,0,45])
  cylinder
    ( r1 = SHAFT_RADIUS*sqrt(2)
    , r2 = 0
    , h = SHAFT_POINT_LENGTH
    , center = true
    , $fn = 4
    );
}

module tape_measure_slot() {
    head_vertical = 1.5;
    head_horizontal = 1.5;
    head_height = 5.8;
    tape_width = 5.8;
    
    translate([SHAFT_RADIUS-tape_width/2,0,-SHAFT_LENGTH/2-5-SHAFT_LENGTH/2])
    difference() {
        cube([2*SHAFT_RADIUS,head_height,SHAFT_LENGTH+10], center = true);
        
        translate([0,-head_vertical, -head_horizontal])
        cube([4*SHAFT_RADIUS,head_height,SHAFT_LENGTH+10], center = true);
    }
}

module gripper_flexure_profile() {
  r = SHAFT_RADIUS - GRIPPER_FLEXURE_STIFFNESS;
  d = 2*r;

  translate([0,0,-0.5*GRIPPER_FLEXURE_LENGTH+0.5*RAPIER_LENGTH-GRIPPER_CLOSURE_INSET])
  union() {
    translate([0,0,0.5*r])
    cube
      ( [ 10*cm
        , d
        , GRIPPER_FLEXURE_LENGTH - r
        ]
      , center = true
      );
    
    // translate([0,0,0.5*GRIPPER_FLEXURE_LENGTH - r])
    // rotate([0,90,0])
    // cylinder
    //   ( r = r
    //   , h = 10*cm
    //   , center = true
    //   );
    
    translate([0,0,-0.5*GRIPPER_FLEXURE_LENGTH + r])
    rotate([0,90,0])
    cylinder
      ( r = r
      , h = 10*cm
      , center = true
      );
  }

  s = 2;
  translate([0,0,0.5*RAPIER_LENGTH-GRIPPER_CLOSURE_INSET+s*SHAFT_RADIUS+GRIPPER_CLOSURE_LENGTH])
  scale([1,1,s])
  rotate([45,0,0])
  cube
    ( [ 10*cm
      , sqrt(2)*SHAFT_RADIUS
      , sqrt(2)*SHAFT_RADIUS
      ]
    , center = true
    );
  
  // TODO
  translate([0,0,0.5*RAPIER_LENGTH-GRIPPER_CLOSURE_INSET+0.5*GRIPPER_CLOSURE_LENGTH])
  difference() {
    cube([5*cm,1.4*mm,GRIPPER_CLOSURE_LENGTH+2*cm], center = true);

    r = 3*mm;
    delta_x = 0.2*mm;
    delta_y = 0.75*mm;

    translate([0,r-delta_x,0])
    rotate([0,90,0])
    cylinder(r = r, h = 10*cm, center = true, $fn = 4);

    translate([0,-r+delta_x,delta_y])
    rotate([0,90,0])
    cylinder(r = r, h = 10*cm, center = true, $fn = 4);

    translate([0,r-delta_x,2*delta_y])
    rotate([0,90,0])
    cylinder(r = r, h = 10*cm, center = true, $fn = 4);

    translate([0,r-delta_x,4*delta_y])
    rotate([0,90,0])
    cylinder(r = r, h = 10*cm, center = true, $fn = 4);

    translate([0,-r+delta_x,3*delta_y])
    rotate([0,90,0])
    cylinder(r = r, h = 10*cm, center = true, $fn = 4);

    translate([0,r-delta_x,-2*delta_y])
    rotate([0,90,0])
    cylinder(r = r, h = 10*cm, center = true, $fn = 4);

    translate([0,-r+delta_x,-delta_y])
    rotate([0,90,0])
    cylinder(r = r, h = 10*cm, center = true, $fn = 4);

    translate([0,-r+delta_x,-3*delta_y])
    rotate([0,90,0])
    cylinder(r = r, h = 10*cm, center = true, $fn = 4);
  }
}

difference() {
rapier_body();

gripper_flexure_profile();
}

// tape_measure_slot();