mm = 1;
cm = 10 * mm;

$fn = 64;

module _ref_line_x(x) {
    translate([x,0, 0])
    #cube([0.1*mm, 100*cm, 1*cm], center = true);
}

module _ref_line_y(y) {
    translate([0,y, 0])
    #cube([100*cm, 0.1*mm, 1*cm], center = true);
}

module rotate_around_xy(x, y, angle) {
    translate([x,y,0])
    rotate([0,0,angle])
    translate([-x,-y,0])
    children();
}

module sweep(n, delta) {
    for (i = [0:n]) {
        rotate([0,0,i*delta]) children();
    }
}



c_part_thickness = 5*mm;

c_total_travel = 2*cm;

c_heddle_height = 12*cm;
c_heddle_width = 3*cm;

c_warp_thread_slot_width = 4*mm;
c_warp_thread_slot_downset = 2*cm;

c_guide_pin_radius = 2*mm;
c_guide_pin_diameter = 2 * c_guide_pin_radius;
c_guide_pin_slot_width = c_guide_pin_diameter;
c_guide_pin_slot_length = c_total_travel;
c_guide_pin_slot_upset = 3*cm;

c_select_pin_radius = 1*mm;
c_select_pin_diameter = 2 * c_select_pin_radius;
c_select_pin_lower_rise = 10*mm;
c_select_pin_upper_rise = 15*mm;
c_select_pin_horizontal_travel = 1*mm + c_select_pin_diameter;
c_select_pin_slot_upset = c_guide_pin_slot_upset + c_guide_pin_slot_length + 1*cm;


module heddle_body() {
    cube([c_heddle_width, c_heddle_height, c_part_thickness]);
}

module warp_thread_slot_negative() {
    x_offset = 0.5*c_heddle_width - 0.5*c_warp_thread_slot_width;
    y_offset = c_heddle_height - c_warp_thread_slot_downset;
    
    translate([x_offset,y_offset,-50*mm])
    cube([c_warp_thread_slot_width, 100*mm, 100*mm]);
}

module guide_pin_slot() {
    x_offset = 0.5*c_heddle_width - 0.5*c_guide_pin_slot_width;
    y_offset = 0; //c_heddle_height - c_guide_pin_slot_length;
    
    translate([x_offset,y_offset+c_guide_pin_radius + c_guide_pin_slot_upset,-50*mm])
    cube([c_guide_pin_slot_width, c_guide_pin_slot_length - c_guide_pin_diameter, 100*mm]);
    
    translate([x_offset + c_guide_pin_radius, c_guide_pin_radius + c_guide_pin_slot_upset, -50*mm])
    cylinder(d = c_guide_pin_diameter, h = 100*mm);
    
    translate([x_offset + c_guide_pin_radius, c_guide_pin_slot_length - c_guide_pin_radius + c_guide_pin_slot_upset, -50*mm])
    cylinder(d = c_guide_pin_diameter, h = 100*mm);
}

module select_pin_slot() {
//    _ref_line_y(c_select_pin_diameter);
//    _ref_line_y(c_select_pin_diameter + c_select_pin_lower_rise);
//    _ref_line_y(c_select_pin_diameter + c_select_pin_lower_rise +   c_select_pin_upper_rise);
    c_select_pin_slot_width = 2*(c_select_pin_diameter + c_select_pin_horizontal_travel);
    c_select_pin_slot_height = c_select_pin_diameter + c_select_pin_lower_rise + c_select_pin_upper_rise;
    
    translate([0.5*c_heddle_width - 0.5*c_select_pin_slot_width, c_select_pin_slot_upset, -50*mm])
    linear_extrude(100*mm)
    polygon([
        [0,0],
        [0, c_select_pin_diameter + c_select_pin_lower_rise],
        [c_select_pin_diameter+c_select_pin_horizontal_travel, c_select_pin_diameter + c_select_pin_lower_rise],
        [c_select_pin_diameter+c_select_pin_horizontal_travel, c_select_pin_lower_rise],
        [c_select_pin_diameter, c_select_pin_lower_rise],
        [c_select_pin_diameter+c_select_pin_horizontal_travel, c_select_pin_diameter+1*mm],
        [c_select_pin_diameter+2*c_select_pin_horizontal_travel, c_select_pin_lower_rise],
        [c_select_pin_diameter+2*c_select_pin_horizontal_travel, c_select_pin_lower_rise+c_select_pin_upper_rise],
        [c_select_pin_diameter+c_select_pin_horizontal_travel, c_select_pin_lower_rise+c_select_pin_upper_rise],
        [c_select_pin_diameter+c_select_pin_horizontal_travel, c_select_pin_lower_rise+c_select_pin_upper_rise+c_select_pin_diameter],
        [2*c_select_pin_diameter+2*c_select_pin_horizontal_travel, c_select_pin_lower_rise+c_select_pin_upper_rise+c_select_pin_diameter],
        [2*c_select_pin_diameter+2*c_select_pin_horizontal_travel, 0],
        [0,0]
    ]);
}


module heddle() {
    difference() {
        heddle_body();
        
        #warp_thread_slot_negative();
        
        #guide_pin_slot();
        
        #select_pin_slot();
    }
}

heddle();