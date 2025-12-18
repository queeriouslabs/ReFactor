$fn = 64;

mm = 1;
cm = 10*mm;

PROCESS_DELTA = 0.1*mm;

HOOK_LENGTH = 15*cm;
HOOK_SIZE = 3*mm;
HOOK_THICKNESS = 7*mm;
HOOK_TRAVEL = 2*cm;
HOOK_LOOP_LENGTH = 2*cm;
HOOK_LOOP_ANGLE = 20;
HOOK_LOOP_SIZE = 6.2*mm;
HOOK_HANGER_LENGTH = 1*mm;
HOOK_HANGER_HEIGHT = 2*mm;
HOOK_COUNT = 20;
HOOK_BLOCK_MOUNTING_STRUT_HOLE_SIZE = 4.5*mm;
HOOK_BLOCK_TOP_BOTTOM_MARGIN = 5*mm;
HOOK_CONTROL_ROD_SIZE = HOOK_SIZE;
HOOK_CONTROL_ROD_HEIGHT = 7*mm;
HOOK_CONTROL_ROD_LENGTH_CLEARANCE = 0.2*mm;
HOOK_CONTROL_ROD_WIDTH_CLEARANCE = 0.5*mm;
HOOK_CONTROL_ROD_GRIP_THICKNESS = 1*mm;
HOOK_CONTROL_ROD_TRAVEL = 2*cm;
// HOOK_CONTROL_ROD_HOLDER_DIAMETER = HOOK_CONTROL_ROD_SIZE + 2*HOOK_CONTROL_ROD_CLEARANCE + 2*HOOK_CONTROL_ROD_GRIP_THICKNESS;
HOOK_CONTROL_ROD_HOLDER_WALL_THICKNESS = 1*mm;
HOOK_CONTROL_ROD_BEARING_SIZE = HOOK_THICKNESS + 2*HOOK_CONTROL_ROD_HOLDER_WALL_THICKNESS + 2*HOOK_CONTROL_ROD_LENGTH_CLEARANCE;
HOOK_SEPARATION = HOOK_CONTROL_ROD_SIZE + HOOK_CONTROL_ROD_HOLDER_WALL_THICKNESS + 1*mm;
HOOK_BLOCK_INTERIOR_DEPTH = HOOK_CONTROL_ROD_BEARING_SIZE + HOOK_CONTROL_ROD_TRAVEL;
HOOK_CONTROL_ROD_LENGTH = HOOK_BLOCK_INTERIOR_DEPTH + 3*HOOK_CONTROL_ROD_TRAVEL;
HOOK_BLOCK_HEIGHT = HOOK_CONTROL_ROD_SIZE + 2*HOOK_BLOCK_TOP_BOTTOM_MARGIN;
HOOK_BLOCK_MOUNTING_STRUT_SIZE = HOOK_BLOCK_HEIGHT;
HOOK_BLOCK_MOUNTING_STRUT_INTERIOR_SIZE = 7*mm;
HOOK_BLOCK_LENGTH = HOOK_COUNT*HOOK_SIZE + (HOOK_COUNT+1)*HOOK_SEPARATION + 2*HOOK_BLOCK_MOUNTING_STRUT_SIZE;
HOOK_BLOCK_WALL_THICKNESS = 5*mm;
HOOK_BLOCK_ROD_CLEARANCE = 0.5*mm;
KNIFE_GUIDE_SIZE = 5*mm;
KNIFE_GUIDE_CUFF_LENGTH = 4*cm;
KNIFE_HANG_LOOP_LENGTH = 2*cm;
KNIFE_GUIDE_INITIAL_SEPARATION = 2*mm;
KNIFE_GUIDE_SEPARATION = 5*mm;
KNIFE_THICKNESS = 5*mm;
KNIFE_HEIGHT = 1*cm;
KNIFE_GUIDE_HOLE_DIAMETER = sqrt(2)*KNIFE_GUIDE_SIZE+0.5*mm;
KNIFE_GUIDE_CUFF_SIZE = KNIFE_GUIDE_HOLE_DIAMETER + 2*mm;
KNIFE_LENGTH = HOOK_BLOCK_LENGTH - KNIFE_GUIDE_SIZE + KNIFE_GUIDE_CUFF_SIZE;
HOOK_HANGER_CLEARANCE = 1*cm;
HOOK_HANGER_OFFSET = HOOK_LENGTH - HOOK_HANGER_HEIGHT - HOOK_SIZE - HOOK_LOOP_LENGTH - KNIFE_HEIGHT - HOOK_HANGER_CLEARANCE;
KNIFE_GUIDE_LENGTH = KNIFE_GUIDE_CUFF_LENGTH + HOOK_TRAVEL + KNIFE_HANG_LOOP_LENGTH + HOOK_HANGER_CLEARANCE + HOOK_LOOP_LENGTH;
FRAME_MOUNTING_SCREW_DIAMETER = 3*mm;
FRAME_MOUNTING_HOLE_DIAMETER = FRAME_MOUNTING_SCREW_DIAMETER + 1*mm;
THREAD_SLOT_HOLE_DIAMETER = 1*mm;
THREAD_SLOT_HOLE_INSET = 7*mm;
THREAD_SLOT_LENGTH = 3*mm;
THREAD_GUIDE_LENGTH = 17*cm;
THREAD_GUIDE_FLAT_WIDTH = 3*cm;
THREAD_GUIDE_RADIUS = 1*cm;
FRAME_SIZE = 15*mm;
FRAME_SCREW_DIAMETER = 3*mm;

