//log files
clear all
cd "/Users/tristanwille/Desktop/Stata Modules/Data/" //important to set a directory so there is somewhere to save the log file!
use mpd2020.dta

capture log close //closing a preexisting log if there were to be one
log using samplelogfile.txt, text replace //this is how you name a log file

summarize gdppc if year >1800

reg pop gdppc

reg pop gdppc i.year 

capture log close //capturing a snapshot of the log and closing it
