function detect_circles_and_speed(im1,im2,coord1,coord2)
%detect circles in first image
im = imread(im1);
hsvim = rgb2hsv(im);
bwIm = hsvim(:,:,1)>0.01 & hsvim(:,:,1)<0.1;
[centers, radii, metric] = imfindcircles(bwIm,[10 30]);
figure;imshow(im)
viscircles(centers, radii,'EdgeColor','b');

%detect circles in second image
im2 = imread(im2);
hsvim2 = rgb2hsv(im2);
bwIm2 = hsvim2(:,:,1)>0.01 & hsvim2(:,:,1)<0.1;
[centers2, radii2, metric2] = imfindcircles(bwIm2,[10 30]);
figure;imshow(im2)
viscircles(centers2, radii2,'EdgeColor','b');

centers = round(centers);
centers2 = round(centers2);

%find locations of ball1
x11 = coord1(centers(3),centers(1),1);
y11 = coord1(centers(3),centers(1),2);
z11 = coord1(centers(3),centers(1),3);

x12 = coord2(centers2(3),centers2(1),1);
y12 = coord2(centers2(3),centers2(1),2);
z12 = coord2(centers2(3),centers2(1),3);

location1 = [x11;y11;z11];
location2 = [x12;y12;z12];
ball1_displacement = sqrt(sum(((location1(:)-location2(:)).^2)));


%find location of ball2
x21 = coord1(329,36,1);
y21 = coord1(329,36,2);
z21 = coord1(329,36,3);

x22 = coord2(333,443,1);
y22 = coord2(333,443,2);
z22 = coord2(333,443,3);

location3 = [x21;y21;z21];
location4 = [x22;y22;z22];
ball2_displacement = sqrt(sum(((location3(:)-location4(:)).^2)));


%Calculate velocities
time_constant = 1.3;
ball1_velocity = ball1_displacement/time_constant;
ball2_velocity = ball2_displacement/time_constant;
total_relative_velocity = ball1_velocity + ball2_velocity;
disp('Total relative velocity of the balls is ...');
disp(num2str(total_relative_velocity));
disp('millimeters/second');
end