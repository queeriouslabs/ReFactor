HEIGHT = 80+30;

module separator_block() {
    cube([30,HEIGHT,5], center = true);
}

module hole() {
    DIAMETER = 11;
    translate([0,HEIGHT/2 - DIAMETER/2 - 10,40])
    cylinder(d = DIAMETER, h = 100, center = true, $fn = 100);
    
    multmatrix([[1,0,0,0],
                [0,1,0.175,1.5],
                [0,0,1,0]])
    translate([0,HEIGHT/2 + DIAMETER/2 - (HEIGHT - 30 - 45),40])
    cylinder(d = DIAMETER, h = 100, center = true, $fn = 100);
    
    //translate([0,HEIGHT/2 + 9/2 - (HEIGHT - 30 - 45),40])
    //cylinder(d = 9, h = 100, center = true, $fn = 100);
    
    multmatrix([[1,0,0,0],
                [0,1,0.09,31.5],
                [0,0,1,-22]])
    translate([0,0,25])
    scale([1,1,7])
    rotate([0,-90,0])
    cylinder(d = 25, h = DIAMETER, center = true, $fn = 3);
}


i = 8;
difference() {
    translate([0,0,0]) separator_block();
    translate([0,0,-10*i]) hole();
}