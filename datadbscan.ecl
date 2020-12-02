EXPORT  datadbscan:=MODULE
    EXPORT Layout := RECORD
    REAL4 dim1;
    REAL4 dim2;
    REAL4 dim3;
    REAL4 dim4;
    END;

    EXPORT ds :=DATASET([
                { 0.0, 0.0, 1.0, 0.9 }, 
                { 0.0, 0.0, 0.9, 0.9 },
                { 0.0, 0.0, 0.0, 0.9 },
                { 0.0, 1.0, 1.0, 0.8 },
                { 0.0, 0.0, 0.1, 0.8 },
                {0.0, 0.011312, 1.0, 1.0},
                { 0.0, 0.0, 0.1, 0.8 }],Layout);
    EXPORT num_dims:=4;
    EXPORT num_records:=28;
    END;