module heddle_rod() {
  cube
    ( [ 2*mm
      , 6*mm
      , 5*cm
      ]
    , center = true
    );
}

module heddle_rod_2() {
  cube
    ( [ 5*cm
      , 2*mm
      , 2*mm
      ]
    , center = true
    );
  
  translate([1*cm,2*mm,0])
  cube([ 2*mm, 2*mm, 2*mm ], center = true);

  translate([-1*cm,0,2*mm])
  cube([ 2*mm, 2*mm, 2*mm ], center = true);
}

module selector_rod() {
  cube
    ( [ 14*cm
      , 2*mm
      , 8*mm
      ]
    , center = true
    );
}

module hook() {
  difference() {
    cube
      ( [ HOOK_THICKNESS
        , HOOK_LENGTH
        , HOOK_SIZE
        ]
      );
    
    translate
      ( [ 0.5*HOOK_THICKNESS
        , 0
        , 0
        ]
      )
    cylinder
      ( d = 2*THREAD_SLOT_HOLE_DIAMETER
      , h = 10*cm
      , center = true
      , $fn = 4
      );
    
    translate
      ( [ 0.5*HOOK_THICKNESS
        ,THREAD_SLOT_HOLE_INSET
        , 0
        ]
      )
    cylinder
      ( d = 2*THREAD_SLOT_HOLE_DIAMETER
      , h = 10*cm
      , center = true
      , $fn = 4
      );
    
    translate
      ( [ 0.5*HOOK_THICKNESS
        , THREAD_SLOT_HOLE_INSET - 0.5*THREAD_SLOT_LENGTH
        , 0
        ]
      )
    cube
      ( [ 0.5*THREAD_SLOT_HOLE_DIAMETER
        , THREAD_SLOT_LENGTH
        , 10*cm
        ]
      , center = true
      );
  }
  
  translate
    ( [ 0
      , HOOK_HANGER_OFFSET
      , HOOK_SIZE
      ]
    )
  cube
    ( [ HOOK_THICKNESS
      , HOOK_HANGER_HEIGHT
      , HOOK_HANGER_HEIGHT
      ]
    );
  
