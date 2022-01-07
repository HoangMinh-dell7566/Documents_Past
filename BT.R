#PHAN PHOI NHI THUC
#2.1 Goi X la BNN so lo thuoc tot cua hop 1,2,3
#a. 
x<-c(0,1,2,3)
p<-c(7/90,59/180,77/180,1/6)
library(distrEx)
X<-DiscreteDistribution(x,p)
E(X)
var(X)
#b. 
#P(X>=2)
p1<-p[3]+p[4] 
#P(X=0)+P(X=3)
p2<-p[1]+p[4]
#2.2 Goi X la BNN so tran thang cua doi tuyen 0,1,2,3
#a.
x<-c(0,1,2,3)
p<-c(0.024,0.188,0.452,0.336) 
#b.
#P(x>=2)
p1<-p[3]+p[4]
#P(x>=1)
p2<-1-p[1]
#2.3 Goi X la BNN cua so tran thang cua doi tuyen 0,1,2,3
#a. 
x<-c(0,1,2,3)
p<-c(0.024,0.188,0.452,0.336) 
#b.
#P(Abar/X=2) = P(0.4,0.7,0.8)/P(X = 2)
#2.4 goi X la BNN là so tran thang cua doi tuyen 0,1,2,3
x<-c(0,1,2,3)
p<-c(0.024,0.188,0.452,0.336)
#E(X) = sum(x*p)
library(distrEx)
X<-DiscreteDistribution(x,p)
E(X)
var(X)
#2.5 Goi X la BNN the hien so keo trong moi bao
a. trung binh va phuong sai cua so keo trng moi bao
x<-c(18,19,20,21,22)
p<-c(0.14,0.24,0.32,0.21,0.09)
library(distrEx)
X<-DiscreteDistribution(x,p)
E(X)
var(X)
#b. E(Y) = E(84 - 3X) = 84 - 3E(X)
#sig(Y)=sqrt(var(Y))=sqrt(var(84-3X))=3sqrt(var(X))
#PHAN PHOI DEU
#VD 58 Goi x la BNN the hien ds trong 1 thang; kha nagn ds tu 20 -40
#X ~ unif([20,40])
#P(X>=35) = 1 - P(X<35) = 1 - P(X<=35)
1-punif(35,20,40)
#Ve ham mat do xs hay ham gtri xs cua x
x<-seq(20,40,0.1)
y<-dunif(x,20,40)
plot(x,y,type='l',dol='red')
#Ve ham pp xs cua x
z<-punif(x,20,40)
plot(x,z,type='l',dol='red')
#PHAN PHOI MU
#VD 59 Goi X là BNN the hien so nguoi truy cap trong 6 phút
#lamda = so nguoi TB dang nhap trong 6'
lamda <- 25/10
#P(X=0)
dpois(0,lamda)
#Y la BNN the hien thgin giua 2 lan dang nhap Y~Exp(lamda1)
#lamda = so nguoi TB dang nhap trong 1'
lamda1<-25/60
#P(2<=x<=3) = P(x<=b) - P(x<=a)
pexp(3,lamda1) - pexp(2,lamda1)
#Ve ham mat do xs ung vs xe
x<-seq(0,15,0.1) 
j<-dexp(x,lamda1)
plot(x,j,type='l',lty=1,col='red')
#Ve ham phan phoi xs ung vs x
l<-pexp(x,lamda1)
plot(x,l,type='l',lty=1,col='red')
#UOC LUONG KHOANG DA BT PHUONG SAI
#5.1b
alpha<-0.05
sig<-3
n<-25
xbar<-10
zstar<-qnorm(1-alpha/2)
er<-zstar*sig/sqrt(n)
zstar-er;zstar+er
#5.2a 
sig<-500
xbar<-8900
n<-15
alpha<-0.05
zstar<-qnorm(1-alpha/2,0,1)
er<-zstar*sig/sqrt(n)
xbar-er;xbar+er
#5.2b
n<-25
xbar<-15
s<-3
alpha<-0.05
tstar<-qt(1-alpha/2,n-1)
er<-tstar*s/sqrt(n)
xbar-er;xbar+er 
#5.3a
s<-500
xbar<-8900
n<-35
alpha<-0.05
zstar<-qnorm(1-alpha/2)
er<-zstar*s/sqrt(n)
xbar-er;xbar+er
#5.3b
alpha<-0.1
zstar<-qnorm(1-alpha/2)
er<-zstar*s/sqrt(n)
xbar-er;xbar+er
#5.4a
n<-100
xbar<-8900
s<-500
alpha<-0.05
zstar<-qnorm(1-alpha/2)
er<-zstar*s/sqrt(n)
xbar-er;xbar+er
#5.4b
er1<-130
zstar<-er1/(s/sqrt(n))
alpha1<-2*(1-pnorm(zstar))
alpha1
#do tin cay
(1-alpha1)*100
#5.5b
n<-300*0.1
xbar<-148.5
s<-35.75
alpha<-0.05
tstar<-qt(1-alpha/2,n-1)
er<-tstar*s/sqrt(n)
xbar-er;xbar+er
#5.6a
alpha<-0.05
n<-50*10
Y<-45
pmu<-Y/n
zstar<-qnorm(1-alpha/2)
er<-zstar*sqrt(pmu*(1-pmu)/n)
(pmu-er)*10000;(pmu+er)*10000
#5.6b
er1<-0.015
zstar<-er1/sqrt(pmu*(1-pmu)/n)
alpha1<-2*(1-pnorm(zstar))
(1-alpha1)*100
#UOC LUONG KHOANG CHUA BT PHUONG SAI
#5.8a 
xi<-c(3,4,5,6,7,8)
ts<-c(2,8,23,32,23,12)
n<-sum(ts)
xbar<-sum(xi*ts)/n
s2<-sum((xi-xbar)^2*ts)/(n-1)
s<-sqrt(s2)
alpha<-1-0.9
zstar<-qnorm(1-alpha/2)
er<-zstar*s/sqrt(n)
xbar-er;xbar+er
#5.8b
A<-sum(ts[xi>=7])
pmu<-A/n
alpha<-(1-0.9544)
zstar<-qnorm(1-alpha/2)
er<-zstar*sqrt(pmu*(1-pmu)/n)
pmu-er;pmu+er
#5.11a 
xi<-c(9,10,12,14,15)
ts<-c(10,24,42,16,8)
alpha<-0.03
n<-100
xbar<-sum(xi*ts)/sum(ts)
S2<-sum((xi-xbar)^2*ts)/(n-1)
s<-sqrt(S2)
zstar<-qnorm(1-alpha/2)
er<-zstar*s/sqrt(n)
xbar-er;xbar+er
#bai5.7a,5.16a,5.26a,5.28a
#5.7a
xi<-c(3,4,5,6,7,8)
pi<-c(2,8,23,32,23,12)
n<-sum(pi)
xbar<-sum(xi*pi)/sum(pi)
s2<-sum((xi-xbar)^2*pi)/(n-1)
s<-sqrt(s2)
alpha<-1-0.9
zstar<-qnorm(1-alpha/2)
er<-zstar*s/sqrt(n)
xbar-er;xbar+er
#5.16a
#UOC LUONG KHOANG CHUA BT PHUONG SAI MAU NHO
#5.23
x<-c(25.4,28,20.1,27.4,25.6,23.9,24.8,26.4,27,25.4)
n<-length(x)
xbar<-mean(x)
s2<-var(x)
s<-sqrt(s2)
alpha<-1-0.9
tstar<-qt(1-alpha/2,n-1)
er<-tstar*s/sqrt(n)
xbar-er;xbar+er
#BT 5.2(sd=3)
#5.3a
n<-35
s<-500
xbar<-8900
alpha<-1-0.9
tstar<-qt(1-alpha/2,n-1)
er<-tstar*s/sqrt(n)
xbar-er;xbar+er
#UOC LUONG TY LE CHO TONG THE
#5.19b
n<-344
y<-83
alpha<-1-0.9
pmu<-y/n
zstar<-qnorm(1-alpha/2)
er<-zstar*sqrt(pmu*(1-pmu)/n)
pmu-er;pmu+er
#5.20
xi<-c(9.85,9.9,9.95,10,10.05,10.10,10.15)
ts<-c(8,12,20,30,14,10,6)
n<-sum(ts)
alpha<-0.05
y<-12+20+30+14+10
pmu<-y/n
zstar<-qnorm(1-alpha/2)
er<-zstar*sqrt(pmu*(1-pmu)/n)
pmu-er;pmu+er
#KICH THUOC MAU
#5.7b
esp<-0.2
alpha<-0.05
zstar<-qnorm(1-alpha/2)
xi<-c(3,4,5,6,7,8)
ts<-c(2,8,23,32,23,12)
xbar<-sum(xi*ts)/sum(ts)
ktm<-sum(ts)
s2<-sum((xi-xbar)^2*ts)/(ktm-1)
s<-sqrt(s2)
n<- (zstar*s/esp)^2
ktmqs<-round(n)
ktmqs-ktm
#KDGTTK BT PHUONG SAI
#6.1
#H0: mu <= mu0 ; H1:mu >mu0 
n<- 64
mu0<-72
alpha<-0.01
sig<-9
xbar<-74
z0<-(xbar-mu0)/(sig/sqrt(n))
zstar<-qnorm(1-alpha)
z0>zstar
p<-1-pnorm(z0)
p<alpha
#TKKD CHUA BT PHUONG SAI MAU LON
#6.20
#H0: mu >= mu0; H1: mu < mu0
xi<-c(0,1,2,3,4,5,6)
ts<-c(7,4,4,6,8,6,1)
mu0<-3
n<-sum(ts)
xbar<-sum(xi*ts)/n
s2<-sum((xi-xbar)^2*ts)/(n-1)
s<-sqrt(s2)
z0<-(xbar-mu0)/(s/sqrt(n))
alpha<-0.1
zstar<-qnorm(1-alpha)
z0< -zstar
p<-pnorm(t0)
p <alpha
#6.24
#H0: mu <= mu0; H1: mu > 0
cd<-c(3,3.6,4.2,4.8,5.4,6,6.6)
ct<-c(3.6,4.2,4.8,5.4,6,6.6,7.2)
xi<-(cd+ct)/2
ts<-c(2,8,35,43,22,15,5)
n<-sum(ts)
mu0<-4.95
xbar<-sum(xi*ts)/n
s2<-sum((xi-xbar)^2*ts)/(n-1)
s<-sqrt(s2)
z0<-(xbar-mu0)/(s/sqrt(n))
alpha<-0.01
zstar<-qnorm(1-alpha)
z0>zstar
p<-1-pnorm(z0)
p<alpha
#TKKD CHUA BT PHUONG SAI MAU NHO
#6.2
#H0: mu < mu0; H1:mu >mu0
n<-25
xbar<-172
s<-40
mu0<-156
alpha<-0.05
t0<-(xbar-mu0)/(s/sqrt(n))
tstar<-qt(1-alpha,n-1)
t0>tstar
p<-1-pt(t0,n-1)
p<alpha
#KD CHO PHUONG SAI
#6.27
#H0:sig2<=sig02  H1:sig2>sig02
n<-10
sig02<-1000^2
sig2<-1150^2
alpha<-0.05
k0<-(n-1)*sig2/sig02
kstar<-qchisq(1-alpha,n-1)
k0>kstar
#KIEM DINH CHO TY LE
#6.4a
#H0:pmu>=p0 H1:pmu<p0
p0<-0.05
n<-800
y<-24
pmu<-y/n
alpha<-0.05
z0<-(pmu-p0)/sqrt((p0*(1-p0))/n)
zstar<-qnorm(1-alpha)
z0< -zstar
p<- pnorm(z0)
p<alpha
#6.4b
#H0: p=0.02; H1: p <> 0.02
p0<-0.02
n<-800
y<-24
pmu<-y/n
alpha<-0.03
z0<-(pmu-p0)/sqrt((p0*(1-p0))/n)
zstar<-qnorm(1-alpha/2)
abs(z0)>zstar
p<-2*(1-pnorm(abs(z0)))
p<alpha
#6.9 
#H0:p<=p0 H1:p>p0
n<-400
xi<-c(1,2,3,4,5,6,7,8,9,10)
ts<-c(2,0,4,6,8,10,4,5,1,0)
y<-sum(ts*xi)
n<-400
pmu<- y/n
p0<-0.48
z0<-(pmu-p0)/sqrt(p0*(1-p0)/n)
alpha<-0.05
zstar<-qnorm(1-alpha)
z0>zstar
p<-1-pnorm(z0)
p<alpha
#6.7
dl<-edit(data.frame())
xbar<-sum(dl$ni*dl$pi)/sum(dl$pi)
n<-sum(dl$pi)
xbar<-500
sig<-8.5
alpha<-0.05
zstar<-qnorm(1-alpha)
Z0>zstar
# Z0 lon hon zstar nen bac bo H0 -> chap nhan H1
zphi<-qnorm(Z0)
p<phiz0
#TKKD CHO 2 MAU
#vidu89
#H1:mu1<>mu2
pa1<-c(2.5,3.2,3.5,3.8,3.5)
n<-length(pa1)
pa2<-c(2,2.7,2.5,2.3,2.6)
m<-length(pa2)
Xbar<-mean(pa1)
Ybar<-mean(pa2)
sig12<-0.16
sig22<-0.16
alpha<-0.05
Z0<-(Xbar-Ybar)/sqrt(sig12/n+sig22/m)
zstar<-qnorm(1-alpha/2)
abs(Z0)>zstar
P<-2*(1-pnorm(abs(Z0)))
p<alpha
#6.34
#H1: mu1 > mu2
mc<-c(58,58,56,38,70,38,42,75,68,67)
mm<-c(57,55,63,24,67,43,33,68,56,54)
n<-length(mc)
m<-length(mm)
Xbar<-mean(mc)
Ybar<-mean(mm)
sig12<-13.5
sig22<-14.5
alpha<-0.05
Z0<- (Xbar-Ybar)/sqrt(sig12/n+sig22/m)
zstar<-qnorm(1-alpha)
Z0>zstar
p<- 1-pnorm(Z0)
p<alpha
#SO SANH 2 KY VONG, CHUA BT PHUONG SAI
#MAU LON
#6.5
#H1: mu1 <> mu2
n<-30
m<-40
Xbar<-180
Ybar<-170
sig12<-14^2
sig22<-10^2
alpha<-0.05
Z0<- (Xbar-Ybar)/sqrt(sig12/n+sig22/m)
zstar<-qnorm(1-alpha/2)
abs(Z0)> zstar
p<-2*(1-pnorm(abs(z0)))
p<alpha
#mau nho
#6.18
#H1: mu1 <> mu2
pxa<-c(250,249,251,253,248,250,252,257,245,248,247,249,250,280,250,247,253,256,249)
n<-length(pxa)
Xbar<-mean(pxa)
Ybar<-249.8
m<-20
S12<-var(pxa)
S22<-56.2
alpha<-0.05
sp2<-((n-1)*S12+(m-1)*S22)/(n+m-2)
T0<- (Xbar-Ybar)/sqrt(sp2*(1/n+1/m))
df<-n+m-2
tstar<-qt(1-alpha/2,df)
abs(T0)>tstar
p<-2*pt(t0,n+m-2)
p<alpha
#SO SANH 2 PHUONG SAI
#vd90
#H1: sig12 > sig22
alpha<-0.05
n<-40
s12<-11.41
m<-41
s22<-6.52
m<-40
F0<-s12/s22
fstar<-qf(1-alpha,n-1,m-1)
F0>fstar
#SO SANH 2 TY LE
#6.25
#H1: p1 > p2
x<-28
n<-200
y<-12
m<-170
pu1<-x/n
pu2<-y/m
pmu<-(x+y)/(n+m)
Z0<-(pu1-pu2)/sqrt(pmu*(1-pmu)*(1/n+1/m))
alpha<-0.05
zstar<-qnorm(1-alpha)
Z0>zstar
p<- 1-pnorm(Z0)
p<alpha
#6.23
#H1: p1 <> p2 
x<-71
n<-100
y<-58
m<-90
alpha<-0.05
pu1<-x/n
pu2<-y/m
pmu<-(x+y)/(n+m)
Z0<-(pu1-pu2)/sqrt(pmu*(1-pmu)*(1/n+1/m))
zstar<-qnorm(1-alpha/2)
abs(Z0)>zstar
p<-2*(1-pnorm(abs(Z0)))
p<alpha
#KIEM DINH GIA THUYET CHO 2 MAU DOC LAP
#VD1: H1: muD>0; H0: muD<0
x1<-c(6.6,6.5,9,10.3,11.3,8.1,6.3,11.6)
x2<-c(6.8,2.4,7.4,8.5,8.1,6.1,3.4,2)
D=x1-x2
xbar<-mean(D)
Sd<-sd(D)
n<-length(D)
T0<- xbar/(Sd/sqrt(n))
alpha<-0.05
tstar<-qt(1-alpha,n-1)
T0> tstar
#VD2: H0: muD < 0; H1: muD > 0
tt<-c(30,26,34,17,19,26,20)
ty<-c(28,14,27,18,17,26,16)
D=tt-ty
xbar<-mean(D)s
Sd<-sd(D)
n<-length(D)
T0<- xbar/(Sd/sqrt(n))
alpha<-0.05
tstar<-qt(1-alpha,n-1)
T0>tstar
#VD3: H1: muD >0 
ds<-c(1920,2160,2200,2100)
dt<-c(1840,1960,1920,2150)
D=ds-dt
n<-length(D)
xbar<-mean(D)
Sd<-sd(D)
T0<- xbar/(Sd/sqrt(n))
alpha<-0.05
tstar<-qt(1-alpha,n-1)
T0>tstar
#KIEM DINH KHI BINH PHUONG
#VD
E<-c(50,30,12,6,2)
O<-c(35,40,20,1,4)
Q2<-sum((O-E)^2/E)
K<-length(E)
df<-K-1
alpha<-0.05
kstar<-qchisq(1-alpha,df)
Q2>=kstar
p<-1-pchisq(Q2,df)
p<alpha
#6.29 p.111
#H0: viec thanh toan hoa don theo qui luat nam cu
#H1: viec thanh toan hoa don k theo qui luat nam cu
O<-c(287,49,30,34)
E<-c(320,40,24,16)
Q2<-sum((O-E)^2/E)
K<-length(E)
df<-K-1
alpha<-0.05
kstar<-qchisq(1-alpha,df)
Q2>=kstar
p<-1-pchisq(Q2,df)
p<alpha
#vd:H0: bac bo, h1: chap nhan
E<-c(12,12,12,12,12)
O<-c(15,12,9,9,15)
Q2<-sum((O-E)^2/E)
alpha<-0.05
K<-length(E)
df<-K-1
kstar<-qchisq(1-alpha,df)
Q2>=kstar
p<-1-pchisq(Q2,df)
p<alpha
#6.30 p.112
#H0: bac bo H1: chap nhan
E<-c(38.33,38.33,38.33,42.33,42.33,42.33,19.33,19.33,19.33)
O<-c(43,30,42,35,53,39,22,17,19)
Q2<-sum((O-E)^2/E)
K<-9
alpha<-0.05
df<-K-1
kstar<-qchisq(1-alpha,df)
Q2 >=kstar
#11.2 H0: bac bo H1: chap nhan
E<-c(8,8,8,8,8,8,8)
O<-c(11,8,10,7,10,5,5)
Q2<-sum((O-E)^2/E)
K<-length(E)
df<-K-1
alpha<-0.05
tstar<-qchisq(1-alpha,df)
Q2 >= tstar
#VD93 129
cd<-c(0,3,6,9,12,15,18,21,24,27)
ct<-c(3,6,9,12,15,18,21,24,27,30)
xj<-(cd+ct)/2
ts<-c(10,30,40,60,110,100,70,50,20,10)
n<-sum(ts)
xbar<-sum(xj*ts)/n
s2<-sum((xj-xbar)^2*ts)/(n-1)
s<-sqrt(s2)
x<- (xj-xbar)/s
shapiro.test(x)

