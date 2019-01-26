%number of clusters
nc = max(cluster_class(:,1));
%germinal matrix
tmx = 0;
tmx(nc,1) = 0;
%number of points
[np , clm] = size(cluster_class);
%creating
for i = 1:np
    if cluster_class(i,1) ~= 0
        tmx((cluster_class(i,1)),i) = cluster_class(i,2);
    else
        tmx(:,i) = 0;
    end
end
sct = 0;
sct(nc,1) = 0;
for i = 1:np
    if cluster_class(i,1) ~= 0
        sct((cluster_class(i,1)),i) = cluster_class(i,1);
    else
        sct(:,i) = 0;
    end
end
%plotting
%scatter(tmx(1,:),sct(1,:),'filled')
%hold on
%for i = 2:nc
%    scatter(tmx(i,:),sct(i,:),'filled');
%end
%hold off
