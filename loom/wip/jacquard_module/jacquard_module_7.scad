$fn = 64;

mm = 1;
cm = 10*mm;

PROCESS_DELTA = 0.5*mm;
BALL_DIAMETER = 3*mm;
BALL_RADIUS = BALL_DIAMETER/2;
MAX_HEDDLE_COUNT = 20;
HEDDLE_COUNT = min(MAX_HEDDLE_COUNT,5);
HEDDLE_ROD_THICKNESS = BALL_DIAMETER;
HEDDLE_ROD_WIDTH = 2*BALL_DIAMETER;
HEDDLE_ROD_RISE = 2*cm;
HEDDLE_ROD_RESET_MARGIN = 3*cm;
HEDDLE_ROD_MINI_DETENT_SIZE = BALL_DIAMETER+PROCESS_DELTA;
HEDDLE_ROD_DETENT_SIZE = HEDDLE_ROD_MINI_DETENT_SIZE + HEDDLE_ROD_RISE;
HEDDLE_ROD_SEGMENT_SEPARATION = 1*cm;
HEDDLE_ROD_BOTTOM_MARGIN = 3*cm;
GUIDE_FRAME_TOP_MARGIN = 15*mm;
CONTROL_CYLINDER_BALL_DETENT_SIZE = 0.4 + BALL_DIAMETER;
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
HEDDLE_ROD_TOP_MARGIN = CONTROL_CYLINDER_RADIUS
                      - HEDDLE_ROD_MINI_DETENT_SIZE/2
                      + GUIDE_FRAME_TOP_MARGIN;
HEDDLE_ROD_LENGTH = HEDDLE_ROD_BOTTOM_MARGIN +
                    HEDDLE_ROD_SEGMENT_SEPARATION +
                    HEDDLE_ROD_TOP_MARGIN +
                    2*HEDDLE_ROD_DETENT_SIZE;
HEDDLE_ROD_2_LENGTH = 20*cm;
HEDDLE_ROD_CAP_WIDTH = 2*HEDDLE_ROD_WIDTH;
HEDDLE_ROD_CAP_HEIGHT = 5*mm;
HEDDLE_ROD_THREAD_SLOT_WIDTH = 0.5*mm;
HEDDLE_ROD_THREAD_SLOT_LENGTH = 1*cm;
HEDDLE_ROD_THREAD_HOLE_DIAMETER = 2*mm;
HEDDLE_ROD_THREAD_HOLE_RADIUS = 0.5*HEDDLE_ROD_THREAD_HOLE_DIAMETER;
HEDDLE_ROD_THREAD_SLOT_BOTTOM_MARGIN = 2*cm;
GUIDE_FRAME_SIDEWALL_THICKNESS = 1*mm;
GUIDE_FRAME_HOLE_THICKNESS = HEDDLE_ROD_THICKNESS + 2*PROCESS_DELTA;
GUIDE_FRAME_THICKNESS = GUIDE_FRAME_HOLE_THICKNESS + 2*GUIDE_FRAME_SIDEWALL_THICKNESS;
GUIDE_FRAME_INDEXING_LAYER_THICKNESS = 1*cm;
GUIDE_FRAME_SINGLE_SEPARATION = GUIDE_FRAME_HOLE_THICKNESS + GUIDE_FRAME_SIDEWALL_THICKNESS;
GUIDE_FRAME_WIDTH = CONTROL_CYLINDER_RADIUS + BALL_RADIUS + HEDDLE_ROD_WIDTH + 12*mm;
GUIDE_FRAME_BOTTOM_MARGIN = 15*mm;
GUIDE_FRAME_HEIGHT = CONTROL_CYLINDER_DIAMETER;
CONTROL_CYLINDER_CENTER_OFFSET = -GUIDE_FRAME_WIDTH/2;
GUIDE_FRAME_CONTROL_WIDTH = 5*mm;
CONTROL_CYLINDER_LENGTH = GUIDE_FRAME_THICKNESS - GUIDE_FRAME_SIDEWALL_THICKNESS;
GUIDE_FRAME_MIDDLE_HEIGHT = abs(
        -HEDDLE_ROD_RISE
        - HEDDLE_ROD_SEGMENT_SEPARATION
        - HEDDLE_ROD_MINI_DETENT_SIZE
    ) - GUIDE_FRAME_HEIGHT;
GUIDE_FRAME_TOTAL_HEIGHT = GUIDE_FRAME_TOP_MARGIN
                         + GUIDE_FRAME_HEIGHT
                         + GUIDE_FRAME_MIDDLE_HEIGHT
                         + GUIDE_FRAME_HEIGHT
                         + GUIDE_FRAME_BOTTOM_MARGIN;
