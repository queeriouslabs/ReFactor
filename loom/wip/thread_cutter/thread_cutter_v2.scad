is_laser_cut = true;
laser_material_thickness = 6;
threed_print_thickness = 5;
material_thickness = is_laser_cut ?
                        laser_material_thickness :
                        threed_print_thickness;

pin_diameter = 6;
pin_radius = pin_diameter/2;

gripper_track_long_horizontal_leg_length = 25;
gripper_track_short_horizontal_leg_length = 2;
gripper_track_vertical_length = 20;

cutter_track_length = gripper_track_long_horizontal_leg_length + gripper_track_short_horizontal_leg_length;

vertical_track_separation = 50;

slider_side = gripper_track_long_horizontal_leg_length + gripper_track_short_horizontal_leg_length;
slider_vertical_travel = 20;
total_slider_travel = slider_side + slider_vertical_travel - 4*pin_radius + gripper_track_vertical_length;

horizontal_track_separation = 20;

slider_margin = 5;
slider_width = 2*cutter_track_length + horizontal_track_separation + 2*slider_margin;
slider_length = 185;
slider_thickness = material_thickness;

top_guide_wall_thickness = material_thickness;
side_guide_wall_thickness = 5;
guide_width = slider_width + 2*side_guide_wall_thickness;
guide_length = 2*slider_margin + 2*vertical_track_separation + gripper_track_vertical_length;
guide_thickness = 2*top_guide_wall_thickness + slider_thickness;

pin_pad_thickness = 2;
pin_pad_radius = pin_radius + horizontal_track_separation/2 - 0.5;
pin_stickout = 15;
pin_height = pin_pad_thickness + guide_thickness + pin_stickout;


module gripper_track(h) {
    curve_cut = pin_radius/2;
    
    p1 = [ pin_radius,
           pin_radius + gripper_track_vertical_length - 2*pin_radius];
    p2 = [ pin_radius + gripper_track_long_horizontal_leg_length - 2*pin_radius,
           pin_radius + gripper_track_vertical_length - 2*pin_radius];
    p3 = [ pin_radius + gripper_track_long_horizontal_leg_length - 2*pin_radius,
           pin_radius];
    p4 = [ pin_radius + gripper_track_long_horizontal_leg_length + gripper_track_short_horizontal_leg_length - 2*pin_radius,
           pin_radius];
    
    //polygon(points = [p1,p2,p3,p4]);
    
    linear_extrude(height = h)
    polygon(points = [
        p1 + [-pin_radius, -pin_radius],
        p2 + [-pin_radius, -pin_radius] + [-curve_cut,0],
        p2 + [-pin_radius, -pin_radius] + [0,-curve_cut],
        p3 + [-pin_radius, -pin_radius],
        p4 + [ pin_radius, -pin_radius],
        
        p4 + [ pin_radius,  pin_radius],
        p3 + [ pin_radius,  pin_radius] + [curve_cut,0],
        p3 + [ pin_radius,  pin_radius] + [0,curve_cut],
        p2 + [ pin_radius,  pin_radius],
        p1 + [-pin_radius,  pin_radius]
    ]);
}

module cutter_track(h) {
    cube([cutter_track_length, 2 * pin_radius, h]);
}

module top_gripper_drive_track(h) {
    p1 = [ pin_radius,
           pin_radius ];
    p2 = [ pin_radius + slider_side - 2*pin_radius,
           pin_radius + slider_side - 2*pin_radius];
    p3 = [ pin_radius + slider_side - 2*pin_radius,
           pin_radius + slider_vertical_travel + slider_side - 2*pin_radius];
    //polygon(points = [p1,p2,p3]);

    linear_extrude(height = h)
    polygon(points = [
        p1 + [-pin_radius, pin_radius],
        p1 + [-pin_radius,-pin_radius],
        p1 + [ pin_radius,-pin_radius],
        
        p2 + [ pin_radius,-pin_radius],
        
        p3 + [ pin_radius, pin_radius],
        p3 + [-pin_radius, pin_radius],
        
        p2 + [-pin_radius, pin_radius]
    ]);
}

module bottom_gripper_drive_track(h) {
    p1 = [ pin_radius,
           pin_radius ];
    p2 = [ pin_radius ,
           pin_radius + slider_vertical_travel/2];
    p3 = [ pin_radius + (slider_side - 2*pin_radius),
           pin_radius + slider_vertical_travel/2 + (slider_side - 2*pin_radius)];
    p4 = [ pin_radius + slider_side - 2*pin_radius,
           pin_radius + slider_vertical_travel + (slider_side - 2*pin_radius)];
    //polygon(points = [p1,p2,p3,p4]);

