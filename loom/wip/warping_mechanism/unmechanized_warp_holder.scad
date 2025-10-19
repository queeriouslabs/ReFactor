$fn = 64;

mm = 1;
cm = 10*mm;

FRAME_STOCK_SIZE = 15*mm;
HEDDLE_COUNT = 60;
WARP_SEPARATION = 1*mm;
WARP_BLOCK_WIDTH = 13*cm;
WARP_BLOCK_HEIGHT = 3*cm;
WARP_BLOCK_THICKNESS = 4*mm;
WARP_HOOK_HEIGHT = 5*mm;
MOUNT_THICKNESS = 5*mm;

difference() {
  union() {
    cube
      ( [ WARP_BLOCK_WIDTH
        , WARP_BLOCK_HEIGHT
        , WARP_BLOCK_THICKNESS
        ]
      , center = true
      );

    // mounting
    translate
      ( [ -15*mm
        , -0.5*WARP_BLOCK_HEIGHT + 0.5*FRAME_STOCK_SIZE
        , 0.5*WARP_BLOCK_THICKNESS+0.5*MOUNT_THICKNESS
        ]
      )
    cube
      ( [ 2*cm
        , FRAME_STOCK_SIZE
        , MOUNT_THICKNESS
        ]
      , center = true
      );
    
    translate
      ( [ 15*mm
        , -0.5*WARP_BLOCK_HEIGHT + 0.5*FRAME_STOCK_SIZE
        , 0.5*WARP_BLOCK_THICKNESS+0.5*MOUNT_THICKNESS
        ]
      )
    cube
      ( [ 2*cm
        , FRAME_STOCK_SIZE
        , MOUNT_THICKNESS
        ]
      , center = true
      );
  }

  // teeth
  for (i = [0:HEDDLE_COUNT-1]) {
    translate
      ( [ -(HEDDLE_COUNT - 1)*WARP_SEPARATION + i*2*WARP_SEPARATION
        , 0.5*WARP_BLOCK_HEIGHT+5*mm-WARP_HOOK_HEIGHT
        , 0
        ]
      )
    cube([WARP_SEPARATION,1*cm,1*cm], center = true);
  }

  // mounting screw inset
  translate
    ( [ -15*mm
      , -0.5*WARP_BLOCK_HEIGHT + 0.5*FRAME_STOCK_SIZE
      , -2*cm + 0.5*WARP_BLOCK_THICKNESS + MOUNT_THICKNESS - 1*mm
      ]
    )
  cylinder
    ( d = 1*cm
    , h = 4*cm
    , center = true
    );
  
  translate
    ( [ 15*mm
      , -0.5*WARP_BLOCK_HEIGHT + 0.5*FRAME_STOCK_SIZE
      , -2*cm + 0.5*WARP_BLOCK_THICKNESS + MOUNT_THICKNESS - 1*mm
      ]
    )
  cylinder
    ( d = 1*cm
    , h = 4*cm
    , center = true
    );

  
  // mounting screw hole
  translate
    ( [ -15*mm
      , -0.5*WARP_BLOCK_HEIGHT + 0.5*FRAME_STOCK_SIZE
      , 0
      ]
    )
  cylinder
    ( d = 4*mm
    , h = 4*cm
    , center = true
    );
  
  translate
    ( [ 15*mm
      , -0.5*WARP_BLOCK_HEIGHT + 0.5*FRAME_STOCK_SIZE
      , 0
      ]
    )
  cylinder
    ( d = 4*mm
    , h = 4*cm
    , center = true
    );
}
