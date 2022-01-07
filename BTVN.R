#BT
#H1: s12 <> s22
mm<-c(42.1,41.3,42.4,43.2,41.8,41,41.8,42.8,42.3,42.7)
mc<-c(42.7,43.8,42.5,43.1,44,43.6,43.4,43.5,41.7,44.1)
n<-length(mm)
m<-length(mc)
s12<-var(mm)
s22<-var(mc)
F0<-s12/s22
alpha<-0.05
fstar<-qf(1-alpha/2,n-1,m-1)
abs(F0)>fstar
============================================
#H1: sig12<>sig22
xbar<-38.48
ybar<-26.93
n<-40
m<-40
s12<-16.37^2
s22<-9.88^2
f0<-s12/s22
alpha<-0.05
fstar<-qf(alpha/2,39,39)
f1<-qf(alpha/2,39,39)
f2<-qf(1-alpha/2,39,39)
f0<f1 || f0>f2


t1<-function(x){
print('so lan thanh cong trong khoang 1: ')
dem<-0
gt<-ybar-3*S
gd<-ybar+3*S
for(i in 1:length(x)){
if(x[i]>=gt && x[i]<=gd){dem<-dem+1}
}
print(dem)
print(gt)
print(gd)
}
t1(dl)