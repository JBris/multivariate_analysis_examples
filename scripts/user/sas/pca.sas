%let path=your/path/here; 
libname multivariate "&path"; 
ods graphics on;

data concrete; 
    set multivariate.concrete; 
run;

/* 
    PCA

    Employing the Kaiser-Guttman rule and proportion 
    rule (using an 80% cut-off) leads to 4 PCs.
    
*/

proc princomp data=concrete out=concrete_pca n=4 prefix=PC plots=all; 
    var cement--fine_aggregate; 
    id id; 
run;

proc prinqual data=concrete mdpref n=4; 
    transform identity(cement--fine_aggregate); 
    id id; 
run;
