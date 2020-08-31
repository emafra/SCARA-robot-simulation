function [PontosU,PontosF,PontosS,PontosC] = armazena_pontos(Iaux,PontosU,PontosF,PontosS,PontosC,n,m)

cont = 0;
for i = 1 : n
    for j = 1 : m
        if Iaux(i,j) == 1
            cont = cont + 1;
            if isequal(cont,1)
                [Iaux,~,PontosU] = erode_object(Iaux,i,j);
            end
            if isequal(cont,2)
                [Iaux,~,PontosF] = erode_object(Iaux,i,j); 
            end
            if isequal(cont,3)
                [Iaux,~,PontosS] = erode_object(Iaux,i,j); 
            end
            if isequal(cont,4)
                [Iaux,~,PontosC] = erode_object(Iaux,i,j); 
            end
%             figure
%             imshow(Iaux)
        end
    end
end
% imshow(Iaux)
% cont
% size(PontosU)
EixoZ = ones(size(PontosU,1),1);
PontosU = [PontosU(:,1),PontosU(:,2),EixoZ];
EixoZ = ones(size(PontosF,1),1);
PontosF = [PontosF(:,1),PontosF(:,2),EixoZ];
EixoZ = ones(size(PontosS,1),1);
PontosS = [PontosS(:,1),PontosS(:,2),EixoZ];
EixoZ = ones(size(PontosC,1),1);
PontosC = [PontosC(:,1),PontosC(:,2),EixoZ];

end