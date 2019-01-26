%Número máximo de unidades
nmu = max(cluster_class(:,1));
%Número de espigas
[nsp , clm] = size(cluster_class);
%Crear vector por unidad con tiempos
for i =1:nmu
    genvarname('U', num2str(i));
    eval(['U' num2str(i) '= tmx(i,:);'])
    vname = eval(['U' num2str(i)]);
    eval(['U' num2str(i) '(:,~any(vname,1))=[];'])
end
C = {U1;U2;U3;U4;U5};
plotSpikeRaster(C,'PlotType','vertline');