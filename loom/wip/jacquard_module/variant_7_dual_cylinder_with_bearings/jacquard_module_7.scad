$fn = 64;

mm = 1;
cm = 10*mm;

PROCESS_DELTA = 0.5*mm;
WASHER_DIAMETER = 6*mm;
WASHER_THICKNESS = 3*mm;
WASHER_RADIUS = WASHER_DIAMETER/2;
WASHER_ENGAGED_FRACTION = 1/3;
WASHER_UNENGAGED_FRACTION = 1-WASHER_ENGAGED_FRACTION;
MAX_HEDDLE_COUNT = 20;
HEDDLE_COUNT = min(MAX_HEDDLE_COUNT,5);
HEDDLE_ROD_THICKNESS = WASHER_THICKNESS;
HEDDLE_ROD_WIDTH = WASHER_ENGAGED_FRACTION*WASHER_RADIUS + 5*mm;
HEDDLE_ROD_RISE = 2*cm;
HEDDLE_ROD_RESET_MARGIN = 3*cm;
HEDDLE_ROD_MINI_DETENT_SIZE = WASHER_ENGAGED_FRACTION*WASHER_DIAMETER+PROCESS_DELTA;
HEDDLE_ROD_DETENT_SIZE = HEDDLE_ROD_MINI_DETENT_SIZE + HEDDLE_ROD_RISE;
HEDDLE_ROD_SEGMENT_SEPARATION = 1*cm;
HEDDLE_ROD_BOTTOM_MARGIN = 3*cm;
CONTROL_CYLINDER_BALL_DETENT_SIZE = 0.4 + 3*mm; //WASHER_DIAMETER;
CONTROL_CYLINDER_BALL_DETENT_ANGLE = 360/20; //360/(HEDDLE_COUNT+1);
// we use max(MAX_HEDDLE_COUNT, 1+HEDDLE_COUNT) for the following reason:
// ultimately, we want to use 21 effective heddles -- 20 for real heddles and
// 1 for the reset groove, so 21 grooves
// but when using <20 heddles,  the radius of the cylinder gets quite small
// so we force it to be no less than the radius for MAX_HEDDLE_COUNT
// this should probably be changed tho to just always use the MAX_HEDDLE_COUNT
// size, which would entail reprinting anything made with the old circumference
CONTROL_CYLINDER_CIRCUMFERENCE = max(MAX_HEDDLE_COUNT, 1+HEDDLE_COUNT)*CONTROL_CYLINDER_BALL_DETENT_SIZE;
CONTROL_CYLINDER_RADIUS = CONTROL_CYLINDER_CIRCUMFERENCE / (2*PI);
CONTROL_CYLINDER_DIAMETER = 2*CONTROL_CYLINDER_RADIUS;
CONTROL_CYLINDER_AXLE_RADIUS = CONTROL_CYLINDER_RADIUS - 5*mm;
GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT = abs(
        -HEDDLE_ROD_RISE
        - HEDDLE_ROD_SEGMENT_SEPARATION
        - HEDDLE_ROD_MINI_DETENT_SIZE
    ) - CONTROL_CYLINDER_DIAMETER;
HEDDLE_ROD_TOP_MARGIN = CONTROL_CYLINDER_RADIUS
                      - HEDDLE_ROD_MINI_DETENT_SIZE/2
                      + GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT;
HEDDLE_ROD_LENGTH = HEDDLE_ROD_BOTTOM_MARGIN +
                    HEDDLE_ROD_SEGMENT_SEPARATION +
                    HEDDLE_ROD_TOP_MARGIN +
                    2*HEDDLE_ROD_DETENT_SIZE;
HEDDLE_ROD_2_LENGTH = 15*cm;
HEDDLE_ROD_2_RESET_BAR_WIDTH = 15*mm;
HEDDLE_ROD_2_RESET_BAR_ENGAGE_ANGLE = -45;
HEDDLE_ROD_CAP_WIDTH = 2*HEDDLE_ROD_WIDTH;
HEDDLE_ROD_CAP_HEIGHT = 5*mm;
HEDDLE_ROD_THREAD_SLOT_WIDTH = 0.5*mm;
HEDDLE_ROD_THREAD_SLOT_LENGTH = 1*cm;
HEDDLE_ROD_THREAD_HOLE_DIAMETER = 2*mm;
HEDDLE_ROD_THREAD_HOLE_RADIUS = 0.5*HEDDLE_ROD_THREAD_HOLE_DIAMETER;
HEDDLE_ROD_THREAD_SLOT_BOTTOM_MARGIN = 2*cm;
INDEXING_DETENT_COUNT = 20; //HEDDLE_COUNT + 1;
INDEXING_DETENT_ANGLE = 360/20; //CONTROL_CYLINDER_BALL_DETENT_ANGLE;
INDEXING_SPRING_DIAMETER = 4*mm;
INDEXING_SPRING_RADIUS = 0.5*INDEXING_SPRING_DIAMETER;
INDEXING_SPRING_HOLE_SIZE = INDEXING_SPRING_DIAMETER + 1*mm;
INDEXING_SPRING_THREADED_INSERT_DIAMETER = 4.5*mm;
INDEXING_SPRING_PLUG_WIDTH = INDEXING_SPRING_HOLE_SIZE-0.75*mm;
INDEXING_SPRING_PLUG_LENGTH = 1.5*INDEXING_SPRING_DIAMETER;
INDEXING_SPRING_PLUG_POINT_LENGTH  = 0.5*INDEXING_SPRING_DIAMETER;
INDEXING_SPRING_LENGTH = 1*cm;
INDEXING_SPRING_HOLE_LENGTH = 2*INDEXING_SPRING_PLUG_LENGTH + INDEXING_SPRING_PLUG_POINT_LENGTH + INDEXING_SPRING_LENGTH;
GUIDE_FRAME_SIDEWALL_THICKNESS = 1*mm;
GUIDE_FRAME_HOLE_THICKNESS = HEDDLE_ROD_THICKNESS + 2*PROCESS_DELTA;
GUIDE_FRAME_HOLE_WIDTH = HEDDLE_ROD_WIDTH + 0.5*PROCESS_DELTA;
GUIDE_FRAME_THICKNESS = GUIDE_FRAME_HOLE_THICKNESS + 2*GUIDE_FRAME_SIDEWALL_THICKNESS;
GUIDE_FRAME_INDEXING_LAYER_THICKNESS = 1*cm;
GUIDE_FRAME_SINGLE_SEPARATION = GUIDE_FRAME_HOLE_THICKNESS + GUIDE_FRAME_SIDEWALL_THICKNESS;
GUIDE_FRAME_HEIGHT = CONTROL_CYLINDER_DIAMETER;
GUIDE_FRAME_WIDTH = CONTROL_CYLINDER_RADIUS + INDEXING_SPRING_HOLE_LENGTH + 5*mm;
CONTROL_CYLINDER_CENTER_OFFSET = 0;
GUIDE_FRAME_CONTROL_WIDTH = 5*mm;
CONTROL_CYLINDER_LENGTH = GUIDE_FRAME_THICKNESS - GUIDE_FRAME_SIDEWALL_THICKNESS;
GUIDE_FRAME_TOTAL_HEIGHT = GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
                         + GUIDE_FRAME_HEIGHT
                         + GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
                         + GUIDE_FRAME_HEIGHT
                         + GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT;
GUIDE_FRAME_CONTROL_CYLINDER_BEARING_SPACING = 0.5*mm;
GUIDE_FRAME_FACE_SCREW_THREADED_INSERT_DIAMETER = 6*mm;
GUIDE_FRAME_FACE_SCREW_THREADED_INSERT_RADIUS = 0.5*GUIDE_FRAME_FACE_SCREW_THREADED_INSERT_DIAMETER;
GUIDE_FRAME_FACE_SCREW_DIAMETER = 4*mm;
GUIDE_FRAME_FACE_SCREW_RADIUS = 0.5*GUIDE_FRAME_FACE_SCREW_DIAMETER;
GUIDE_FRAME_COVER_GAP = 1*mm;
END_PLATE_THICKNESS = 4*mm;
END_PLATE_HEIGHT = 4*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT + 3*CONTROL_CYLINDER_DIAMETER; //GUIDE_FRAME_TOTAL_HEIGHT;
ROD_SNAP_GAP = 1*mm;
CONTROL_CYLINDER_AXLE_LENGTH = END_PLATE_THICKNESS;
// we add half the guide frame sidewall thickness because the control cylinder
// proper doesn't stick out all the way, since the guide frame sidewalls
// overlap by half their thickness
// we add a compensation for the bearing because without it, the bearing will
// tend to apply an ourward force to the control cylinder, so we add some length
// and that lets us shim the bearing as needed
CONTROL_CYLINDER_SIDEWALL_BEARING_COMPENSATION = 0.5*mm;
CONTROL_CYLINDER_SIDEWALL_THICKNESS = 0.5*GUIDE_FRAME_SIDEWALL_THICKNESS + CONTROL_CYLINDER_SIDEWALL_BEARING_COMPENSATION;
END_PLATE_MOUNTING_HOLE_TMB_Y = GUIDE_FRAME_WIDTH - 5*mm;
END_PLATE_MOUNTING_HOLE_T_Z =
  CONTROL_CYLINDER_RADIUS + 0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT;
END_PLATE_MOUNTING_HOLE_M_Z =
  - CONTROL_CYLINDER_RADIUS - 0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT;
END_PLATE_MOUNTING_HOLE_B_Z =
  - 3*CONTROL_CYLINDER_RADIUS - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT - 0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT;
END_PLATE_MOUNTING_SCREW_DIAMETER = 4*mm;
END_PLATE_MOUNTING_SCREW_RADIUS = 0.5*END_PLATE_MOUNTING_SCREW_DIAMETER;
END_PLATE_MOUNTING_SCREW_HOLE_RADIUS = END_PLATE_MOUNTING_SCREW_RADIUS + PROCESS_DELTA;
END_PLATE_MOUNTING_SCREW_HOLE_THREADED_INSERT_RADIUS = END_PLATE_MOUNTING_SCREW_RADIUS + 0.5*mm;
END_PLATE_MOUNTING_NUT_HEIGHT = 7*mm;
END_PLATE_MOUNTING_NUT_WIDTH = 8*mm;
END_PLATE_MOUNTING_NUT_THICKNESS = 3*mm;
END_PLATE_MOUNTING_THREADED_INSERT_RADIUS = 2.5*mm;
SCREW_CLEARANCE = 4*mm;
INDEXING_GEAR_THICKNESS = GUIDE_FRAME_INDEXING_LAYER_THICKNESS - GUIDE_FRAME_SIDEWALL_THICKNESS; //2*END_PLATE_THICKNESS;
SELECTOR_RATCHET_GEAR_THICKNESS = 6*mm;
SELECTOR_RATCHET_GEAR_RADIUS = CONTROL_CYLINDER_RADIUS + 0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT + 5*mm;
SELECTOR_RATCHET_GEAR_DIAMETER = 2*SELECTOR_RATCHET_GEAR_RADIUS;
SELECTOR_RATCHET_TOOTH_DEPTH = 3*mm;
SELECTOR_RATCHET_TOOTH_ANGLE = 37;
RELEASE_PAWL_GEAR_THICKNESS = 7*mm;
RELEASE_PAWL_GEAR_DIAMETER = CONTROL_CYLINDER_DIAMETER;
RELEASE_PAWL_GEAR_RADIUS = 0.5*RELEASE_PAWL_GEAR_DIAMETER;
RELEASE_PAWL_THICKNESS = 1*mm;
RELEASE_PAWL_TOOTH_HEIGHT = 11*mm;
MOTOR_WIDTH = 12*mm;
MOTOR_DEPTH = 22.5*mm;
MOTOR_ADAPTOR_PLATE_SCREW_RADIUS = 2*mm;
MOTOR_ADAPTOR_PLATE_SCREW_OFFSET_RADIUS = 10*mm;
MOTOR_ADAPTOR_PLATE_SCREW_NUT_SLOT_WIDTH = 6*mm;
MOTOR_ADAPTOR_PLATE_SCREW_NUT_SLOT_THICKNESS = 3*mm;
RELEASE_CYLINDER_MOUNTING_BUFFER = 5*mm;
RELEASE_CYLINDER_MOUNTING_PLATE_THICKNESS = 6*mm;



