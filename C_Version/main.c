#include <stdio.h>
#include <math.h>
#include "kinematics.h"

int main() {
	double matrix[4][4] = transformation_0_to_v1(0,0,0);
	int i, j;
	for (i = 0; i<=3; i++) {
		for (j = 0; j<=3; j++) {
			printf("Matrix: %f\n", matrix[i][j]);
		}
	}
	
	return 0;
}
