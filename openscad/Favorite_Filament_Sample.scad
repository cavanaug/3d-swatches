// Author: GlennovitS 3D https://makerworld.com/en/@GlennovitS3D
// License: Standard Digital File License (You shall not share, sub-license, sell, rent, host, transfer, or distribute in any way the digital or 3D printed versions of this object, nor any other derivative work)
// Commercial license: https://www.printables.com/@GlennovitS3D#join

// preview[view:south west, tilt:side]

/* [Costumize 🖌️️] */

// Material
material="PLA"; // [Custom,PLA,PLA-CF,PETG,PETG-CF,ASA,ASA-GF,ABS,TPU,PC,PET-CF,PA6,PA6-CF,PA6-GF,PAHT-CF,-,PLA+,e-PLA,rPLA,TPC,PEEK,PEKK,PP,Custom]
// Brand
materialBrand="BAMBU LAB"; // [Custom,BAMBU LAB,PRUSAMENT,POLYMAKER,FORMFUTURA,3DE PREMIUM,3DSUPREME,eSUN,INLAND,SUNLU,MATTERHACKERS,OVERTURE,HATCHBOX,ERYONE,PROTOPASTA,FILLAMENTUM,COLORFABB,ELEGOO,JAYO,KINGROON,Custom]
// Type of material (Basic, Matte, Silke..)
materialType="BASIC"; // [Custom,BASIC,MATTE,GALAXY,SPARKLE,GRADIENT,SILK,SILK DUAL,METAL,MARBLE,CF,GF,GLOW,AERO,TRANSLUCENT,DYNAMIC,-,POLYTERRA,POLYSONIC,POLYLITE,POLYMAX,POLYWOOD,EASYFIL,PREMIUM,TOUGH,VOLCANO,HIGH GLOSS,STONEFIL,METALFIL,PRO,BUILD,QUANTUM,Custom]
// Color of material
materialColor="CYAN"; // [Custom,,WHITE,BEIGE,CLEAR,SILVER,GRAY,BROWN,RED,MAGENTA,PINK,ORANGE,YELLOW,GOLD,GREEN,CYAN,BLUE,PURPLE,BRONZE,BLACK,--- BAMBU BASIC ---,JADE WHITE,BAMBU GREEN,MISTLETOE GREEN,BLUE GRAY,--- BAMBU MATTE ---,IVORY WHITE,LATTE BROWN,ASH GREY,DESERT TAN,LEMON YELLOW,MANDARIN ORANGE,SAKURA PINK,GRASS GREEN,ICE BLUE,MARINE BLUE,LILAC PURPLE,SCARLET RED,DARK RED,DARK BROWN,DARK GREEN,DARK BLUE,CHARCOAL,--- BAMBU GRADIENT ---,OCEAN TO MEADOW,ARCTIC WHISPER,SOLAR BREEZE,--- BAMBU CF ---,MATCHA GREEN,BURGUNDY RED,JEANS BLUE,LAVA GRAY,ROYAL BLUE,IRIS PURPLE,--- BAMBU SPARKLE ---,ALPINE GREEN,SLATE GRAY,ROYAL PURPLE,CRIMSON RED,ONYX BLACK,CLASSIC GOLD,--- BAMBU METAL ---,COBALT BLUE,OXIDE GREEN,IRIDIUM GOLD,COPPER BROWN,IRON GRAY,--- BAMBU SILK DUAL ---,NEON CITY,MIDNIGHT BLAZE,GILDED ROSE,BLUE HAWAII,--- OTHER ---,COPPER,GRANITE,NEBULAE,Custom]

/* [Text settings ⚙️] */

// Walls between sections
textDepth = 0.6; //[0.2:0.2:1]

// Textsize for line 1
line1Size = 6.5; //[3:0.5:10]
// Textsize for line 2
line2Size = 4.5; //[3:0.5:10]
// Textsize for layer-thickness-texts
lineLayersSize = 4.5; //[3:0.5:10]
// Textsize for material line
lineMaterialSize = 6.0; //[3:0.5:10]
// Should the material text size adapt or be fixed?
lineMaterialSizeStyle="Adaptive"; // [Adaptive,Fixed]