module ball() {
    sphere(d = WASHER_DIAMETER);
}

module washer() {
  rotate([0,90,0])
  cylinder(d = WASHER_DIAMETER, h = WASHER_THICKNESS, center = true);
}

module bevelled_washer() {
  rotate([0,90,0])
  cylinder(d1 = WASHER_DIAMETER, d2 = WASHER_DIAMETER-0.5*WASHER_THICKNESS, h = 0.5*WASHER_THICKNESS, center = true);

  translate([-0.5*WASHER_THICKNESS,0,0])
  rotate([0,90,0])
  cylinder(d2 = WASHER_DIAMETER, d1 = WASHER_DIAMETER-0.5*WASHER_THICKNESS, h = 0.5*WASHER_THICKNESS, center = true);

}

module heddle_detents() {
    translate([0,0,HEDDLE_ROD_MINI_DETENT_SIZE/2]) {
        detent_side_length = sqrt(0.5*HEDDLE_ROD_MINI_DETENT_SIZE^2);

        //
        // hold dedent
        //
        rotate([45,0,0])
        cube([
            100,
            detent_side_length,
            detent_side_length
        ], center = true);


        //
        // lower drop detent
        //
        translate([0,0,HEDDLE_ROD_MINI_DETENT_SIZE])
        rotate([45,0,0])
        cube([
            100,
            detent_side_length,
            detent_side_length
        ], center = true);

        translate([
            -50,
            -100 + HEDDLE_ROD_MINI_DETENT_SIZE/2,
            HEDDLE_ROD_MINI_DETENT_SIZE
        ])
        cube([
            100,100,HEDDLE_ROD_RISE-HEDDLE_ROD_MINI_DETENT_SIZE
        ]);

        translate([0,0,HEDDLE_ROD_RISE])
        rotate([45,0,0])
        cube([
            100,
            detent_side_length,
            detent_side_length
        ], center = true);
    }
}

module heddle_detents_2() {
  detent_side_length = sqrt(2*HEDDLE_ROD_MINI_DETENT_SIZE^2);
  engagement_angle_compensation = 0.8*mm;
  detent_start =
    HEDDLE_ROD_2_LENGTH
    - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    - CONTROL_CYLINDER_RADIUS
    + engagement_angle_compensation
    ;
  
  detent_end =
    detent_start
    - CONTROL_CYLINDER_DIAMETER
    - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    - HEDDLE_ROD_RISE
    - HEDDLE_ROD_RESET_MARGIN;

  difference() {
    union() {
      // upper cylinder top stop position
      translate([0,0,detent_start])
      rotate([45,0,0])
      cube([
          100,
          detent_side_length,
          detent_side_length
      ], center = true);

      // main long detent
      translate([
          0,
          -50 + HEDDLE_ROD_MINI_DETENT_SIZE,
          detent_start - 0.5*(detent_start - detent_end)
      ])
      cube([
          100,
          100,
          detent_start - detent_end
      ], center = true);

      // bottom limit position
      translate([0,0,detent_end])
      rotate([45,0,0])
      cube([
          100,
          detent_side_length,
          detent_side_length
      ], center = true);
    }

    // lower cylinder top stop tooth
    translate([
      0,
      HEDDLE_ROD_MINI_DETENT_SIZE,
      detent_start
      - CONTROL_CYLINDER_DIAMETER
      - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
      + HEDDLE_ROD_MINI_DETENT_SIZE
    ])
    rotate([45,0,0])
    cube([
        100,
        detent_side_length,
        detent_side_length
    ], center = true);

    // upper cylinder hold tooth
    translate([
      0,
      HEDDLE_ROD_MINI_DETENT_SIZE,
      detent_start
      - HEDDLE_ROD_RISE
      + 0.5*HEDDLE_ROD_MINI_DETENT_SIZE
      - engagement_angle_compensation
    ])
    rotate([45,0,0])
    cube([
        100,
        detent_side_length,
        detent_side_length
    ], center = true);

    // lower cylinder hold tooth
    translate([
      0,
      HEDDLE_ROD_MINI_DETENT_SIZE,
      detent_start
      - CONTROL_CYLINDER_DIAMETER
      - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
      - HEDDLE_ROD_RISE
      + 0.5*HEDDLE_ROD_MINI_DETENT_SIZE
      - engagement_angle_compensation
    ])
    rotate([45,0,0])
    cube([
        100,
        detent_side_length,
        detent_side_length
    ], center = true);
  }
}

module heddle_thread_slot() {
  translate([
    0,
    0.5*HEDDLE_ROD_WIDTH,
    HEDDLE_ROD_THREAD_SLOT_BOTTOM_MARGIN
    + HEDDLE_ROD_THREAD_SLOT_LENGTH
  ])
  // rotate([0,90,0])
  // cylinder(r = HEDDLE_ROD_THREAD_HOLE_RADIUS, h = 100, center = true);
  scale([1,HEDDLE_ROD_THREAD_HOLE_DIAMETER/sqrt(2),HEDDLE_ROD_THREAD_HOLE_DIAMETER/sqrt(2)])
  rotate([45,0,0])
  cube([100,1,1], center = true);

  translate([
    0,
    0.5*HEDDLE_ROD_WIDTH,
    HEDDLE_ROD_THREAD_SLOT_BOTTOM_MARGIN
    + 0.5*HEDDLE_ROD_THREAD_SLOT_LENGTH
  ])
  cube([100,HEDDLE_ROD_THREAD_SLOT_WIDTH,HEDDLE_ROD_THREAD_SLOT_LENGTH], center = true);


  translate([
    0,
    0.5*HEDDLE_ROD_WIDTH,
    0
  ])
  scale([1,HEDDLE_ROD_THREAD_HOLE_DIAMETER/sqrt(2),HEDDLE_ROD_THREAD_HOLE_DIAMETER/sqrt(2)])
  rotate([45,0,0])
  cube([100,1,1], center = true);

  translate([
    0,
    0.5*HEDDLE_ROD_WIDTH,
    0.5*HEDDLE_ROD_THREAD_SLOT_LENGTH
  ])
  cube([100,HEDDLE_ROD_THREAD_SLOT_WIDTH,HEDDLE_ROD_THREAD_SLOT_LENGTH], center = true);
}

module heddle_rod() {
    difference() {
        //
        // main body
        //
        cube([
            HEDDLE_ROD_THICKNESS,
            HEDDLE_ROD_WIDTH,
            HEDDLE_ROD_LENGTH
        ]);

        translate([0, 0, HEDDLE_ROD_BOTTOM_MARGIN])
        heddle_detents();

        translate([0, 0, HEDDLE_ROD_BOTTOM_MARGIN + HEDDLE_ROD_DETENT_SIZE + HEDDLE_ROD_SEGMENT_SEPARATION])
        heddle_detents();      
    }

    //
    // top cap
    //
    translate([
        0,
        HEDDLE_ROD_WIDTH/2 - HEDDLE_ROD_CAP_WIDTH/2,
        HEDDLE_ROD_LENGTH
    ])
    cube([
        HEDDLE_ROD_THICKNESS,
        HEDDLE_ROD_CAP_WIDTH,
        HEDDLE_ROD_CAP_HEIGHT
    ]);
}

module heddle_rod_2() {
    difference() {
        //
        // main body
        //
        cube([
            HEDDLE_ROD_THICKNESS,
            HEDDLE_ROD_WIDTH,
            HEDDLE_ROD_2_LENGTH
        ]);

        heddle_detents_2();    

        heddle_thread_slot();
    }

    //
    // top cap
    //
    translate([
        0,
        0,
        HEDDLE_ROD_2_LENGTH
    ])
    cube([
        HEDDLE_ROD_THICKNESS,
        HEDDLE_ROD_CAP_WIDTH,
        HEDDLE_ROD_CAP_HEIGHT
    ]);

    //
    // reset bar
    //
    difference() {
      translate([
          0,
          -HEDDLE_ROD_2_RESET_BAR_WIDTH,
          HEDDLE_ROD_2_LENGTH + 0*mm
      ])
      cube([
          HEDDLE_ROD_THICKNESS,
          HEDDLE_ROD_2_RESET_BAR_WIDTH + HEDDLE_ROD_WIDTH,
          HEDDLE_ROD_CAP_HEIGHT
      ]);
    
      translate([0,-CONTROL_CYLINDER_RADIUS-WASHER_UNENGAGED_FRACTION*WASHER_DIAMETER+2,HEDDLE_ROD_2_LENGTH])
      rotate([HEDDLE_ROD_2_RESET_BAR_ENGAGE_ANGLE,0,0])
      translate([0,0,-5*cm])
      cube([10*cm, 10*cm, 10*cm], center = true);
    }
}

module guide_frame_control_cylinder_holes() {
  //
  // release cylinder
  //
  translate([0,CONTROL_CYLINDER_CENTER_OFFSET,0])
  rotate([0,90,0])
  cylinder(r = CONTROL_CYLINDER_RADIUS+PROCESS_DELTA, h = 100*cm, center = true);

  //
  // selector cylinder
  //
  translate([
      0,
      CONTROL_CYLINDER_CENTER_OFFSET,
      - CONTROL_CYLINDER_DIAMETER
      - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
  ])
  rotate([0,90,0])
  cylinder(r = CONTROL_CYLINDER_RADIUS+PROCESS_DELTA, h = 100*cm, center = true);

  //
  // reset cylinder
  //
  translate([
      0,
      CONTROL_CYLINDER_CENTER_OFFSET,
      + CONTROL_CYLINDER_DIAMETER
      + GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
  ])
  rotate([0,90,0])
  cylinder(r = CONTROL_CYLINDER_RADIUS+PROCESS_DELTA, h = 100*cm, center = true);
}

module guide_frame_bearing_ball_and_heddle_rod_holes() {
    l = 100*cm;
    heddle_rod_center =
      CONTROL_CYLINDER_CENTER_OFFSET
      + CONTROL_CYLINDER_RADIUS
      + 0.5*HEDDLE_ROD_WIDTH
      + (2/3)*WASHER_DIAMETER
      ;
    
    // HEDDLE_ROD_WIDTH/2 - GUIDE_FRAME_WIDTH/2 + CONTROL_CYLINDER_RADIUS + WASHER_RADIUS;

    //
    // top bearing hole
    //
    translate([0,-0.5*l+heddle_rod_center,0])
    cube([
        GUIDE_FRAME_HOLE_THICKNESS,
        l,
        WASHER_DIAMETER+PROCESS_DELTA],
    center = true);

    //
    // bottom bearing hole
    //
    translate([
        0,
        -0.5*l+heddle_rod_center,
        -CONTROL_CYLINDER_DIAMETER
        - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    ])
    cube([
        GUIDE_FRAME_HOLE_THICKNESS,
        l,
        WASHER_DIAMETER+PROCESS_DELTA],
    center = true);

    //
    // heddle rod hole
    //
    translate([
      0,
      heddle_rod_center,
      0
    ])
    cube([
        GUIDE_FRAME_HOLE_THICKNESS,
        GUIDE_FRAME_HOLE_WIDTH,
        100*cm
    ], center = true);
}

module guide_frame_holes() {
  guide_frame_bearing_ball_and_heddle_rod_holes();
  guide_frame_control_cylinder_holes();
}

module guide_frame_full_single_body() {
  translate([0,0.5*GUIDE_FRAME_WIDTH,0]) {
    //
    // top margin
    //
    translate([0,0,GUIDE_FRAME_HEIGHT/2+GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT/2])
    cube([
        GUIDE_FRAME_THICKNESS,
        GUIDE_FRAME_WIDTH,
        GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    ], center = true);

    //
    // top cylinder part
    //
    cube([
        GUIDE_FRAME_THICKNESS,
        GUIDE_FRAME_WIDTH,
        GUIDE_FRAME_HEIGHT
    ], center = true);

    //
    // middle separator
    //
    translate([
        0,
        0,
        GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT/2
        + GUIDE_FRAME_HEIGHT/2
        - HEDDLE_ROD_RISE
        - HEDDLE_ROD_SEGMENT_SEPARATION
        - HEDDLE_ROD_MINI_DETENT_SIZE
    ])
    cube([
        GUIDE_FRAME_THICKNESS,
        GUIDE_FRAME_WIDTH,
        GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    ], center = true);

    //
    // bottom cylinder part
    //
    translate([
        0,
        0,
        -HEDDLE_ROD_RISE
        - HEDDLE_ROD_SEGMENT_SEPARATION
        - HEDDLE_ROD_MINI_DETENT_SIZE
    ])
    cube([
        GUIDE_FRAME_THICKNESS,
        GUIDE_FRAME_WIDTH,
        GUIDE_FRAME_HEIGHT
    ], center = true);

    //
    // bottom margin
    //
    translate([
        0,
        0,
        -GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT/2
        - 1.5*GUIDE_FRAME_HEIGHT
        - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    ])
    cube([
        GUIDE_FRAME_THICKNESS,
        GUIDE_FRAME_WIDTH,
        GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    ], center = true);
  }
}