GUIDE_FRAME_CONTROL_CYLINDER_BEARING_SPACING = 0.5*mm;
GUIDE_FRAME_FACE_SCREW_THREADED_INSERT_DIAMETER = 6*mm;
GUIDE_FRAME_FACE_SCREW_THREADED_INSERT_RADIUS = 0.5*GUIDE_FRAME_FACE_SCREW_THREADED_INSERT_DIAMETER;
GUIDE_FRAME_FACE_SCREW_DIAMETER = 4*mm;
GUIDE_FRAME_FACE_SCREW_RADIUS = 0.5*GUIDE_FRAME_FACE_SCREW_DIAMETER;
GUIDE_FRAME_COVER_GAP = 1*mm;
END_STOP_THICKNESS = 4*mm;
END_STOP_HEIGHT = GUIDE_FRAME_TOTAL_HEIGHT;
ROD_SNAP_GAP = 1*mm;
CONTROL_CYLINDER_AXLE_LENGTH = END_STOP_THICKNESS+2*mm;
// we add half the guide frame sidewall thickness because the control cylinder
// proper doesn't stick out all the way, since the guide frame sidewalls
// overlap by half their thickness
CONTROL_CYLINDER_SIDEWALL_THICKNESS = 0.5*GUIDE_FRAME_SIDEWALL_THICKNESS;
END_PLATE_MOUNTING_HOLE_TMB_Y = 10*mm;
END_PLATE_MOUNTING_HOLE_T_Z =
  CONTROL_CYLINDER_RADIUS + 0.5*GUIDE_FRAME_TOP_MARGIN;
END_PLATE_MOUNTING_HOLE_M_Z =
  - CONTROL_CYLINDER_RADIUS - 0.5*GUIDE_FRAME_MIDDLE_HEIGHT;
END_PLATE_MOUNTING_HOLE_B_Z =
  - 3*CONTROL_CYLINDER_RADIUS - GUIDE_FRAME_MIDDLE_HEIGHT - 0.5*GUIDE_FRAME_BOTTOM_MARGIN;
END_PLATE_MOUNTING_SCREW_DIAMETER = 4*mm;
END_PLATE_MOUNTING_SCREW_RADIUS = 0.5*END_PLATE_MOUNTING_SCREW_DIAMETER;
END_PLATE_MOUNTING_SCREW_HOLE_RADIUS = END_PLATE_MOUNTING_SCREW_RADIUS + PROCESS_DELTA;
END_PLATE_MOUNTING_SCREW_HOLE_THREADED_INSERT_RADIUS = END_PLATE_MOUNTING_SCREW_RADIUS + 1*mm;
END_PLATE_MOUNTING_NUT_HEIGHT = 7*mm;
END_PLATE_MOUNTING_NUT_WIDTH = 8*mm;
END_PLATE_MOUNTING_NUT_THICKNESS = 3*mm;
END_PLATE_MOUNTING_THREADED_INSERT_RADIUS = 2.5*mm;
SCREW_CLEARANCE = 4*mm;
INDEXING_GEAR_THICKNESS = GUIDE_FRAME_INDEXING_LAYER_THICKNESS - GUIDE_FRAME_SIDEWALL_THICKNESS; //2*END_STOP_THICKNESS;
SELECTOR_RATCHET_GEAR_THICKNESS = 6*mm;
SELECTOR_RATCHET_GEAR_RADIUS = CONTROL_CYLINDER_RADIUS + 0.5*GUIDE_FRAME_MIDDLE_HEIGHT - 1*mm;
SELECTOR_RATCHET_GEAR_DIAMETER = 2*SELECTOR_RATCHET_GEAR_RADIUS;
SELECTOR_RATCHET_TOOTH_DEPTH = 2.4*mm;
SELECTOR_RATCHET_TOOTH_ANGLE = 50;
RELEASE_PAWL_GEAR_THICKNESS = 10*mm;
RELEASE_PAWL_GEAR_DIAMETER = SELECTOR_RATCHET_GEAR_DIAMETER;
RELEASE_PAWL_GEAR_RADIUS = 0.5*RELEASE_PAWL_GEAR_DIAMETER;
RELEASE_PAWL_THICKNESS = 1*mm;
INDEXING_DETENT_COUNT = 20; //HEDDLE_COUNT + 1;
INDEXING_DETENT_ANGLE = 360/20; //CONTROL_CYLINDER_BALL_DETENT_ANGLE;
INDEXING_SPRING_DIAMETER = 4*mm;
INDEXING_SPRING_RADIUS = 0.5*INDEXING_SPRING_DIAMETER;
INDEXING_SPRING_HOLE_SIZE = INDEXING_SPRING_DIAMETER + 1*mm;
INDEXING_SPRING_THREADED_INSERT_DIAMETER = 5*mm;
INDEXING_SPRING_PLUG_WIDTH = INDEXING_SPRING_DIAMETER - 0.5*PROCESS_DELTA;
INDEXING_SPRING_PLUG_LENGTH = 2*INDEXING_SPRING_DIAMETER;
INDEXING_SPRING_PLUG_POINT_LENGTH  = 0.5*INDEXING_SPRING_DIAMETER;
INDEXING_SPRING_LENGTH = 1*cm;
INDEXING_SPRING_HOLE_LENGTH = 2*INDEXING_SPRING_PLUG_LENGTH + INDEXING_SPRING_PLUG_POINT_LENGTH + INDEXING_SPRING_LENGTH;
RELEASE_PAWL_TOOTH_HEIGHT = 15*mm;



