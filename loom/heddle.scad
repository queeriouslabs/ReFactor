dowel_size = 10;

separator_disk_thickness = 1;
separator_disk_radius = 50;

heddle_cam_long_side = separator_disk_radius/2;
heddle_cam_short_side = heddle_cam_long_side/2;

module dowel() {
    cube([dowel_size, dowel_size, 20], center=true);
}

module separator_disk() {
    difference() {
        cylinder(separator_disk_thickness,
                r=separator_disk_radius,
                center=true,
                $fn=20);
        dowel();
    };
    
}

module heddle_cam() {
    difference() {
        scale([heddle_cam_long_side, heddle_cam_short_side, 1])
            cylinder(1, 1, center=true, $fn=20);
        dowel();
    };
}

separator_disk();
//heddle_cam();
//dowel();