module guide_frame_full_single() {
    difference() {
        guide_frame_full_single_body();

        guide_frame_holes();
    }
}

module guide_frame_full_single_no_heddles() {
    difference() {
        guide_frame_full_single_body();

        guide_frame_control_cylinder_holes();
    }
}

module guide_frame_cover_full_single() {
    difference() {
        guide_frame_full_single_body();

        guide_frame_control_cylinder_holes();
    }
}

module guide_frame_end_plate_screw_holes() {
  margin = 10*mm;
  
  translate([
    0,
    END_PLATE_MOUNTING_HOLE_TMB_Y - margin,
    0
  ]) {
    translate([
      0,
      0,
      END_PLATE_MOUNTING_HOLE_T_Z
    ]) {
      rotate([0,90,0])
      cylinder(r = END_PLATE_MOUNTING_SCREW_HOLE_RADIUS, h = 100*cm, center = true);

      translate([0, 5*cm, 0])
      cube([100*cm, 10*cm, 2*END_PLATE_MOUNTING_SCREW_HOLE_RADIUS], center = true);
    }

    translate([
      0,
      0,
      END_PLATE_MOUNTING_HOLE_M_Z
    ]) {
      rotate([0,90,0])
      cylinder(r = END_PLATE_MOUNTING_SCREW_HOLE_RADIUS, h = 100*cm, center = true);

      translate([0, 5*cm, 0])
      cube([100*cm, 10*cm, 2*END_PLATE_MOUNTING_SCREW_HOLE_RADIUS], center = true);
    }

    translate([
      0,
      0,
      END_PLATE_MOUNTING_HOLE_B_Z
    ]) {
      rotate([0,90,0])
      cylinder(r = END_PLATE_MOUNTING_SCREW_HOLE_RADIUS, h = 100*cm, center = true);

      translate([0, 5*cm, 0])
      cube([100*cm, 10*cm, 2*END_PLATE_MOUNTING_SCREW_HOLE_RADIUS], center = true);
    }
  }
}

module motor_cuff() {
  cuff_size = 4*mm;
  plate_size = 4*cm;
  delta = 0.1*mm;
  difference() {
    cube([plate_size, plate_size, cuff_size], center = true);

    cube([MOTOR_WIDTH+2*delta, MOTOR_DEPTH+2*delta, 10*cm], center = true);
  }
}

module motor_adaptor_plate_profile() {
  cylinder(d = 3*cm, h = 10*cm, center = true);
}

module motor_shaft_adaptor(is_servo = false) {
  mating_gear_diameter = 5*mm;
  mating_gear_radius = 0.5*mating_gear_diameter;
  main_thickness = 2*mm;
  shaft_radius = 4*mm;
  mating_gear_thickness = 4*mm;
  shaft_thickness = is_servo ? mating_gear_thickness : 25*mm;
  difference() {
    // adaptor body
    union() {
      intersection() {
        motor_adaptor_plate_profile();
        cube([10*cm, 10*cm, main_thickness], center = true);
      }

      translate([0,0,0.5*shaft_thickness+0.5*main_thickness])
      cylinder(r = shaft_radius, h = shaft_thickness, center = true);
    }

    if (is_servo) {
      // center screw hole
      cylinder(r = 1*mm, h = 1*cm, center = true);

      // center screw head indent
      translate([0,0,-5*mm+0.5*main_thickness+shaft_thickness-mating_gear_thickness-1*mm])
      cylinder(r = mating_gear_radius, h = 1*cm, center = true);
    } else {
      // shaft hole
      translate([0,0,1*cm+25*mm+0.5*main_thickness-8*mm])
      difference() {
        cylinder(d = 5*mm+PROCESS_DELTA, h = 2*cm, center = true);
        
        translate([0,1*cm+1.5*mm+0.5*PROCESS_DELTA,-2*cm+6*mm])
        cube([2*cm,2*cm,2*cm], center = true);

        translate([0,-1*cm-1.5*mm-0.5*PROCESS_DELTA,-2*cm+6*mm])
        cube([2*cm,2*cm,2*cm], center = true);
      }
    }

    // arm screw holes
    translate([MOTOR_ADAPTOR_PLATE_SCREW_OFFSET_RADIUS,0,0])
    cylinder(r = MOTOR_ADAPTOR_PLATE_SCREW_RADIUS, h = 1*cm, center = true);

    translate([-MOTOR_ADAPTOR_PLATE_SCREW_OFFSET_RADIUS,0,0])
    cylinder(r = MOTOR_ADAPTOR_PLATE_SCREW_RADIUS, h = 1*cm, center = true);

    translate([0,MOTOR_ADAPTOR_PLATE_SCREW_OFFSET_RADIUS,0])
    cylinder(r = MOTOR_ADAPTOR_PLATE_SCREW_RADIUS, h = 1*cm, center = true);

    translate([0,-MOTOR_ADAPTOR_PLATE_SCREW_OFFSET_RADIUS,0])
    cylinder(r = MOTOR_ADAPTOR_PLATE_SCREW_RADIUS, h = 1*cm, center = true);

    if (is_servo) {
      // mating gear
      translate([0,0,5*mm+0.5*main_thickness+shaft_thickness-mating_gear_thickness])
      difference() {
        cylinder(r = mating_gear_radius, h = 1*cm, center = true);

        count = 21;
        for (i = [0:count-1]) {
          rotate([0,0,i*360/count])
          translate([mating_gear_radius+0.5*sqrt(2)*cm-0.3*mm,0,0])
          rotate([0,0,45])
          cube([1*cm, 1*cm, 20*cm], center = true);
        }
      }
    }
  }
}

module stepper_brace() {
  d_body = 28*mm;
  d_shaft_riser = 10*mm;
  cross_bar_actual_width = 42*mm;
  cross_bar_actual_height = 7*mm;
  center_shaft_riser = 0.5*d_shaft_riser + 0.5*cross_bar_actual_height;
  screw_hole_radius = 2*mm;
  h = 5*mm;
  difference() {
    union() {
      // circular body match
      cylinder
        ( d = d_body
        , h = h
        , center = true
        );
      
      // screw mount cross bar minimum
      cube
        ( [ cross_bar_actual_width + 3*mm
          , cross_bar_actual_height +4*mm
          , h
          ]
        , center = true
        );
      
      // rotation stop
      translate([0,0,1*cm-0.5*h])
      cube
        ( [ 12*mm
          , 20*mm
          , 2*cm
          ]
        , center = true
        );
    }

    // shaft riser hole
    translate([0,center_shaft_riser,0])
    cylinder
      ( d = d_shaft_riser
      , h = 10*cm
      , center = true
      );
    
    // screw holes
    translate([0.5*cross_bar_actual_width - screw_hole_radius - 1*mm,0,0])
    #cylinder
      ( r = screw_hole_radius
      , h = 10*cm
      , center = true
      );
    
    translate([-0.5*cross_bar_actual_width + screw_hole_radius + 1*mm,0,0])
    #cylinder
      ( r = screw_hole_radius
      , h = 10*cm
      , center = true
      );
  }
}

module guide_frame_end_plate(indexing_end) {
  control_cylinder_center = 0; //-0.5*GUIDE_FRAME_WIDTH;

  difference() {
    collar_width = 2*cm;
    pawl_area_width = 1*cm;
    end_plate_width = GUIDE_FRAME_WIDTH+collar_width+pawl_area_width;
    translate([
      0,
      0.5*GUIDE_FRAME_WIDTH-0.5*collar_width-0.5*pawl_area_width,
      0.5*END_PLATE_HEIGHT - 3*CONTROL_CYLINDER_RADIUS - 2*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    ])
    cube([END_PLATE_THICKNESS,end_plate_width,END_PLATE_HEIGHT], center=true);


    // control cylinder holes
    s = 10*cm;
    dc_delta = 0.5*PROCESS_DELTA;
    dw_delta = 0;

    translate([0,control_cylinder_center,0]) {
      if(indexing_end) {
        double_cone_reference(delta = dc_delta);
        
        translate([0,0.5*s,0])
        double_wedge_reference(s = s, delta = dw_delta);
      } else {
        rotate([0,90,0])
        cylinder(r = CONTROL_CYLINDER_RADIUS + dc_delta, h = 10*cm, center = true);

        translate([0,0.5*s,0])
        cube([s, s, CONTROL_CYLINDER_DIAMETER + 2*dw_delta], center = true);
      }
    }

    translate([ 0
              , control_cylinder_center
              , -CONTROL_CYLINDER_RADIUS - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT - CONTROL_CYLINDER_RADIUS
              ])
    {
      if (indexing_end) {
        double_cone_reference(delta = dc_delta);

        translate([0,0.5*s,0])
        double_wedge_reference(s = s, delta = dw_delta);
      } else {
        rotate([0,90,0])
        cylinder(r = CONTROL_CYLINDER_RADIUS + dc_delta, h = 10*cm, center = true);

        translate([0,0.5*s,0])
        cube([s, s, CONTROL_CYLINDER_DIAMETER + 2*dw_delta], center = true);
      }
    }

    translate([ 0
              , control_cylinder_center
              , CONTROL_CYLINDER_RADIUS + GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT + CONTROL_CYLINDER_RADIUS
              ])
    {
      if (indexing_end) {
        double_cone_reference(delta = dc_delta);

        translate([0,0.5*s,0])
        double_wedge_reference(s = s, delta = dw_delta);
      } else {
        rotate([0,90,0])
        cylinder(r = CONTROL_CYLINDER_RADIUS + dc_delta, h = 10*cm, center = true);

        translate([0,0.5*s,0])
        cube([s, s, CONTROL_CYLINDER_DIAMETER + 2*dw_delta], center = true);
      }
    }


    // screw holes

    guide_frame_end_plate_screw_holes();

  }

