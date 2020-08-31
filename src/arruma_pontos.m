function [PontosU,PontosF,PontosS,PontosC] = arruma_pontos(PontosU,PontosF,PontosS,PontosC);

Id = eye(3);
% Rotação em Z:
o = -90;
o = deg2rad(o);
RotZ(1,1) =  cos(o);
RotZ(1,2) = -sin(o); 
RotZ(2,1) =  sin(o); 
RotZ(2,2) =  cos(o); 
% Translação no plano X Y:
trans = [-150; 350; 1];

A = Id;
A(1:2,1:2) = RotZ(:,:);
A(:,3) = trans(:,1);

for i = 1 : length(PontosU)
PontosU(:,i) = A * PontosU(:,i);
end
for i = 1 : length(PontosF)
PontosF(:,i) = A * PontosF(:,i);
end
for i = 1 : length(PontosS)
PontosS(:,i) = A * PontosS(:,i);
end
for i = 1 : length(PontosC)
PontosC(:,i) = A * PontosC(:,i);
end
end