  translate
    ( [ HOOK_THICKNESS
      , HOOK_LENGTH - HOOK_LOOP_LENGTH
      , 0
      ]
    )
  difference() {
    cube
      ( [ HOOK_LOOP_SIZE
        , HOOK_LOOP_LENGTH
        , HOOK_SIZE
        ]
      );

    translate([0,HOOK_LOOP_LENGTH-HOOK_SIZE,0])
    rotate([0,0,HOOK_LOOP_ANGLE])
    translate([-5*cm,0,0])
    cube([10*cm,10*cm,10*cm], center = true);

    translate([HOOK_SIZE,HOOK_LOOP_LENGTH-HOOK_SIZE,0])
    rotate([0,0,HOOK_LOOP_ANGLE])
    translate([5*cm,0,0])
    cube([10*cm,10*cm,10*cm], center = true);
  }
}

module hook_control_rod() {
  difference() {
    union() {
      cube
        ( [ HOOK_CONTROL_ROD_SIZE
          , HOOK_CONTROL_ROD_LENGTH
          , HOOK_CONTROL_ROD_HEIGHT
          ]
        , center = true
        );
      
      s = HOOK_CONTROL_ROD_SIZE + HOOK_SIZE + HOOK_CONTROL_ROD_HOLDER_WALL_THICKNESS + 2*HOOK_CONTROL_ROD_WIDTH_CLEARANCE;
      h = 0.5*HOOK_BLOCK_HEIGHT + 0.5*HOOK_CONTROL_ROD_HEIGHT;
      translate([0.5*s - 0.5*HOOK_CONTROL_ROD_SIZE,0,0.5*h-0.5*HOOK_CONTROL_ROD_HEIGHT])
      cube
        ( [ s
          , HOOK_CONTROL_ROD_BEARING_SIZE
          , h
          ]
        , center = true
        );
    }

    translate([0.5*HOOK_CONTROL_ROD_SIZE + 0.5*HOOK_SIZE + HOOK_CONTROL_ROD_WIDTH_CLEARANCE,0,0])
    cube
      ( [ HOOK_SIZE + 2*HOOK_CONTROL_ROD_WIDTH_CLEARANCE
        , HOOK_THICKNESS + 2*HOOK_CONTROL_ROD_LENGTH_CLEARANCE
        , 10*cm
        ]
      , center = true
      );
    
    translate
      ( [ 0
        , 0.5*HOOK_CONTROL_ROD_LENGTH
        , 0
        ]
      )
    rotate([0,90,0])
    cylinder
      ( d = 2*THREAD_SLOT_HOLE_DIAMETER
      , h = 10*cm
      , center = true
      , $fn = 4
      );
    
    // translate
    //   ( [ 0
    //     , 0.5*HOOK_CONTROL_ROD_LENGTH - THREAD_SLOT_HOLE_INSET
    //     , -0.75*THREAD_SLOT_HOLE_DIAMETER
    //     ]
    //   )
    // rotate([0,90,0])
    // #cylinder
    //   ( d = 2*THREAD_SLOT_HOLE_DIAMETER
    //   , h = 10*cm
    //   , center = true
    //   , $fn = 4
    //   );
    
    // translate
    //   ( [ 0
    //     , 0.5*HOOK_CONTROL_ROD_LENGTH - THREAD_SLOT_HOLE_INSET + THREAD_SLOT_HOLE_DIAMETER
    //     , -0.25*THREAD_SLOT_HOLE_DIAMETER
    //     ]
    //   )
    // rotate([0,90,0])
    // cylinder
    //   ( d = THREAD_SLOT_HOLE_DIAMETER
    //   , h = 10*cm
    //   , center = true
    //   , $fn = 4
    //   );
  
    translate
      ( [ 0
        , -1*mm+0.5*HOOK_CONTROL_ROD_LENGTH - THREAD_SLOT_HOLE_INSET
        , 5*cm-0.25*THREAD_SLOT_HOLE_DIAMETER
        ]
      )
    cube([10*cm,2*mm,10*cm], center = true);
    
    translate
      ( [ 0
        , 0.5*HOOK_CONTROL_ROD_LENGTH - THREAD_SLOT_HOLE_INSET + 0.5*THREAD_SLOT_LENGTH
        , 0
        ]
      )
    cube
      ( [ 10*cm
        , THREAD_SLOT_LENGTH
        , 0.5*THREAD_SLOT_HOLE_DIAMETER
        ]
      , center = true
      );
    
    translate
      ( [ 0
        , -0.5*HOOK_CONTROL_ROD_LENGTH
        , 0
        ]
      )
    rotate([0,90,0])
    cylinder
      ( d = 2*THREAD_SLOT_HOLE_DIAMETER
      , h = 10*cm
      , center = true
      , $fn = 4
      );
    
    // translate
    //   ( [ 0
    //     , -0.5*HOOK_CONTROL_ROD_LENGTH + THREAD_SLOT_HOLE_INSET
    //     , -0.75*THREAD_SLOT_HOLE_DIAMETER
    //     ]
    //   )
    // rotate([0,90,0])
    // #cylinder
    //   ( d = 2*THREAD_SLOT_HOLE_DIAMETER
    //   , h = 10*cm
    //   , center = true
    //   , $fn = 4
    //   );
    
    // translate
    //   ( [ 0
    //     , -0.5*HOOK_CONTROL_ROD_LENGTH + THREAD_SLOT_HOLE_INSET - THREAD_SLOT_HOLE_DIAMETER
    //     , -0.25*THREAD_SLOT_HOLE_DIAMETER
    //     ]
    //   )
    // rotate([0,90,0])
    // cylinder
    //   ( d = THREAD_SLOT_HOLE_DIAMETER
    //   , h = 10*cm
    //   , center = true
    //   , $fn = 4
    //   );

    translate
      ( [ 0
        , 1*mm-0.5*HOOK_CONTROL_ROD_LENGTH + THREAD_SLOT_HOLE_INSET
        , 5*cm-0.25*THREAD_SLOT_HOLE_DIAMETER
        ]
      )
    cube([10*cm,2*mm,10*cm], center = true);
    
    translate
      ( [ 0
        , -0.5*HOOK_CONTROL_ROD_LENGTH + THREAD_SLOT_HOLE_INSET - 0.5*THREAD_SLOT_LENGTH
        , 0
        ]
      )
    cube
      ( [ 10*cm
        , THREAD_SLOT_LENGTH
        , 0.5*THREAD_SLOT_HOLE_DIAMETER
        ]
      , center = true
      );
  }
  

}

