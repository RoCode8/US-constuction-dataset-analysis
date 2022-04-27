library(tidyverse)
data("construction")
print(colnames(construction))
head(construction)
tail(construction)
ncol(construction)
nrow(construction)

summary(construction)
unique(construction$Month)
construction = construction[-4]     #dropping the null valued column
names(construction)[3] = '1_unit'   #Renaming the particular col
names(construction)[4] = '5_or_more_unit'
mean(construction$'1_unit')
median(construction$Northeast)
sum(construction$'5_or_more_unit')


# plotting the bar graph for the northeast region for each month
x = construction$Northeast
y = construction$Month
barplot(x , names.arg = y , col = 'pink',horiz = TRUE )


##plotted the line graph for 2 different units

l1 = plot(construction$`1_unit` , xlab= '1 Unit Details' ,ylab = 'Construction Data' , col = 'red',
          type = 'l' , main = 'plot the graph' , cex = 1)
l2 = lines(construction$West, xlab= '5 or more unit Detail' ,ylab = 'Construction Dataset' , col = 'blue',
           type = 'l' , main = 'plot the graph' , cex = 4)


# plotting the bar graph using ggplot

ggplot(data = construction)+
  geom_bar(mapping = aes(x = West))

# plotting the Histogram graph using ggplot with binwidth 0.5

ggplot(data = construction)+
  geom_histogram(mapping = aes(x = Midwest) , binwidth = 0.5)

# histogram with facet wrap
# giving results 
ggplot(data = construction)+
  geom_histogram(mapping = aes(x = Northeast),
                 binwidth = 0.1)+
  facet_wrap(~Month)## (~color)


#plotting frequency plot, having different color using "color".
ggplot(data = construction,
       mapping = aes(x = Midwest , color = South))+
  geom_freqpoly(binwidth = 0.1)

ggplot(data = construction,
       mapping = aes(x = West, y = Month))+
  geom_boxplot(mapping = aes(group = cut_width(Northeast , 0.1)))

