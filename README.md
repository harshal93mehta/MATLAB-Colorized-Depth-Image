# MATLAB-Colorized-Depth-Image
Taking a kinect sensor depth image of a scene and another regular RGB camera image and aligning them to create a colorized depth image. 

This project requires MATLAB Computer Vision Toolbox

# How to Run:
--> Clone/download the repo.
--> Open MATLAB and navigate to the repo folder
--> Run "Colorized_depth_image_main_script.m".

# Information about the data required
--> "color-63647317626781.png" and "color-63647317628081.png" are the regular color images taken by a camera
--> "depth-63647317626781.png" and "depth-63647317628081.png" are kinect generated depth images
--> "IntrinsicRGB" is a matrix containing RBG camera intrinsic parameters
--> "InvIntrinsicIR" is a matrix containing kinect senson intrinsic parameters
--> "TransformationD-C" matrix has information about rotation and translation between the two cameras


# How does it work
--> alignImage.m file takes all the data mentioned above, and for each value in depth image, it transforms the coordinate system and generates X-Y-Z coordinates for the depth image, as well as finds one color pixel from RBG image corresponding to the location in depth image

# Detecting objects
--> Here I've used some basic colorspace transforms, thresholding and shape finding funcitons to locate and mark the balls in both the image. Refer to "detect_circles_and_speed.m"
--> Then I used the location of the centers of those balls and computed the locations of both balls in both the X-Y-Z coordinate system.
--> The time difference between two frames is given in the "Some info about camera parameters.txt" file
--> I used the time difference and the positions of both balls in each scene, to calculate displacement and total relative velocity.