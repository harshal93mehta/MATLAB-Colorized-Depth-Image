%generate colorized depth images and coordinate spaces
[colorizedDepth1,coord1] = alignImage('depth-63647317626781.png','color-63647317626781.png','IntrinsicRGB','InvIntrinsicIR','TransformationD-C');
[colorizedDepth2,coord2] = alignImage('depth-63647317628081.png','color-63647317628081.png','IntrinsicRGB','InvIntrinsicIR','TransformationD-C');

%save computed data
imwrite(colorizedDepth1,'Colorized_Depth_1.png');
imwrite(colorizedDepth2,'Colorized_Depth_2.png');


%detect circles and compute relative velocity
detect_circles_and_speed('Colorized_Depth_1.png','Colorized_Depth_2.png',coord1,coord2);