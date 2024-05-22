%% Cargar datos secuenciales
load HumanActivityTrain
XTrain

%% Definir la arquitectura de red LSTM
numFeatures = 3;
numHiddenUnits = 200;
numClasses = 5;

layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits,'OutputMode','sequence')
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm', ...
    'MaxEpochs',30, ...
    'GradientThreshold',2, ...
    'Verbose',0, ...
    'MiniBatchSize',64, ...
    'Plots','training-progress');


%% Descomentar si se desea llevar a cabo el entrenamiento de la red.

%net = trainNetwork(XTrain,YTrain,layers,options);


%% Descomentar si se desea utilizar una red ya entrenada.

load RedLSTM;
RedLSTM = net;


%%  Test LSTM Network. Para testear una red ya entrenada.

load HumanActivityTest
figure
plot(XTest{1}')
xlabel("Time Step")
legend("Feature " + (1:numFeatures))
title("Test Data")

% Clasificar los datos de test usando classify. 
YPred = classify(net,XTest{1});

% Calcular la precisión de las predicciones.

acc = sum(YPred == YTest{1})./numel(YTest{1})

% Comparar las predicciones con los datos de test utilizando una gráfica.

figure
plot(YPred,'.-')
hold on
plot(YTest{1})
hold off

xlabel("Time Step")
ylabel("Activity")
title("Predicted Activities")
legend(["Predicted" "Test Data"])