  if (indexing_end) {
    // pawl shield
    shield_thickness = 1*mm;
    shield_width = SCREW_CLEARANCE + SELECTOR_RATCHET_GEAR_THICKNESS + 5*mm; //RELEASE_PAWL_GEAR_THICKNESS;
    shield_height = 7*mm;
    shear = 2*mm;
    shield_gap = 0.5*mm;

    // translate([
    //     0,
    //     SELECTOR_RATCHET_GEAR_RADIUS+0.5*shield_thickness+shield_gap,
    //     0.5*shield_height - 2*mm
    //   ])
    difference() {
      translate([
        0.5*END_PLATE_THICKNESS+0.5*shield_width-0.5*mm,
        control_cylinder_center - 2*mm,
        -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT + 1*cm
      ])
      rotate([-50,0,0])
      cube([shield_width, 3.5*cm, 2*cm], center = true);

      // inner profile
      
      // difference() {
      //   translate([
      //     0.5*END_PLATE_THICKNESS+0.5*shield_width,
      //     control_cylinder_center,
      //     -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT - 6*mm
      //   ])
      //   cube([2*cm, 2*cm, 2*cm], center = true);

      //   translate([
      //     0.5*END_PLATE_THICKNESS+0.5*shield_width,
      //     control_cylinder_center - 15.5*mm,
      //     -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT + 1*cm - 6*mm
      //   ])
      //   rotate([45,0,0])
      //   cube([2*cm, 2*cm, 2*cm], center = true);

      //   translate([
      //     0.5*END_PLATE_THICKNESS+0.5*shield_width,
      //     control_cylinder_center + 13*mm,
      //     -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT + 1*cm - 4*mm
      //   ])
      //   rotate([-40,0,0])
      //   cube([2*cm, 2*cm, 2*cm], center = true);
      // }

      // translate([
      //   0.5*END_PLATE_THICKNESS+0.5*shield_width,
      //   control_cylinder_center - 7*mm,
      //   -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT - 11*mm
      // ])
      // rotate([20,0,0])
      // cube([2*cm, 2*cm, 2*cm], center = true);

      // translate([
      //   0.5*END_PLATE_THICKNESS+0.5*shield_width,
      //   control_cylinder_center + 7*mm,
      //   -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT - 11*mm
      // ])
      // rotate([-20,0,0])
      // cube([2*cm, 2*cm, 2*cm], center = true);

      // release pawl clearance disk
      // YES using SELECTOR_RATCHET_GEAR_THICKNESS is correct here!
      // we need to cut away the vertical columns only, not the top guard profile
      clearance_spacing = 1*mm;
      translate([
        0,
        control_cylinder_center,
        0
      ])
      rotate([0,90,0])
      cylinder(r = RELEASE_PAWL_GEAR_RADIUS + 1*mm, h = 100*cm, center = true);

      // selector ratchet insertion clearance block
      translate([
        0.5*END_PLATE_THICKNESS + SCREW_CLEARANCE + SELECTOR_RATCHET_GEAR_THICKNESS + clearance_spacing,
        50*cm + control_cylinder_center,
        -SELECTOR_RATCHET_GEAR_RADIUS
      ])
      cube([100*cm, 100*cm, 100*cm], center =  true);

      // selector ratchet clearance disk
      translate([
        0,
        control_cylinder_center,
        -CONTROL_CYLINDER_DIAMETER - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
      ])
      rotate([0,90,0])
      cylinder(r = SELECTOR_RATCHET_GEAR_RADIUS + 0.5*mm, h = 100*cm, center = true);

      translate([0,control_cylinder_center,0])
      rotate([-50,0,0])
      translate([
        0,
        0,
        5*cm - CONTROL_CYLINDER_RADIUS - 1*mm
      ])
      cube([10*cm, 10*cm, 10*cm], center = true);

      translate([
        0,
        control_cylinder_center,
        0
      ])
      rotate([-4,0,0])
      cube([10*cm,1*cm,10*cm], center = true);
    }
  } else {
    w = 35*mm;
    r = 2*mm;
    clearance = 47*mm;
    ch = 52*mm;
    brace_size = ch - clearance - 2*mm;

    difference() {
      r2 = 0.5*w + 7*mm;

      union() {
        difference() {
          
          translate([-0.5*ch-0.5*END_PLATE_THICKNESS,-10*mm,0])
          cube([
            ch,
            0.5*w + 22.5*mm,
            MOTOR_WIDTH + 20*mm
          ], center = true);

          translate([5*cm - ch - 0.5*END_PLATE_THICKNESS + brace_size,0,0])
          rotate([0,90,0])
          cylinder(r = r2, h = 10*cm, center = true);

        }

        intersection() {
          translate([-0.5*ch-0.5*END_PLATE_THICKNESS,-10*mm,0])
          cube([
            ch,
            0.5*w + 22.5*mm,
            MOTOR_WIDTH + 20*mm
          ], center = true);
        
          translate([-ch+brace_size-0.5*END_PLATE_THICKNESS,0,0])
          rotate([0,90,0])
          rotate_extrude()
          translate([r2, 0, 0])
          circle(r = 2*mm, $fn = 16);
        }

        intersection() {
          translate([-0.5*ch-0.5*END_PLATE_THICKNESS,-10*mm,0])
          cube([
            ch,
            0.5*w + 22.5*mm,
            MOTOR_WIDTH + 20*mm
          ], center = true);
        
          translate([-0.5*END_PLATE_THICKNESS,0,0])
          rotate([0,90,0])
          rotate_extrude()
          translate([r2, 0, 0])
          circle(r = 2*mm, $fn = 16);
        }
      }

      translate([-ch+brace_size-0.5*END_PLATE_THICKNESS+2*mm,0,0])
      rotate([0,90,0])
      rotate_extrude()
      translate([r2-2*mm, 0, 0])
      circle(r = 2*mm);

      translate([-0.5*END_PLATE_THICKNESS-2*mm,0,0])
      rotate([0,90,0])
      rotate_extrude()
      translate([r2-2*mm, 0, 0])
      circle(r = 2*mm);
      
      cube([100*cm, w, MOTOR_WIDTH], center = true);

      cube([100*cm, w+2*r, MOTOR_WIDTH-2*r], center = true);

      translate([0,-0.5*w,0.5*MOTOR_WIDTH-r])
      rotate([0,90,0])
      cylinder(r = r, h = 100*cm, center = true);

      translate([0,-0.5*w,-0.5*MOTOR_WIDTH+r])
      rotate([0,90,0])
      cylinder(r = r, h = 100*cm, center = true);
    }
  }
}

module guide_frame_indexing_layer_no_screw_mounts() {
  translate([0,0.5*GUIDE_FRAME_WIDTH,0]) {
    //
    // top margin
    //
    translate([0,0,GUIDE_FRAME_HEIGHT/2+GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT/2])
    cube([
        GUIDE_FRAME_INDEXING_LAYER_THICKNESS,
        GUIDE_FRAME_WIDTH,
        GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    ], center = true);

    //
    // top cylinder part
    //
    cube([
        GUIDE_FRAME_INDEXING_LAYER_THICKNESS,
        GUIDE_FRAME_WIDTH,
        GUIDE_FRAME_HEIGHT
    ], center = true);

    //
    // middle separator
    //
    translate([
        0,
        0,
        GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT/2
        + GUIDE_FRAME_HEIGHT/2
        - HEDDLE_ROD_RISE
        - HEDDLE_ROD_SEGMENT_SEPARATION
        - HEDDLE_ROD_MINI_DETENT_SIZE
    ])
    cube([
        GUIDE_FRAME_INDEXING_LAYER_THICKNESS,
        GUIDE_FRAME_WIDTH,
        GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    ], center = true);

    //
    // bottom cylinder part
    //
    translate([
        0,
        0,
        -HEDDLE_ROD_RISE
        - HEDDLE_ROD_SEGMENT_SEPARATION
        - HEDDLE_ROD_MINI_DETENT_SIZE
    ])
    cube([
        GUIDE_FRAME_INDEXING_LAYER_THICKNESS,
        GUIDE_FRAME_WIDTH,
        GUIDE_FRAME_HEIGHT
    ], center = true);

    //
    // bottom margin
    //
    translate([
        0,
        0,
        -GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT/2
        - 1.5*GUIDE_FRAME_HEIGHT
        - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    ])
    cube([
        GUIDE_FRAME_INDEXING_LAYER_THICKNESS,
        GUIDE_FRAME_WIDTH,
        GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    ], center = true);
  }
}

module guide_frame_reset_cylinder_brace_body() {
  translate([0,0.5*GUIDE_FRAME_WIDTH,0]) {
    //
    // top margin
    //
    translate([
      0,
      0,
      0.5*GUIDE_FRAME_HEIGHT + 1.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT + CONTROL_CYLINDER_DIAMETER
    ])
    cube([
        GUIDE_FRAME_THICKNESS,
        GUIDE_FRAME_WIDTH,
        GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    ], center = true);

    //
    // top cylinder part
    //
    translate([
      0,
      0,
      GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT + CONTROL_CYLINDER_DIAMETER
    ])
    cube([
        GUIDE_FRAME_THICKNESS,
        GUIDE_FRAME_WIDTH,
        GUIDE_FRAME_HEIGHT
    ], center = true);
  }
}

module guide_frame_indexing_layer_holes() {
    guide_frame_control_cylinder_holes();

    // spring holes
    l = 100*cm;

    translate([
      0,
      0,
      - GUIDE_FRAME_HEIGHT
      - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    ]) {
      rotate([90,0,0])
      cylinder(d = INDEXING_SPRING_THREADED_INSERT_DIAMETER-1*mm, h = 100*cm, center = true);
      
      translate([
        0,
        -0.5*l
        + CONTROL_CYLINDER_RADIUS
        + INDEXING_SPRING_HOLE_LENGTH,
        0
      ])
      cube([INDEXING_SPRING_HOLE_SIZE,l,INDEXING_SPRING_HOLE_SIZE], center = true);
    }
}

module guide_frame_indexing_layer() {
  difference() {
    guide_frame_indexing_layer_no_screw_mounts();

    guide_frame_indexing_layer_holes();
  }
}

module guide_frame_cover_indexing_layer() {
  difference() {
    guide_frame_indexing_layer_no_screw_mounts();

    guide_frame_control_cylinder_holes();
  }
}

module guide_frame_reset_cylinder_brace() {
  difference() {
    guide_frame_reset_cylinder_brace_body();

    guide_frame_control_cylinder_holes();
  }
}

module guide_frame_control_cylinder_sidewall_compensation() {
  difference() {
    translate([
      0,
      0,
      -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    ])
    cube([
      CONTROL_CYLINDER_SIDEWALL_THICKNESS,
      GUIDE_FRAME_WIDTH,
      GUIDE_FRAME_TOTAL_HEIGHT
    ], center = true);

    guide_frame_control_cylinder_holes();
  }
}

module guide_frame_control_cylinder_bearing_holes() {
  //
  // top control cylinder bearing
  //
  translate([0,CONTROL_CYLINDER_CENTER_OFFSET,0])
  rotate([0,90,0])
  cylinder(r = CONTROL_CYLINDER_AXLE_RADIUS+PROCESS_DELTA, h = 100*cm, center = true);

  //
  // bottom control cylinder bearing
  //
  translate([
      0,
      CONTROL_CYLINDER_CENTER_OFFSET,
      - CONTROL_CYLINDER_DIAMETER
      - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
  ])
  rotate([0,90,0])
  cylinder(r = CONTROL_CYLINDER_AXLE_RADIUS+PROCESS_DELTA, h = 100*cm, center = true);
}

module guide_frame_control_cylinder_bearing_body() {
  difference() {
    translate([
      0,
      0,
      -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    ])
    cube([
      CONTROL_CYLINDER_AXLE_LENGTH-2*GUIDE_FRAME_CONTROL_CYLINDER_BEARING_SPACING,
      GUIDE_FRAME_WIDTH,
      GUIDE_FRAME_TOTAL_HEIGHT
    ], center = true);

    guide_frame_control_cylinder_bearing_holes();
  }
}

module guide_frame_control_cylinder_bearing(indexing_end) {
  // if (indexing_end) {
    guide_frame_control_cylinder_bearing_body();
  // }

  difference() {
    translate([
      (indexing_end ? -1 : 1)*(0.5*CONTROL_CYLINDER_AXLE_LENGTH-0.5*GUIDE_FRAME_CONTROL_CYLINDER_BEARING_SPACING),
      0,
      -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    ])
    cube([
      GUIDE_FRAME_CONTROL_CYLINDER_BEARING_SPACING,
      GUIDE_FRAME_WIDTH,
      GUIDE_FRAME_TOTAL_HEIGHT
    ], center = true);

    guide_frame_control_cylinder_holes();
  }
}

module pawl_guard() {
  collar_width = 2*cm;
  end_plate_width = 1*cm;
  // translate([
  //   0,
  //   -end_plate_width-18.65*mm,
  //   -0.5*END_PLATE_HEIGHT + CONTROL_CYLINDER_RADIUS + GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
  // ])
  // cube([END_PLATE_THICKNESS,end_plate_width,END_PLATE_HEIGHT], center=true);

  // pawl shield
  shield_thickness = 1*mm;
  shield_width = SCREW_CLEARANCE + SELECTOR_RATCHET_GEAR_THICKNESS + 5*mm; //RELEASE_PAWL_GEAR_THICKNESS;
  shield_height = 7*mm;
  shear = 2*mm;
  shield_gap = 0.5*mm;

