shaft_radius = 4.5;
shaft_height = 70;

module nose() {
    rot_max = 20;
    rot_angle = 360/rot_max;
    curve_radius = 40;
    difference() {
        intersection_for (i = [0:rot_max]) {
            rotate(i*rot_angle, [0,0,1])
            translate([curve_radius - shaft_radius ,0,0])
            rotate(90, [1,0,0])
            cylinder(1000, r = curve_radius, center = true, $fn = 100);
        }
        translate([0,0,-2*shaft_radius])
        cube(4*shaft_radius, center = true);
    }
}

module tail() {
    translate([0,0,-shaft_height])
    rotate(180, [1,0,0])
    nose();
}

module shaft() {
    rotate(360/40, [0,0,1])
    translate([0,0,-shaft_height/2])
    cylinder(shaft_height, r = shaft_radius, center = true, $fn = 20);
}

module hook_notches() {
    hook_thickness = 2;
    
    translate([hook_thickness/2,0,0])
    cube([20,20,20]);
    
    translate([-20-hook_thickness/2,0,0])
    cube([20,20,20]);
    
    translate([0,shaft_radius,hook_thickness/2 - 1])
    cube([4*hook_thickness, 2*shaft_radius, 2+hook_thickness], center = true);
}

module hook_cross_hole_1() {
    curve_radius = 20;
    hook_thickness = 1;
    
    intersection() {
        translate([0,shaft_radius,15])
        cube([4*shaft_radius, 2*shaft_radius, 30], center = true);
        
        translate([0,-curve_radius+shaft_radius-hook_thickness,0])
        rotate(90, [0,1,0])
        cylinder(20, r = curve_radius, center = true, $fn = 50);
    }
}

module hook_cross_hole_2() {
    radius = 5;
    
    union() {
        intersection() {
            translate([0,10,-10])
            cube(20, center = true);
        
            translate([0,radius,0])
            rotate(90, [0,1,0])
            cylinder(30, r = radius, center = true, $fn = 50);
        }
        difference() {
            translate([0,10+radius*cos(60),10-2*radius*sin(60)])
            cube(20, center = true);
            
            translate([0,0,-2*radius*sin(60)])
            rotate(90, [0,1,0])
            cylinder(30, r = radius, center = true, $fn = 50);
        }
    }
}

module tape_measure_slot() {
    head_vertical = 1.5;
    head_horizontal = 1.5;
    head_height = 5.8;
    tape_width = 5.8;
    
    translate([shaft_radius-tape_width/2,0,-shaft_height/2-5-shaft_height/2])
    difference() {
        cube([2*shaft_radius,head_height,shaft_height+10], center = true);
        
        translate([0,-head_vertical, -head_horizontal])
        cube([4*shaft_radius,head_height,shaft_height+10], center = true);
    }
}

module grip_slot() {
    thickness = 0.5;
    
    translate([0,0,5]) {
        difference() {
            cube([10,10,40], center = true);
            
            translate([0,10 + thickness/2,0])
            rotate([0,90,0])
            cylinder(r = 10, h = 20, center = true);
            
            translate([0,-(10 + thickness/2),0])
            rotate([0,90,0])
            cylinder(r = 10, h = 20, center = true);
        
            translate([0,0,-20])
            cube([20,20,40], center = true);
        }
        
        translate([0,0,-10])
        cube([10,thickness,20], center = true);
    }
}


difference() {
    shaft();
    grip_slot();
    //translate([0,0,0.1]) hook_cross_hole_2();
    tape_measure_slot();
}

difference() {
    nose();
    grip_slot();
    //hook_notches();
    //translate([0,0,-0.1]) hook_cross_hole_1();
}

difference(){
    tail();
    tape_measure_slot();
}