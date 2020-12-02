import datadbscan;
EXPORT neigh:=MODULE
    EXPORT set of real get_neighrest_neighbour(DATASET(datadbscan.Layout) x,DATASET(datadbscan.Layout)y,numdims,num_records) := BEGINC++
    // #include <iostream>
    #include<iostream>
    #include<bits/stdc++.h>
    #include<math.h>
    #option pure
    
    using namespace std;

    double get_distance(vector<double> row1,vector<double> row2){
        long n=row1.size();
    
        double out=0;
        for(int i=0;i<n;i++){
            out=out+ pow((row1[i]-row2[i]),2);
        }
        return out;
    }
    #body
    int i=num_records/numdims;
        //i is record_len
        int j=0,t=0,l=0;
        
        int core[num_dims],remote[i][num_dims],temp;
        long cluster_merger[i];
        for(j=0;j<i;j++){
            for(k=0;k<numdims;k++)
            {
                remote[j][jk]=*((float *)y+t);
                t++;
            }
            
        }
        t=0;
        for(k=0;k<numdims;k++)
            {
                core[k]=*((float *)x+t);
                t++;
            }

        t=0;
        vector<double> row1;
        for(int i=0;i<M;i++){
            row1.push_back(core[i]);
        }

        //could parallelise using threads
        for(int j=0;j<N;j++){
            vector<double> row2;
            for(int k=0;k<M;k++){
                row2.push_back(remote[j][i]);
            }
            temp=get_distance(row1,row2);
            if(temp<=eps)
            cluster_merger[t++]=remote[i][M-1]; //assuming last field is cluster id
        }

        //return the set of possible cluster id's, -- dataset local clusterid|remote cluster id
        unsigned int n1=(unsigned int)t;
        __lenResult = 2*n1*sizeof(unsigned __int64);
        __result = rtlMalloc(__lenResult);
        for(unsigned iter=0;iter<2*t;iter+=2){
        ((unsigned __int64 *)__result)[iter]=cluster_merger[iter];
        ((unsigned __int64 *)__result)[iter+1]=1; //clusterid of the row

        }
    return 0;
    ENDC++;
            
END;
