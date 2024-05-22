
readChannelID = 2521644;
writeChannelID = 2521644;
APIKey = '1SG5UE41TW4LCTEP';

% resultaData = thingSpeakRead(readChannelID, 'ReadKey', APIKey, 'Fields',1)

% avgResults = mean(resultData);

valoresAEscribir=[[0,0,0]]; % [field1,field2,field3] SOLO DEJA 1 VALOR por FIELD, no vectores

writeResponse = thingSpeakWrite(writeChannelID, valoresAEscribir, 'WriteKey', APIKey);


