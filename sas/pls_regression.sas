%let path=your/path/here; 
libname multivariate "&path"; 
ods graphics on;

data concrete; 
    set multivariate.concrete; 
run;

/* 

    Partial Least Squares Regression

    PLS has been implemented using the NIPALS algorithm. 
    As the number of observations is small (n=103), we can use
    leave-one-out cross-validation.
    
*/ 

proc pls data = concrete method = pls(algorithm=nipals) 
    cv=one plot=(vip xyscores xscores parmprofiles dmod); 
    model slump--compressive_strength = cement--fine_aggregate; 
run;
