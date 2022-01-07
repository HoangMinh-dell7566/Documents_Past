#DE 1
TH1<-c(7.5,8,6.5,7.5,10,NA,9.5,8,8,7.5)
TH2<-c(6,6.5,NA,8,9,8.5,9.5,8.5,NA,7.5)
HT1<-c(7,7,6.5,5.5,9.5,6.5,NA,7.5,7.5,8)
dl<-cbind(TH1,TH2,HT1)
#BT1 a. tao dataframe
KQ<-data.frame(dl)
#b. dien` vao` o trong gia tri TB tuong ung cua tung lop
KQ$TH1[is.na(KQ$TH1)]<-mean(KQ$TH1,na.rm=T)
KQ$TH2[is.na(KQ$TH2)]<-mean(KQ$TH2,na.rm=T)
KQ$HT1[is.na(KQ$HT1)]<-mean(KQ$HT1,na.rm=T)
#c. Ve bieu do the hien ket qua hoc tap
barplot(as.matrix(KQ),main='Ket qua hoc tap',ylab='Diem TB',beside=T,col=rainbow(10))
#BT2 a 
cd<-c(95,115,135,155,175,195)
ct<-c(115,135,155,175,195,215)
db<-(cd+ct)/2
db[7]<-215
stt<-c(15,19,23,31,29,21,6)
#b Tim khoang uoc luong 0.03
n<-sum(stt)
xbar<-sum(db*stt)/n
s2<-sum((db-xbar)^2*stt)/(n-1)
s<-sqrt(s2)
alpha<-0.03
zstar<-qnorm(1-alpha/2)
er<-zstar*s/sqrt(n)
xbar-er;xbar+er
#c tinh so thep loai A
tA<-sum(stt[db>195])
#d Khoang tin cay cho ti le thep loai A
pmu<-tA/n
alpha<-0.02
zstar<-qnorm(1-alpha/2)
er<-zstar*sqrt(pmu*(1-pmu)/n)
pmu-er;pmu+er
#BT3 a
#H0: mu1 = mu2 ; H1: mu1 <> mu2
#b
n<-32
xbar<-180
sig12<-14^2
m<-40
ybar<-170
sig22<-10^2
Z0<-(xbar-ybar)/sqrt(sig12/n+sig22/m)
alpha<-0.05
zstar<-qnorm(1-alpha/2)
abs(Z0)>zstar
p<-2*(1-pnorm(abs(Z0)))
p<alpha 	
#==============================================================
#DE2
#Cau1 a
ABC<-c(192,280,250,370,420,350)
XYZ<-c(210,305,280,300,380,360)
MNL<-c(190,260,300,310,390,380)
dl<-cbind(ABC,XYZ,MNL)

