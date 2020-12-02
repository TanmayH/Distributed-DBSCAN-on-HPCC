IMPORT datadbscan;
doneRec := { unsigned4 execid };
inRec := { unsigned id };
out1rec := { unsigned id; };
DATASET(doneRec) doSomethingNasty(DATASET(inRec) input) := BEGINC++
  __lenResult = 4;
  __result = rtlMalloc(8);
  *(unsigned *)__result = 91823;
ENDC++;



DATASET(out1Rec) extractResult1(doneRec done) := BEGINC++
  //  const unsigned id = *(unsigned *)done;
   const unsigned cnt = 10;
   int a[1]={1};
   __lenResult = cnt * sizeof(unsigned __int64);
   __result = rtlMalloc(__lenResult);
   for (unsigned i=0; i < cnt; i++)
       ((unsigned __int64 *)__result)[i] = a;
ENDC++;
ds := DATASET([1,2,3,4], inRec);
processed := doSomethingNasty(ds);

processed;
output('hello');
NORMALIZE(processed, extractResult1(LEFT), TRANSFORM(RIGHT));
output('hello');
DATASET([1,2,3,4], inRec);

