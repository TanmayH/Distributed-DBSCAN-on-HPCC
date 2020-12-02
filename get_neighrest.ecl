import neigh;


import datadbscan;

Layout_cluster := RECORD
    datadbscan.Layout;
    set of integer clusters;
    END;
//iterate4

DATASET(Layout_cluster) get_neigh_clusters(Layout_cluster L,dataset(datadbscan.Layout) core,dataset(datadbscan.Layout) remote,integer c) := TRANSFORM
//neigh.get_neighrest_neighbour()
SELF := L;
END;
result:=DATASET([],Layout_cluster);
remote:=DATASET([],datadbscan.Layout);
core:=DATASET([],datadbscan.Layout);

Neighrest:=ITERATE(result,get_neigh_clusters(LEFT, core, remote,counter));
Neighrest;
//move to disjoint set from here
