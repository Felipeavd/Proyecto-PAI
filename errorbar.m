spks = [cluster_class(:,1) spikes];

nmu = max(spks(:,1));
[nsp , clm] = size(spks);
x = 1:64;

for i = 1:nmu
    for k = 1:4
        genvarname('UN', num2str(i));
        if k == 1
            eval(['UN' num2str(i) num2str(k) '= [spks((spks(:,1)==i),2:65)];'])
            pname = eval(['UN' num2str(i) num2str(k)]);
            subplot(4,nmu,i);
            shadedErrorBar(x,pname,{@mean,@std});
        end
        if k == 2
            eval(['UN' num2str(i) num2str(k) '= [spks((spks(:,1)==i),66:129)];'])
            pname = eval(['UN' num2str(i) num2str(k)]);
            subplot(4,nmu,(i+5));
            shadedErrorBar(x,pname,{@mean,@std});
        end
        if k == 3
            eval(['UN' num2str(i) num2str(k) '= [spks((spks(:,1)==i),130:193)];'])
            pname = eval(['UN' num2str(i) num2str(k)]);
            subplot(4,nmu,(i+10));
            shadedErrorBar(x,pname,{@mean,@std});
        end
        if k == 4
            eval(['UN' num2str(i) num2str(k) '= [spks((spks(:,1)==i),194:257)];'])
            pname = eval(['UN' num2str(i) num2str(k)]);
            subplot(4,nmu,(i+15));
            shadedErrorBar(x,pname,{@mean,@std});
        end
    end
end

