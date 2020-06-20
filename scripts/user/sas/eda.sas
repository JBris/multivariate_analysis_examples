%let path=your/path/here; 
libname multivariate "&path"; 
ods graphics on;

data concrete; 
    set multivariate.concrete; 
run;

proc sgscatter data=concrete; 
    title "Scatterplot Matrix for Concrete Testing Data"; 
    matrix cement--compressive_strength / diagonal=(histogram kernel); 
run;

proc univariate data=concrete; 
    var cement--compressive_strength; 
run;