// Type of text on line 1
line1Style="Bold+Narrow"; // [Default,Bold,Narrow,ExtraNarrow,Bold+Narrow,Bold+ExtraNarrow]
// Bold text on line 1
// Type of text on line 1
line2Style="Bold+Narrow"; // [Default,Bold,Narrow,ExtraNarrow,Bold+Narrow,Bold+ExtraNarrow]
// Type of text on material line
lineMaterialStyle="Bold+Narrow"; // [Default,Bold,Narrow,ExtraNarrow,Bold+Narrow,Bold+ExtraNarrow]


/* [Custom text 🔠] */

// ONLY applies if Custom is selected in Material
lineMaterial = "";
// Line 1 (fx. Brand name) - ONLY applies if Custom is selected in Brand
line1 = "";
// Line 2 - from left (fx. temperature or price) - Can ALWAYS be used - also with predefined colors..
line2A = "";
// Line 2 - from right (fx. color) - ONLY applies if Custom is selected in either MaterialType or Material Color
line2B = "";

/* [Size 📐️] */

// Length of the sample (default: 75)
l = 75; //[50:100]
// Height of the sample (default: 35)
h = 35; //[30:50]
// Thickness of the sample (default: 2)
thick = 2.0; //[1.6:0.2:3]
// Corner radius of the sample (default: 5)
rad = 5.0; //[3:0.5:5]
// Sample border thickness (default: 2)
border = 2.0; //[1.5:0.5:3]
// Walls between sections (default: 1)
wall = 1.0; //[0.5:0.5:2]

/* [Layout 📏️️] */

// Size of hole
holeDim = 8.5; //[6.5:0.5:10]
// Material window width
matWidth = 20; //[15:50]

/* [Other️] */

innerRad = rad-border;
layerWidth = l-2*border-wall-matWidth;
textNormal = 0.05;
textBold = 0.15;
textNarrow = 0.85;

$fn=50;

module roundCube(le, he, th, ra, co1, co2, co3, co4) {
    union() {
        minkowski() {
            cube([le-2*ra, he-2*ra, th/2], center=true);
            cylinder(h=th/2, r=ra, center=true);
        }
        
        if (co1 == 1) {
            translate([le/2-ra, he/2-ra, 0]) cube([ra*2, ra*2, th], center=true);
        }
        if (co2 == 1) {
            translate([le/2-ra, -he/2+ra, 0]) cube([ra*2, ra*2, th], center=true);
        }
        if (co3 == 1) {
            translate([-le/2+ra, -he/2+ra, 0]) cube([ra*2, ra*2, th], center=true);
        }
        if (co4 == 1) {
            translate([-le/2+ra, he/2-ra, 0]) cube([ra*2, ra*2, th], center=true);
        }
    }
}

module cornerFillet(ra, th, direction) {
    difference() {
        if (direction == 2) {
            translate([0, -ra, -th/2]) {
                cube([ra, ra, th]);
            }
        }
        else if (direction == 3) {
            translate([-ra, -ra, -th/2]) {
                cube([ra, ra, th]);
            }
        }
        else if (direction == 4) {
            translate([-ra, 0, -th/2]) {
                cube([ra, ra, th]);
            }
        }
        else {
            translate([0, 0, -th/2]) {
                cube([ra, ra, th]);
            }
        }
        translate([0, 0, -th/2]) {
            cylinder(h=th*2, r=ra);
        }
    }
}

