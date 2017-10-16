#activation function
pi=function(x){
  z=1/(1+exp(-x))
  return(z)
}
#activation potential
active_pot=function(x,w){
  v=(x%*%w)
  return(v)
}

#mean square error
mean_square=function(d,y){
  e=sum((d-y)^2)/16
}
error=function(d,y){
  e=(d-y)
}
mod=function(x){
  if(x>=0){
    return(x)
  }
  else{
    return(-x)
  }
}
lms=function(x){
  e=n*sum(x^2)/16
  return(e)
}
#dummy
#initalization

input=data.matrix(data.frame(x1=c(rep(0,8),rep(1,8)),x2=c(rep(c(rep(0,4),rep(1,4)),2)),x3=c(rep(c(rep(0,2),rep(1,2)),4)),x4=c(rep(c(0,1),8)),b=rep(1,16)))
rownames(input)=c("ip1","ip2","ip3","ip4","ip5","ip6","ip7","ip8","ip9","ip10","ip11","ip12","ip13","ip14","ip15","ip16")
d=data.matrix(data.frame(d=c(0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0)))
rownames(d)=rownames(input)=c("op_1","op_2","op_3","op_4","op_5","op_6","op_7","op_8","op_9","op_10","op_11","op_12","op_13","op_14","op_15","op_16")
set.seed(100)
w_ih=matrix(c(runif(20,-1,1)),5,4)
rownames(w_ih)=c("w1","w2","w3","w4","b")
colnames(w_ih)=c("h1","h2","h3","h4")
set.seed(100)
w_ho=matrix(c(runif(5,-1,1)),5,1)
rownames(w_ho)=c("wo1","wo2","wo3","wo4","b")
colnames(w_ho)="o"
v_h=active_pot(input,w_ih)
y_h=cbind(pi(v_h),c(rep(1,16)))
rownames(y_h)=rownames(input)=c("op_1","op_2","op_3","op_4","op_5","op_6","op_7","op_8","op_9","op_10","op_11","op_12","op_13","op_14","op_15","op_16")
colnames(y_h)=c("h1","h2","h3","h4","b")
v=active_pot(y_h,w_ho)                
y=pi(v)
colnames(y)="y"
e=error(d,y)
epoch=0
n=c(0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5)
delta_wo=0
delta_wh=0
lapply(n,function(x){
repeat{
  if(mod(e[1,1])>=0.05|mod(e[2,1])>=0.05|mod(e[3,1])>=0.05|mod(e[4,1])>=0.05|mod(e[5,1])>=0.05|mod(e[6,1])>=0.05|mod(e[7,1])>=0.05|mod(e[8,1])>=0.05|mod(e[9,1])>=0.05|mod(e[10,1])>=0.05|mod(e[11,1])>=0.05|mod(e[12,1])>=0.05|mod(e[13,1])>=0.05|mod(e[14,1])>=0.05|mod(e[15,1])>=0.05|mod(e[16,1])>=0.05){ 
    
    epoch=epoch+1
    #output layer
    pi_1=y*(1-y)
    #n=0.05
    del_k=(e*pi_1)
    delta_wo=(x*t(y_h)%*%del_k)+(0.9*delta_wo)
    rownames(delta_wo)=c("wo1","wo2","wo3","wo4","b")
    #hidden layer
    pi_h1=y_h*(1-y_h)

    del_hk=del_k%*%t(w_ho)*pi_h1
    delta_wh=((x*t(input)%*%del_hk)[,1:4]) +(0.9*delta_wh)
    rownames(delta_wh)=c("wo1","wo2","wo3","wo4","b")
    colnames(delta_wh)=c("h1","h2","h3","h4")
    #updating the weights
    w_ho=w_ho+delta_wo
    w_ih=w_ih+delta_wh 
    #recalculating the error
    v_h=active_pot(input,w_ih)
    y_h=cbind(pi(v_h)[,1:4],c(rep(1,16)))
    rownames(y_h)=rownames(input)=c("op_1","op_2","op_3","op_4","op_5","op_6","op_7","op_8","op_9","op_10","op_11","op_12","op_13","op_14","op_15","op_16")
    colnames(y_h)=c("h1","h2","h3","h4","b")
    v=active_pot(y_h,w_ho)                
    y=pi(v)
    colnames(y)="y"
    e=error(d,y)
  }
  else{
    break
  }
  
}
  print(epoch)
  print(e)
  
})