module hook_block_guide_wall() {
  l = HOOK_COUNT*HOOK_SIZE + (HOOK_COUNT+1)*HOOK_SEPARATION;

  difference() {
    cube
      ( [ HOOK_BLOCK_LENGTH
        , HOOK_BLOCK_WALL_THICKNESS
        , HOOK_BLOCK_HEIGHT
        ,
        ]
      , center = true
      );
    
    for (i = [0:HOOK_COUNT-1])
    translate
      ( [ -0.5*l
          + (HOOK_SEPARATION + HOOK_SIZE)
          + i*(HOOK_SEPARATION + HOOK_SIZE)
          // - 0.5*HOOK_CONTROL_ROD_SIZE
        , 0
        , 0
        ]
      )
    cube
      ( [ HOOK_CONTROL_ROD_SIZE + HOOK_BLOCK_ROD_CLEARANCE
        , 10*cm
        , HOOK_CONTROL_ROD_HEIGHT + HOOK_BLOCK_ROD_CLEARANCE
        ]
      , center = true
      );
    

    translate
      ( [ -0.5*HOOK_BLOCK_LENGTH + 0.5*HOOK_BLOCK_MOUNTING_STRUT_SIZE
        , 0
        , 0
        ]
        )
    rotate([90,0,0])
    cylinder
      ( d = HOOK_BLOCK_MOUNTING_STRUT_HOLE_SIZE
      , h = 10*cm
      , center = true
      );
    
    translate
      ( [ 0.5*HOOK_BLOCK_LENGTH - 0.5*HOOK_BLOCK_MOUNTING_STRUT_SIZE
        , 0
        , 0
        ]
        )
    rotate([90,0,0])
    cylinder
      ( d = HOOK_BLOCK_MOUNTING_STRUT_HOLE_SIZE
      , h = 10*cm
      , center = true
      );
    
    // translate
    //   ( [ -5*cm - 0.5*HOOK_BLOCK_LENGTH + 0.5*HOOK_BLOCK_MOUNTING_STRUT_SIZE
    //     , 0
    //     , 0
    //     ]
    //   )
    // cube
    //   ( [ 10*cm
    //     , 10*cm
    //     , HOOK_BLOCK_MOUNTING_STRUT_HOLE_SIZE
    //     ]
    //   , center = true
    //   );
    
    // translate
    //   ( [ 5*cm + 0.5*HOOK_BLOCK_LENGTH - 0.5*HOOK_BLOCK_MOUNTING_STRUT_SIZE
    //     , 0
    //     , 0
    //     ]
    //   )
    // cube
    //   ( [ 10*cm
    //     , 10*cm
    //     , HOOK_BLOCK_MOUNTING_STRUT_HOLE_SIZE
    //     ]
    //   , center = true
    //   );
  }
}

