%let path=your/path/here; 
libname multivariate "&path"; 
ods graphics on;

data concrete; 
    set multivariate.concrete; 
run;

/* 
    FA 
    
    Using a maximum-likelihood FA leads to an ultra-Heywood case error. 
    Unfortunately, this does cast some doubt on the validity of the FA. 
    Nonetheless, a Principal FA has been employed to offer some form of analysis. 

    A promax rotation has been included to improve interpretability.
    
*/

proc factor data=concrete plots=all method=principal priors=max r=p corr; 
    var cement--fine_aggregate; 
run;