module ball() {
    sphere(d = BALL_DIAMETER);
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
  detent_side_length = sqrt(0.5*HEDDLE_ROD_MINI_DETENT_SIZE^2);
  detent_start =
    HEDDLE_ROD_2_LENGTH
    - GUIDE_FRAME_TOP_MARGIN
    - CONTROL_CYLINDER_RADIUS;
  
  detent_end =
    detent_start
    - CONTROL_CYLINDER_DIAMETER
    - GUIDE_FRAME_MIDDLE_HEIGHT
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
          -50 + 0.5*HEDDLE_ROD_MINI_DETENT_SIZE,
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
      0.5*HEDDLE_ROD_MINI_DETENT_SIZE,
      detent_start
      - CONTROL_CYLINDER_DIAMETER
      - GUIDE_FRAME_MIDDLE_HEIGHT
      + 0.5*HEDDLE_ROD_MINI_DETENT_SIZE
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
      0.5*HEDDLE_ROD_MINI_DETENT_SIZE,
      detent_start
      - HEDDLE_ROD_RISE
      + 0.5*HEDDLE_ROD_MINI_DETENT_SIZE
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
      0.5*HEDDLE_ROD_MINI_DETENT_SIZE,
      detent_start
      - CONTROL_CYLINDER_DIAMETER
      - GUIDE_FRAME_MIDDLE_HEIGHT
      - HEDDLE_ROD_RISE
      + 0.5*HEDDLE_ROD_MINI_DETENT_SIZE
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
        HEDDLE_ROD_WIDTH/2 - HEDDLE_ROD_CAP_WIDTH/2,
        HEDDLE_ROD_2_LENGTH
    ])
    cube([
        HEDDLE_ROD_THICKNESS,
        HEDDLE_ROD_CAP_WIDTH,
        HEDDLE_ROD_CAP_HEIGHT
    ]);
}

module guide_frame_control_cylinder_holes() {
  //
  // top control cylinder
  //
  translate([0,CONTROL_CYLINDER_CENTER_OFFSET,0])
  rotate([0,90,0])
  cylinder(r = CONTROL_CYLINDER_RADIUS+PROCESS_DELTA, h = 100*cm, center = true);

  //
  // bottom control cylinder
  //
  translate([
      0,
      CONTROL_CYLINDER_CENTER_OFFSET,
      - CONTROL_CYLINDER_DIAMETER
      - GUIDE_FRAME_MIDDLE_HEIGHT
  ])
  rotate([0,90,0])
  cylinder(r = CONTROL_CYLINDER_RADIUS+PROCESS_DELTA, h = 100*cm, center = true);
}

module guide_frame_bearing_ball_and_heddle_rod_holes() {
    l = 100*cm;
    heddle_rod_center =
      CONTROL_CYLINDER_CENTER_OFFSET
      + CONTROL_CYLINDER_RADIUS+PROCESS_DELTA
      + 0.5*HEDDLE_ROD_WIDTH+0.5*PROCESS_DELTA
      + BALL_RADIUS
      ;
    
    // HEDDLE_ROD_WIDTH/2 - GUIDE_FRAME_WIDTH/2 + CONTROL_CYLINDER_RADIUS + BALL_RADIUS;

    //
    // top bearing hole
    //
    translate([0,-0.5*l+heddle_rod_center,0])
    cube([
        HEDDLE_ROD_THICKNESS+PROCESS_DELTA,
        l,
        BALL_DIAMETER+PROCESS_DELTA],
    center = true);

    //
    // bottom bearing hole
    //
    translate([
        0,
        -0.5*l+heddle_rod_center,
        -CONTROL_CYLINDER_DIAMETER
        - GUIDE_FRAME_MIDDLE_HEIGHT
    ])
    cube([
        HEDDLE_ROD_THICKNESS+PROCESS_DELTA,
        l,
        BALL_DIAMETER+PROCESS_DELTA],
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
        HEDDLE_ROD_WIDTH+2*PROCESS_DELTA,
        100*cm
    ], center = true);
}

module guide_frame_holes() {
    guide_frame_bearing_ball_and_heddle_rod_holes();
    guide_frame_control_cylinder_holes();
}

module guide_frame_full_single_body() {
    //
    // top margin
    //
    translate([0,0,GUIDE_FRAME_HEIGHT/2+GUIDE_FRAME_TOP_MARGIN/2])
    cube([
        GUIDE_FRAME_THICKNESS,
        GUIDE_FRAME_WIDTH,
        GUIDE_FRAME_TOP_MARGIN
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
        GUIDE_FRAME_MIDDLE_HEIGHT/2
        + GUIDE_FRAME_HEIGHT/2
        - HEDDLE_ROD_RISE
        - HEDDLE_ROD_SEGMENT_SEPARATION
        - HEDDLE_ROD_MINI_DETENT_SIZE
    ])
    cube([
        GUIDE_FRAME_THICKNESS,
        GUIDE_FRAME_WIDTH,
        GUIDE_FRAME_MIDDLE_HEIGHT
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
        -GUIDE_FRAME_BOTTOM_MARGIN/2
        - 1.5*GUIDE_FRAME_HEIGHT
        - GUIDE_FRAME_MIDDLE_HEIGHT
    ])
    cube([
        GUIDE_FRAME_THICKNESS,
        GUIDE_FRAME_WIDTH,
        GUIDE_FRAME_BOTTOM_MARGIN
    ], center = true);
}

