$fn = 100;

is_laser_cut = true;
laser_material_thickness = 3;
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

bottom_gripper_track_offset = 0;
bottom_gripper_track_height = gripper_track_vertical_length;
gripper_track_separation = 70;
top_gripper_track_offset = bottom_gripper_track_offset + bottom_gripper_track_height + gripper_track_separation;
top_gripper_track_height = gripper_track_vertical_length;
gripper_cutter_track_separation = 30 + gripper_track_vertical_length-pin_diameter;
cutter_track_offset = top_gripper_track_offset + top_gripper_track_height + gripper_cutter_track_separation;
cutter_track_height = pin_diameter;

slider_side = gripper_track_long_horizontal_leg_length + gripper_track_short_horizontal_leg_length;
slider_vertical_travel = 20;
total_slider_travel = slider_side + slider_vertical_travel - 4*pin_radius + gripper_track_vertical_length;

horizontal_track_separation = 20;

bottom_gripper_slider_track_offset = bottom_gripper_track_offset + bottom_gripper_track_height - pin_diameter;
top_gripper_slider_track_offset = top_gripper_track_offset + gripper_track_vertical_length - pin_diameter;
cutter_slider_track_offset = cutter_track_offset;
cutter_slider_track_height = 0
    + pin_radius
    + (gripper_track_vertical_length - pin_diameter)
    + slider_vertical_travel
    + (slider_side - pin_diameter)
    + pin_radius;
second_slider_track_offset = 35;
slider_margin = 5;
slider_width = 2*(cutter_track_length + second_slider_track_offset) + horizontal_track_separation + 2*slider_margin;
slider_length = slider_margin +
                cutter_slider_track_offset +
                cutter_slider_track_height +
                slider_margin;
slider_thickness = material_thickness;


top_guide_wall_thickness = material_thickness;
guide_support_thickness = slider_thickness+0.5;
guide_support_diameter = 10;
guide_support_radius = guide_support_diameter/2;
guide_support_hole_diameter = 3.5;
giode_support_hole_radius = guide_support_hole_diameter/2;
guide_width = slider_width + 2*guide_support_diameter;
guide_length = slider_margin +
               bottom_gripper_track_height +
               gripper_track_separation +
               top_gripper_track_height +
               gripper_cutter_track_separation +
               cutter_track_height +
               slider_margin; //2*vertical_track_separation + gripper_track_vertical_length;
guide_thickness = material_thickness;

pin_pad_thickness = 2;
pin_pad_radius = pin_radius + 5;
pin_stickout = 15;
pin_height = 2*guide_thickness + guide_support_thickness + pin_stickout;

pin_cap_radius = pin_radius + 1;
pin_cap_pad_radius = pin_pad_radius;
pin_cap_pad_thickness = pin_pad_thickness;



module gripper_track(h) {
    curve_cut = pin_radius/2;
    
    p1 = [ pin_radius,
           pin_radius + gripper_track_vertical_length - pin_diameter];
    p2 = [ pin_radius + gripper_track_long_horizontal_leg_length - pin_diameter,
           pin_radius + gripper_track_vertical_length - pin_diameter];
    p3 = [ pin_radius + gripper_track_long_horizontal_leg_length - pin_diameter,
           pin_radius];
    p4 = [ pin_radius + gripper_track_long_horizontal_leg_length + gripper_track_short_horizontal_leg_length - pin_diameter,
           pin_radius];
    
    //polygon(points = [p1,p2,p3,p4]);
    
