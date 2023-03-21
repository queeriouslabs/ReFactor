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


*for (i = [0:7]) {
    difference() {
        translate([0,0,i*10]) separator_block();
        translate([0,0,0]) hole();
    }
}

LENGTH = 72;

difference() {
    translate([0,0,LENGTH/2])
    cube([30,HEIGHT,LENGTH], center = true);
    
    hole();
    
    translate([100,0,0])
    cube([200,200,200], center = true);
}