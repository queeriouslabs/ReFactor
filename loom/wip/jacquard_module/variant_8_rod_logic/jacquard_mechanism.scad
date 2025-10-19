$fn = 64;

mm = 1;
cm = 10*mm;

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

heddle_rod_2();

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