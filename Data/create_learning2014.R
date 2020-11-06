#Jessie Chen
#3.11.2020
#Data wrangling: pre-processing on the data from http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt

#The data set has a total of 183 rows and 60 columns, which means there are 183 observations and 60 variables.
setwd()
getwd()learning2014.txt <- read.table('learning2014.txt',header = T) #read data
dim(learning2014.txt) 
#The data set initially shows that there are 1 predictor variable 'points', a categorical variable 'gender', and the remaining are explanatory variables. The explanatory variables are numerical variables.
class(learning2014.txt[,60]) #Checking the the data type of the last column variable. The result is a character type.
type<- data.frame("1") #Defining an empty data frame that can store characters
for(i in 1:60){type[i,]<-class(data2[,i]) print(type)} #Using a loop to check the data type of each variable. The result shows that except for the last variable which is a character type, the rest are all numeric types.


View(learning2014.txt) #Checking the specific organization of the data to determine the required variables.
#Constructing new variables
learning2014.txt<-na.omit(learning2014.txt) #Removing the missing values in the data.
d_sm<-learning2014.txt[,9]+learning2014.txt[,17]+learning2014.txt[,25]+learning2014.txt[,33]
d_ri<-learning2014.txt[,13]+learning2014.txt[,20]+learning2014.txt[,28]+learning2014.txt[,36]
d_ue<-learning2014.txt[,12]+learning2014.txt[,21]+learning2014.txt[,29]+learning2014.txt[,37]
su_lp<-learning2014.txt[,8]+learning2014.txt[,16]+learning2014.txt[,24]+learning2014.txt[,32]
su_um<- learning2014.txt[,11]+learning2014.txt[,19]+learning2014.txt[,27]+learning2014.txt[,35]
su_sb<- learning2014.txt[,14]+learning2014.txt[,22]+learning2014.txt[,30]+learning2014.txt[,38]
st_os<- learning2014.txt[,7]+learning2014.txt[,15]+learning2014.txt[,23]+learning2014.txt[,31]
st_tm<-learning2014.txt[,10]+learning2014.txt[,18]+learning2014.txt[,26]+learning2014.txt[,34]
#Defining new variables
deep<-d_sm+d_ri+d_ue
surf<-su_lp+su_um+su_sb
stra<-st_os+st_tm
#Extracting the variables required in the question
gender<- learning2014.txt[,60]
age<-learning2014.txt[,57]
attitude<-learning2014.txt[,58]
points<-learning2014.txt[,59]
#Constructing the data frame
df<- data.frame(gender,age,attitude,deep,stra,surf,points) library(dplyr) 
df2<-df %>% filter(points!=0) #Remove all lines with 'point=0'
df2_scale<- scale(df2[,-c(1,2)],center = T,scale = T) #Removing gender variables, standardize the remaining numerical variables, and centralize processing.

#Writing the data to the folder and save it in csv format
df.data<- write.csv(df2_scale,file = 'data.csv')