module hook_block_mounting_strut(dir) {
  mounting_bracket_length
    = HOOK_BLOCK_INTERIOR_DEPTH
    + 2*HOOK_BLOCK_MOUNTING_STRUT_SIZE
    + 2*HOOK_BLOCK_WALL_THICKNESS
    + 1*cm;
  mirror([dir == "right" ? 1 : 0,0,0])
  difference() {
    union() {
      cube
        ( [ HOOK_BLOCK_MOUNTING_STRUT_SIZE
          , HOOK_BLOCK_INTERIOR_DEPTH
          , HOOK_BLOCK_MOUNTING_STRUT_SIZE
          ]
        , center = true
        );
      
      translate
        ( [ -0.5*KNIFE_GUIDE_LENGTH - 0.5*HOOK_BLOCK_MOUNTING_STRUT_SIZE
          , 0.5*HOOK_BLOCK_INTERIOR_DEPTH - 0.5*KNIFE_GUIDE_CUFF_SIZE - KNIFE_GUIDE_INITIAL_SEPARATION
          , 0.5*HOOK_BLOCK_MOUNTING_STRUT_SIZE - 0.5*KNIFE_GUIDE_SIZE
          ]
        )
      cube
        ( [ KNIFE_GUIDE_LENGTH
          , KNIFE_GUIDE_SIZE
          , KNIFE_GUIDE_SIZE
          ]
        , center = true
        );
      
      th = 5*mm;
      translate([0.5*th+0.5*HOOK_BLOCK_MOUNTING_STRUT_SIZE,0,0])
      cube
        ( [ th
          , mounting_bracket_length
          , HOOK_BLOCK_MOUNTING_STRUT_SIZE
          ]
        , center = true
        );
    }
  
    l2 = 9*mm;
    translate
      ( [ 0
        , -0.5*l2 + 0.5*HOOK_BLOCK_INTERIOR_DEPTH-2*mm
        , 5*cm-0.5*HOOK_BLOCK_MOUNTING_STRUT_SIZE+2*mm
        ]
      )
    cube
      ( [ HOOK_BLOCK_MOUNTING_STRUT_INTERIOR_SIZE
        , l2
        , 10*cm
        ]
      , center = true
      );
    
    translate
      ( [ 0
        , 0.5*l2 - 0.5*HOOK_BLOCK_INTERIOR_DEPTH+2*mm
        , 5*cm-0.5*HOOK_BLOCK_MOUNTING_STRUT_SIZE+2*mm
        ]
      )
    cube
      ( [ HOOK_BLOCK_MOUNTING_STRUT_INTERIOR_SIZE
        , l2
        , 10*cm
        ]
      , center = true
      );
    
    translate([0,5*cm+0.5*HOOK_BLOCK_INTERIOR_DEPTH-3*mm,0])
    rotate([90,0,0])
    cylinder
      ( d = HOOK_BLOCK_MOUNTING_STRUT_HOLE_SIZE
      , h = 10*cm
      , center = true
      );
    
    translate([0,-5*cm-0.5*HOOK_BLOCK_INTERIOR_DEPTH+3*mm,0])
    rotate([90,0,0])
    cylinder
      ( d = HOOK_BLOCK_MOUNTING_STRUT_HOLE_SIZE
      , h = 10*cm
      , center = true
      );
    
    translate([0,5*cm+0.5*HOOK_BLOCK_INTERIOR_DEPTH-3*mm,5*cm])
    cube
      ( [ HOOK_BLOCK_MOUNTING_STRUT_HOLE_SIZE
        , 10*cm
        , 10*cm
        ]
      , center = true
      );
    
    translate([0,-5*cm-0.5*HOOK_BLOCK_INTERIOR_DEPTH+3*mm,5*cm])
    cube
      ( [ HOOK_BLOCK_MOUNTING_STRUT_HOLE_SIZE
        , 10*cm
        , 10*cm
        ]
      , center = true
      );

    translate
      ( [ -0.5*HOOK_BLOCK_MOUNTING_STRUT_SIZE - KNIFE_GUIDE_LENGTH + 2*mm
        , 0.5*HOOK_BLOCK_INTERIOR_DEPTH - 0.5*KNIFE_GUIDE_CUFF_SIZE - KNIFE_GUIDE_INITIAL_SEPARATION
        , 0
        ]
      )
    rotate([0,0,-45])
    translate([-1*cm,-1*cm,0])
    cube([2*cm,2*cm,2*cm], center = true);

    translate
      ( [ 0
        , 0.5*mounting_bracket_length - 0.5*HOOK_BLOCK_MOUNTING_STRUT_SIZE
        , 0
        ]
      )
    rotate([0,90,0])
    cylinder
      ( d = FRAME_MOUNTING_HOLE_DIAMETER
      , h = 10*cm
      , center = true
      );
    
    translate
      ( [ 0
        , -0.5*mounting_bracket_length + 0.5*HOOK_BLOCK_MOUNTING_STRUT_SIZE
        , 0
        ]
      )
    rotate([0,90,0])
    cylinder
      ( d = FRAME_MOUNTING_HOLE_DIAMETER
      , h = 10*cm
      , center = true
      );
  }
}