#11.13 p 629
#H0: 
E<-c(60,96,330,66,48)
O<-c(66,119,340,60,15)
Q2<-sum((O-E)^2/E)
K<-length(E)
df<-K-1
alpha<-0.01
tstar<-qchisq(1-alpha,df)
Q2 >= tstar
#KIEM 1 BNN THUOC PP NAO?
#VD93
cd<-c(0,3,6,9,12,15,18,21,24,27)
ct<-c(3,6,9,12,15,18,21,24,27,30)
x<-(cd+ct)/2
ni<-c(10,30,40,60,110,100,70,50,20,10)
O<-c(10,30,40,60,110,100,70,50,20,10)
#H0: X co phan phoi chuan N(mu,sig2)
#H1; X k co phan phoi chuan N(mu,sig2)
#chuan hoa du lieu z-score, de kiem kinh voi BNN co pp N(0,1)
xbar<-sum(x*ni)/sum(ni)
s2<-sum((x-xbar)^2*ni)/(sum(ni)-1)
n<-sum(ts)
s<-sqrt(s2)
x1<-(x-xbar)/s
#chuan hoa cac canh
cdn<- (cd-xbar)/s
ctn<- (ct-xbar)/s
pi<-pnorm(ctn)-pnorm(cdn)
E<-pi*n
Q2<-sum((O-E)^2/E)
K<-length(E)
df<-K-2-1
alpha<-0.05
kstar<-qchisq(1-alpha,df)
Q2>=kstar
#VD
x<-c(0,1,2,3,4,5,6,7)
ts<-c(6,23,29,31,27,13,8,13)
O<-c(6,23,29,31,27,13,8,13)
n<-sum(ts)
lamda<-sum(x*ts)/n
pi<- dpois(x,lamda)
pi[8]<-1-ppois(7,lamda)
E<-pi*n
Q2<-sum((O-E)^2/E)
K<-length(E)
df<-K-1-1
alpha<-0.05
kstar<-qchisq(1-alpha,df)
Q2>=kstar
vd94.