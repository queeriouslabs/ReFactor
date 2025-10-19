$fn = 64;

mm = 1;
cm = 10*mm;
PROCESS_DELTA = 0.1*mm;


module gear (
	radius_of_pitch_circle,
  // mm_per_tooth    = 3,    //this is the "circular pitch", the circumference of the pitch circle divided by the number of teeth
	number_of_teeth = 11,   //total number of teeth around the entire perimeter
	thickness       = 6,    //thickness of gear in mm
	hole_diameter   = 3,    //diameter of the hole in the center, in mm
	twist           = 0,    //teeth rotate this many degrees from bottom of gear to top.  360 makes the gear a screw with each thread going around once
	teeth_to_hide   = 0,    //number of teeth to delete to make this only a fraction of a circle
	pressure_angle  = 28,   //Controls how straight or bulged the tooth sides are. In degrees.
	clearance       = 0.0,  //gap between top of a tooth on one gear and bottom of valley on a meshing gear (in millimeters)
	backlash        = 0.0,   //gap between two meshing teeth, in the direction along the circumference of the pitch circle
    center = false,   // center gear by z axis
    $fn = 20   // number of fragments to draw hole cylinder
) {
  mm_per_tooth = 2*radius_of_pitch_circle*PI / number_of_teeth;
	p  = radius_of_pitch_circle; //mm_per_tooth * number_of_teeth / PI / 2;  //radius of pitch circle
	c  = p + mm_per_tooth / PI - clearance;        //radius of outer circle
	b  = p*cos(pressure_angle);                    //radius of base circle
	r  = p-(c-p)-clearance;                        //radius of root circle
	t  = mm_per_tooth/2-backlash/2;                //tooth thickness at pitch circle
	k  = -iang(b, p) - t/2/p/PI*180;             //angle to where involute meets base circle on each side of tooth
    difference() {
        linear_extrude(height = thickness, center = center, convexity = 10, twist = twist)
            for (i = [0:(number_of_teeth-teeth_to_hide-1 > 0 ? 1 : -1):number_of_teeth-teeth_to_hide-1] )
                rotate([0,0,i*360/number_of_teeth])
                    polygon(
                        points=[
                            [0, -hole_diameter/10],
                            polar(r, -181/number_of_teeth),
                            polar(r, r<b ? k : -180/number_of_teeth),
                            q7(0/5,r,b,c,k, 1),q7(1/5,r,b,c,k, 1),q7(2/5,r,b,c,k, 1),q7(3/5,r,b,c,k, 1),q7(4/5,r,b,c,k, 1),q7(5/5,r,b,c,k, 1),
                            q7(5/5,r,b,c,k,-1),q7(4/5,r,b,c,k,-1),q7(3/5,r,b,c,k,-1),q7(2/5,r,b,c,k,-1),q7(1/5,r,b,c,k,-1),q7(0/5,r,b,c,k,-1),
                            polar(r, r<b ? -k : 180/number_of_teeth),
                            polar(r, 181/number_of_teeth)
                        ],
                        paths=[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]]
                    );
        translate([0,0, (center ? 0 : -0.1)])
            cylinder(h=thickness+0.2, r=hole_diameter/2, center=center, $fn=$fn);
    }
};	
//these 4 functions are used by gear
function polar(r,theta)   = r*[sin(theta), cos(theta)];                            //convert polar to cartesian coordinates
function iang(r1,r2)      = sqrt((r2/r1)*(r2/r1) - 1)/PI*180 - acos(r1/r2); //unwind a string this many degrees to go from radius r1 to radius r2
function q7(f,r,b,r2,t,s) = q6(b,s,t,(1-f)*max(b,r)+f*r2);                         //radius a fraction f up the curved side of the tooth 
function q6(b,s,t,d)      = polar(d,s*(iang(b,d)+t));                              //point at radius d on the involute curve              




module thread_holder_half(alt = false) {
  th = 5*mm;
  grip_inset = 10*mm;

  difference() {
    union() {

      if (alt) {
        rotate([0,0,0.5*360/16])
        gear
          ( radius_of_pitch_circle = 1*cm
          , number_of_teeth = 16
          , thickness = th
          , hole_diameter = 0
          , teeth_to_hide = 8
          , center = true
          );
      } else {
        gear
          ( radius_of_pitch_circle = 1*cm
          , number_of_teeth = 16
          , thickness = th
          , hole_diameter = 0
          , teeth_to_hide =7
          , center = true
          );
      }
      
      translate
        ( [ 3*mm
          , 20*mm
          , 0
          ]
        )
      cube
        ( [ 6*mm
          , 100*mm
          , th
          ]
        , center = true
        );

      translate
        ( [ 0
          , 50*mm - 20*mm
          , 0
          ]
        )
      difference() {
        translate
          ( [ -5*mm
            , 20*mm
            , 0
            ]
          )
        cube
          ( [ 10*mm
            , 40*mm
            , th
            ]
          , center = true
          );
        
        rotate([ 0 , 0, -45 ])
        translate([ 0, -5*cm, 0 ])
        cube
          ( [ 10*cm
            , 10*cm
            , 10*cm
            ]
          , center = true
          );
      }

      translate
        ( [ -15*mm
          , 70*mm - grip_inset
          , 0
          ]
        )
      cube
        ( [ 10*mm
          , 6*mm
          , th
          ]
        , center = true
        );
    }

    cylinder
      ( d = 4*mm + 2*PROCESS_DELTA
      , h = 10*cm
      , center = true
      );
    

    translate([0,70*mm,0])
    rotate([45,0,0])
    translate([0,5*cm,0])
    cube([10*cm,10*cm,10*cm], center = true);

    translate([0,70*mm,0])
    rotate([-45,0,0])
    translate([0,5*cm,0])
    cube([10*cm,10*cm,10*cm], center = true);

    translate
      ( [ -10*mm + 0.5*th + 0.5*mm
        , -1*mm + 70*mm - grip_inset + 3.5*mm
        , -0.5*th
        ]
      )
    rotate([0,45,0])
    translate([-5*cm, 0, -5*cm])
    cube([10*cm, 3*mm, 10*cm], center = true);

    translate
      ( [ -10*mm + 0.5*th + 0.5*mm
        , -1*mm + 70*mm - grip_inset + 1*mm
        , 0.5*th
        ]
      )
    rotate([0,45,0])
    translate([-5*cm, 0, -5*cm])
    cube([10*cm, 4*mm, 10*cm], center = true);

    translate
      ( [ -10*mm + 0.5*th + 0.5*mm
        , -1*mm + 70*mm - grip_inset - 1.5*mm
        , -0.5*th
        ]
      )
    rotate([0,45,0])
    translate([-5*cm, 0, -5*cm])
    cube([10*cm, 3*mm, 10*cm], center = true);
  }
}

module axle_bottom() {
  translate([1*cm,0,6*mm])
  cylinder
    ( d = 4*mm
    , h = 1*cm
    , center = true
    );
  
  translate([-1*cm,0,6*mm])
  cylinder
    ( d = 4*mm
    , h = 1*cm
    , center = true
    );
  
  translate([0,0,1*mm])
  cube([3*cm, 1*cm, 2*mm], center = true);
}



thread_holder_half(alt = false);

// axle_bottom();