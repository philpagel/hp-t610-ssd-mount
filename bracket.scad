/* 
 SATA bracket 
 for mounting a 2.5" SATA drive 
 in a hp t610 plus thin client
*/

$fn=60;

// size of baseplate/tray
tray_width = 70;
tray_length = 50;
baseplate_height = 2.0;
spacer_height = 8.0;
spacer_diam = 6.0;

// mounting screws
screwdist = 61.71;
screwdiam = 3.1;
footdist = 50;

module baseplate() {
    union() {
        // base plate
        difference() {
            cube([	tray_width, tray_length, baseplate_height]);
            cylinder(h=baseplate_height, d=55);
            translate([tray_width, 0, 0]){
                scale([63/55, 1, 1]){
                    cylinder(h=baseplate_height, d=55);
                }
            }
        }
        // spacers
        translate([(tray_width-footdist)/2, 42, 0]){
            spacer();
            translate([footdist, 0, 0]){
                spacer();
            };
        };
        translate([tray_width/2 - 2 , spacer_diam/2 + 2 , 0]){
            spacer();
        }
    }
}

module spacer () {
    cylinder(h=spacer_height, d=spacer_diam);
} 

module hole () {
    cylinder(h=spacer_height, d=screwdiam);
}

difference(){
    baseplate();
    translate([0, spacer_diam/2, 0]){
        translate([tray_width/2 - 2 , 2, 0]){
            hole();
        };
        translate([(tray_width-screwdist)/2, 30, 0]){
            hole();
            translate([screwdist, 0, 0]){
                hole();
            };
        };
    }
}

//EOF
