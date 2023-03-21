$fn = 100;

*union() {
    difference() {
        translate([-6.1,-.2,0])
        linear_extrude(height = 5, center = true)
        import(file = "thread-release-clip.dxf");
        
        #translate([0,58,0])
        cube([1,10,10], center = true);
    }
    
    translate([0,-15,0])
    cube([30,30,5], center = true);
}


clip_width = 10;
clip_height = 100;
clip_thickness = 5;
cube([clip_width, clip_height, clip_thickness], center = true);

flexure_thickness = 1;
curve_diameter = clip_width - 2*flexure_thickness;
center_cutout_height = clip_height - 50;
release_wedge_height = 20;
center_cutout_box_height =
    center_cutout_height
    - 0.5*curve_diameter
    + release_wedge_height;

translate([0,clip_height/2,0])
cylinder(d = curve_diameter, h = 2*clip_thickness, center = true);

difference() {
    cube([clip_width - 2*flexure_thickness,
          center_cutout_box_height,
          2*clip_thickness],
         center = true);
    
    translate([0,center_cutout_box_height/2 + 1,0])
    rotate([0,0,-20])
    translate([-25,0,0])
    cube([50,50,50], center = true);
    
    translate([0,center_cutout_box_height/2 + 1,0])
    rotate([0,0,20])
    translate([25,0,0])
    cube([50,50,50], center = true);
}

translate([0,-center_cutout_box_height/2,0])
cylinder(d = curve_diameter, h = 2*clip_thickness, center = true);

