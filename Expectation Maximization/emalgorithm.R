data1=read.csv('C:\\Users\\manub\\Downloads\\ML\\data1.csv')
#initialization
u=c(0.3,0.6,0.4)
s=c(0.4,0.8,0.5)
pc=c(0.33,0.33,0.34)
Prb__X=c()
PrbX_C=data.frame()
pc_x=data.frame()
for(i in 1:nrow(data1)){
  Prb__X[i]=0
}
N=c()
for(i in 1:length(u))
{
  N[i]=0
  
  
}

l=c()
l[1]=7
l[2]=9

for(k in 2:200)
{
#Expectation
  
  if(abs(l[k]-l[k-1])>=0.000001){
    
  
  for(j in 1:nrow(data1))
  { 
    for(i in 1:length(u))
    {
      PrbX_C[j,i]=exp(-1*((data1[j,1]-u[i])^2)/(2*(s[i]^2)))/sqrt(2*pi*(s[i]^2))
      
    }  
  }
  for(j in 1:nrow(data1)){
    Prb__X[j]=0
  }
  for(j in 1:nrow(data1)){
    for(i in 1:length(u)){
      Prb__X[j]=Prb__X[j]+pc[i]*PrbX_C[j,i]
      
    }
    
  }
  for(j in 1:nrow(data1))
  {
    for(i in 1:length(u))
    {
      pc_x[j,i]=(PrbX_C[j,i]*pc[i])/Prb__X[j]
      
    }
    
  }
  
  
 #Maximmization 
  
 
  for(i in 1:length(u))
  {
    N[i]=sum(pc_x[,i])
    
    
  }
  for(i in 1:length(u)){
    u[i]=sum(pc_x[,i]*data1)/N[i]
    s[i]=sqrt((sum(pc_x[,i]*(data1^2))/N[i])-((sum(pc_x[,i]*data1)/N[i])^2))
    pc[i]=N[i]/nrow(data1)
    
  }
  
  
  loglkhd=0
  
    for(i in 1:length(u))
    {
      loglkhd=loglkhd+(PrbX_C[,i]*pc[i])
    }
    l=append(l,sum(log(loglkhd)))
  

  
}

}
max(l)
u
s
pc
plot(l,main="Plot of log Likelihood",xlab="number of iteration ",ylab="log likelihood")
