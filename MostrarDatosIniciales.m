%%  CARGAMOS LOS DATOS

load HumanActivityTrain  %cargamos este archivo y dentro de el hay una variable XTrain que la mostramos 
XTrain %son las aceleraciones: 6 lotes que son matrices de 3 filas(x,y,z)x muchas columnas(numero de datos por lote)
%YTrain son las categorías de cada aceleración: 6 lotes que son arrays de tantos elementos como el lote corresp. de XTrain

%%  Visualizamos una secuencia de entrenamiento en una gráfica. Solo los datos del 1er lote.
%%  Representamos la aceleracion de la 1a coord. frente al tiempo según la actividad correspondiente.

X = XTrain{6}(1,:); %Selecciona la 1a fila del 1er lote de XTrain y extrae la coord. x de todo el lote que se almacena en la variable X.
classes = categories(YTrain{6}); %Obtiene las categorías únicas de las etiquetas de entrenamiento del 1er lote(YTrain{1})
colores = {'blue', 'green', 'red', 'cyan', 'magenta'}; %colores para representar cada movimiento

figure(1) %comienza una figura
for j = 1:numel(classes)  %numel dev. el numero de elem de classes
    label = classes(j);
    idx = find(YTrain{6} == label); %guarda en idx los índices de los elem que sus etiquetas de entrenamiento(YTrain{1}) coinciden con label.
    %e.d. guarda los tiempos (indices) de los elem. de cada movimiento
    hold on  %permite la superposición de gráficos en la misma figura
    plot(idx,X(idx), 'Color', colores{j})  %Traza la aceleración X(idx) de la 1a coord. en función del tiempo(indices) para cada clase de movimiento.
end
hold off

%leyenda y titulos y tal
xlabel("Paso de Tiempo")
ylabel("Aceleración")
title("Secuencia de Entrenamiento 1, Atributo 1(x)")
legend(classes,'Location','northwest')

% %% Visualizamos una secuencia de entrenamiento en una gráfica. Solo los datos del 1er lote.
% %% Representamos la aceleracion de la 2a coord. frente al tiempo según la actividad correspondiente.
% Y = XTrain{1}(2,:); %Selecciona la 2a fila del 1er lote de XTrain y extrae la coord. y de todo el lote que se almacena en la variable Y.
% 
% figure(2) %comienza una figura
% for j = 1:numel(classes)  %numel dev. el numero de elem de classes
%     label = classes(j);
%     idy = find(YTrain{1} == label); %guarda en idx los índices de los elem que sus etiquetas de entrenamiento(YTrain{1}) coinciden con label.
%     %e.d. guarda los tiempos (indices) de los elem. de cada movimiento
%     hold on  %permite la superposición de gráficos en la misma figura
%     plot(idy,Y(idy), colores{j})  %Traza la aceleración X(idx) en función del tiempo(indices) para cada clase de movimiento.
% end
% hold off
% 
% %leyenda y titulos y tal
% xlabel("Paso de Tiempo")
% ylabel("Aceleración")
% title("Secuencia de Entrenamiento 1, Atributo 2(y)")
% legend(classes,'Location','southwest')
% 
% %% Visualizamos una secuencia de entrenamiento en una gráfica. Solo los datos del 1er lote.
% %% Representamos la aceleracion de la 3a coord. frente al tiempo según la actividad correspondiente.
% Z = XTrain{1}(3,:); %Selecciona la 3a fila del 1er lote de XTrain y extrae la coord. z de todo el lote que se almacena en la variable Y.
% 
% figure(3) %comienza una figura
% for j = 1:numel(classes)  %numel dev. el numero de elem de classes
%     label = classes(j);
%     idz = find(YTrain{1} == label); %guarda en idx los índices de los elem que sus etiquetas de entrenamiento(YTrain{1}) coinciden con label.
%     %e.d. guarda los tiempos (indices) de los elem. de cada movimiento
%     hold on  %permite la superposición de gráficos en la misma figura
%     plot(idz,Z(idz), colores{j})  %Traza la aceleración X(idx) en función del tiempo(indices) para cada clase de movimiento.
% end
% hold off
% 
% %leyenda y titulos y tal
% xlabel("Paso de Tiempo")
% ylabel("Aceleración")
% title("Secuencia de Entrenamiento 1, Atributo 3(z)")
% legend(classes,'Location','northwest')

