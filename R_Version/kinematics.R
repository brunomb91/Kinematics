transformation_0_to_v1 <- function(theta_1, theta_2, theta_3) {
  matrix <- matrix(nrow = 4, ncol = 4);
  
  # l1 = 0.21 * cos(theta_1) * cos(theta_2 + pi/2);
  # l2 = 0.21 * sin(theta_1) * cos(theta_2 + pi/2);
  # l3 = 0.21 * sin(theta_2 + pi/2) + 0.125;
  
  # Transformation's first line
  matrix[1, 1] = -sin(theta_1); # a11
  matrix[1, 2] = -cos(theta_1) * cos(theta_2 + pi/2 + theta_3); # a12
  matrix[1, 3] = -cos(theta_1) * sin(theta_2 + pi/2 + theta_3); # a13
  # matrix[1, 4] = -(cos(theta_1) * sin(theta_2 + pi/2 + theta_3)) * 0.075 + l1; # a14
  matrix[1, 4] = (cos(theta_1) * sin(theta_2 + pi/2 + theta_3)) * 0.075; # a14
  
  # Transformation's second line
  matrix[2, 1] = cos (theta_1); # a21
  matrix[2, 2] = -sin(theta_1) * cos(theta_2 + pi/2 + theta_3); # a22
  matrix[2, 3] = -sin(theta_1) * cos(theta_2 + pi/2 + theta_3); # a23
  matrix[2, 4] = (sin(theta_1) * sin(theta_2 + pi/2 + theta_3)) * 0.075; # a24
  
  # Transformation's third line
  matrix[3, 1] = 0; # a31
  matrix[3, 2] = -sin(theta_2 + pi/2 + theta_3); # a32
  matrix[3, 3] = cos(theta_2 + pi/2 + theta_3); # a33
  matrix[3, 4] = cos(theta_2 + pi/2 + theta_3) * (-0.075) + 0.125; # a34
  
  # Transformation's fourth line
  matrix[4, 1] = 0; # a41
  matrix[4, 2] = 0; # a42
  matrix[4, 3] = 0; # a43
  matrix[4, 4] = 1; # a44
  
  return (matrix);
}

transformation_0_to_effector <- function(theta_1, theta_2, theta_3) {
  matrix <- matrix(nrow = 4, ncol = 4);
  
  l1 = 0.075 * cos(theta_1) * sin(theta_2 + pi/2 + theta_3);
  l2 = 0.075 * sin(theta_1) * cos(theta_2 + pi/2 + theta_3);
  l3 = (-0.075) * cos(theta_2 + pi/2 + theta_3) + 0.125;
  
  # Transformation's first line
  matrix[1, 1] = cos(theta_1) * sin(theta_2 + pi/2 + theta_3); # a11
  matrix[1, 2] = sin(theta_1); # a11
  matrix[1, 3] = cos(theta_1) * cos(theta_2 + pi/2 + theta_3); # a13
  matrix[1, 4] = (cos(theta_1) * cos(theta_2 + pi/2 + theta_3)) * 0.210 + l1; # a14
  
  # Transformation's second line
  matrix[2, 1] = sin(theta_1) * cos(theta_2 + pi/2 + theta_3); # a21
  matrix[2, 2] = -cos(theta_1); # a22
  matrix[2, 3] = sin(theta_1) * cos(theta_2 + pi/2 + theta_3); # a23
  matrix[2, 4] = (sin(theta_1) * cos(theta_2 + pi/2 + theta_3)) * 0.210 + l2; # a24
  
  # Transformation's third line
  matrix[3, 1] = cos(theta_2 + pi/2 + theta_3); # a31
  matrix[3, 2] = 0; # a32
  matrix[3, 3] = sin(theta_2 + pi/2 + theta_3); # a33
  matrix[3, 4] = 0.210 * cos(theta_2 + pi/2 + theta_3) + l3; # a34
  
  # Transformation's fourth line
  matrix[4, 1] = 0; # a41
  matrix[4, 2] = 0; # a42
  matrix[4, 3] = 0; # a43
  matrix[4, 4] = 1; # a44
  
  return (matrix);
  
}