  // translate([
  //     0,
  //     SELECTOR_RATCHET_GEAR_RADIUS+0.5*shield_thickness+shield_gap,
  //     0.5*shield_height - 2*mm
  //   ])
  difference() {
    translate([
      0.5*END_PLATE_THICKNESS+0.5*shield_width-0.5*mm,
      CONTROL_CYLINDER_CENTER_OFFSET - 2*mm,
      -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT - 2*mm
    ])
    translate([0,0,5*mm])
    cube([shield_width, 4*cm, 1*cm], center = true);

    // inner profile
    
    difference() {
      translate([
        0.5*END_PLATE_THICKNESS+0.5*shield_width,
        CONTROL_CYLINDER_CENTER_OFFSET,
        -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT - 6*mm
      ])
      cube([2*cm, 2*cm, 2*cm], center = true);

      translate([
        0.5*END_PLATE_THICKNESS+0.5*shield_width,
        CONTROL_CYLINDER_CENTER_OFFSET - 15.5*mm,
        -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT + 1*cm - 6*mm
      ])
      rotate([45,0,0])
      cube([2*cm, 2*cm, 2*cm], center = true);

      translate([
        0.5*END_PLATE_THICKNESS+0.5*shield_width,
        CONTROL_CYLINDER_CENTER_OFFSET + 13*mm,
        -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT + 1*cm - 4*mm
      ])
      rotate([-40,0,0])
      cube([2*cm, 2*cm, 2*cm], center = true);
    }

    translate([
      0.5*END_PLATE_THICKNESS+0.5*shield_width,
      CONTROL_CYLINDER_CENTER_OFFSET - 7*mm,
      -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT - 11*mm
    ])
    rotate([20,0,0])
    cube([2*cm, 2*cm, 2*cm], center = true);

    translate([
      0.5*END_PLATE_THICKNESS+0.5*shield_width,
      CONTROL_CYLINDER_CENTER_OFFSET + 7*mm,
      -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT - 11*mm
    ])
    rotate([-20,0,0])
    cube([2*cm, 2*cm, 2*cm], center = true);
    
    // middle divider trim block
    translate([
      0,
      0,
      -50*cm - CONTROL_CYLINDER_DIAMETER - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT + RELEASE_PAWL_GEAR_RADIUS + 0.5*mm
    ])
    cube([100*cm, 100*cm, 100*cm], center = true);

    // release pawl clearance disk
    // YES using SELECTOR_RATCHET_GEAR_THICKNESS is correct here!
    // we need to cut away the vertical columns only, not the top guard profile
    translate([
      -50*cm + 0.5*END_PLATE_THICKNESS + SCREW_CLEARANCE + SELECTOR_RATCHET_GEAR_THICKNESS + 1*mm,
      CONTROL_CYLINDER_CENTER_OFFSET,
      -CONTROL_CYLINDER_DIAMETER - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    ])
    difference() {
      rotate([0,90,0])
      cylinder(r = RELEASE_PAWL_GEAR_RADIUS + 7*mm, h = 100*cm, center = true);

      translate([0, 5*cm, 0])
      cube([200*cm, 10*cm, 10*cm], center = true);
    }

    // selector ratchet insertion clearance block
    translate([
      -50*cm + 0.5*END_PLATE_THICKNESS + SCREW_CLEARANCE + SELECTOR_RATCHET_GEAR_THICKNESS + 1*mm,
      50*cm + CONTROL_CYLINDER_CENTER_OFFSET,
      -SELECTOR_RATCHET_GEAR_RADIUS - 0*mm
    ])
    cube([100*cm, 100*cm, 100*cm], center =  true);

    // selector ratchet clearance disk
    translate([
      -50*cm + 0.5*END_PLATE_THICKNESS + SCREW_CLEARANCE + SELECTOR_RATCHET_GEAR_THICKNESS + 1*mm,
      CONTROL_CYLINDER_CENTER_OFFSET,
      0
    ])
    rotate([0,90,0])
    cylinder(r = SELECTOR_RATCHET_GEAR_RADIUS + 1*mm, h = 100*cm, center = true);
  }
}

module indexing_spring_plug(point) {
  // rotate([90,0,0])
  // cylinder(d = INDEXING_SPRING_DIAMETER, h = INDEXING_SPRING_DIAMETER, center = true);
  cube([INDEXING_SPRING_PLUG_WIDTH, INDEXING_SPRING_PLUG_LENGTH, INDEXING_SPRING_PLUG_WIDTH], center = true);
  
  if (point) {
    translate([0,-0.5*INDEXING_SPRING_PLUG_LENGTH,0])
    scale([INDEXING_SPRING_PLUG_WIDTH,2*INDEXING_SPRING_PLUG_POINT_LENGTH,INDEXING_SPRING_PLUG_WIDTH])
    rotate([0,0,45])
    cube([1/sqrt(2),1/sqrt(2),1], center = true);
  }
}

module guide_frame_face_screw_holes(r) {
  l = CONTROL_CYLINDER_RADIUS - 2*mm;
  screw_hole_center_offset = 5.5*mm;
  guide_frame_total_thickness =
  // main heddle_portion
  HEDDLE_COUNT*GUIDE_FRAME_THICKNESS - HEDDLE_COUNT*GUIDE_FRAME_SIDEWALL_THICKNESS
  // indexing gear
  + INDEXING_GEAR_THICKNESS
  // cylinder sidewalls
  + 2*CONTROL_CYLINDER_SIDEWALL_THICKNESS
  // axle
  + CONTROL_CYLINDER_AXLE_LENGTH
  ;
  

  // top holes
  translate([
    -0.5*GUIDE_FRAME_THICKNESS
    + 0.5*GUIDE_FRAME_SIDEWALL_THICKNESS
    - CONTROL_CYLINDER_SIDEWALL_THICKNESS
    - GUIDE_FRAME_CONTROL_CYLINDER_BEARING_SPACING
    + screw_hole_center_offset
    ,
    -0.5*GUIDE_FRAME_WIDTH-1*cm+l,
    CONTROL_CYLINDER_RADIUS + GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT - screw_hole_center_offset
  ])
  rotate([90,0,0])
  cylinder(r = r, h = 2*cm, center = true);

  translate([
    -0.5*GUIDE_FRAME_THICKNESS
    + 0.5*GUIDE_FRAME_SIDEWALL_THICKNESS
    - CONTROL_CYLINDER_SIDEWALL_THICKNESS
    - GUIDE_FRAME_CONTROL_CYLINDER_BEARING_SPACING
    + 0.5*guide_frame_total_thickness,
    -0.5*GUIDE_FRAME_WIDTH-1*cm+l,
    CONTROL_CYLINDER_RADIUS + GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT - screw_hole_center_offset
  ])
  rotate([90,0,0])
  cylinder(r = r, h = 2*cm, center = true);

  translate([
    
    (HEDDLE_COUNT-1)*GUIDE_FRAME_SINGLE_SEPARATION
    + 0.5*GUIDE_FRAME_THICKNESS
    - 0.5*GUIDE_FRAME_SIDEWALL_THICKNESS
    + INDEXING_GEAR_THICKNESS
    + CONTROL_CYLINDER_SIDEWALL_THICKNESS
    + CONTROL_CYLINDER_AXLE_LENGTH
    - GUIDE_FRAME_CONTROL_CYLINDER_BEARING_SPACING
    - screw_hole_center_offset,
    -0.5*GUIDE_FRAME_WIDTH-1*cm+l,
    CONTROL_CYLINDER_RADIUS + GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT - screw_hole_center_offset
  ])
  rotate([90,0,0])
  cylinder(r = r, h = 2*cm, center = true);

  // middle holes
  translate([
    -0.5*GUIDE_FRAME_THICKNESS
    + 0.5*GUIDE_FRAME_SIDEWALL_THICKNESS
    - CONTROL_CYLINDER_SIDEWALL_THICKNESS
    - GUIDE_FRAME_CONTROL_CYLINDER_BEARING_SPACING
    + screw_hole_center_offset,
    -0.5*GUIDE_FRAME_WIDTH-1*cm+l,
    -CONTROL_CYLINDER_RADIUS
    - 0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
  ])
  rotate([90,0,0])
  cylinder(r = r, h = 2*cm, center = true);

  translate([
    -0.5*GUIDE_FRAME_THICKNESS
    + 0.5*GUIDE_FRAME_SIDEWALL_THICKNESS
    - CONTROL_CYLINDER_SIDEWALL_THICKNESS
    - GUIDE_FRAME_CONTROL_CYLINDER_BEARING_SPACING
    + 0.5*guide_frame_total_thickness,
    -0.5*GUIDE_FRAME_WIDTH-1*cm+l,
    -CONTROL_CYLINDER_RADIUS
    - 0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
  ])
  rotate([90,0,0])
  cylinder(r = r, h = 2*cm, center = true);

  translate([
    
    (HEDDLE_COUNT-1)*GUIDE_FRAME_SINGLE_SEPARATION
    + 0.5*GUIDE_FRAME_THICKNESS
    - 0.5*GUIDE_FRAME_SIDEWALL_THICKNESS
    + INDEXING_GEAR_THICKNESS
    + CONTROL_CYLINDER_SIDEWALL_THICKNESS
    + CONTROL_CYLINDER_AXLE_LENGTH
    - GUIDE_FRAME_CONTROL_CYLINDER_BEARING_SPACING
    - screw_hole_center_offset,
    -0.5*GUIDE_FRAME_WIDTH-1*cm+l,
    -CONTROL_CYLINDER_RADIUS
    - 0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
  ])
  rotate([90,0,0])
  cylinder(r = r, h = 2*cm, center = true);

  // bottom holes
  translate([
    -0.5*GUIDE_FRAME_THICKNESS
    + 0.5*GUIDE_FRAME_SIDEWALL_THICKNESS
    - CONTROL_CYLINDER_SIDEWALL_THICKNESS
    - GUIDE_FRAME_CONTROL_CYLINDER_BEARING_SPACING
    + screw_hole_center_offset,
    -0.5*GUIDE_FRAME_WIDTH-1*cm+l,
    -3*CONTROL_CYLINDER_RADIUS
    - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    + screw_hole_center_offset
  ])
  rotate([90,0,0])
  cylinder(r = r, h = 2*cm, center = true);

  translate([
    -0.5*GUIDE_FRAME_THICKNESS
    + 0.5*GUIDE_FRAME_SIDEWALL_THICKNESS
    - CONTROL_CYLINDER_SIDEWALL_THICKNESS
    - GUIDE_FRAME_CONTROL_CYLINDER_BEARING_SPACING
    + 0.5*guide_frame_total_thickness,
    -0.5*GUIDE_FRAME_WIDTH-1*cm+l,
    -3*CONTROL_CYLINDER_RADIUS
    - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    + screw_hole_center_offset
  ])
  rotate([90,0,0])
  cylinder(r = r, h = 2*cm, center = true);

  translate([
    
    (HEDDLE_COUNT-1)*GUIDE_FRAME_SINGLE_SEPARATION
    + 0.5*GUIDE_FRAME_THICKNESS
    - 0.5*GUIDE_FRAME_SIDEWALL_THICKNESS
    + INDEXING_GEAR_THICKNESS
    + CONTROL_CYLINDER_SIDEWALL_THICKNESS
    + CONTROL_CYLINDER_AXLE_LENGTH
    - GUIDE_FRAME_CONTROL_CYLINDER_BEARING_SPACING
    - screw_hole_center_offset,
    -0.5*GUIDE_FRAME_WIDTH-1*cm+l,
    -3*CONTROL_CYLINDER_RADIUS
    - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    - GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
    + screw_hole_center_offset
  ])
  rotate([90,0,0])
  cylinder(r = r, h = 2*cm, center = true);

}

module guide_frame_side_screw_holes() {
  translate([
    0,
    END_PLATE_MOUNTING_HOLE_TMB_Y,
    END_PLATE_MOUNTING_HOLE_T_Z
  ])
  rotate([0,90,0])
  cylinder(r = END_PLATE_MOUNTING_SCREW_HOLE_THREADED_INSERT_RADIUS, h = 100*cm, center = true);

  translate([
    0,
    END_PLATE_MOUNTING_HOLE_TMB_Y,
    END_PLATE_MOUNTING_HOLE_M_Z
  ])
  rotate([0,90,0])
  cylinder(r = END_PLATE_MOUNTING_SCREW_HOLE_THREADED_INSERT_RADIUS, h = 100*cm, center = true);

