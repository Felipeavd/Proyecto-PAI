%Número máximo de unidades
nmu = max(cluster_class(:,1));
%Número de espigas
[nsp , clm] = size(cluster_class);
%Celda inicial
con_var = {};
%Crear vector por unidad con tiempos
for i =1:nmu
    genvarname('U', num2str(i));
    eval(['U' num2str(i) '= tmx(i,:);'])
    vname = eval(['U' num2str(i)]);
    eval(['U' num2str(i) '(:,~any(vname,1))=[];'])
    newvname = eval(['U' num2str(i)]);
    con_var = {con_var ; [newvname]};
end
C = con_var;
plotSpikeRaster(C,'PlotType','vertline');
     