module textExtrude(textString="", textSize=5, depth=textDepth, style="Default", align="center") {
    if (style == "Default") {
        linear_extrude(depth) offset(r=textNormal) text(textString, size=textSize, halign=align, valign="center");
    }
    else if (style == "Bold") {
        linear_extrude(depth) offset(r=textBold) text(textString, size=textSize, halign=align, valign="center");
    }
    else if (style == "Narrow") {
        linear_extrude(depth) offset(r=textNormal) scale([0.85,1,1]) text(textString, size=textSize, halign=align, valign="center");
    }
    else if (style == "ExtraNarrow") {
        linear_extrude(depth) offset(r=textNormal) scale([0.7,1,1]) text(textString, size=textSize, halign=align, valign="center");
    }
    else if (style == "Bold+Narrow") {
        linear_extrude(depth) offset(r=textBold) scale([0.85,1,1]) text(textString, size=textSize, halign=align, valign="center");
    }
    else if (style == "Bold+ExtraNarrow") {
        linear_extrude(depth) offset(r=textBold) scale([0.7,1,1]) text(textString, size=textSize, halign=align, valign="center");
    }
    
}

///// Favorite Filament Sample //////

difference() {
    colorname = materialColor == "CYAN" ? "cyan" : materialColor == "BLUE" ? "blue" : materialColor == "RED" ? "red" : materialColor == "BLACK" ? "black" : materialColor == "ORANGE" ? "orange" : materialColor == "YELLOW" ? "yellow" : materialColor == "GREEN" ? "green" : materialColor == "PINK" ? "pink" : materialColor == "MAGENTA" ? "magenta" : materialColor == "PURPLE" ? "purple" : materialColor == "GOLD" ? "gold" : materialColor == "SILVER" ? "silver" : materialColor == "BEIGE" ? "beige" : materialColor == "GRAY" ? "gray" : materialColor == "BROWN" ? "brown" : "white";
    color(colorname) union() {
        difference() {
            // Main card shape
            roundCube(l, h, thick, rad);
            
            // Top window
            translate([0, ((h-2*border)/6)+wall/4, 1]) {
                roundCube(l-2*border, ((h-2*border)*2/3)-wall/2, thick, innerRad);
            }
            
            // Material window
            translate([(l/2)-border-matWidth/2, -((h-2*border)/3)-wall/4, 1]) {
                roundCube(matWidth, ((h-2*border)/3)-wall/2, thick, innerRad);
            }
            
            // Layers window
            translate([-(l/2)+border+layerWidth/2, -((h-2*border)/3)-wall/4, 0.2]) {
                roundCube(layerWidth, ((h-2*border)/3)-wall/2, thick, innerRad);
            }
        }
        
        // Wall around hole
        translate([-(l/2)+border+holeDim/2, (h/2)-border-holeDim/2, 0]) {
            difference() {
                roundCube(holeDim+2*wall, holeDim+2*wall, thick, innerRad, co1=1, co3=1);
                translate([-9,9,0]) rotate([0,0,45]) cube(20, center=true);
                translate([-10-holeDim/2,0,0]) cube(20, center=true);
                translate([0,10+holeDim/2,0]) cube(20, center=true);
            }
            
        }
        
        // Missing fillets around hole
        translate([-l/2+border+innerRad, h/2-border-holeDim-wall-innerRad, 0]) cornerFillet(innerRad, thick, 4);
        
        translate([-l/2+border+holeDim+wall+innerRad, h/2-border-innerRad, 0]) cornerFillet(innerRad, thick, 4);
        
        // Layers levels
        echo("Layerwidth: ",layerWidth);
        if (layerWidth > 35) {
            translate([-(l/2)+border+layerWidth/10,-(h-2*border)/3,-0.8]) textExtrude(textString=".2", textSize=6, style="Bold+Narrow");
        }
        translate([-(l/2)+border+layerWidth/10+layerWidth/5, -(h-2*border)/3, -0.7]) union() {
            cube([layerWidth/5, (h-2*border)/3, 0.2], center=true);
            if (layerWidth > 35) {
                translate([0,0,0.1]) textExtrude(textString=".4", textSize=6, style="Bold+Narrow");
            }
        }
        translate([-(l/2)+border+layerWidth/10+2*layerWidth/5, -(h-2*border)/3, -0.6]) union() {
            cube([layerWidth/5, (h-2*border)/3, 0.4], center=true);
            if (layerWidth > 35) {
                translate([0,0,0.2]) textExtrude(textString=".6", textSize=6, style="Bold+Narrow");
            }
        }
        translate([-(l/2)+border+layerWidth/10+3*layerWidth/5, -(h-2*border)/3, -0.5]) union() {
            cube([layerWidth/5, (h-2*border)/3, 0.6], center=true);
            if (layerWidth > 35) {
                translate([0,0,0.3]) textExtrude(textString=".8", textSize=6, style="Bold+Narrow");
            }
        }
        translate([-(l/2)+border+layerWidth/10+4*layerWidth/5, -(h-2*border)/3, -0.4]) union() {
            cube([layerWidth/5, (h-2*border)/3, 0.8], center=true);
            if (layerWidth > 35) {
                translate([0,0,0.4]) textExtrude(textString="1.", textSize=6, style="Bold+Narrow");
            }
        }
        
        // Text
        // Line 1
        if (materialBrand == "Custom") {
            translate([l/2-border-2, h*0.28, 0]) textExtrude(textString=line1, textSize=line1Size, style=line1Style, align="right");
        }
        else {
            translate([l/2-border-2, h*0.28, 0]) textExtrude(textString=materialBrand, textSize=line1Size, style=line1Style, align="right");
        }
        
        // Line 2
        if (materialColor == "Custom") {
            translate([l/2-border-2, 0, 0]) textExtrude(textString=line2B, textSize=line2Size, style=line2Style, align="right");
        }
        else {
            if (materialType == "Custom") {
                translate([l/2-border-2, 0, 0]) textExtrude(textString=line2B, textSize=line2Size, style=line2Style, align="right");
            }
            else {
                translate([l/2-border-2, 0, 0]) textExtrude(textString=str(materialType," ",materialColor), textSize=line2Size, style=line2Style, align="right");
            }
        }
        translate([-l/2+border+2, 0, 0]) textExtrude(textString=line2A, textSize=line2Size, style=line2Style, align="left");
        
        // Line Material
        materialLength = len(material);
        materialSize = ((10-materialLength)/7)*lineMaterialSize+(materialLength-3)/18*lineMaterialSize;
        if (material == "Custom") {
            if (lineMaterialSizeStyle == "Adaptive") {
                translate([l/2-border-matWidth/2, -h/2+border+5, 0]) textExtrude(textString=lineMaterial, textSize=materialSize, style=lineMaterialStyle, align="center");
            }
            else {
                translate([l/2-border-matWidth/2, -h/2+border+5, 0]) textExtrude(textString=lineMaterial, textSize=lineMaterialSize, style=lineMaterialStyle, align="center");
            }
        }
        else {
            if (lineMaterialSizeStyle == "Adaptive") {
                translate([l/2-border-matWidth/2, -h/2+border+5, 0]) textExtrude(textString=material, textSize=materialSize, style=lineMaterialStyle, align="center");
            }
            else {
                translate([l/2-border-matWidth/2, -h/2+border+5, 0]) textExtrude(textString=material, textSize=lineMaterialSize, style=lineMaterialStyle, align="center");
            }
        }
    }

    // Hole to cut out
    translate([-(l/2)+border+holeDim/2, (h/2)-border-holeDim/2, 0]) {
        roundCube(holeDim, holeDim, thick*2, innerRad);
    }
    
    // Gribs in the sides
    translate([-l/2, (h/2)-6, 0]) cylinder(r=1, h=thick*2, center=true);
    translate([-l/2, (h/2)-9, 0]) cylinder(r=1, h=thick*2, center=true);
    translate([l/2, (h/2)-6, 0]) cylinder(r=1, h=thick*2, center=true);
    translate([l/2, (h/2)-9, 0]) cylinder(r=1, h=thick*2, center=true);
}