  translate([
    0,
    END_PLATE_MOUNTING_HOLE_TMB_Y,
    END_PLATE_MOUNTING_HOLE_B_Z
  ])
  rotate([0,90,0])
  cylinder(r = END_PLATE_MOUNTING_SCREW_HOLE_THREADED_INSERT_RADIUS, h = 100*cm, center = true);
}

module guide_frame() {
  difference() {
    union() {
      // heddle parts
      for (i = [1:HEDDLE_COUNT]) {
          translate([
              (i-1)*GUIDE_FRAME_SINGLE_SEPARATION,
              0,
              0
          ])
          guide_frame_full_single();
      }

      // indexing layer
      translate([
        (HEDDLE_COUNT-1)*GUIDE_FRAME_SINGLE_SEPARATION
        + 0.5*GUIDE_FRAME_INDEXING_LAYER_THICKNESS
        + 0.5*GUIDE_FRAME_THICKNESS
        - GUIDE_FRAME_SIDEWALL_THICKNESS,
        0,
        0
      ])
      guide_frame_indexing_layer();

      // blank space for reset cylinder brace
      translate([-GUIDE_FRAME_THICKNESS,0,0])
      guide_frame_full_single_no_heddles();

      // non-indexing end reset cylinder brace
      translate([-GUIDE_FRAME_THICKNESS,0,0])
      guide_frame_reset_cylinder_brace();

      // non-indexing end reset cylinder brace
      translate([
        (HEDDLE_COUNT-1)*GUIDE_FRAME_SINGLE_SEPARATION
        + GUIDE_FRAME_INDEXING_LAYER_THICKNESS
        - GUIDE_FRAME_SIDEWALL_THICKNESS,
        0,
        0
      ])
      guide_frame_reset_cylinder_brace();

    }

    guide_frame_side_screw_holes();
  }
}

module guide_frame_cover(indexing_end) {
  intersection() {
    difference() {
      union() {
        mirror([0,1,0])
        difference() {
          union() {
            // heddle parts
            for (i = [1:HEDDLE_COUNT]) {
                translate([
                    (i-1)*GUIDE_FRAME_SINGLE_SEPARATION,
                    0,
                    0
                ])
                guide_frame_cover_full_single();
            }
            
            // indexing layer
            translate([HEDDLE_COUNT*GUIDE_FRAME_SINGLE_SEPARATION + 0.5*GUIDE_FRAME_THICKNESS - GUIDE_FRAME_SIDEWALL_THICKNESS,0,0])
            guide_frame_cover_indexing_layer();

            translate([
              -0.5*GUIDE_FRAME_THICKNESS - 0.5*CONTROL_CYLINDER_SIDEWALL_THICKNESS,
              0,
              0
            ])
            guide_frame_control_cylinder_sidewall_compensation();

            translate([
              HEDDLE_COUNT*GUIDE_FRAME_SINGLE_SEPARATION
              + 0.5*GUIDE_FRAME_THICKNESS
              - GUIDE_FRAME_SIDEWALL_THICKNESS
              + 0.5*GUIDE_FRAME_INDEXING_LAYER_THICKNESS
              + 0.5*CONTROL_CYLINDER_SIDEWALL_THICKNESS,
              0,
              0
            ])
            guide_frame_control_cylinder_sidewall_compensation();


            //non-indexing end bearing
            translate([
              -0.5*GUIDE_FRAME_THICKNESS - CONTROL_CYLINDER_SIDEWALL_THICKNESS - 0.5*CONTROL_CYLINDER_AXLE_LENGTH,
              0,
              0
            ])
            guide_frame_control_cylinder_bearing(indexing_end = false);

            // indexing end bearing
            translate([
              (HEDDLE_COUNT-1)*GUIDE_FRAME_SINGLE_SEPARATION
              + 0.5*GUIDE_FRAME_THICKNESS
              - GUIDE_FRAME_SIDEWALL_THICKNESS
              + GUIDE_FRAME_INDEXING_LAYER_THICKNESS
              + CONTROL_CYLINDER_SIDEWALL_THICKNESS
              + 0.5*CONTROL_CYLINDER_AXLE_LENGTH,
              0,
              0
            ])
            guide_frame_control_cylinder_bearing(indexing_end = true);

          }

          // gap difference
          translate([0,-10*cm + CONTROL_CYLINDER_CENTER_OFFSET + GUIDE_FRAME_COVER_GAP,0])
          cube([20*cm, 20*cm, 20*cm], center = true);

          // material thinning
          if (indexing_end) {
            translate([0,10*cm + 10.15*mm,0])
            cube([20*cm, 20*cm, 20*cm], center = true);
          } else {
            translate([0,10*cm + 2*mm,0])
            cube([20*cm, 20*cm, 20*cm], center = true);
          }
        }

        // pawl guard
        translate([40.5*mm,23.5*mm,0])
        pawl_guard();
      }

      translate([0,10*cm,0])
      scale([1,10,1])
      guide_frame_face_screw_holes(r = GUIDE_FRAME_FACE_SCREW_RADIUS+0.5*mm);

    }

    if (indexing_end) {
      translate([
        10*cm
        + (HEDDLE_COUNT-1)*GUIDE_FRAME_SINGLE_SEPARATION
        + 0.5*GUIDE_FRAME_THICKNESS
        - GUIDE_FRAME_SIDEWALL_THICKNESS
        + GUIDE_FRAME_INDEXING_LAYER_THICKNESS
        + CONTROL_CYLINDER_SIDEWALL_THICKNESS
        - 5*mm
        ,
        0,
        0
      ])
      cube([20*cm, 20*cm, 20*cm], center = true);
    } else {
      translate([
        -10*cm
        + 2*mm
        ,
        0,
        0
      ])
      cube([20*cm, 20*cm, 20*cm], center = true);
    }
  }
}

module double_cone_reference(delta = 0) {
  true_control_cylinder_radius = CONTROL_CYLINDER_RADIUS;
  
  union() {
    // spoke 1
    translate([-0.5*CONTROL_CYLINDER_AXLE_LENGTH,0,0])
    rotate([0,90,0])
    cylinder( r1 = true_control_cylinder_radius + 0.5*CONTROL_CYLINDER_AXLE_LENGTH + delta
            , r2 = true_control_cylinder_radius - 0.5*CONTROL_CYLINDER_AXLE_LENGTH + delta
            , h = CONTROL_CYLINDER_AXLE_LENGTH
            , center = true
            );
    // spoke 2
    translate([0.5*CONTROL_CYLINDER_AXLE_LENGTH,0,0])
    rotate([0,90,0])
    cylinder( r1 = true_control_cylinder_radius - 0.5*CONTROL_CYLINDER_AXLE_LENGTH + delta
            , r2 = true_control_cylinder_radius + 0.5*CONTROL_CYLINDER_AXLE_LENGTH + delta
            , h = CONTROL_CYLINDER_AXLE_LENGTH
            , center = true
            );
  }
}

module double_wedge_reference(s = 4*cm, delta = 0) {
  true_control_cylinder_radius = CONTROL_CYLINDER_RADIUS;

  offset_radius = true_control_cylinder_radius - 0.5*CONTROL_CYLINDER_AXLE_LENGTH;
  
  translate([-sqrt(2)*0.5*s+offset_radius+delta,0,0])
  rotate([0,45,0])
  cube([s, s, s], center = true);

  translate([+sqrt(2)*0.5*s-offset_radius-delta,0,0])
  rotate([0,45,0])
  cube([s, s, s], center = true);
}

module control_cylinder_single(is_release_cylinder) {
    difference() {
        rotate([0,90,0])
        cylinder(r = CONTROL_CYLINDER_RADIUS, h = CONTROL_CYLINDER_LENGTH, center = true);

        s = WASHER_DIAMETER+PROCESS_DELTA;
        if (!is_release_cylinder) {
          translate([0,CONTROL_CYLINDER_RADIUS,0])
          scale([1,s,s])
          rotate([45,0,0])
          cube([
              CONTROL_CYLINDER_LENGTH-0.4*mm,
              1/sqrt(2),
              1/sqrt(2)
          ], center = true);
        }
    }
}

module motor_mount_release_cylinder_screw_holes() {
  // translate([-15,0,0])
  union() {
    translate([
      0,
      MOTOR_ADAPTOR_PLATE_SCREW_OFFSET_RADIUS,
      -5*cm-0.5*RELEASE_CYLINDER_MOUNTING_PLATE_THICKNESS+15*mm
    ])
    cylinder(r = MOTOR_ADAPTOR_PLATE_SCREW_RADIUS, h = 10*cm, center = true);

    translate([
      0,
      -MOTOR_ADAPTOR_PLATE_SCREW_OFFSET_RADIUS,
      -5*cm-0.5*RELEASE_CYLINDER_MOUNTING_PLATE_THICKNESS+15*mm
    ])
    cylinder(r = MOTOR_ADAPTOR_PLATE_SCREW_RADIUS, h = 10*cm, center = true);

    translate([
      MOTOR_ADAPTOR_PLATE_SCREW_OFFSET_RADIUS,
      0,
      -5*cm-0.5*RELEASE_CYLINDER_MOUNTING_PLATE_THICKNESS+15*mm
    ])
    cylinder(r = MOTOR_ADAPTOR_PLATE_SCREW_RADIUS, h = 10*cm, center = true);

    translate([
      -MOTOR_ADAPTOR_PLATE_SCREW_OFFSET_RADIUS,
      0,
      -5*cm-0.5*RELEASE_CYLINDER_MOUNTING_PLATE_THICKNESS+15*mm
    ])
    cylinder(r = MOTOR_ADAPTOR_PLATE_SCREW_RADIUS, h = 10*cm, center = true);
  }
}

module motor_mount_release_cylinder_nut_holes() {
  l = MOTOR_ADAPTOR_PLATE_SCREW_OFFSET_RADIUS + 5*mm;

  translate([
    0,
    0.5*l,
    0
  ])
  cube([
    MOTOR_ADAPTOR_PLATE_SCREW_NUT_SLOT_WIDTH,
    l,
    MOTOR_ADAPTOR_PLATE_SCREW_NUT_SLOT_THICKNESS
  ], center = true);

  rotate([0,0,90])
  translate([
    0,
    0.5*l,
    0
  ])
  cube([
    MOTOR_ADAPTOR_PLATE_SCREW_NUT_SLOT_WIDTH,
    l,
    MOTOR_ADAPTOR_PLATE_SCREW_NUT_SLOT_THICKNESS
  ], center = true);

  rotate([0,0,180])
  translate([
    0,
    0.5*l,
    0
  ])
  cube([
    MOTOR_ADAPTOR_PLATE_SCREW_NUT_SLOT_WIDTH,
    l,
    MOTOR_ADAPTOR_PLATE_SCREW_NUT_SLOT_THICKNESS
  ], center = true);

  rotate([0,0,270])
  translate([
    0,
    0.5*l,
    0
  ])
  cube([
    MOTOR_ADAPTOR_PLATE_SCREW_NUT_SLOT_WIDTH,
    l,
    MOTOR_ADAPTOR_PLATE_SCREW_NUT_SLOT_THICKNESS
  ], center = true);
}

module control_cylinder(is_release_cylinder = false, is_reset_cylinder = false) {
  total_control_cylinder_heddle_length =
    HEDDLE_COUNT * CONTROL_CYLINDER_LENGTH
    + INDEXING_GEAR_THICKNESS;
  
