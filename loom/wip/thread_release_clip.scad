union() {
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