module knife() {
  difference() {
    cube
      ( [ KNIFE_LENGTH
        , KNIFE_THICKNESS
        , KNIFE_HEIGHT
        ]
      , center = true
      );
    
    translate([0,0,-2*mm])
    rotate([HOOK_LOOP_ANGLE,0,0])
    translate([0,5*cm,0])
    cube([100*cm,10*cm,10*cm], center = true);
  }

  translate([-0.5*KNIFE_LENGTH+0.5*KNIFE_GUIDE_CUFF_SIZE,-0.5*KNIFE_GUIDE_CUFF_SIZE-0.5*KNIFE_THICKNESS,0.5*KNIFE_GUIDE_CUFF_LENGTH-5*mm])
  difference() {
    cube([KNIFE_GUIDE_CUFF_SIZE,KNIFE_GUIDE_CUFF_SIZE,KNIFE_GUIDE_CUFF_LENGTH], center = true);
    cylinder(d = KNIFE_GUIDE_HOLE_DIAMETER, h = 10*cm, center = true);
  }

  s = KNIFE_GUIDE_CUFF_SIZE + 2*mm;
  th = 0.4*mm;
  
  translate
    ( [ 0.5*KNIFE_LENGTH - 0.5*KNIFE_GUIDE_CUFF_SIZE
      , 0.5*th - 0.5*KNIFE_THICKNESS - KNIFE_GUIDE_CUFF_SIZE
      , -0.5*KNIFE_HEIGHT + KNIFE_GUIDE_CUFF_LENGTH + 0.5*KNIFE_HANG_LOOP_LENGTH
      ]
    )
  difference() {
    union() {
      cube
        ( [ s
          , th
          , KNIFE_HANG_LOOP_LENGTH - 0.5*s
          ]
        , center = true
        );
      
      translate([0,0,0.5*(KNIFE_HANG_LOOP_LENGTH-0.5*s)])
      rotate([90,0,0])
      cylinder
        ( d = s
        , h = th
        , center = true
        );
      
      translate([0,0,-0.5*(KNIFE_HANG_LOOP_LENGTH-0.5*s)])
      rotate([90,0,0])
      cylinder
        ( d = s
        , h = th
        , center = true
        );
    }

    s2 = KNIFE_GUIDE_SIZE+1*mm;
    cube
      ( [ s2
        , 10*cm
        , KNIFE_HANG_LOOP_LENGTH - 0.5*s
        ]
      , center = true
      );
    
    translate([0,0,0.5*(KNIFE_HANG_LOOP_LENGTH-0.5*s)])
      rotate([90,0,0])
      cylinder
        ( d = s2
        , h = 10*cm
        , center = true
        );
      
      translate([0,0,-0.5*(KNIFE_HANG_LOOP_LENGTH-0.5*s)])
      rotate([90,0,0])
      cylinder
        ( d = s2
        , h = 10*cm
        , center = true
        );
  }