#b hien thi doanh thu cac thang cua xi nghiep ABC tren 300
data<-data.frame(dl)
data$ABC[(data$ABC) > 300]
#c 
dl<-cbind(ABC,XYZ,MNL)
company <- c('ABC','XYZ','MNL')
color <- c('red','green','blue')
data<-matrix(dl,3,6,byrow=T,dimnames=list(c('ABC','XYZ','MNL'),c(1,2,3,4,5,6)))
barplot(as.matrix(data),main='Doanh thu sau thang',ylab='Doanhthu',xlab='Thang',col=rainbow(3))
legend('topleft',company,fill=color)
#Cau2 a
cd<-c(5,7,9,11,13,15,17,19)
ct<-c(7,9,11,13,15,17,19,21)
x<-(cd+ct)/2
sosp<-c(2,8,14,19,22,20,10,5)
#b tim khoang uoc luong chi tieu TB cua loai sp vs do tin cay 95%
n<-sum(sosp)
xbar<-sum(x*sosp)/n
s2<-sum((x-xbar)^2*sosp)/(n-1)
s<-sqrt(s2)
alpha<-0.05
zstar<-qnorm(1-alpha/2)
er<-zstar*s/sqrt(n)
xbar-er;xbar+er
#c chi tieu be hon 12 dc la thep loai 2. Tinh so thep loai 2
t2<-sum(sosp[x<12])
#d Tim khoang tin cay 98% cho ti le sp loai 2
pmu<-t2/n
alpha<-0.02
zstar<-qnorm(1-alpha/2)
er<-zstar*sqrt(pmu*(1-pmu)/n)
pmu-er;pmu+er
#Cau3 a 
#H0: mu1 = mu2; H1: mu1 > mu2
n<-4
xbar<-78
sig12<-24.4^2
m<-4
ybar<-63.5
sig22<-20.2^2
df<-n+m-2
sp<-((n-1)*sig12+(m-1)*sig22)/df
t0<-(xbar-ybar)/(sp*sqrt((1/n)+(1/m)))
alpha<-0.1
tstar<-qt(1-alpha,df)
t0 > tstar
p<-1-pt(t0,df)
p<alpha
#==============================================================
#DE3
#Cau1 a
ABC<-c(192,280,250,370,420,350)
XYZ<-c(210,305,280,300,380,360)
MNL<-c(190,260,300,310,390,380)
dl<-cbind(ABC,XYZ,MNL)
data<-data.frame(dl)
#b
data$ABC[data$ABC > 300]
#c
max_y<-max(data)
colors<-c('red','blue','forestgreen')
plot(data$ABC,type='o',col=colors[1],ylim=c(180,max_y),)
lines(data$XYZ,type='o',col=colors[2],lty=2,pch=22)
lines(data$MNL,type='o',col=colors[3],lty=3,pch=23)
legend(1,max_y,names(data),col=colors,bty='n',fill=rainbow(3))
#Cau2 a
cd<-c(45,50,55,60,65,70,75)
ct<-c(50,55,60,65,70,75,80)
kl<-(cd+ct)/2
kl[8]<-80
st<-c(2,11,25,74,187,43,16,3)
#b 
#H0: mu = 65; H1: mu > 65
mu0<-65
n<-sum(st)
xbar<-sum(kl*st)/n
s2<-sum((kl-xbar)^2*sx)/(n-1)
alpha<-0.01
zstar<-qnorm(1-alpha)
z0<-(xbar-mu0)/(s/sqrt(n))
z0 > zstar
#c trai cay loai 1
l1<-sum(st[kl>65]) 
#d tim khoang tin cay 98% cho loai 1
pmu<-l1/n
alpha<-0.02
zstar<-qnorm(1-alpha/2)
er<-zstar*sqrt(pmu*(1-pmu)/n)
pmu-er;pmu+er
#Cau3 a
dt<-c(81,62,74,78,93,69,72,83,90,84)
ddt<-c(76,71,69,76,87,62,80,75,92,79)
#b
O<-c(81,62,74,78,93,69,72,83,90,84)
#H0: diem thi co phan phoi chuan N(mu,sig2)
#H1: diem thi khon co phan phoi chuan N(mu,sig2)
#chuan hoa du lieu z-score, de kiem dinh voi bien ngau nhien co pp N(0,1)
xbar<-mean(dt)
s2<-var(dt)
s<-sqrt(s2)
#Chuan hoa diem thi
x1<-(dt-xbar)/s
shapiro.test(x1)
#cach 2
pi<-pnorm(x1)
#Ly thuyet, neu diem thi co pp chuan, diem thi pi*n
E<-pi*n	
Q2<-sum((O-E)^2/E)
K<-length(E)
r<-2
df<-K-r-1
alpha<-0.05
kstar<-qchisq(1-alpha,df)
Q2>=kstar
#c Tinh he so tuong quan giua diem thi va diem do an co tuong quan tuyen tinh?
cor(dt,ddt)
cor.test(dt,ddt,method='spearman')
cor.test(dt,ddt,method='kendall')
lm(dt~ddt)
#dt=0.8618ddt+12.4963
#d ve do thi
reg<-lm(dt~ddt)
abline(reg)	