module guide_frame_full_single() {
    difference() {
        guide_frame_full_single_body();

        guide_frame_holes();
    }
}

module guide_frame_cover_full_single() {
    difference() {
        guide_frame_full_single_body();

        guide_frame_control_cylinder_holes();
    }
}

module guide_frame_end_plate_screw_holes() {
  margin = 2*mm;
  
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

module guide_frame_end_plate(has_pawl_shield) {
  control_cylinder_center = -0.5*GUIDE_FRAME_WIDTH;

  difference() {
    collar_width = 2*cm;
    pawl_area_width = 1*cm;
    end_plate_width = GUIDE_FRAME_WIDTH+collar_width+pawl_area_width;
    translate([0,-0.5*collar_width-0.5*pawl_area_width,-0.5*END_STOP_HEIGHT + CONTROL_CYLINDER_RADIUS + GUIDE_FRAME_TOP_MARGIN])
    cube([END_STOP_THICKNESS,end_plate_width,END_STOP_HEIGHT], center=true);


    // control cylinder holes
    s = 10*cm;

    translate([0,control_cylinder_center,0]) {
      double_cone_reference(delta = PROCESS_DELTA);
      
      translate([0,0.5*s,0])
      double_wedge_reference(s = s);
    }

    translate([ 0
              , control_cylinder_center
              , -CONTROL_CYLINDER_RADIUS - GUIDE_FRAME_MIDDLE_HEIGHT - CONTROL_CYLINDER_RADIUS
              ])
    {
      double_cone_reference(delta = PROCESS_DELTA);

      translate([0,0.5*s,0])
      double_wedge_reference(s = s);
    }

    // screw holes

    guide_frame_end_plate_screw_holes();

  }

  if (has_pawl_shield) {
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
        0.5*END_STOP_THICKNESS+0.5*shield_width-0.5*mm,
        control_cylinder_center - 2*mm,
        -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_MIDDLE_HEIGHT - 2*mm
      ])
      translate([0,0,5*mm])
      cube([shield_width, 4*cm, 1*cm], center = true);

      // inner profile
      
      difference() {
        translate([
          0.5*END_STOP_THICKNESS+0.5*shield_width,
          control_cylinder_center,
          -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_MIDDLE_HEIGHT - 6*mm
        ])
        cube([2*cm, 2*cm, 2*cm], center = true);

        translate([
          0.5*END_STOP_THICKNESS+0.5*shield_width,
          control_cylinder_center - 15.5*mm,
          -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_MIDDLE_HEIGHT + 1*cm - 6*mm
        ])
        rotate([45,0,0])
        cube([2*cm, 2*cm, 2*cm], center = true);

        translate([
          0.5*END_STOP_THICKNESS+0.5*shield_width,
          control_cylinder_center + 13*mm,
          -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_MIDDLE_HEIGHT + 1*cm - 4*mm
        ])
        rotate([-40,0,0])
        cube([2*cm, 2*cm, 2*cm], center = true);
      }

      translate([
        0.5*END_STOP_THICKNESS+0.5*shield_width,
        control_cylinder_center - 7*mm,
        -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_MIDDLE_HEIGHT - 11*mm
      ])
      rotate([20,0,0])
      cube([2*cm, 2*cm, 2*cm], center = true);

      translate([
        0.5*END_STOP_THICKNESS+0.5*shield_width,
        control_cylinder_center + 7*mm,
        -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_MIDDLE_HEIGHT - 11*mm
      ])
      rotate([-20,0,0])
      cube([2*cm, 2*cm, 2*cm], center = true);
      
      // middle divider trim block
      translate([
        0,
        0,
        -50*cm - CONTROL_CYLINDER_DIAMETER - GUIDE_FRAME_MIDDLE_HEIGHT + RELEASE_PAWL_GEAR_RADIUS + 0.5*mm
      ])
      cube([100*cm, 100*cm, 100*cm], center = true);

      // release pawl clearance disk
      // YES using SELECTOR_RATCHET_GEAR_THICKNESS is correct here!
      // we need to cut away the vertical columns only, not the top guard profile
      translate([
        -50*cm + 0.5*END_STOP_THICKNESS + SCREW_CLEARANCE + SELECTOR_RATCHET_GEAR_THICKNESS + 1*mm,
        control_cylinder_center,
        -CONTROL_CYLINDER_DIAMETER - GUIDE_FRAME_MIDDLE_HEIGHT
      ])
      difference() {
        rotate([0,90,0])
        cylinder(r = RELEASE_PAWL_GEAR_RADIUS + 7*mm, h = 100*cm, center = true);

        translate([0, 5*cm, 0])
        cube([200*cm, 10*cm, 10*cm], center = true);
      }

