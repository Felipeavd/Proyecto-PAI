
ClusterSpikes = cluster_class(:,1)==noCluster;  % Generar una lista con las espigas del cluster noCluster

[L, Lratio, df] = L_Ratio(inspk, ClusterSpikes)     % inspk = Fet
IsolDist = IsolationDistance(inspk, ClusterSpikes)