  translate([0.5*KNIFE_LENGTH-0.5*KNIFE_GUIDE_CUFF_SIZE,-0.5*KNIFE_GUIDE_CUFF_SIZE-0.5*KNIFE_THICKNESS,0.5*KNIFE_GUIDE_CUFF_LENGTH-5*mm])
  difference() {
    cube([KNIFE_GUIDE_CUFF_SIZE,KNIFE_GUIDE_CUFF_SIZE,KNIFE_GUIDE_CUFF_LENGTH], center = true);
    cylinder(d = KNIFE_GUIDE_HOLE_DIAMETER, h = 10*cm, center = true);
  }

  translate
    ( [ -0.5*KNIFE_LENGTH + 0.5*KNIFE_GUIDE_CUFF_SIZE
      , 0.5*th - 0.5*KNIFE_THICKNESS - KNIFE_GUIDE_CUFF_SIZE
      , -0.5*KNIFE_HEIGHT + KNIFE_GUIDE_CUFF_LENGTH + 0.5*KNIFE_HANG_LOOP_LENGTH
      ]
    )
  difference() {
    union() {
      cube
        ( [ s
          , th
          , KNIFE_HANG_LOOP_LENGTH - 0.5*s
          ]
        , center = true
        );
      
      translate([0,0,0.5*(KNIFE_HANG_LOOP_LENGTH-0.5*s)])
      rotate([90,0,0])
      cylinder
        ( d = s
        , h = th
        , center = true
        );
      
      translate([0,0,-0.5*(KNIFE_HANG_LOOP_LENGTH-0.5*s)])
      rotate([90,0,0])
      cylinder
        ( d = s
        , h = th
        , center = true
        );
    }

    s2 = KNIFE_GUIDE_SIZE+1*mm;
    cube
      ( [ s2
        , 10*cm
        , KNIFE_HANG_LOOP_LENGTH - 0.5*s
        ]
      , center = true
      );
    
    translate([0,0,0.5*(KNIFE_HANG_LOOP_LENGTH-0.5*s)])
      rotate([90,0,0])
      cylinder
        ( d = s2
        , h = 10*cm
        , center = true
        );
      
      translate([0,0,-0.5*(KNIFE_HANG_LOOP_LENGTH-0.5*s)])
      rotate([90,0,0])
      cylinder
        ( d = s2
        , h = 10*cm
        , center = true
        );
  }
}

module thread_guide() {
  th = 1*mm;
  
  cube
    ( [ THREAD_GUIDE_LENGTH
      , THREAD_GUIDE_FLAT_WIDTH
      , th
      ]
    , center = true
    );
  
