heddle_count = 3;
heddle_thickness = 1.0;
wall_thickness = 1;
separator_thickness = 0.75;
heddle_block_width = 2*wall_thickness + 3*heddle_count*heddle_thickness + (heddle_count-1)*separator_thickness;
heddle_tension_depth = 15;
heddle_tension_hole_depth = heddle_tension_depth + 1;
heddle_tension_hole_thickness = (3*heddle_thickness - separator_thickness)/2;
heddle_control_inset = 5;
heddle_control_depth = heddle_tension_depth + 2*heddle_control_inset;
heddle_control_height = 15;
heddle_block_inner_depth = heddle_control_depth+1; //heddle_tension_depth + 2*(heddle_control_inset + 3);
heddle_block_outer_depth = heddle_block_inner_depth + 2*wall_thickness;
heddle_lower_rise = heddle_control_height + 1;
heddle_upper_rise = heddle_lower_rise + 10;
heddle_support_depth = (heddle_block_inner_depth - heddle_tension_hole_depth - 2)/2;
separator_depth = (heddle_block_inner_depth - heddle_tension_hole_depth - 2)/2;
separator_min_height = heddle_upper_rise + 10;
separator_spacing = 4;
separator_max_height = separator_min_height + separator_spacing*heddle_count;
heddle_block_height = separator_max_height + 5;

positioner_tine_length = 15;
positioner_tine_thickness = 3*heddle_thickness-1;
positioner_depth = 5;
positioner_width = heddle_block_width + 20;
positioner_height = 14;



module separator(i) {
    difference() {
        cube([separator_thickness, separator_depth, separator_max_height]);

        translate([0, 0, separator_max_height-separator_depth-i*separator_spacing])
        rotate([45,0,0])
        translate([-10, 0, 0])
        cube([20, 20, 20]);
    }
}

module heddle_block() {

    difference() {
        cube([heddle_block_width, heddle_block_outer_depth, heddle_block_height]);

        for (i = [0:heddle_count-1]) {
            translate([wall_thickness+i*separator_thickness+3*i*heddle_thickness, wall_thickness, wall_thickness])
            cube([3*heddle_thickness, heddle_block_inner_depth, 100]);

            translate([wall_thickness+i*separator_thickness+(1.5+3*i)*heddle_thickness - heddle_tension_hole_thickness/2, wall_thickness + heddle_block_inner_depth/2 - heddle_tension_hole_depth/2, -10])
            cube([heddle_tension_hole_thickness, heddle_tension_hole_depth, 100]);
        }

        translate([-10,heddle_block_outer_depth/2 - 2.5,2*wall_thickness])
        cube([100,5,100]);
    }

    for (i = [0:heddle_count-1]) {
        translate([wall_thickness+i*separator_thickness+3*i*heddle_thickness,wall_thickness,wall_thickness])
        #cube([1.5*heddle_thickness, heddle_support_depth, heddle_lower_rise]);

        translate([wall_thickness+i*separator_thickness+3*i*heddle_thickness,heddle_block_outer_depth-wall_thickness-heddle_support_depth,wall_thickness])
        cube([1.5*heddle_thickness, heddle_support_depth, heddle_lower_rise]);

        translate([wall_thickness+i*separator_thickness+(1.5+3*i)*heddle_thickness,wall_thickness,wall_thickness])
        cube([1.5*heddle_thickness, heddle_support_depth, heddle_upper_rise]);

        translate([wall_thickness+i*separator_thickness+(1.5+3*i)*heddle_thickness,heddle_block_outer_depth-wall_thickness-heddle_support_depth,wall_thickness])
        cube([1.5*heddle_thickness, heddle_support_depth, heddle_upper_rise]);

        translate([wall_thickness+i*separator_thickness+(1.5+3*i)*heddle_thickness-separator_thickness/2, heddle_block_outer_depth-wall_thickness-separator_depth, 0])
        translate([separator_thickness/2, separator_depth/2, 0])
        rotate([0,0,180])
        translate([-separator_thickness/2, -separator_depth/2, 0])
        separator(i);

        translate([wall_thickness+i*separator_thickness+(1.5+3*i)*heddle_thickness-separator_thickness/2, wall_thickness, 0])
        separator(i);
    }
}

difference() {
    heddle_block();

    // translate([0,0,0])
    // rotate([-45,0,0])
    // translate([-10,-100,-10])

    // translate([wall_thickness+3*heddle_thickness-1,-10,-10])
    // cube([100,100,100]);
}

module positioner() {
    difference() {
        cube([positioner_width, positioner_height, positioner_depth]);

        for (i = [0:heddle_count-1]) {
            translate([10+i*separator_thickness+(1.5+3*i)*heddle_thickness - heddle_tension_hole_thickness/2, wall_thickness + heddle_block_inner_depth/2 - heddle_tension_hole_depth/2, -10])
            #cube([heddle_tension_hole_thickness, 20, 20]);
        }
    }
}

// positioner();