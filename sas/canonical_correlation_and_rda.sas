%let path=your/path/here; 
libname multivariate "&path"; 
ods graphics on;

data concrete; 
    set multivariate.concrete; 
run;

/* 
    
    Canonical Correlation Analysis 

    Some interesting results are returned when employing all
    of the variables. Canonical variates with high correlation 
    but low redundancy are produced.
    
*/ 

proc cancorr data=concrete vprefix=Ingredient wprefix=Test 
    vname='Concrete Ingredients' wname= 'Test Results' outstat=concrete_cancorr; 
    var cement--fine_aggregate; 
    with slump--compressive_strength; 
run;

/*

    Canonical Redundancy Analysis 
    
*/ 

proc cancorr data=concrete vprefix=Ingredient wprefix=Test 
    redundancy vname='Concrete Ingredients' wname= 'Test Results' outstat=concrete_cancorr; 
    var cement--fine_aggregate; 
    with slump--compressive_strength; 
run;