      // selector ratchet insertion clearance block
      translate([
        -50*cm + 0.5*END_STOP_THICKNESS + SCREW_CLEARANCE + SELECTOR_RATCHET_GEAR_THICKNESS + 1*mm,
        50*cm + control_cylinder_center,
        -SELECTOR_RATCHET_GEAR_RADIUS - 0*mm
      ])
      cube([100*cm, 100*cm, 100*cm], center =  true);

      // selector ratchet clearance disk
      translate([
        -50*cm + 0.5*END_STOP_THICKNESS + SCREW_CLEARANCE + SELECTOR_RATCHET_GEAR_THICKNESS + 1*mm,
        control_cylinder_center,
        0
      ])
      rotate([0,90,0])
      cylinder(r = SELECTOR_RATCHET_GEAR_RADIUS + 1*mm, h = 100*cm, center = true);
    }
  }
}

module guide_frame_indexing_layer_no_screw_mounts() {
  //
    // top margin
    //
    translate([0,0,GUIDE_FRAME_HEIGHT/2+GUIDE_FRAME_TOP_MARGIN/2])
    cube([
        GUIDE_FRAME_INDEXING_LAYER_THICKNESS,
        GUIDE_FRAME_WIDTH,
        GUIDE_FRAME_TOP_MARGIN
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
        GUIDE_FRAME_MIDDLE_HEIGHT/2
        + GUIDE_FRAME_HEIGHT/2
        - HEDDLE_ROD_RISE
        - HEDDLE_ROD_SEGMENT_SEPARATION
        - HEDDLE_ROD_MINI_DETENT_SIZE
    ])
    cube([
        GUIDE_FRAME_INDEXING_LAYER_THICKNESS,
        GUIDE_FRAME_WIDTH,
        GUIDE_FRAME_MIDDLE_HEIGHT
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
        -GUIDE_FRAME_BOTTOM_MARGIN/2
        - 1.5*GUIDE_FRAME_HEIGHT
        - GUIDE_FRAME_MIDDLE_HEIGHT
    ])
    cube([
        GUIDE_FRAME_INDEXING_LAYER_THICKNESS,
        GUIDE_FRAME_WIDTH,
        GUIDE_FRAME_BOTTOM_MARGIN
    ], center = true);
}

module guide_frame_indexing_layer_full_single_body() {
    guide_frame_indexing_layer_no_screw_mounts();

    // indexing screw mounts
    t = INDEXING_SPRING_HOLE_LENGTH
      - (GUIDE_FRAME_WIDTH - CONTROL_CYLINDER_RADIUS)
      + 5*mm; // 5mm for the threaded insert
    
    translate([
      0,
      0.5*GUIDE_FRAME_WIDTH + 0.5*t,
      0
    ])
    cube([GUIDE_FRAME_INDEXING_LAYER_THICKNESS, t, GUIDE_FRAME_INDEXING_LAYER_THICKNESS], center = true);

    translate([
      0,
      0.5*GUIDE_FRAME_WIDTH + 0.5*t,
      - GUIDE_FRAME_HEIGHT
      - GUIDE_FRAME_MIDDLE_HEIGHT
    ])
    cube([GUIDE_FRAME_INDEXING_LAYER_THICKNESS, t, GUIDE_FRAME_INDEXING_LAYER_THICKNESS], center = true);
}

module guide_frame_indexing_layer_holes() {
    guide_frame_control_cylinder_holes();

    t = INDEXING_SPRING_HOLE_LENGTH
      - (GUIDE_FRAME_WIDTH - CONTROL_CYLINDER_RADIUS);
    
    // spring holes
    l = 100*cm;

    rotate([90,0,0])
    cylinder(d = INDEXING_SPRING_THREADED_INSERT_DIAMETER-1*mm, h = 100*cm, center = true);
    
    translate([
      0,
      -0.5*l
      + 0.5*GUIDE_FRAME_WIDTH
      + t,
      0])
    cube([INDEXING_SPRING_HOLE_SIZE,l,INDEXING_SPRING_HOLE_SIZE], center = true);

    translate([
      0,
      0,
      - GUIDE_FRAME_HEIGHT
      - GUIDE_FRAME_MIDDLE_HEIGHT
    ]) {
      rotate([90,0,0])
      cylinder(d = INDEXING_SPRING_THREADED_INSERT_DIAMETER-1*mm, h = 100*cm, center = true);
      
      translate([
        0,
        -0.5*l
        + 0.5*GUIDE_FRAME_WIDTH
        + t,
        0
      ])
      cube([INDEXING_SPRING_HOLE_SIZE,l,INDEXING_SPRING_HOLE_SIZE], center = true);
    }
}

