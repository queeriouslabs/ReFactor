$fn = 64;

mm = 1;
cm = 10*mm;

d = 15*mm;

// difference() {
//   cube([4*cm, 2*cm, 2*mm]);

//   translate([
//     1*cm,
//     1*cm,
//     0
//   ])
//   #cylinder(d=d, h = 10*cm, center = true);

//   translate([
//     3*cm,
//     1*cm,
//     0
//   ])
//   #cylinder(d=d, h = 10*cm, center = true);

//   translate([
//     2*cm,
//     1*cm,
//     0
//   ])
//   #cube([2*cm, 1*cm, 10*cm], center = true);
// }

difference() {
  translate([
    1*cm,
    1*cm,
    0
  ])
  cylinder(d=d-1*mm, h = 4*mm, center = true);

  translate([
    1*cm + d/2,
    1*cm,
    1*cm])
  {
    cylinder(d = 10*mm, h = 10*cm, center = true);
    // rotate([0,0,45])
    // #cube([10*mm, 10*mm, 10*cm], center =  true);
  }
}

// cylinder(d = 10*mm - 0.5*mm, h = 4*mm, center = true);