% Verificar e "Limpar" objeto
function [imagem, n_pixels, ordem] = erode_object(imagem, i, j)
    % C�digo s� � chamado quando encontra ponto branco
    % a primeira contagem � realizada fora de la�o
    pontos = [i j];
    imagem(i, j) = 0;
    n_pixels = 1;
    ordem = [];
    while ~isequal(pontos, [])
       % Retira o ponto presente de an�lise
%        ordem = [ordem; pontos(1)];
       [i, j, pontos] = pop_front(pontos);
       ordem = [ordem; i, j];
       % Caso alguma das condi��es abaixo sejam satisfeitas
       % o ponto � adicionado para an�lise
       
       % V� se tem a direita e embaixo
       % Para analisar na diagonal
       cont = 0;
       limit = 2;
       if i + 1 <= size(imagem, 1) ...
               && j + 1 <= size(imagem, 2)...
               && imagem(i + 1, j + 1) == 1
          pontos = push_back(pontos, i + 1, j + 1);
          imagem(i + 1, j + 1) = 0;
          n_pixels = n_pixels + 1;
          cont = cont + 1;
%           if cont>=limit
%               continue
%           end
          
       end
       
       if i + 2 <= size(imagem, 1) ...
               && j + 2 <= size(imagem, 2)...
               && imagem(i + 2, j + 2) == 1
          pontos = push_back(pontos, i + 1, j + 1);
          imagem(i + 1, j + 1) = 0;
          n_pixels = n_pixels + 1;
          cont = cont + 1;
%           if cont>=limit
%               continue
%           end
          
       end
       
       % V� se tem a esquerda e em cima
       % Para analisar na diagonal 
       if i - 1 > 0 ...
               && j - 1 > 0 ...
               && imagem(i - 1, j - 1) == 1 
          pontos = push_back(pontos, i - 1, j - 1);
          imagem(i - 1, j - 1) = 0;
          n_pixels = n_pixels + 1;
          cont = cont + 1;
%           if cont>=limit
%               continue
%           end
       end
       
       % V� se tem na esquerda e embaixo
       % Para analisar na diagonal
       if i - 1 > 0 ...
               && j + 1 <= size(imagem, 2) ...
               && imagem(i - 1, j + 1) == 1 
          pontos = push_back(pontos, i - 1, j + 1);
          imagem(i - 1, j + 1) = 0;
          n_pixels = n_pixels + 1;
          cont = cont + 1;
%           if cont>=limit
%               continue
%           end
       end

       % V� se tem na direita e em cima
       % Para analisar na diagonal
       if i + 1 <= size(imagem, 1) ...
                && j - 1 > 0 ...
                && imagem(i + 1, j - 1) == 1 
          pontos = push_back(pontos, i + 1, j - 1);
          imagem(i + 1, j - 1) = 0;
          n_pixels = n_pixels + 1;
          cont = cont + 1;
%           if cont>=limit
%               continue
%           end
       end

       % Para analisar em cima
       if j - 1 > 0 ...
                && imagem(i, j - 1) == 1 
          pontos = push_back(pontos, i, j - 1);
          imagem(i, j - 1) = 0;
          n_pixels = n_pixels + 1;
          cont = cont + 1;
%           if cont>=3
%               continue
%           end
       end

       % Para analisar embaixo
       if j + 1 <= size(imagem, 2) ...
               && imagem(i, j + 1) == 1
          pontos = push_back(pontos, i, j + 1);
          imagem(i, j + 1) = 0;
          n_pixels = n_pixels + 1;
          cont = cont + 1;
%           if cont>=limit
%               continue
%           end
       end

       % Para analisar na esquerda
       if i - 1 > 0 ...
               && imagem(i - 1, j) == 1 
          pontos = push_back(pontos, i - 1, j);
          imagem(i - 1, j) = 0;
          n_pixels = n_pixels + 1;
          cont = cont + 1;
%           if cont>=limit
%               continue
%           end
       end

       % Para analisar na direita
       if i + 1 <= size(imagem, 1) ...
               && imagem(i + 1, j) == 1 
          pontos = push_back(pontos, i + 1, j);
          imagem(i + 1, j) = 0;
          n_pixels = n_pixels + 1;
          cont = cont + 1;
%           if cont>=limit
%               continue
%           end
       end
    end
end

% Retira um ponto do inicio da lista
function [i, j, list_of_points] = pop_front(list_of_points)
    i = list_of_points(1, 1);
    j = list_of_points(1, 2);
    if isequal(size(list_of_points), [1 2])
       list_of_points = [];
    else
       list_of_points = list_of_points(2:end,:);
    end
end

% Adiciona um ponto ao fim da lista
function [list_of_points] = push_back(list_of_points, i, j)
    list_of_points = [list_of_points; i, j];
end