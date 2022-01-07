#De 1:
#Cau 1
dl<-c(33,42,49,49,53,55,55,61,63,67,68,68,69,69,72,73,74,78,80,83,88,88,88,90,
92,94,94,94,94,96,100)
#a
dlu<-unique(dl)
dlu
#b
ts<-function(D,dl){
dem<-0
for(i in 1:length(dl)) if(dl[i]==D) dem<-dem+1
return (dem)}
ts(94,dl)
#c
n<-length(dlu)
H<-rep(1,n)
for(i in 1:length(H)) H[i]<-ts(dlu[i],dl)
H
#d
xbar<-mean(dl)
XS<-H/length(dl)
EX<-sum(dlu*XS)
#Cau 2
x<-c(1,2,3,4,5)
ts<-c(1,7,18,7,6)
# a
ktm<-sum(ts)
xbar<-sum(x*ts)/ktm
s2<-sum((x-xbar)^2*ts)/(ktm-1)
s<-sqrt(s2)
ktm;xbar;s
#b
alpha<-0.05
zstar<-qnorm(1-alpha/2)
er<-zstar*s/sqrt(ktm)
round(xbar-er);round(xbar+er)
#Cau 3
#a Phat bieu GTTK
#H0: muy>=muy0
#H1: muy<muy0
#b KDTK vs alpha = 0.05
xbar<-1.97
n<-20
muy0<-2
s2<-0.12
s<-sqrt(s2)
z0<-(xbar-muy0)/(s/sqrt(n))
zstar<-qnorm(1-alpha)
z0< -zstar
#c P-value
p<-pnorm(zstar)
p<alpha
#=================================
#De 2
#Cau 1 
dl<-c(32, 35, 45, 45, 45, 48, 50, 50, 50, 54, 55, 57, 57, 60, 60, 60, 
		60, 62, 62, 65, 68, 68, 68, 70, 72, 72, 72, 75, 75, 75, 75, 75)
#a
dlu<-unique(dl)
dlu
#b
ts<-function(D,dl){
dem<-0
for(i in 1:length(dl)) if(dl[i]==D) dem<-dem+1
return (dem)}
ts(75,dl)
#c
n<-length(dlu)
H<-rep(1,n)
H
for(i in 1:length(H)) H[i]=ts(dlu[i],dl)
H
#d
xbar<-mean(dl)
xbar
XS<-H/length(dl)
XS
EX<-sum(dlu*XS)
EX
#Cau 2 
nu<-64
nam<-16
n<-nu+nam
pmu<-nu/n
alpha<-0.05
zstar<-qnorm(1-alpha/2)
er<-zstar*sqrt(pmu*(1-pmu)/n)
pmu-er;pmu+er
#b
er1<-0.09
zstar<-er1/er
alpha1<-2*(1-pnorm(zstar))
alpha1
(1-alpha1)*100
#Cau3 
#a Phat bieu GTTK
#mu1 la banh cua nguoi vo lam, mu2 la banh cua nguoi lam banh
#muD = mu1 - mu2; H0: muD <= 0;H1: muD > 0
#b
x1<-c(512,530,498,540,521,528,505,523)
x2<-c(499,500,510,495,515,503,490,511)
D<-x1-x2
xbar<-mean(D)
s<-sd(D)
n<-length(D)
t0<-xbar/(s/sqrt(n))
alpha<-0.05
tstar<-qt(1-alpha,n-1)
t0>tstar
#c P-value
p<-1-pt(t0,n-1)
p<alpha
