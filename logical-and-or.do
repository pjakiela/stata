sysuse auto
count
summarize
count if weight<3000
count if price>6000
count if weight<3000 & price>6000
list make if weight<3000 & price>6000
count if weight>4000
count if mpg<15
count if weight>4000 | mpg<15
list make weight mpg if weight>4000 | mpg<15