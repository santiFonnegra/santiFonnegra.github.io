library(dslabs)
library(ggplot2)

data(Orange)

## Plotting distirbutions 
ggplot(data = Orange, aes(x = age, y = circumference)) + geom_boxplot()


# Make age a factor with as.factor()
Orange$age<-as.factor(Orange$age)
ggplot(Orange, aes(x=age, y=circumference)) + geom_boxplot()


# Boxplots are useful but they hide the true values
# Overlay points + jitter with geom_jitter()
# adds random noise so they don't overlap
# Add transparency via alpha
ggplot(Orange, aes(x=age, y=circumference)) + geom_boxplot() + geom_jitter(alpha=.5)

# change color?
ggplot(Orange, aes(x=age, y=circumference)) + geom_boxplot() +
  geom_jitter(alpha=.5, aes(color=Tree))

# Let's collapse across Three and age (by leaving it out)
# Try to view the distribution of tree heights using geom_histogram()
# Just leave off the y= mapping entirely (what does a histogram have on the y-axis?)
ggplot(Orange, aes(x=circumference)) + geom_histogram()


# Try adding fill=age inside of the aes()
# Why not color=age (try it)
ggplot(Orange, aes(x=circumference, fill=age)) + geom_histogram(bins=60)

# Bring the legend inside your plot!
ggplot(Orange, aes(x=circumference, fill=age)) + geom_histogram(bins=60) +
  theme(legend.position=c(.3,.8), legend.direction = "horizontal")

# Density plots are smoothed versions of histograms
ggplot(Orange, aes(x=circumference, fill=age)) +
  geom_density(alpha=0.7, bw=5) +
  theme(legend.position=c(.3,.8), legend.direction = "horizontal")


# add a rug plot to it 
ggplot(Orange, aes(x=circumference, fill=age)) + 
  geom_density(alpha=0.7, bw=5) +  geom_rug() + 
  theme(legend.position=c(.3,.8), legend.direction = "horizontal")

# combine boxplot and density plot 
ggplot(Orange, aes(x=age, y=circumference, fill=age)) +
  geom_violin(trim=F, bw=10) 


# overlay boxplots  
ggplot(Orange, aes(x=age, y=circumference, fill=age)) + 
  geom_violin(trim=F, bw=10) + geom_boxplot(width=.1)

# Take a minute and poke around in this dataset
data(msleep)
head(msleep)

str(msleep)

# make a scatter plot
p <- ggplot(msleep, aes(sleep_total, sleep_rem)) + geom_point()
p

# let's add geom_smooth()
p + geom_smooth()

# linear trend
p + geom_smooth(method='lm')

ggplot(msleep, aes(x=sleep_total, y=sleep_rem)) + geom_point(aes(color=vore, size=bodywt)) 


### BAR PLOTS and SUMMARY STATS

# Count of each dietary classification in the dataset
ggplot(msleep, aes(vore))+geom_bar(stat="count")

# Let's omit the NAs from the vore variable
# is.na(x) tests if each element of x is an NA, TRUE if so, FALSE otherwise 
# We negate this using the not operator ! (flips T to F and F to T)
msleep1<-msleep[!is.na(msleep$vore),] #delete all rows with NA for vore
ggplot(msleep1, aes(vore))+geom_bar(stat="count")

# exercise 
ggplot(msleep1, aes(x = vore, fill = vore))+geom_bar()+
  theme(legend.position = "none")+
  ggtitle("Prettier Plot!")+xlab("Dietary Habit")+ylab("Count")

# Let's create a new categorical variable called size
# If bodywt is less than the median, then "Small", else "Large"
msleep1$size <- ifelse(msleep1$bodywt<median(msleep1$bodywt), "Small", "Large")
str(msleep1)

# let's plot bar chart again
# We can add this new variable to the previous plot 
# vore and size are both categorical: geom_bar() knows what to do! 
ggplot(msleep1, aes(x = vore, fill=size))+geom_bar() 

# change the order
msleep1$size <- factor(msleep1$size,levels = c("Small","Large"))
ggplot(msleep1, aes(x = vore, fill=size))+geom_bar()

# instead of stacked, you can stagger the bars with position="dodge"
ggplot(msleep1, aes(x = vore, fill=size)) +
  geom_bar(position="dodge")

# Proportions within each level of x-axis variable 
# Here, marginal distribution of size given each vore
ggplot(msleep1, aes(x = vore, fill=size)) +
  geom_bar(position="fill")

# Swap the position of the categorical variables
ggplot(msleep1, aes(x = size, fill=vore)) +
  geom_bar(position="fill")


ggplot(msleep1, aes(x = vore))+
  geom_bar(aes(y=sleep_total), stat="summary", fun=mean)


ggplot(msleep1, aes(x = vore, y = sleep_total))+
  geom_bar(stat="summary",fun=mean)+
  geom_errorbar(stat="summary", fun.data=mean_se, width=0.4)