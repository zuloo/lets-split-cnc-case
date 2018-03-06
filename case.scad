echo(version=version());

module outline() {
    hull(){
        translate([4,4,0]) circle(4);
        translate([118,4,0]) circle(4);
        translate([118,85,0]) circle(4);
        translate([4,85,0]) circle(4);

    }
}
outline_point = [ [0,0], [122,0], [122,89], [0,89] ];
pcb = [ 
    [0, 81], 
    [114, 81], 
    [114, 6], 
    [107.75, 6],
    [101.5, -1.25],
    [90.25, -1.25],
    [84.5, 5.5],
    [45.5, 5.5],
    [39, -1],
    [14, -1],
    [7, 6],
    [0, 6],
];

*color("khaki")
    union(){
        linear_extrude( 1.4 )
            difference(){
                outline();
                translate([5,5,0]){
                    translate([14.85, 3.3, 0]) circle(r=1.1);
                    translate([94.2, 23.45, 0]) circle(r=1.1);
                    translate([94.2, 61.55, 0]) circle(r=1.1);
                    translate([18, 61.50, 0]) circle(r=1.1);
                }
            }
        linear_extrude( 3.4 )
            difference(){
                outline();
                translate([24, 0, 0]) 
                    square([16, 3]);
                translate([22, 4, 0]) 
                    square([20, 39]);
                translate([5,5,0]){
                    translate([14.85, 3.3, 0]) circle(r=1.1);
                    translate([94.2, 23.45, 0]) circle(r=1.1);
                    translate([94.2, 61.55, 0]) circle(r=1.1);
                    translate([18, 61.50, 0]) circle(r=1.1);
                }
            }
        linear_extrude( 11 )
            difference(){
                outline();

                translate([24, 0, 0]) 
                    square([16, 3]);
                translate([94.75, 0, 0])
                    square([10.25,3]);
                *translate([92.75, 3, 0])
                    square([14.25,3]);
                translate([4,4,0])
                    polygon(pcb);
            }
        translate([0,0,11])
            linear_extrude( 1 )
                difference(){
                    outline();

                    translate([24, 0, 0]) 
                        square([16, 3]);
                    translate([94.75, 0, 0])
                        square([10.25,3]);
                    translate([4,4,0])
                        polygon(pcb);

                    translate([118,20,0])
                        square([1,49]);
                    translate([3,20,0])
                        square([1,49]);
                    translate([52,8.5,0])
                        square([34,1]);
                    translate([20, 85,0])
                        square([82,1]);
                }
    }

module grid(rows, cols) {
    for(i = [0 : cols-1])
        for(j = [0 : rows-1])
            translate( [i*19.05, j*19.05, 0] ) children(0);
}

color("gray")
    translate([0,0,0])
        difference(){
            union(){
                translate([2,27.5,1])
                    linear_extrude( 2 )
                        union(){
                            grid( 3, 1 ){
                                square([120,2]);
                            }
                        }
                translate([22,2,1])
                    linear_extrude( 2 )
                        union(){
                            grid( 1, 5 ){
                                square([2,86]);
                            }
                        }
                translate([0,0,1])
                    linear_extrude( 2 )
                        difference(){
                            outline();
                            translate([4,4,0])
                                polygon(pcb);
                        }
                translate([0,0,3])
                    linear_extrude( 2 )
                        difference(){
                            outline();
                            translate([6.5,11.85,0])
                                grid( 4, 6 ){
                                    union(){
                                        hull(){
                                            translate([0, 1, 0]) circle(1);
                                            translate([0, 3.5, 0]) circle(1);
                                            translate([13.6, 1, 0]) circle(1);
                                            translate([13.6, 3.5, 0]) circle(1);
                                        }
                                        hull(){
                                            translate([0, 10.5, 0]) circle(1);
                                            translate([13.6, 10.5, 0]) circle(1);
                                            translate([0, 13, 0]) circle(1);
                                            translate([13.6, 13, 0]) circle(1);
                                        }
                                        translate([0,0,0]) square([14,14]);
                                    }
                                }
                        }
                linear_extrude(3)
                    translate([5,5,0]){
                        translate([14.85, 3.3, 0]) circle(r=3);
                        translate([94.2, 23.45, 0]) circle(r=3);
                        translate([94.2, 61.55, 0]) circle(r=3);
                        translate([18, 61.55, 0]) circle(r=3);
                        translate([75.2, 42.55, 0]) circle(r=2);
                        translate([37.2, 42.55, 0]) circle(r=2);
                        translate([56.1, 61.55, 0]) circle(r=2);
                        translate([24.2, 22.50, 0]) square([7,2]);
                        translate([55.1, 11.85, 0]) square([2,4]);
                    }

                linear_extrude(1)
                    union(){
                        translate([118,21,0])
                            square([1,48]);
                        translate([3,21,0])
                            square([1,48]);
                        translate([53,8.5,0])
                            square([32,1]);
                        translate([22, 85,0])
                            square([80,1]);
                        translate([24, 0, 0]) 
                            square([16, 3]);
                        translate([94.75, 0, 0])
                            square([10.25,3]);
                    }
            }
            union(){
                linear_extrude(6)
                    translate([5,5,-0.5]){
                        translate([14.85, 3.3, 0]) circle(r=1.1);
                        translate([94.2, 23.45, 0]) circle(r=1.1);
                        translate([94.2, 61.55, 0]) circle(r=1.1);
                        translate([18, 61.55, 0]) circle(r=1.1);
                    }
                translate([5,5,3.5]){
                    translate([14.85, 3.3, 0]) cylinder(h=1.5, r1=1.1, r2=2);
                    translate([94.2, 23.45, 0]) cylinder(h=1.5, r1=1.1, r2=2);
                    translate([94.2, 61.55, 0]) cylinder(h=1.5, r1=1.1, r2=2);
                    translate([18, 61.55, 0]) cylinder(h=1.5, r1=1.1, r2=2);
                }
            }
        }
*difference(){
    polygon([ 
        [0, 89], 
        [112, 89], 
        [112, 6], 
        [105.75, 6], 
        [101, 1.25],
        [88.75, 1.25],
        [84.5, 5.5],
        [43.5, 5.5],
        [38, 0],
        [13, 0],
        [7, 6],
        [0, 6],
    ]);
    translate([14.85, 3.3, 0]) circle(r=1.1);
    translate([94.2, 23.45, 0]) circle(r=1.1);
    translate([94.2, 61.55, 0]) circle(r=1.1);
    translate([18, 61.50, 0]) circle(r=1.1);
}
