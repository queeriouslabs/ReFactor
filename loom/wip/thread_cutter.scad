$fn = 100;

module guide() {
    difference() {
        translate([-45,-50,0])
        linear_extrude(height = 15, center = true)
        import("thread_cutter_1.dxf", layer="layer_3_FLATTENED");
    
        translate([-45,0,5])
        #cube([20,200,15], center = true);

        translate([45,0,5])
        #cube([20,200,15], center = true);

        #cube([60,200,5], center = true);
    }
}

//guide();

module slider() {

    intersection() {
        translate([-35,-90,0])
        linear_extrude(height = 4, center = true)
        import("thread_cutter_2.dxf", layer="layer_2_FLATTENED");

        #cube([59,200,100], center = true);
    }
}

//slider(); 

module pin() {
    cylinder(d = 10, h = 1);
    cylinder(d = 2.5, h = 30);
}

pin();

module pincap() {
    difference() {
        cylinder(d = 6, h = 20);
        
        translate([0,0,-10])
        cylinder(d = 2.7, h = 100);
    }
}

//pincap();

gripper_exterior_radius = 10;
gripper_interior_radius = 3;

module gripper_exterior() {
    difference() {
        union() {
            cylinder(r = gripper_exterior_radius, h = 15, center = true);
        
            num_treads = floor(2 * PI * gripper_exterior_radius / 2);
            for (i = [0:num_treads]) {
                rotate([0,0,i*(360/num_treads)])
                translate([gripper_exterior_radius,0,0])
                cylinder(d = 1, h = 14, center = true);
            }
        }

        cylinder(r = gripper_exterior_radius-1, h = 100, center = true);
    }
}

module gripper_spoke() {
    intersection() {
        cylinder(r = gripper_exterior_radius-0.5, h = 100, center = true);
        
        translate([0,50,0])
        cube([100,100,100], center = true);
        
        translate([gripper_exterior_radius-gripper_interior_radius-1,0,0])
        difference() {
            cylinder(r = gripper_exterior_radius, h = 15, center = true);
            cylinder(r = gripper_exterior_radius-0.5, h = 100, center = true);
        }
    }
}

module gripper_spokes() {
    num_spokes = 6;
    for (i = [0:num_spokes]) {
        rotate([0,0,i*(360/num_spokes)])
        gripper_spoke();
    }
}

module gripper_interior() {
    cylinder(r = gripper_interior_radius+1, h = 15, center = true);
}

module gripper() {
    difference() {
        union() {
            gripper_exterior();
            gripper_spokes();
            gripper_interior();
        }
        cylinder(d = 6, h = 100, center = true);
    }
}

//gripper();