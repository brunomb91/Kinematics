#include <stdio.h>
#include <math.h>
#include "kinematics.h"

double** transformation_0_to_v1(double theta_1, double theta_2, double theta_3) {
	double** matrix;
	
	double l1 = 0.21 * cos(theta_1) * cos(theta_2 + M_PI_2);
	double l2 = 0.21 * sin(theta_1) * cos(theta_2 + M_PI_2);
	double l3 = 0.21 * sin(theta_2 + M_PI_2) + 0.125;
	
	// Transformation's first line
	matrix[0][0] = -sin(theta_1); // a11
	matrix[0][1] = -cos(theta_1) * cos(theta_2 + M_PI_2 + theta_3); // a12
	matrix[0][2] = -cos(theta_1) * sin(theta_2 + M_PI_2 + theta_3); // a13
	matrix[0][3] = -(cos(theta_1) * sin(theta_2 + M_PI_2 + theta_3)) * 0.075 + l1; // a14
	
	// Transformation's second line
	matrix[1][0] = cos (theta_1); // a21
	matrix[1][1] = -sin(theta_1) * cos(theta_2 + M_PI_2 + theta_3); // a22
	matrix[1][2] = -sin(theta_1) * sin(theta_2 + M_PI_2 + theta_3); // a23
	matrix[1][3] = -(sin(theta_1) * sin(theta_2 + M_PI_2 + theta_3)) * 0.075 + l2; // a24
	
	// Transformation's third line
	matrix[2][0] = 0; // a31
	matrix[2][1] = -sin(theta_2 + M_PI_2 + theta_3); // a32
	matrix[2][2] = cos(theta_2 + M_PI_2 + theta_3); // a33
	matrix[2][3] = cos(theta_2 + M_PI_2 + theta_3) + l3; // a34
	
	// Transformation's fourth line
	matrix[3][0] = 0; // a41
	matrix[3][1] = 0; // a42
	matrix[3][2] = 0; // a43
	matrix[3][3] = 1; // a44
	
	return matrix;
}