module guide_frame_indexing_layer() {
  difference() {
    guide_frame_indexing_layer_full_single_body();

    guide_frame_indexing_layer_holes();
  }
}

module guide_frame_cover_indexing_layer() {
  difference() {
    guide_frame_indexing_layer_no_screw_mounts();

    guide_frame_control_cylinder_holes();
  }
}

module guide_frame_control_cylinder_sidewall_compensation() {
  difference() {
    translate([
      0,
      0,
      -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_MIDDLE_HEIGHT
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
      - GUIDE_FRAME_MIDDLE_HEIGHT
  ])
  rotate([0,90,0])
  cylinder(r = CONTROL_CYLINDER_AXLE_RADIUS+PROCESS_DELTA, h = 100*cm, center = true);
}

module guide_frame_control_cylinder_bearing_body() {
  difference() {
    translate([
      0,
      0,
      -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_MIDDLE_HEIGHT
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
      -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_MIDDLE_HEIGHT
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
  //   -0.5*END_STOP_HEIGHT + CONTROL_CYLINDER_RADIUS + GUIDE_FRAME_TOP_MARGIN
  // ])
  // cube([END_STOP_THICKNESS,end_plate_width,END_STOP_HEIGHT], center=true);

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
      0.5*END_STOP_THICKNESS+0.5*shield_width-0.5*mm,
      CONTROL_CYLINDER_CENTER_OFFSET - 2*mm,
      -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_MIDDLE_HEIGHT - 2*mm
    ])
    translate([0,0,5*mm])
    cube([shield_width, 4*cm, 1*cm], center = true);

    // inner profile
    
    difference() {
      translate([
        0.5*END_STOP_THICKNESS+0.5*shield_width,
        CONTROL_CYLINDER_CENTER_OFFSET,
        -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_MIDDLE_HEIGHT - 6*mm
      ])
      cube([2*cm, 2*cm, 2*cm], center = true);

      translate([
        0.5*END_STOP_THICKNESS+0.5*shield_width,
        CONTROL_CYLINDER_CENTER_OFFSET - 15.5*mm,
        -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_MIDDLE_HEIGHT + 1*cm - 6*mm
      ])
      rotate([45,0,0])
      cube([2*cm, 2*cm, 2*cm], center = true);

      translate([
        0.5*END_STOP_THICKNESS+0.5*shield_width,
        CONTROL_CYLINDER_CENTER_OFFSET + 13*mm,
        -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_MIDDLE_HEIGHT + 1*cm - 4*mm
      ])
      rotate([-40,0,0])
      cube([2*cm, 2*cm, 2*cm], center = true);
    }

    translate([
      0.5*END_STOP_THICKNESS+0.5*shield_width,
      CONTROL_CYLINDER_CENTER_OFFSET - 7*mm,
      -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_MIDDLE_HEIGHT - 11*mm
    ])
    rotate([20,0,0])
    cube([2*cm, 2*cm, 2*cm], center = true);

    translate([
      0.5*END_STOP_THICKNESS+0.5*shield_width,
      CONTROL_CYLINDER_CENTER_OFFSET + 7*mm,
      -CONTROL_CYLINDER_RADIUS-0.5*GUIDE_FRAME_MIDDLE_HEIGHT - 11*mm
    ])
    rotate([-20,0,0])
    cube([2*cm, 2*cm, 2*cm], center = true);
    
    // middle divider trim block
    translate([
      0,
      0,
      -50*cm - CONTROL_CYLINDER_DIAMETER - GUIDE_FRAME_MIDDLE_HEIGHT + RELEASE_PAWL_GEAR_RADIUS + 0.5*mm
    ])
    cube([100*cm, 100*cm, 100*cm], center = true);

    // release pawl clearance disk
    // YES using SELECTOR_RATCHET_GEAR_THICKNESS is correct here!
    // we need to cut away the vertical columns only, not the top guard profile
    translate([
      -50*cm + 0.5*END_STOP_THICKNESS + SCREW_CLEARANCE + SELECTOR_RATCHET_GEAR_THICKNESS + 1*mm,
      CONTROL_CYLINDER_CENTER_OFFSET,
      -CONTROL_CYLINDER_DIAMETER - GUIDE_FRAME_MIDDLE_HEIGHT
    ])
    difference() {
      rotate([0,90,0])
      cylinder(r = RELEASE_PAWL_GEAR_RADIUS + 7*mm, h = 100*cm, center = true);

      translate([0, 5*cm, 0])
      cube([200*cm, 10*cm, 10*cm], center = true);
    }

    // selector ratchet insertion clearance block
    translate([
      -50*cm + 0.5*END_STOP_THICKNESS + SCREW_CLEARANCE + SELECTOR_RATCHET_GEAR_THICKNESS + 1*mm,
      50*cm + CONTROL_CYLINDER_CENTER_OFFSET,
      -SELECTOR_RATCHET_GEAR_RADIUS - 0*mm
    ])
    cube([100*cm, 100*cm, 100*cm], center =  true);

    // selector ratchet clearance disk
    translate([
      -50*cm + 0.5*END_STOP_THICKNESS + SCREW_CLEARANCE + SELECTOR_RATCHET_GEAR_THICKNESS + 1*mm,
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
    CONTROL_CYLINDER_RADIUS + GUIDE_FRAME_TOP_MARGIN - screw_hole_center_offset
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
    CONTROL_CYLINDER_RADIUS + GUIDE_FRAME_TOP_MARGIN - screw_hole_center_offset
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
    CONTROL_CYLINDER_RADIUS + GUIDE_FRAME_TOP_MARGIN - screw_hole_center_offset
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
    - 0.5*GUIDE_FRAME_MIDDLE_HEIGHT
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
    - 0.5*GUIDE_FRAME_MIDDLE_HEIGHT
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
    - 0.5*GUIDE_FRAME_MIDDLE_HEIGHT
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
    - GUIDE_FRAME_MIDDLE_HEIGHT
    - GUIDE_FRAME_BOTTOM_MARGIN
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
    - GUIDE_FRAME_MIDDLE_HEIGHT
    - GUIDE_FRAME_BOTTOM_MARGIN
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
    - GUIDE_FRAME_MIDDLE_HEIGHT
    - GUIDE_FRAME_BOTTOM_MARGIN
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
      translate([HEDDLE_COUNT*GUIDE_FRAME_SINGLE_SEPARATION + 0.5*GUIDE_FRAME_THICKNESS - GUIDE_FRAME_SIDEWALL_THICKNESS,0,0])
      guide_frame_indexing_layer();

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
        #pawl_guard();
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
      #cube([20*cm, 20*cm, 20*cm], center = true);
    } else {
      translate([
        -10*cm
        + 2*mm
        ,
        0,
        0
      ])
      #cube([20*cm, 20*cm, 20*cm], center = true);
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

        s = BALL_DIAMETER+PROCESS_DELTA;
        if (!is_release_cylinder) {
          translate([0,CONTROL_CYLINDER_RADIUS,0])
          scale([1,s,s])
          rotate([45,0,0])
          cube([
              100,1/sqrt(2),1/sqrt(2)
          ], center = true);
        }
    }
}

module control_cylinder(is_release_cylinder = false) {
  // control discs
  rotate([+CONTROL_CYLINDER_BALL_DETENT_ANGLE,0,0])
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
      control_cylinder_single(is_release_cylinder);
    }

    s = BALL_DIAMETER+PROCESS_DELTA;
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

    // indexing gear teeth
    translate([-5*cm - 0.5*END_STOP_THICKNESS,0,0])
    for (i = [1:INDEXING_DETENT_COUNT]) {
      s = BALL_DIAMETER+PROCESS_DELTA;
      rotate([(i-1)*INDEXING_DETENT_ANGLE,0,0])
      translate([0,CONTROL_CYLINDER_RADIUS,0])
      scale([1,s,s])
      rotate([45,0,0])
      cube([
          100*cm,1/sqrt(2),1/sqrt(2)
      ], center = true);
    }
  }

  
  // grooves and caps (disks and gears)

