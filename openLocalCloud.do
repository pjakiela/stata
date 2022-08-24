clear all
//Stata dummy car data
sysuse auto
//useful for tinkering and easily accessible, this command is unique to Stata dummy data, and is not often used 
clear all

//To use "real" data, let's start by setting a path to a directory
cd "/Users/tristanwille/Desktop/Stata Modules/Data" //sets directory path
use mpd2020.dta //chooses the actual data file from the directory

//This data set is publically available data on historical world population, GDP, GDP per capita collected by Professor Angus Maddison
// download link: https://www.rug.nl/ggdc/historicaldevelopment/maddison/releases/maddison-project-database-2020 

//Although it's generally considered best practice to set a working directory, you can also simply make use of the "use" command to import your data -- particularly helpful if you want to use data that isn't saved in your working directory 
clear all
use "/Users/tristanwille/Desktop/Stata Modules/Data/mpd2020.dta"

//Great! Now we have data loaded in a few ways
//You can also get data from a github link or other online links
clear all
webuse set "https://pjakiela.github.io/stata"
webuse "nzDataSubset.dta"


//Manually created subset of publically-accessible CSV data (converted to .dta) from the New Zealand Bureau of Statistics
//Download link: https://www.stats.govt.nz/large-datasets/csv-files-for-download/
