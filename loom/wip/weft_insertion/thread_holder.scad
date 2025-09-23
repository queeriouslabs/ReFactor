$fn = 64;

mm = 1;
cm = 10*mm;

module bistable_test() {
  #difference() {
    cube([7*cm, 7*cm, 5*mm], center = true);
    cube([6*cm, 6*cm, 6*cm], center = true);
  }

  translate([0,5*mm,0])
  #cube([1*cm, 2*cm, 5*mm], center = true);

  rotate([0,0,20]) {
    translate([-18*mm,0,0])
    #cube([8*mm, 5*mm, 5*mm], center = true);

    translate([-18*mm,0,0])
    cube([35*mm, 0.5*mm, 5*mm], center = true);
  }

  translate([0,13*mm,0])
  rotate([0,0,20]) {
    translate([-18*mm,0,0])
    #cube([8*mm, 5*mm, 5*mm], center = true);

    translate([-18*mm,0,0])
    cube([35*mm, 0.5*mm, 5*mm], center = true);
  }

  rotate([0,0,-20]) {
    translate([18*mm,0,0])
    #cube([8*mm, 5*mm, 5*mm], center = true);

    translate([18*mm,0,0])
    cube([35*mm, 0.5*mm, 5*mm], center = true);
  }

  translate([0,13*mm,0])
  rotate([0,0,-20]) {
    translate([18*mm,0,0])
    #cube([8*mm, 5*mm, 5*mm], center = true);

    translate([18*mm,0,0])
    cube([35*mm, 0.5*mm, 5*mm], center = true);
  }
}


bistable_test();