    linear_extrude(height = h)
    polygon(points = [
        p1 + [-pin_radius, -pin_radius],
        p2 + [-pin_radius, -pin_radius],
        p3 + [-pin_radius, -pin_radius],
        p4 + [ pin_radius, -pin_radius],
        
        p4 + [ pin_radius,  pin_radius],
        p3 + [ pin_radius,  pin_radius],
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
    p2 = [ pin_radius + slider_side - pin_diameter,
           pin_radius + slider_side - pin_diameter];
    p3 = [ pin_radius + slider_side - pin_diameter,
           pin_radius + slider_vertical_travel + slider_side - pin_diameter];
    //polygon(points = [p1,p2,p3]);

    // right + bottom_right edges are two lines
    // x = pin_radius
    // y = x - sqrt(2) * pin_radius
    // therefore they intersect at
    // y = pin_radius - sqrt(2) * pin_radius
    //   = pin_radius * (1 - sqrt(2))
    // this is below the origin so negate it to get the length
    angle_offset = -pin_radius*(1 - sqrt(2));
    linear_extrude(height = h)
    polygon(points = [
        p1 + [-pin_radius  , angle_offset],
        p1 + [-pin_radius  ,-pin_radius],
        p1 + [ angle_offset,-pin_radius],
        
        p2 + [ pin_radius,-angle_offset],
        
        p3 + [ pin_radius, pin_radius],
        p3 + [-pin_radius, pin_radius],
        
        p2 + [-pin_radius, angle_offset]
    ]);
}

module bottom_gripper_drive_track(h) {
    p1 = [ pin_radius,
           pin_radius ];
    p2 = [ pin_radius ,
           pin_radius + slider_vertical_travel/2];
    p3 = [ pin_radius + (slider_side - pin_diameter),
           pin_radius + slider_vertical_travel/2 + (slider_side - pin_diameter)];
    p4 = [ pin_radius + slider_side - pin_diameter,
           pin_radius + slider_vertical_travel + (slider_side - pin_diameter)];
    //polygon(points = [p1,p2,p3,p4]);

    // right + bottom_right edges are two lines
    // x = pin_radius
    // y = x - sqrt(2) * pin_radius
    // therefore they intersect at
    // y = pin_radius - sqrt(2) * pin_radius
    //   = pin_radius * (1 - sqrt(2))
    // this is below the origin so negate it to get the length
    angle_offset = -pin_radius*(1 - sqrt(2));
    linear_extrude(height = h)
    polygon(points = [
        p1 + [-pin_radius,-pin_radius],
        p1 + [ pin_radius,-pin_radius],

        p2 + [ pin_radius,-angle_offset],
        
        p3 + [ pin_radius,-angle_offset],
        
        p4 + [ pin_radius, pin_radius],
        p4 + [-pin_radius, pin_radius],
        
        p3 + [-pin_radius, angle_offset],

        p2 + [-pin_radius, angle_offset]
    ]);
}







module cutter_drive_track(h) {
    p1 = [ pin_radius,
           pin_radius ];
    p2 = [ pin_radius,
           pin_radius + gripper_track_vertical_length - pin_diameter + slider_vertical_travel];
    p3 = [ pin_radius + slider_side - pin_diameter,
           pin_radius + gripper_track_vertical_length - pin_diameter + slider_vertical_travel + slider_side - pin_diameter];
    //polygon(points = [p1,p2,p3]);

    // right + bottom_right edges are two lines
    // x = pin_radius
    // y = x - sqrt(2) * pin_radius
    // therefore they intersect at
    // y = pin_radius - sqrt(2) * pin_radius
    //   = pin_radius * (1 - sqrt(2))
    // this is below the origin so negate it to get the length
    angle_offset = -pin_radius*(1 - sqrt(2));
    linear_extrude(height = h)
    polygon(points = [
        p1 + [-pin_radius,-pin_radius],
        p1 + [ pin_radius,-pin_radius],
        
        p2 + [ pin_radius,-angle_offset],
        
        p3 + [ pin_radius,-angle_offset], 
        p3 + [ pin_radius, pin_radius],
        p3 + [-angle_offset, pin_radius],
        
        p2 + [-pin_radius, angle_offset]
    ]);
}

module single_slider_tracks(track_height) {
    translate([0,cutter_slider_track_offset,0])
    cutter_drive_track(track_height);

    translate([0,top_gripper_slider_track_offset,0])
    top_gripper_drive_track(track_height);

    translate([0,bottom_gripper_slider_track_offset, 0])
    bottom_gripper_drive_track(track_height);
}

module slider_tracks(track_height) {
    translate([second_slider_track_offset,0,0])
    single_slider_tracks(track_height);
    
    //translate([-second_slider_track_offset,0,0])
    single_slider_tracks(track_height);
}

module slider() {
    difference() {
        union() {
            cube([slider_width, slider_length, slider_thickness]);
            
//            handle_width = 10;
//            translate([slider_width/2-handle_width/2,slider_length,0])
//            cube([handle_width,40,slider_thickness]);
        }
    
        track_height = 100;
        translate([slider_margin, slider_margin, -10]) {
            #slider_tracks(track_height);
    
            translate([2*(cutter_track_length+second_slider_track_offset)+horizontal_track_separation,0,0])
            mirror([1,0,0])
            #slider_tracks(track_height);
        }
    }
}

module single_guide_tracks(track_height) {
    translate([0,bottom_gripper_track_offset,0])
    gripper_track(track_height);
            
    translate([0,top_gripper_track_offset,0])
    gripper_track(track_height);
    
    translate([0,cutter_track_offset,0])
    cutter_track(track_height);
}

module guide_tracks(track_height) {
    single_guide_tracks(track_height);

    translate([second_slider_track_offset,0,0])
    single_guide_tracks(track_height);
}

module guide() {
    difference() {
        cube([guide_width, guide_length, guide_thickness]);



        // tracks

        track_height = 100;
    
        translate([guide_support_diameter+slider_margin,slider_margin,-10]) {
            #guide_tracks(track_height);
        
            translate([2*(cutter_track_length+second_slider_track_offset)+horizontal_track_separation,0,0])
            mirror([1,0,0])
            #guide_tracks(track_height);
        }



        // supports

        // bottom left
        translate([guide_support_radius, guide_support_radius, 0]) {
            translate([0,0,guide_thickness])
            %cylinder(d = guide_support_diameter, h = slider_thickness+0.2);
        
            #cylinder(d = guide_support_hole_diameter, h = 100, center = true);
        }

        // bottom right
        translate([guide_width-guide_support_radius, guide_support_radius, 0]) {
            translate([0,0,guide_thickness])
            %cylinder(d = guide_support_diameter, h = slider_thickness+0.2);
        
            #cylinder(d = guide_support_hole_diameter, h = 100, center = true);
        }

        // top left
        translate([guide_support_radius, guide_length-guide_support_radius, 0]) {
            translate([0,0,guide_thickness])
            %cylinder(d = guide_support_diameter, h = slider_thickness+0.2);
        
            #cylinder(d = guide_support_hole_diameter, h = 100, center = true);
        }

        // top right
        translate([guide_width-guide_support_radius, guide_length-guide_support_radius, 0]) {
            translate([0,0,guide_thickness])
            %cylinder(d = guide_support_diameter, h = guide_support_thickness);
        
            #cylinder(d = guide_support_hole_diameter, h = 100, center = true);
        }
    }
}

module guide_support(){
    difference() {
        cylinder(d = guide_support_diameter, h = guide_support_thickness);

        cylinder(d = guide_support_hole_diameter, h = 100, center = true);
    }
}

module pin() {
    translate([0,0,pin_pad_thickness])
    cylinder(r = pin_radius, h = pin_height);
    
    translate([second_slider_track_offset,0,pin_pad_thickness])
    cylinder(r = pin_radius, h = pin_height);

    cylinder(r = pin_pad_radius, h = pin_pad_thickness);

    translate([second_slider_track_offset,0,0])
    cylinder(r = pin_pad_radius, h = pin_pad_thickness);

    translate([0,-pin_pad_radius,0])
    cube([second_slider_track_offset, 2*pin_pad_radius, pin_pad_thickness]);
}

module base_pin_cap() {
    s = 2*pin_cap_radius;
    h = pin_stickout+2;
    difference() {
        union() {
            translate([-s/2,-s/2,0])
            cube([s,s,h+pin_cap_pad_thickness]);
            cylinder(r = pin_cap_pad_radius, h = pin_cap_pad_thickness);
    
            translate([second_slider_track_offset,0,0])
            translate([-s/2,-s/2,0])
            cube([s,s,h+pin_cap_pad_thickness]);
            
            translate([second_slider_track_offset,0,0])
            cylinder(r = pin_cap_pad_radius, h = pin_cap_pad_thickness);
    
            translate([0,-pin_cap_pad_radius,0])
            cube([second_slider_track_offset, 2*pin_cap_pad_radius, pin_cap_pad_thickness]);
        }

        h2 = pin_stickout + pin_cap_pad_thickness + 10;
        pin_cap_clearance_with_guide_place = 2; // having a gap is important for preventing pinching!
        pin_cap_hole_depth = -h2 + pin_cap_pad_thickness + pin_stickout - pin_cap_clearance_with_guide_place;
        translate([0,
                   0,
                   pin_cap_hole_depth])
        #cylinder(r = pin_radius, h = h2);
            
        translate([second_slider_track_offset,
                   0,
                   pin_cap_hole_depth])
        #cylinder(r = pin_radius, h = h2);
    
    }
}

module left_pin_cap() {
    base_pin_cap();

    centering_guide_offset = 10;
    
    translate([0,pin_cap_pad_radius,0])
    cube([second_slider_track_offset,centering_guide_offset,pin_cap_pad_thickness]);

    centering_guide_stickout = 40;

    difference() {
        translate([0,
                   pin_cap_pad_radius+centering_guide_offset-pin_cap_pad_thickness,
                   pin_cap_pad_thickness])
        cube([second_slider_track_offset+centering_guide_stickout,
              pin_cap_pad_thickness,
              pin_stickout]);

//        translate([second_slider_track_offset+pin_cap_pad_radius-10,
//                   pin_cap_pad_radius,
//                   pin_cap_pad_thickness/2 + pin_stickout/2])
//        #cube([100,10,2]);

        center_inset = 0.0;
        center_position = horizontal_track_separation/2 + pin_radius - center_inset;
        outer_inset = 2;
        outer_width = pin_stickout-2*outer_inset;
        outer_length = (centering_guide_stickout - outer_inset) // rightmost extent of stickout
                     - center_position // leftmost point of the centering guide hole
                     - (outer_width/2); // centering hole half width
        
        // stickout / centering guide frame
        translate([second_slider_track_offset+center_position+outer_width/2,
                   pin_cap_pad_radius,
                   pin_cap_pad_thickness + outer_inset])
        #cube([outer_length,100,outer_width]);
        
        // centering guide hole
        s = outer_width/sqrt(2);
        translate([second_slider_track_offset+center_position,
                   pin_cap_pad_radius,
                   pin_cap_pad_thickness+pin_stickout/2])
        rotate([0,45,0])
        #cube([s,100,s]);

        // bevel
        translate([second_slider_track_offset+centering_guide_stickout-2,
                   pin_cap_pad_radius,
                   pin_cap_pad_thickness])
        rotate([0,45,0])
        #cube([10,100,10]);
    }
}

module right_pin_cap() {
    mirror([1,0,0]) {
        base_pin_cap();

        centering_guide_offset = 10;
    
        difference() {
            translate([0,pin_cap_pad_radius,0])
            cube([second_slider_track_offset,centering_guide_offset+1+pin_cap_pad_thickness,pin_cap_pad_thickness]);

            translate([second_slider_track_offset-2,
                       pin_cap_pad_radius,
                       pin_cap_pad_thickness])
            rotate([0,45,0])
            #cube([10,centering_guide_offset+1,10]);
        }

        centering_guide_stickout = 40;
    
        difference() {
            translate([
                0,
                pin_cap_pad_radius+centering_guide_offset+1,
                0])
            cube([second_slider_track_offset+centering_guide_stickout,
                  pin_cap_pad_thickness,
                  pin_stickout+pin_cap_pad_thickness]);
    
//            translate([second_slider_track_offset+pin_cap_pad_radius-10,
//                       pin_cap_pad_radius,
//                       pin_cap_pad_thickness/2 + pin_stickout/2])
//            #cube([100,10,2]);
    
            center_inset = 0.5;
            outer_inset = 2;
            outer_width = pin_stickout-2*outer_inset;
            outer_length = (centering_guide_stickout - outer_inset) // rightmost extent of stickout
                         - (pin_cap_pad_radius - center_inset) // leftmost point of the centering guide hole
                         - (outer_width/2); // centering hole half width
            
            // stickout / centering guide frame
            translate([second_slider_track_offset+pin_cap_pad_radius-center_inset+outer_width/2,
                       pin_cap_pad_radius,
                       pin_cap_pad_thickness + outer_inset])
            #cube([outer_length,100,outer_width]);
            
            // centering guide hole
            s = outer_width/sqrt(2);
            translate([second_slider_track_offset+pin_cap_pad_radius-center_inset,
                       pin_cap_pad_radius,
                       pin_cap_pad_thickness+pin_stickout/2])
            rotate([0,45,0])
            #cube([s,100,s]);

            // bevel
            translate([second_slider_track_offset+centering_guide_stickout-2,
                       pin_cap_pad_radius,
                       0])
            rotate([0,45,0])
            #cube([10,100,10]);
        }
    }
}


module gripper_pad() {
    s = 2*pin_cap_radius;
    h = pin_stickout;
    gripper_radius = pin_radius + horizontal_track_separation/2 + 5;

    
    intersection() {
        #
        translate([-sqrt(2),0,0])
        rotate([0,0,-45])
        translate([0,0,-50])
        cube([100,100,100]);
        
        difference() {
            translate([0,0,pin_cap_pad_thickness+h/2])
            cylinder(r = gripper_radius, h = h, center = true);
    
            #cylinder(r = gripper_radius - 2, h = 100, center = true);
    
            indent_count = 28;
            for (i = [0:indent_count]) {
                rotate([0,0,(360/indent_count)*i])
                translate([gripper_radius,0,10])
                #cylinder(r = 1, h = 50, center = true);
            }
        }
    }

    translate([0,0,pin_cap_pad_thickness])
    difference() {
        translate([-s/2-1,-s/2-1,0])
        cube([s+2,s+2,h]);
    
        #translate([-s/2-0.1,-s/2-0.1,-10])
        cube([s+0.2,s+0.2,100]);
    }

    spoke_length = 50;

    difference() {
        intersection() {
            for (i = [0:1]) {
                rotate([0,0,-90*i+45])
                translate([spoke_length/2,0,h/2+pin_cap_pad_thickness])
                cube([spoke_length,2,h], center = true);
            }
            
            #cylinder(r = gripper_radius - 2 + 0.1, h = 100, center = true);
        }
    
        #translate([-s/2-0.1,-s/2-0.1,-10])
        cube([s+0.2,s+0.2,100]);

    }
}





$t = 0;
delta = $t < 0.5 ?
            -2*$t*(total_slider_travel) :
            -2*(1-$t)*(total_slider_travel);

//translate([200,0,0])
//projection()
//slider();

//projection()
//guide();

//guide_support();

//translate([13,25,0])
//pin();

//base_pin_cap();

//translate([-60,0,0])
left_pin_cap();

//translate([60,0,0])
//right_pin_cap();

//gripper_pad();