  total_control_cylinder_heddle_length =
    HEDDLE_COUNT * CONTROL_CYLINDER_LENGTH
    + INDEXING_GEAR_THICKNESS;
  
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
    // thin sidewall
    translate([-0.5*CONTROL_CYLINDER_SIDEWALL_THICKNESS,0,0])
    rotate([0,90,0])
    cylinder(r = CONTROL_CYLINDER_RADIUS, h = CONTROL_CYLINDER_SIDEWALL_THICKNESS, center = true);

    translate([-CONTROL_CYLINDER_SIDEWALL_THICKNESS, 0, 0]) {
      // double cone axle
      translate([-0.5*CONTROL_CYLINDER_AXLE_LENGTH,0,0])
      intersection() {
        cube([CONTROL_CYLINDER_AXLE_LENGTH, 10*cm, 10*cm], center = true);
        double_cone_reference();
      }

      // cylindrical axle
      // translate([-0.5*CONTROL_CYLINDER_AXLE_LENGTH,0,0])
      // rotate([0,90,0])
      // cylinder(r = CONTROL_CYLINDER_AXLE_RADIUS, h = CONTROL_CYLINDER_AXLE_LENGTH, center = true);

      // raiser disk (also for screw clearance)
      translate([-CONTROL_CYLINDER_AXLE_LENGTH - 0.5*SCREW_CLEARANCE,0,0])
      rotate([0,90,0])
      cylinder(r = CONTROL_CYLINDER_RADIUS, h = SCREW_CLEARANCE, center = true);
    }
  }

  if (is_release_cylinder) {
      // pawl
      rotate([-90,0,0])
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
        pawl_stiffness = 1*mm;
        pawl_tooth_width = 4*mm;
        pawl_tooth_thickness = 7*mm;
        pawl_spacing_thickness = 1*mm + pawl_tooth_thickness;
        pawl_stiffness_spacing = 1.5*mm;
        spring_half_cycle_length = 4*mm;

        
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
              cylinder(r = RELEASE_PAWL_GEAR_RADIUS - 2*mm, h = pawl_spacing_thickness + 2*mm, center = true);

            }

