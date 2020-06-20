%let path=your/path/here; 
libname multivariate "&path"; 
ods graphics on;

data concrete; 
    set multivariate.concrete; 
run;

proc corr data=concrete out=concrete_corr;
run;

proc mds data=concrete_corr(type=corr) out=concrete_nmds converge=0.0001 level=ordinal; 
	var cement--fine_aggregate; 
run;