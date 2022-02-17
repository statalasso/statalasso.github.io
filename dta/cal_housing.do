* downloaded from https://www.dcc.fc.up.pt/~ltorgo/Regression/cal_housing.html
* https://scikit-learn.org/stable/datasets/real_world.html#california-housing-dataset

insheet using ///
		/Users/kahrens/MyProjects/statalasso_website/static/dta/cal_housing.data, ///
		clear comma
		
rename v1 longitude 
rename v2 latitude 
rename v3 houseage   
rename v4 rooms 
rename v5 bedrooms 
rename v6 population 
rename v7 households 
rename v8 medinc
rename v9 medhousevalue 

label var longitude "block group longitude"
label var latitude "block group latitude"
label var houseage  "median house age in block group"
label var rooms "average number of rooms per household"
label var bedrooms "average number of bedrooms per household"
label var population "block group population"
label var households "average number of household members"
label var medinc "median income in block group"
label var medhousevalue  "median house value for California districts, expressed in hundreds of thousands of dollars ($100,000)."
 
save "/Users/kahrens/MyProjects/statalasso_website/static/dta/cal_housing.dta", replace
outsheet using "/Users/kahrens/MyProjects/statalasso_website/static/dta/cal_housing.csv", replace comma
        
 
