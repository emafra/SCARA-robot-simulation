function matrix_DH = DH_matrix(Theta,d,a,Alpha)

   matrix_DH = [cosd(Theta), -sind(Theta)*cosd(Alpha),  sind(Theta)*sind(Alpha), a*cosd(Theta);
                sind(Theta),  cosd(Theta)*cosd(Alpha), -cosd(Theta)*sind(Alpha), a*sind(Theta);
                          0,              sind(Alpha),              cosd(Alpha),             d;
                          0,                        0,                        0,             1];

end