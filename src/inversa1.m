function result = inversa1(x,y)

    % Ângulos desejados (q3 não é ângulo e sim deslocamento);

    q1 = x(1);
    q2 = x(2);
    q3 = x(3);
    q4 = x(4);

    % Posição desejada:
    Px = y(1);   
    Py = y(2);    
    Pz = y(3);    

    % Dimensões Scara:
    l1 = y(4);   
    l2 = y(5);
    l3 = y(6);

%     % Cinemática Direta:
    Dh0_1 = DH_matrix( q1,  l1,  0, 0);
    Dh1_2 = DH_matrix(  0,   0, l2, 0);
    Dh2_3 = DH_matrix( q2,   0, l3, 0);
    Dh3_4 = DH_matrix( q4, -q3,  0, 0);

%     Dh0_1 = DH_matrix( q1, l1, l2, 0);
%     Dh1_2 = DH_matrix( q2,  0, l3, 0);
%     Dh2_3 = DH_matrix( q3,  0,  0, 0);
%     Dh3_4 = DH_matrix(  0, q4,  0, 0);
    
    Dh0_2 = Dh0_1*Dh1_2;
    Dh0_3 = Dh0_2*Dh2_3;
    Dh0_4 = Dh0_3*Dh3_4;
    
    Pfx = Dh0_4(1,4);
    Pfy = Dh0_4(2,4);
    Pfz = Dh0_4(3,4);

    % Penalizacion de singularidades:
    pen = 0;
    if ((q1 > 359) || (q1 < 0) ||...
            (q2 >= 180) || (q2 <= 0) ||...
            (q4 > 359) || (q4 < 0) ||...
            (Dh0_1(3,4) < 0) ||...
            (Dh0_2(3,4) < 0) ||...
            (Dh0_3(3,4) < 0) ||...
            (Dh0_4(3,4) < 0))
        pen = pen + 999999999999999;
    end

    result = (Px - Pfx)^2 + (Py - Pfy)^2 + (Pz - Pfz)^2 + pen;
end