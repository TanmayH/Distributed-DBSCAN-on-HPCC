IMPORT datadbscan;
IMPORT DBSCAN;
out1rec := { unsigned id; };    
a:=DBSCAN.FIT(datadbscan.ds,datadbscan.num_dims,datadbscan.num_records);
// Dbscan_Test(datadbscan.ds);
a;
temp:=RECORD
    datadbscan.Layout;
    Integer clusterid;
    BOOLEAN if_core;
END;
out1rec1 := { unsigned i; unsigned j; }; 
temp slim(datadbscan.Layout L,DATASET (out1rec1) a,INTEGER c):= TRANSFORM
    SELF.clusterid:=a[c].i;
    SELF.if_core:=a[c].j=1;
    self:=L;
    
END;
out:=PROJECT(datadbscan.ds,slim(LEFT,a,COUNTER) );
out;