#==============================================================
#DE4
#Cau1 a
TH1<-c(7.5,8,6.5,7.5,10,NA,9.5,8,8,7.5)
TH2<-c(6,6.5,NA,8,9,8.5,9.5,8.5,NA,7.5)
HT1<-c(7,7,6.5,5.5,9.5,6.5,NA,7.5,7.5,8)
dl<-cbind(TH1,TH2,HT1)
KQ<-data.frame(dl)
#b 
KQ$TH1[is.na(KQ$TH1)]<-mean(KQ$TH1,na.rm=T)
KQ$TH2[is.na(KQ$TH2)]<-mean(KQ$TH2,na.rm=T)
KQ$HT1[is.na(KQ$HT1)]<-mean(KQ$HT1,na.rm=T)
#c
max_y<-max(KQ)
colors<-c('red','blue','green')
plot(KQ$TH1,type='o',col=colors[1],ylim=c(4,max_y),main='Ket qua hoc tap',
ylab='DiemTB',xlab='Sinh vien')
lines(KQ$TH2,type='o',col=colors[2],lty=2,pch=22)
lines(KQ$HT1,type='o',col=colors[3],lty=3,pch=23)
legend('bottomright',names(KQ),col=colors,bty='n',fill=rainbow(3))
#Cau2 a
cd<-c(35,40,45,50,56)
ct<-c(40,45,50,55,60)
th<-(ct+cd)/2
sx<-c(14,20,36,22,8)
#b uoc luong khoang tieu hao nhien lieu TB cua loai xe vs do tin cay 95%
n<-sum(sx)
xbar<-sum(th*sx)/n
s2<-sum((th-xbar)^2*sx)/(n-1)
s<-sqrt(s2)
alpha<-0.05
zstar<-qnorm(1-alpha/2)
er<-zstar*(s/sqrt(n))
xbar-er;xbar+er
#c
t1<-sum(sx[th>52])
#d uoc luong ti le do tin cay 95%
pmu<-t1/n
alpha<-0.05
zstar<-qnorm(1-alpha/2)
er<-zstar*sqrt(pmu*(1-pmu)/n)
pmu-er;pmu+er
#Cau3 a
y<-c(5,6,5,6,10,5,7,8,9,10)
x<-c(28,28,24,30,60,30,32,42,43,49)
#b
O<-c(28,28,24,30,60,30,32,42,43,49)
#H0: duong kinh co phan phoi chuan N(mu,sig2)
#H1: duong kinh khong co phan phoi chuan N(mu,sig2)
#chuan hoa du lieu z-score, de kiem dinh voi bien ngau nhien co pp N(0,1)
xbar<-mean(x)
s2<-var(x)
s<-sqrt(s2)
#Chuan hoa diem thi
x1<-(x-xbar)/s
shapiro.test(x1)
#cach 2
#Pi<-phi(x1)
pi<-pnorm(x1)
#Ly thuyet, neu diem thi co pp chuan, diem thi pi*n
E<-pi*n	
Q2<-sum((O-E)^2/E)
K<-length(E)
r<-2
df<-K-r-1
alpha<-0.05
kstar<-qchisq(1-alpha,df)
Q2>=kstar
#c He so tuong quan giua duong kinh va chieu cao co tuong quan tuyen tinh
#he so pearson
cor.test(x,y)
#he so spearman
cor.test(x,y,method='spearman')
#he so kendall
cor.test(x,y,method='kendall')
lm(x~y)
#x=5.322y-1.190
#d ve duong hoi quy tuyen tinh giua duong kinh va chieu cao
reg<-lm(y~x)
abline(reg)


m
month <- c('1','2','3','4','5','6')
company <- c('XYZ','ABC','MNL')
color <- c('red','green','blue')
barplot(m,main="Doanh thu sau thang", xlab="thang",
ylab="Doanh thu",names.arg=month,col=color)
legend('topleft',company,fill=color)