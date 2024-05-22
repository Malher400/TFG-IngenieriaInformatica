%% Preparacion del dispositivo y datos

%% Borrado de objetos previos
if exist('m','var')
    clear m;
end

%% Crear objeto 
m = mobiledev;

%% Cargar la RedLSTM si no existe la variable
if not(exist('RedLSTM','var'))
    load RedLSTM;
    RedLSTM = net;
end

%% Activar la habilitación para la captura de datos sensoriales durante el tiempo que dura el bucle
m.Logging = 1;

t = 3;
for i = 0:1:t
    pause(1); % MATLAB Mobile solo permite pausas de máximo 2 segundos
end

%% Desactivar la captura
m.Logging = 0;

%% Recuperar los datos almacenados
[aceleracion, taceleracion] = accellog(m);   % Logged acceleration data

%% Clasificación de la acción mediante el sensor aceleración
[M,N] = size(aceleracion);

if M == 0
  disp('No se han capturado datos: repetir');
else
  X = aceleracion';
  Actividades = classify(RedLSTM,X)
end

discardlogs(m);