  difference() {
    union() {
      // control discs
      rotate([CONTROL_CYLINDER_BALL_DETENT_ANGLE,0,0])
      difference() {
        for (i = [1:HEDDLE_COUNT]) {
          translate([
              (i-1)*(GUIDE_FRAME_THICKNESS - GUIDE_FRAME_SIDEWALL_THICKNESS),
              0,
              0
          ])
          rotate([
              (i-1)*CONTROL_CYLINDER_BALL_DETENT_ANGLE,
              0,
              0
          ])
          control_cylinder_single(is_release_cylinder || is_reset_cylinder);
        }

        s = WASHER_DIAMETER+PROCESS_DELTA;
        if (is_release_cylinder) {

          release_depth = WASHER_ENGAGED_FRACTION*WASHER_DIAMETER;
          angle_adjustment = 7;

          rotate([
                -CONTROL_CYLINDER_BALL_DETENT_ANGLE-angle_adjustment,
                0,
                0
            ])
          translate([0,CONTROL_CYLINDER_RADIUS+0.5*s-release_depth,0])
          scale([1,s,s])
          rotate([45,0,0])
          cube([
              100*cm,1/sqrt(2),1/sqrt(2)
          ], center = true);

          rotate([
                180-CONTROL_CYLINDER_BALL_DETENT_ANGLE+angle_adjustment,
                0,
                0
            ])
          translate([0,CONTROL_CYLINDER_RADIUS+0.5*s-release_depth,0])
          scale([1,s,s])
          rotate([45,0,0])
          cube([
              100*cm,1/sqrt(2),1/sqrt(2)
          ], center = true);

          rotate([-CONTROL_CYLINDER_BALL_DETENT_ANGLE,0,0])
          difference() {
            cube([10*cm, 10*cm, 10*cm], center = true);
            
            rotate([0,90,0])
            cylinder(r = CONTROL_CYLINDER_RADIUS-release_depth, h = 20*cm, center = true);

            intersection() {
              rotate([angle_adjustment,0,0])
              translate([0,0,-10*cm])
              cube([20*cm, 20*cm, 20*cm], center = true);

              rotate([-angle_adjustment,0,0])
              translate([0,0,-10*cm])
              cube([20*cm, 20*cm, 20*cm], center = true);
            }
          }

        } else if (!is_reset_cylinder) {

          rotate([
                -CONTROL_CYLINDER_BALL_DETENT_ANGLE,
                0,
                0
            ])
          translate([0,CONTROL_CYLINDER_RADIUS,0])
          scale([1,s,s])
          rotate([45,0,0])
          cube([
              100*cm,1/sqrt(2),1/sqrt(2)
          ], center = true);

        }
      }

      // indexing disc
      l = (HEDDLE_COUNT-1)*(GUIDE_FRAME_THICKNESS - GUIDE_FRAME_SIDEWALL_THICKNESS)
          + (0.5*GUIDE_FRAME_THICKNESS - 0.5*GUIDE_FRAME_SIDEWALL_THICKNESS)
          - 0.5*GUIDE_FRAME_SIDEWALL_THICKNESS
          + 0.5*GUIDE_FRAME_INDEXING_LAYER_THICKNESS;
      translate([
          l,
          0,
          0
      ])
      difference() {
        rotate([0,90,0])
        cylinder(r = CONTROL_CYLINDER_RADIUS, h = INDEXING_GEAR_THICKNESS, center = true);

        if (!(is_release_cylinder || is_reset_cylinder)) {
          // indexing gear teeth
          translate([-5*cm - 0.5*END_PLATE_THICKNESS,0,0])
          for (i = [1:INDEXING_DETENT_COUNT]) {
            s = 3*mm;
            rotate([(i-1)*INDEXING_DETENT_ANGLE,0,0])
            translate([0,CONTROL_CYLINDER_RADIUS,0])
            scale([1,s,s])
            rotate([45,0,0])
            cube([
                100*cm,1/sqrt(2),1/sqrt(2)
            ], center = true);
          }
        }
      }

      
      // indexing end
      translate([total_control_cylinder_heddle_length-0.5*CONTROL_CYLINDER_LENGTH,0,0]) {
        // thin sidewall
        translate([0.5*CONTROL_CYLINDER_SIDEWALL_THICKNESS,0,0])
        rotate([0,90,0])
        cylinder(r = CONTROL_CYLINDER_RADIUS, h = CONTROL_CYLINDER_SIDEWALL_THICKNESS, center = true);

        translate([CONTROL_CYLINDER_SIDEWALL_THICKNESS, 0, 0]) {
          // double cone axle
          translate([0.5*CONTROL_CYLINDER_AXLE_LENGTH,0,0])
          intersection() {
            cube([CONTROL_CYLINDER_AXLE_LENGTH, 10*cm, 10*cm], center = true);
            double_cone_reference();
          }

          // cylindrical axle
          // translate([0.5*CONTROL_CYLINDER_AXLE_LENGTH,0,0])
          // rotate([0,90,0])
          // cylinder(r = CONTROL_CYLINDER_AXLE_RADIUS, h = CONTROL_CYLINDER_AXLE_LENGTH, center = true);

          // raiser disk (also for screw clearance)
          translate([CONTROL_CYLINDER_AXLE_LENGTH + 0.5*SCREW_CLEARANCE,0,0])
          rotate([0,90,0])
          cylinder(r = CONTROL_CYLINDER_RADIUS, h = SCREW_CLEARANCE, center = true);
        }
      }

      // non-indexing end
      translate([-0.5*CONTROL_CYLINDER_LENGTH,0,0]) {
        // spacer disk for reset cylinder brace
        translate([-0.5*GUIDE_FRAME_THICKNESS,0,0])
        rotate([0,90,0])
        cylinder(r = CONTROL_CYLINDER_RADIUS, h = GUIDE_FRAME_THICKNESS, center = true);

        // thin sidewall
        translate([-GUIDE_FRAME_THICKNESS - 0.5*CONTROL_CYLINDER_SIDEWALL_THICKNESS,0,0])
        rotate([0,90,0])
        cylinder(r = CONTROL_CYLINDER_RADIUS, h = CONTROL_CYLINDER_SIDEWALL_THICKNESS, center = true);

        // cylindrical axle
        translate([-0.5*CONTROL_CYLINDER_AXLE_LENGTH - GUIDE_FRAME_THICKNESS - CONTROL_CYLINDER_SIDEWALL_THICKNESS,0,0])
        rotate([0,90,0])
        cylinder(r = CONTROL_CYLINDER_RADIUS, h = CONTROL_CYLINDER_AXLE_LENGTH, center = true);

        // raiser disk (also for screw clearance)
        translate([-CONTROL_CYLINDER_AXLE_LENGTH - GUIDE_FRAME_THICKNESS - CONTROL_CYLINDER_SIDEWALL_THICKNESS - 0.5*SCREW_CLEARANCE,0,0])
        rotate([0,90,0])
        cylinder(r = CONTROL_CYLINDER_RADIUS, h = SCREW_CLEARANCE, center = true);

      }
    }

    if (is_reset_cylinder) {
      lift_bar_length =
        (HEDDLE_COUNT-1)*CONTROL_CYLINDER_LENGTH
        + INDEXING_GEAR_THICKNESS
        ;

      translate([
        0.5*lift_bar_length - 0.5*CONTROL_CYLINDER_LENGTH - 0.5*CONTROL_CYLINDER_SIDEWALL_THICKNESS,
        50*cm - CONTROL_CYLINDER_RADIUS + 5*mm,
        0
      ])
      cube([
        lift_bar_length,
        100*cm,
        100*cm
      ], center = true);

      translate([
        0.5*lift_bar_length - 0.5*CONTROL_CYLINDER_LENGTH - 0.5*CONTROL_CYLINDER_SIDEWALL_THICKNESS,
        0,
        50*cm
      ])
      cube([
        lift_bar_length,
        100*cm,
        100*cm
      ], center = true);
    }

  }

  if (is_release_cylinder || is_reset_cylinder) {
      hole_diameter =
        is_reset_cylinder
          ? CONTROL_CYLINDER_DIAMETER+2*mm
          : 10*mm;
      
      // gear support
      translate([-GUIDE_FRAME_THICKNESS-16.5*mm,0,0])
      rotate([0,90,0])
      linear_extrude(height = 1*cm, scale = 0.5)
      projection(cut = true)
      gear( radius_of_pitch_circle = CONTROL_CYLINDER_RADIUS + 0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
          , number_of_teeth = 16
          , thickness = 1*cm
          , hole_diameter = hole_diameter
          , $fn = 64
          );
      
      mounting_buffer =
        is_reset_cylinder
          ? 0*mm
          : RELEASE_CYLINDER_MOUNTING_BUFFER;
      
      difference() {
        translate([-GUIDE_FRAME_THICKNESS-mounting_buffer-21.5*mm,0,0])
        rotate([0,90,0])
        gear( radius_of_pitch_circle = CONTROL_CYLINDER_RADIUS + 0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
            , number_of_teeth = 16
            , thickness = 5*mm + mounting_buffer
            , hole_diameter = hole_diameter
            , $fn = 64
            );
        
        translate([-GUIDE_FRAME_THICKNESS-mounting_buffer-21.5*mm-0.5*RELEASE_CYLINDER_MOUNTING_PLATE_THICKNESS,0,0])
        rotate([0,90,0])
        motor_mount_release_cylinder_screw_holes();
      }

      if (!is_reset_cylinder) {
        // mounting plate
        translate([-GUIDE_FRAME_THICKNESS-mounting_buffer-21.5*mm-0.5*RELEASE_CYLINDER_MOUNTING_PLATE_THICKNESS,0,0])
        rotate([0,90,0])
        difference() {
          cylinder(
            r = CONTROL_CYLINDER_RADIUS + 0.5*GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT + 2*mm,
            h = RELEASE_CYLINDER_MOUNTING_PLATE_THICKNESS,
            center = true);

          cylinder(
            r = 0.5*hole_diameter,
            h = 10*cm,
            center = true);

          motor_mount_release_cylinder_screw_holes();

          motor_mount_release_cylinder_nut_holes();
        }

        // pawl
        rotate([90,0,0])
        translate([
          -0.5*CONTROL_CYLINDER_LENGTH
          + total_control_cylinder_heddle_length
          + CONTROL_CYLINDER_SIDEWALL_THICKNESS
          + CONTROL_CYLINDER_AXLE_LENGTH
          + SCREW_CLEARANCE
          + 0.5*RELEASE_PAWL_GEAR_THICKNESS,
          0,
          0
        ]) {
          pawl_thickness = 2*mm;
          pawl_stiffness = 0.6*mm;
          pawl_tooth_width = 4*mm;
          pawl_tooth_thickness = 6*mm;
          pawl_spacing_thickness = 1*mm + pawl_tooth_thickness;
          pawl_stiffness_spacing = 1.5*mm;
          spring_half_cycle_length = 2.5*mm;
          spring_width = 13*mm;

          difference() {
            union() {
              difference() {
                rotate([0,90,0])
                cylinder(r = RELEASE_PAWL_GEAR_RADIUS, h = RELEASE_PAWL_GEAR_THICKNESS, center = true);

                // translate([
                //   -0.5*pawl_thickness + 0.5*RELEASE_PAWL_GEAR_THICKNESS,
                //   0,
                //   -pawl_stiffness_spacing + 0.25*mm
                // ])
                // rotate([90,0,0])
                // rotate([0,90,0])
                // flat_spring(n = 2, w = 2*cm, l = spring_half_cycle_length, t = pawl_spacing_thickness, s = 2*pawl_stiffness_spacing+pawl_stiffness);
                
                translate([
                  0.5*RELEASE_PAWL_GEAR_THICKNESS - 0.5*pawl_spacing_thickness + 1*mm,
                  0,
                  0
                ])
                rotate([0,90,0])
                cylinder(r = RELEASE_PAWL_GEAR_RADIUS - 2*mm, h = 10*cm, center = true);

              }

              brace_height = 4*mm;
              translate([
                0,
                0,
                RELEASE_PAWL_GEAR_RADIUS - 0.5*brace_height - 1*mm])
              cube([
                RELEASE_PAWL_GEAR_THICKNESS,
                pawl_tooth_width + 3.5*mm,
                brace_height
              ],
              center = true);
            }

            translate([
              0.5*RELEASE_PAWL_GEAR_THICKNESS - 0.5*pawl_spacing_thickness + 0.5*mm,
              0,
              50*mm])
            cube([
              10*cm,
              pawl_tooth_width + 1*mm,
              10*cm
            ],
            center = true);
          }
          
          difference() {
            translate([-0.5*pawl_thickness + 0.5*RELEASE_PAWL_GEAR_THICKNESS,0,0])
            rotate([90,0,0])
            rotate([0,90,0])
            flat_spring(n = 2, w = spring_width, l = spring_half_cycle_length, t = pawl_thickness, s = pawl_stiffness);

            translate([0,-5.1*cm,5*cm+1.5*spring_half_cycle_length])
            cube([10*cm, 10*cm, 10*cm], center = true);

          }

          intersection() {
            translate([
              0.5*RELEASE_PAWL_GEAR_THICKNESS - 0.5*pawl_thickness,
              1*cm,
              -2*spring_half_cycle_length
            ])
            cube([pawl_thickness, 2*cm, pawl_stiffness], center = true);

            rotate([0,90,0])
            cylinder(r = RELEASE_PAWL_GEAR_RADIUS-0.1*mm, h = RELEASE_PAWL_GEAR_THICKNESS, center = true);
          }
          
          difference() {
            translate([
              -0.5*pawl_tooth_thickness + 0.5*RELEASE_PAWL_GEAR_THICKNESS,
              0,
              2*spring_half_cycle_length + 0.5*RELEASE_PAWL_TOOTH_HEIGHT - 0.25*pawl_stiffness
            ])
            cube([pawl_tooth_thickness, pawl_tooth_width, RELEASE_PAWL_TOOTH_HEIGHT + 0.5*pawl_stiffness], center = true);
          
            translate([
              -0.5*pawl_thickness + 0.5*RELEASE_PAWL_GEAR_THICKNESS,
              -0.5*pawl_tooth_width,
              2*spring_half_cycle_length + RELEASE_PAWL_TOOTH_HEIGHT - 2.5*mm
            ])
            rotate([-45,0,0])
            translate([0,0,12*mm])
            cube([2*cm, 2*cm, 2*cm], center = true);
          }
        }
        
      }
  } else {
    // ratchet
    difference() {
      translate([
        -0.5*CONTROL_CYLINDER_LENGTH
        + total_control_cylinder_heddle_length
        + CONTROL_CYLINDER_SIDEWALL_THICKNESS
        + CONTROL_CYLINDER_AXLE_LENGTH
        + SCREW_CLEARANCE
        + 0.5*SELECTOR_RATCHET_GEAR_THICKNESS,
        0,
        0
      ])
      rotate([0,90,0])
      cylinder(r = SELECTOR_RATCHET_GEAR_RADIUS, h = SELECTOR_RATCHET_GEAR_THICKNESS, center = true);

      // ratchet teeth
      for (i = [1:20]) {
        s = 2*cm;
        rotate([(i-1)*CONTROL_CYLINDER_BALL_DETENT_ANGLE,0,0])
        translate([0,SELECTOR_RATCHET_GEAR_RADIUS - SELECTOR_RATCHET_TOOTH_DEPTH,0])
        rotate([SELECTOR_RATCHET_TOOTH_ANGLE,0,0])
        translate([0,s,0])
        scale([1,sqrt(2)*s,0.75*sqrt(2)*s])
        rotate([-45,0,0])
        cube([
            100*cm,1,1
        ], center = true);
      }
    }
  }
}