  difference() {
    translate
      ( [ 0
        , -FRAME_SIZE + 0.5*th
        , -0.5*FRAME_SIZE
        ]
      )
    cube
      ( [ THREAD_GUIDE_LENGTH
        , th
        , FRAME_SIZE
        ]
      , center = true
      );
    
    translate
      ( [ 0.5*THREAD_GUIDE_LENGTH - 1*cm
        , 0
        , -0.5*FRAME_SIZE
        ]
      )
    rotate([90,0,0])
    cylinder
      ( d = FRAME_SCREW_DIAMETER
      , h = 10*cm
      , center = true
      );
    
    translate
      ( [ -0.5*THREAD_GUIDE_LENGTH + 1*cm
        , 0
        , -0.5*FRAME_SIZE
        ]
      )
    rotate([90,0,0])
    cylinder
      ( d = FRAME_SCREW_DIAMETER
      , h = 10*cm
      , center = true
      );
  }
  
  translate
    ( [ 0
      , 0.5*THREAD_GUIDE_FLAT_WIDTH
      , -THREAD_GUIDE_RADIUS+0.5*th
      ]
    )
  rotate([0,90,0])
  difference() {
    cylinder
      ( r = THREAD_GUIDE_RADIUS
      , h = THREAD_GUIDE_LENGTH
      , center = true
      );
    
    cylinder
      ( r = THREAD_GUIDE_RADIUS - th
      , h = 2*THREAD_GUIDE_LENGTH
      , center = true
      );
    
    // translate
    //   ( [ 5*cm - THREAD_GUIDE_RADIUS + th
    //     , -5*cm
    //     , 0
    //     ]
    //   )
    // cube
    //   ( [ 10*cm
    //     , 10*cm
    //     , 2*THREAD_GUIDE_LENGTH
    //     ]
    //   , center = true
    //   );
  }
}

// heddle_rod_2();

// delta = 10*mm;
// for (i = [0:9])
// for (j = [0:19])
// translate([ j*delta, i*delta, 0 ])
// rotate([0,0,-45])
// translate
//   ( [ 0
//     , 2*mm
//     , 0
//     ]
//   )
// heddle_rod();

// for (i = [0:9])
// translate
//   ( [ 70*mm-1*mm
//     , 2.5*mm + i*delta
//     , 0
//     ]
//   )
// selector_rod();

// translate([0,-HOOK_SIZE-0.5*HOOK_BLOCK_WALL_THICKNESS-KNIFE_GUIDE_INITIAL_SEPARATION,-HOOK_HANGER_OFFSET+0.5*HOOK_CONTROL_ROD_SIZE])
// rotate([0,0,90])
// rotate([90,0,0])
// hook();

// intersection() {
// hook_block_guide_wall();

// translate([13*cm,0,0])
// cube([10*cm,10*cm,10*cm],center = true);
// }

// translate([-74.5*mm,-2*cm,0])
// color("red")
// rotate([0,0,180])
// hook_control_rod();

// intersection() {
// translate([0.5*HOOK_BLOCK_LENGTH-0.5*HOOK_BLOCK_MOUNTING_STRUT_SIZE,-0.5*HOOK_BLOCK_INTERIOR_DEPTH-0.5*HOOK_BLOCK_WALL_THICKNESS,0])
// rotate([0,90,0])
// hook_block_mounting_strut(dir = "left");

// translate([0,1*cm,0])
// cube([2*cm,2*cm,2*cm], center = true);
// }

// translate([-0.5*HOOK_BLOCK_LENGTH+0.5*HOOK_BLOCK_MOUNTING_STRUT_SIZE,-0.5*HOOK_BLOCK_INTERIOR_DEPTH-0.5*HOOK_BLOCK_WALL_THICKNESS,0])
// rotate([0,-90,0])
// hook_block_mounting_strut(dir = "right");


// translate([0,-KNIFE_GUIDE_INITIAL_SEPARATION,0.5*HOOK_BLOCK_HEIGHT+0.5*KNIFE_HEIGHT+HOOK_TRAVEL])
// knife();

// thread_guide();