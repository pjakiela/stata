# Data Visualization in Stata: Tips

1. Use `set scheme s1mono` so that your graphs have a white background (instead of Stata's defauly light blue).

2. Use color intentionally.  Claus Wilke has a great discussion of color [here](https://clauswilke.com/dataviz/color-basics.html) 
(in [_Fundamentals of Data Visualization_](https://clauswilke.com/dataviz/index.html)).  

3. Use colorblind-friendly colors.  The `blindschemes` package in Stata will allow you to access the colors of the Okabe-Ito color-blind safe colorscale.  

4. Label your axes.  Both your horizontal and vertical axes should almost always be titled, and the title should not be an obscure variable name (e.g. `mean of b_health_index`).  Use the `xtitle` and `ytitle` options in `twoway`, or make sure your variables are named such that the default axis titles are appropriate.

5. Turn off the default legend when it is not needed, for example if you have a scatter plot with a linear or local polynomial fit over it.  Use the option `legend(off)` in Stata.

6. Within the `legend()` option, use `cols(1)` or `rows(1)` to control the number of columns or rows in the legend (so that the number of things listed in the legend divides evenly across multiple columns or rows, if you have them.  It is generally easier to read the legend if it only contains a single column.

7. Your figure should have a self-explanatory title, either created within Stata or as the label for your figure in your manuscript.  Your figure should also have notes that explain the variables.  


<br>

## Additional Resources

[Claus Wilke's _Fundamentals of Data Visualization_](https://clauswilke.com/dataviz/)  

[Kieran Healy's _Data Visualization:  A Practical Introduction](https://socviz.co/)  
_Very focused on R, but the intro chapter is worth reading even if you plan to work in Stata._  