module flat_spring_half_cycle(w, l, t, s) {
  // translate([-0.5*w + 0.5*l,0,0])
  // %cylinder(r=0.5*l, h=t, center = true);

  difference() {
    center_x = -0.5*w + 0.5*l;
    translate([center_x,0,0])
    cylinder(r=0.5*l + 0.5*s, h=t, center = true);

    translate([center_x,0,0])
    cylinder(r=0.5*l - 0.5*s, h=100, center = true);

    translate([center_x+w,0,0])
    cube([2*w, 100, 100], center = true);
  }

  translate([0,-0.5*l,0])
  cube([w - l, s, t], center = true);
}

module flat_spring_full_cycle(w, l, t, s) {
  translate([0,-0.5*l,0])
  flat_spring_half_cycle(w, l, t, s);
  
  translate([0,0.5*l,0])
  mirror([1,0,0])
  flat_spring_half_cycle(w, l, t, s);
}

module flat_spring(n, w, l, t, s) {
  translate([0,-n*l,0]) {
    // cycles
    for (i = [0:n-1]) {
      translate([0,l+2*l*i,0])
      flat_spring_full_cycle(w, l, t, s);
    }

    // final extension
    translate([0,2*n*l,0])
    cube([w - l, s, t], center = true);
  }
}

module spiral_spring_cycle(off, stiffness, thickness, spacing) {
  translate([0,0.5*spacing,0])
  difference() {
    cylinder(d = (1+2*off)*spacing + 0.5*stiffness, h = thickness, center = true);

    cylinder(d = (1+2*off)*spacing - 0.5*stiffness, h = 10*thickness, center = true);
    
    translate([(1+2*off)*spacing,0,0])
    cube([2*(1+2*off)*spacing, 2*(1+2*off)*spacing, 2*(1+2*off)*spacing], center = true);
  }

  difference() {
    cylinder(d = 2*(1+off)*spacing + 0.5*stiffness, h = thickness, center = true);

    cylinder(d = 2*(1+off)*spacing - 0.5*stiffness, h = 10*thickness, center = true);
    
    translate([-2*(1+off)*spacing,0,0])
    cube([4*(1+off)*spacing, 4*(1+off)*spacing, 4*(1+off)*spacing], center = true);
  }
}

module spiral_spring(cycles, stiffness, thickness, spacing) {
  for (i = [0:cycles-1]) {
    spiral_spring_cycle(i, stiffness, thickness, spacing);
  }
}

module gear (
	radius_of_pitch_circle,
  // mm_per_tooth    = 3,    //this is the "circular pitch", the circumference of the pitch circle divided by the number of teeth
	number_of_teeth = 11,   //total number of teeth around the entire perimeter
	thickness       = 6,    //thickness of gear in mm
	hole_diameter   = 3,    //diameter of the hole in the center, in mm
	twist           = 0,    //teeth rotate this many degrees from bottom of gear to top.  360 makes the gear a screw with each thread going around once
	teeth_to_hide   = 0,    //number of teeth to delete to make this only a fraction of a circle
	pressure_angle  = 28,   //Controls how straight or bulged the tooth sides are. In degrees.
	clearance       = 0.0,  //gap between top of a tooth on one gear and bottom of valley on a meshing gear (in millimeters)
	backlash        = 0.0,   //gap between two meshing teeth, in the direction along the circumference of the pitch circle
    center = false,   // center gear by z axis
    $fn = 20   // number of fragments to draw hole cylinder
) {
  mm_per_tooth = 2*radius_of_pitch_circle*PI / number_of_teeth;
	p  = radius_of_pitch_circle; //mm_per_tooth * number_of_teeth / PI / 2;  //radius of pitch circle
	c  = p + mm_per_tooth / PI - clearance;        //radius of outer circle
	b  = p*cos(pressure_angle);                    //radius of base circle
	r  = p-(c-p)-clearance;                        //radius of root circle
	t  = mm_per_tooth/2-backlash/2;                //tooth thickness at pitch circle
	k  = -iang(b, p) - t/2/p/PI*180;             //angle to where involute meets base circle on each side of tooth
    difference() {
        linear_extrude(height = thickness, center = center, convexity = 10, twist = twist)
            for (i = [0:(number_of_teeth-teeth_to_hide-1 > 0 ? 1 : -1):number_of_teeth-teeth_to_hide-1] )
                rotate([0,0,i*360/number_of_teeth])
                    polygon(
                        points=[
                            [0, -hole_diameter/10],
                            polar(r, -181/number_of_teeth),
                            polar(r, r<b ? k : -180/number_of_teeth),
                            q7(0/5,r,b,c,k, 1),q7(1/5,r,b,c,k, 1),q7(2/5,r,b,c,k, 1),q7(3/5,r,b,c,k, 1),q7(4/5,r,b,c,k, 1),q7(5/5,r,b,c,k, 1),
                            q7(5/5,r,b,c,k,-1),q7(4/5,r,b,c,k,-1),q7(3/5,r,b,c,k,-1),q7(2/5,r,b,c,k,-1),q7(1/5,r,b,c,k,-1),q7(0/5,r,b,c,k,-1),
                            polar(r, r<b ? -k : 180/number_of_teeth),
                            polar(r, 181/number_of_teeth)
                        ],
                        paths=[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]]
                    );
        translate([0,0, (center ? 0 : -0.1)])
            cylinder(h=thickness+0.2, r=hole_diameter/2, center=center, $fn=$fn);
    }
};	
//these 4 functions are used by gear
function polar(r,theta)   = r*[sin(theta), cos(theta)];                            //convert polar to cartesian coordinates
function iang(r1,r2)      = sqrt((r2/r1)*(r2/r1) - 1)/PI*180 - acos(r1/r2); //unwind a string this many degrees to go from radius r1 to radius r2
function q7(f,r,b,r2,t,s) = q6(b,s,t,(1-f)*max(b,r)+f*r2);                         //radius a fraction f up the curved side of the tooth 
function q6(b,s,t,d)      = polar(d,s*(iang(b,d)+t));                              //point at radius d on the involute curve              














// translate([18,WASHER_RADIUS+CONTROL_CYLINDER_RADIUS-WASHER_ENGAGED_FRACTION*WASHER_DIAMETER,0])
// bevelled_washer();

// translate([18,WASHER_RADIUS+CONTROL_CYLINDER_RADIUS,-CONTROL_CYLINDER_DIAMETER-GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT])
// washer();

// %guide_frame_holes();


// raised = true;
// translate([16.5,0,0])
// translate([
//   0,
//   CONTROL_CYLINDER_RADIUS+WASHER_UNENGAGED_FRACTION*WASHER_DIAMETER,
//   -HEDDLE_ROD_2_LENGTH
//   + CONTROL_CYLINDER_RADIUS
//   + GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT
//   + (raised ? HEDDLE_ROD_RISE + 2*mm: 0)
// ])
// heddle_rod_2();

// intersection() {
// guide_frame();

// translate([20*mm,-2*mm,-0*mm])
// #cube([7*mm, 5*cm, 1.5*cm], center = true);
// }


// end stop
// intersection() {
// total_control_cylinder_heddle_length =
//     HEDDLE_COUNT * CONTROL_CYLINDER_LENGTH
//     + INDEXING_GEAR_THICKNESS;
// translate([
//   total_control_cylinder_heddle_length,
//   0,
//   0
// ])
// translate([
//   -11*mm,
//   0,
//   0
// ])
// guide_frame_end_plate(indexing_end=false);


// guide_frame_end_plate(indexing_end=true);

// translate([0,-1.5*cm,0*cm])
// cube([100*cm, 3*cm, 3*cm], center = true);
// }

// translate([-11.5*cm,0,0])
// intersection() {
// translate([0,CONTROL_CYLINDER_CENTER_OFFSET,-CONTROL_CYLINDER_DIAMETER-GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT])
// // rotate([-8*CONTROL_CYLINDER_BALL_DETENT_ANGLE,0,0])
// control_cylinder(is_release_cylinder = false);

// translate([0,CONTROL_CYLINDER_CENTER_OFFSET,0])
// rotate([-11*CONTROL_CYLINDER_BALL_DETENT_ANGLE,0,0])
// control_cylinder(is_release_cylinder = true);

// translate([0,CONTROL_CYLINDER_CENTER_OFFSET,CONTROL_CYLINDER_DIAMETER+GUIDE_FRAME_CYLINDER_SEPARATION_HEIGHT])
// // rotate([0,0,0])
// #control_cylinder(is_reset_cylinder = true);

// translate([-25*mm,0,0])
// #cube([50*mm, 10*cm, 10*cm], center = true);
// }


// intersection() {
  // guide_frame_indexing_layer();

//   cube([2*cm, 10*cm, 1*cm], center = true);
// }

// translate([-1*cm,0,0])
// indexing_spring_plug(point = false);

// translate([0,0,0])
// indexing_spring_plug(point = true);

// flat_spring(n = 3, w = 2*cm, l = 3*mm, t = 3*mm, s = 1*mm);

// guide_frame_control_cylinder_bearing_body();

// cube([1*cm, 1*cm, 1*cm]);


// spiral_spring(3, 1*mm, 4*mm, 3*mm);

// translate([
//   -39.6*mm,
//   0,
//   0,
// ])
// rotate([0,-90,0])
motor_shaft_adaptor(is_servo = false);

// stepper_brace();



//////////////////////////////////////////////////////////////////////////////////////////////
//example gear train.  

// num_teeth = 8;
// radius = 1*cm;
// mm_per_tooth = 2*PI*radius / num_teeth;
// thickness    = 6;
// hole_diameter  = 10;

// translate([10*cm,0,0])
// rotate([90,0,0])
// gear(radius,num_teeth,thickness,hole_diameter);