            brace_height = 5*mm;
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
            58*mm])
          cube([
            pawl_spacing_thickness + 1*mm,
            pawl_tooth_width + 1*mm,
            10*cm
          ],
          center = true);
        }
        
        difference() {
          translate([-0.5*pawl_thickness + 0.5*RELEASE_PAWL_GEAR_THICKNESS,0,0])
          rotate([90,0,0])
          rotate([0,90,0])
          flat_spring(n = 2, w = 2*cm, l = spring_half_cycle_length, t = pawl_thickness, s = pawl_stiffness);

          translate([0,-5.1*cm,5*cm+1.5*4*mm])
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
            2*spring_half_cycle_length + RELEASE_PAWL_TOOTH_HEIGHT - 2*mm
          ])
          rotate([-45,0,0])
          translate([0,0,1*cm])
          cube([2*cm, 2*cm, 2*cm], center = true);

          // notch in pawl tooth to fit it under the cylinder loop
          // translate([
          //   0.5*RELEASE_PAWL_GEAR_THICKNESS + 1*cm - 2*mm,
          //   0,
          //   RELEASE_PAWL_GEAR_RADIUS + 1*cm - 2.5*mm
          // ])
          // cube([2*cm, 2*cm, 2*cm], center = true);
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
        scale([1,sqrt(2)*s,0.5*sqrt(2)*s])
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

// translate([0,-BALL_DIAMETER,0])
// ball();

// %guide_frame_holes();


// raised = true;
// translate([
//   0,
//   0,
//   -HEDDLE_ROD_2_LENGTH
//   + CONTROL_CYLINDER_RADIUS
//   + GUIDE_FRAME_TOP_MARGIN
//   + (raised ? HEDDLE_ROD_RISE : 0)
// ])
// // // heddle_rod();
// heddle_rod_2();

// intersection() {
// translate([0,-CONTROL_CYLINDER_CENTER_OFFSET,0])
//guide_frame();

// translate([0,-23.5*mm,0])
// guide_frame_cover(indexing_end = false);

// reference for reset cam LOWEST extent
// translate([
//   0,
//   0,
//   CONTROL_CYLINDER_RADIUS
//   + GUIDE_FRAME_TOP_MARGIN
//   + HEDDLE_ROD_RISE
//   + HEDDLE_ROD_CAP_HEIGHT
// ])
// rotate([0,90,0])
// #cylinder(d = 0.5*mm, h = 100*cm, center = true);

// reference for reset cam LOWEST extent when 
// translate([
//   0,
//   0,
//   CONTROL_CYLINDER_RADIUS
//   + GUIDE_FRAME_TOP_MARGIN
//   + HEDDLE_ROD_CAP_HEIGHT
// ])
// rotate([0,90,0])
// #cylinder(d = 0.5*mm, h = 100*cm, center = true);

// translate([-0*mm,4*mm,-0*mm])
// #cube([7*mm, 1*cm, 15*cm], center = true);
// }

// translate([50*mm, 0, 0])
// %cube([2*mm, 1*mm, 10*mm], center = true);


// end stop
// intersection() {
total_control_cylinder_heddle_length =
    HEDDLE_COUNT * CONTROL_CYLINDER_LENGTH
    + INDEXING_GEAR_THICKNESS;
translate([
  total_control_cylinder_heddle_length-0.1,
  0,
  0
])
guide_frame_end_plate();

// translate([0,0,-1.7*cm])
// cube([100*cm, 5*cm, 2*cm], center = true);
// }

// translate([0,END_PLATE_MOUNTING_HOLE_TMB_Y,END_PLATE_MOUNTING_HOLE_T_Z])
// rotate([0,90,0])
// #cylinder(r = END_PLATE_MOUNTING_SCREW_HOLE_RADIUS, h = 10*cm, center = true);

// translate([0,END_PLATE_MOUNTING_HOLE_TMB_Y,END_PLATE_MOUNTING_HOLE_M_Z])
// rotate([0,90,0])
// #cylinder(r = END_PLATE_MOUNTING_SCREW_HOLE_RADIUS, h = 10*cm, center = true);

// translate([-11.5*cm,0,0])
// intersection() {
// rotate([-8*CONTROL_CYLINDER_BALL_DETENT_ANGLE,0,0])
// translate([0,CONTROL_CYLINDER_CENTER_OFFSET,0])
// control_cylinder(is_release_cylinder = false);

// translate([0,CONTROL_CYLINDER_CENTER_OFFSET,-CONTROL_CYLINDER_DIAMETER-GUIDE_FRAME_MIDDLE_HEIGHT])
// rotate([-0.5*CONTROL_CYLINDER_BALL_DETENT_ANGLE,0,0])
// control_cylinder(is_release_cylinder = true);

// translate([1.5*cm,0,0])
// #cube([4.4*cm, 5*cm, 20*cm], center = true);
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