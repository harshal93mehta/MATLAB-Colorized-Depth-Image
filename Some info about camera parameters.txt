Time duration between two frames = 28081- 26781 = 1300 miliseconds


In order to read the matrix files and use them appropriately follow below example.

The Intrinsic RGB matrix file contains:
 
1034.3,0,0

1.6609,1034.3,0

970.63,529.07,1
 
Corresponding 3x3 matrix would be:
 
m = 	[1034.3		0		0]

	[1.6609		1034.3		0
]
	[970.63		529.07		1]

p = [x y z]

Assuming it is a right hand coordinate system, applying transformation can be performed as:
p' = p * m