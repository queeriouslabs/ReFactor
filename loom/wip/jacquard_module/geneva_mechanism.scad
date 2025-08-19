$fn = 64;

mm = 1;
cm = 10*mm;

pd = 0.3*mm;
axle_radius = 5*mm;
disc_radius = 15*mm;

// base

difference() {
  cube([5*cm, 2*cm, 1*cm]);

  translate([1*cm,1*cm,0])
  cylinder(r = axle_radius+pd, h = 10*cm, center = true);

  translate([4*cm,1*cm,0])
  cylinder(r = axle_radius+pd, h = 10*cm, center = true);
}

// base disc on axle

module base_axle() {
  cylinder(r = axle_radius, h = 9*mm, center = true);
}

module base_cylinder() {
  base_axle();

  translate([0,0,4.5*mm + 3*mm])
  cylinder(r = disc_radius, h = 6*mm, center = true);
}

// translate([1*cm,1*cm,6*mm])
// base_cylinder();

// slotted disc

slot_radius = 20*mm;
divisions = 9;
angle = 360/divisions;

module slot() {
  difference() {
    cylinder(r = slot_radius, h = 10*mm, center = true);
    cylinder(r = slot_radius - 2.2*mm, h = 10*cm, center = true);
  }
}

module slotted_disc() {
  difference() {
    base_cylinder();

    rotate([0,0,75])
    for (i=[0:divisions-1]) {
      rotate([0,0,i*angle])
      translate([
        disc_radius,
        0,
        4.5*mm + 6*mm + 5*mm - 3*mm
      ])
      rotate([0,0,-15])
      translate([0,-slot_radius,0])
      slot();
    }
  }
}

// translate([1*cm,1*cm,6*mm])
// slotted_disc();

// pusher disc

module pusher_disc() {
  base_axle();

  translate([0,0,4.5*mm + 3*mm]) {
    cylinder(r = axle_radius, h = 12*mm, center = true);

    difference() {
      union() {
        difference() {
          translate([-8*mm,0,3*mm])
          cylinder(r = slot_radius, h = 5*mm, center = true);

          translate([-8*mm,0,0])
          cylinder(r = slot_radius-1*mm, h = 10*cm, center = true);
        }

        translate([-8*mm,0,5*mm])
        cylinder(r = slot_radius, h = 2*mm, center = true);
      }

      translate([5*cm,0,0])
      cube([10*cm, 10*cm, 10*cm], center = true);

      translate([0,5.5*cm,0])
      cube([10*cm, 10*cm, 10*cm], center = true);

      translate([0,-5.5*cm,0])
      cube([10*cm, 10*cm, 10*cm], center = true);

    }
  }
}

// translate([4*cm,1*cm,6*mm])
// pusher_disc();