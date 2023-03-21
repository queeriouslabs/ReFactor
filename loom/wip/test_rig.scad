width = 100;
count = 50;
separation = width / (2*count + 1);


difference() {
    cube([width,15,5]);

    translate([0,10,0])
    #union() {
        for(i = [0:count-1]) {
            translate([(2*i+1)*separation,0,-1])
            cube([separation, 100, 10]);
        }
    }

    translate([10,-5,0])
    #cube([4,10,10]);

    translate([86,-5,0])
    #cube([4,10,10]);
}