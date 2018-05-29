import sys
from math import sin, cos, sqrt, atan2, radians
def calculateDistance(x1,y1,x2,y2):
	R = 6373.0
	lat1 = radians(x1)
	lon1 = radians(y1)
	lat2 = radians(x2)
	lon2 = radians(y2)

	dlon = lon2 - lon1
	dlat = lat2 - lat1

	a = sin(dlat / 2)**2 + cos(lat1) * cos(lat2) * sin(dlon / 2)**2
	c = 2 * atan2(sqrt(a), sqrt(1 - a))

	distance = R * c
	return distance

num1=float(sys.argv[1])
num2=float(sys.argv[2])
num3=float(sys.argv[3])
num4=float(sys.argv[4])
print (calculateDistance(num1,num2,num3,num4))