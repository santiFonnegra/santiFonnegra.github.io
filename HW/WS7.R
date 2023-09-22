library(dslabs)
library(ggplot2)

# load data
data(murders)

# compute murder rate
murders$rate <- murders$total / murders$population*100000

# plot murder rate as a function of population
p <- ggplot(data=murders, aes(population/10^6, rate, label = abb))

# scatter plot
p + geom_point(size = 3) 

# make an scatter plot in log-log space and appropriately label it
p + geom_point(size = 3) +
  geom_text(nudge_x = 0.05) + 
  scale_x_log10() +
  scale_y_log10() +
  xlab("Populations in millions (log scale)") + 
  ylab("Murder rate (log scale)") +
  ggtitle("US Gun Murders in 2010")


# lead mpg data set
data(mpg)
# learn more about this data set
?mpg

# we will mostly work with hwy and displ 
# displ, a car’s engine size, in litres.
# hwy, a car’s fuel efficiency on the highway, in miles per gallon (mpg).

# let's start with scatter plot
# initiate a ggplot
p <- ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) 

# make a scatter plot
p + geom_point()

p + geom_point(mapping = aes(color = class))




# let's load orange data set
data(Orange)
head(Orange)

p <- ggplot(data = Orange, aes(x = age, y = circumference, color = Tree))

# Let's make dots slightly transparent
p + geom_point(size = 4, alpha = 0.8)

# let's add another layer and connect all points in one group with a line
# If ambiguous, can also explicitly tell it which lines to connect with group=
p + geom_point(size = 4) + geom_line(aes(group=Tree))

# Notice we can map Tree to both color and linetype
p + geom_point(size = 4) + 
  geom_line(aes(group=Tree, linetype=Tree))

# Change size of line without affecting size of point
p + geom_point(size = 4) + 
  geom_line(aes(group=Tree, linetype=Tree), size=3)

# change theme()
p + geom_point(size = 4) + geom_line(aes(group=Tree)) +
  theme_minimal()

# change the theme()
p1 <- p + geom_point(size = 4) + geom_line(aes(group=Tree)) +
  theme(legend.position="none")
p1

# change the labels
p1 + ggtitle("Growth of Orange Trees") + 
  ylab("Circumference", ) + xlab("Age")

# let's remove all pints
p1 <- p + geom_line(aes(group=Tree)) + theme(legend.position="none") + 
  ggtitle("Growth of Orange Trees") + ylab("Circumference") + xlab("Age")
p1 

# What if you want each tree to get its own plot?
#  Here we use faceting!
#  To facet by one variable (e.g., y), do + facet_wrap(~y)
# To facet by two (e.g., x and y), do +facet_wrap(x~y)
p1 + facet_wrap(~Tree)

# change the number of columns
p1 + facet_wrap(~Tree, ncol = 5)


# Adding a trendline with geom_smooth(method="lm")
# Add color=Tree, fill=Tree, or group=Tree for separate regression lines
# Switch the order of geoms to put the points on top!
ggplot(data = Orange, aes(x = age, y = circumference)) +
  geom_point() + geom_smooth(method="lm")  

# Add color=Tree or group=Tree for separate regression lines
# Switch the order of geoms to put the points on top!
ggplot(data = Orange, aes(x = age, y = circumference, color=Tree)) +
  geom_point() + geom_smooth(method="lm", se=F) 


ggplot(data = Orange, aes(x = age, y = circumference, color=Tree)) +
  geom_smooth(method="lm", se=F) + geom_point()