    linear_extrude(height = h)
    polygon(points = [
        p1 + [-pin_radius,-pin_radius],
        p1 + [ pin_radius,-pin_radius],

        p2 + [ pin_radius,-pin_radius],
        
        p3 + [ pin_radius,-pin_radius],
        
        p4 + [ pin_radius, pin_radius],
        p4 + [-pin_radius, pin_radius],
        
        p3 + [-pin_radius, pin_radius],

        p2 + [-pin_radius, pin_radius]
    ]);
}







module cutter_drive_track(h) {
    p1 = [ pin_radius,
           pin_radius ];
    p2 = [ pin_radius,
           pin_radius + gripper_track_vertical_length - 2*pin_radius + slider_vertical_travel];
    p3 = [ pin_radius + slider_side - 2*pin_radius,
           pin_radius + gripper_track_vertical_length - 2*pin_radius + slider_vertical_travel + slider_side - 2*pin_radius];
    //polygon(points = [p1,p2,p3]);

    linear_extrude(height = h)
    polygon(points = [
        p1 + [-pin_radius,-pin_radius],
        p1 + [ pin_radius,-pin_radius],
        
        p2 + [ pin_radius,-pin_radius],
        
        p3 + [ pin_radius,-pin_radius], 
        p3 + [ pin_radius, pin_radius],
        p3 + [-pin_radius, pin_radius],
        
        p2 + [-pin_radius, pin_radius]
    ]);
}

module slider() {
    difference() {
        union() {
            cube([slider_width, slider_length, slider_thickness]);
            
            handle_width = 10;
            translate([slider_width/2-handle_width/2,slider_length,0])
            cube([handle_width,40,slider_thickness]);
        }
    
        track_height = 100;
        translate([slider_margin, slider_margin, -10]) {
            translate([0,gripper_track_vertical_length-2*pin_radius+2*vertical_track_separation,0])
            cutter_drive_track(track_height);
        
            translate([0,vertical_track_separation+gripper_track_vertical_length-2*pin_radius,0])
            top_gripper_drive_track(track_height);
        
            translate([0, gripper_track_vertical_length-2*pin_radius, 0])
            bottom_gripper_drive_track(track_height);
    
            translate([2*cutter_track_length+horizontal_track_separation,0,0])
            mirror([1,0,0]) {
                translate([0,gripper_track_vertical_length-2*pin_radius+2*vertical_track_separation,0])
                cutter_drive_track(track_height);
            
                translate([0,vertical_track_separation+gripper_track_vertical_length-2*pin_radius,0])
                top_gripper_drive_track(track_height);
            
                translate([0, gripper_track_vertical_length-2*pin_radius, 0])
                bottom_gripper_drive_track(track_height);
            }
        }
    }
}

module guide() {
    difference() {
        cube([guide_width, guide_length, guide_thickness]);

        translate([side_guide_wall_thickness,-20,top_guide_wall_thickness])
        cube([guide_width-2*side_guide_wall_thickness, 200, slider_thickness]);

        track_height = 100;
    
        translate([side_guide_wall_thickness+slider_margin,slider_margin,-10]) {
            gripper_track(track_height);
            
            translate([0,vertical_track_separation,0])
            gripper_track(track_height);
            
            translate([0,2*vertical_track_separation+gripper_track_vertical_length-2*pin_radius,0])
            cutter_track(track_height);
        
            translate([2*cutter_track_length+horizontal_track_separation,0,0])
            mirror([1,0,0]) {
                gripper_track(track_height);
            
                translate([0,vertical_track_separation,0])
                gripper_track(track_height);
                
                translate([0,2*vertical_track_separation+gripper_track_vertical_length-2*pin_radius,0])
                cutter_track(track_height);
            }
        }
    }
}

module pin() {
    cube([2*pin_radius, 2*pin_radius, pin_height]);
    
    translate([pin_radius,pin_radius,0])
    cylinder(r = pin_pad_radius, h = pin_pad_thickness);
}





$t = 0;
delta = $t < 0.5 ?
            -2*$t*(total_slider_travel) :
            -2*(1-$t)*(total_slider_travel);

//translate([side_guide_wall_thickness, delta, top_guide_wall_thickness])
//slider();

guide();

//translate([100,0,0])
//pin();