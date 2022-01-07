#De 1
#Cau a
Sv01<-c(7.5,6.0,7.0)
Sv02<-c(8.0,6.5,7.0)
Sv03<-c(6.5,NA,6.5)
Sv04<-c(7.5,8.0,5.5)
Sv05<-c(10,9,9.5)
Sv06<-c(NA,8.5,6.5)
Sv07<-c(9.5,9.5,NA)
Sv08<-c(8.0,8.5,7.5)
Sv09<-c(8.0,NA,7.5)
Sv10<-c(7.5,7.5,8.0)
Cau1<-data.frame(ID=c('TH1','TH2','HT1'),Sv01,Sv02,Sv03,Sv04,Sv05,Sv06,Sv07,Sv08,Sv09,Sv10)
#cau b
Means<-c(rowMeans(Cau1[,-1],na.rm = T))
Cau1$Sv03[is.na(Cau1$Sv03)]<-round(Means[2],1)
Cau1$Sv06[is.na(Cau1$Sv06)]<-round(Means[1],1)
Cau1$Sv07[is.na(Cau1$Sv07)]<-round(Means[3],1)
Cau1$Sv09[is.na(Cau1$Sv09)]<-round(Means[2],1)
#Cau c
library(reshape2)
new.df<-melt(Cau1,id.vars="ID")
names(new.df)=c("ID","SV","DTB")
library(ggplot2)
ggplot(new.df, aes(x=ID,y=DTB,fill=substring(SV,1)))+
        geom_histogram(stat="identity",position="dodge")

#Cau 2
#a
GHduoi<-c(95,115,135,155,175,195,215)
GHtren<-c(115,135,155,175,195,215,235)
SoThep<-c(15,19,23,31,29,21,6)
Cau2<-data.frame(GHduoi,GHtren,SoThep)
#b
n<-sum(Cau2$SoThep)
mid<-(GHtren+GHduoi)/2
Cau2$mid<-mid
Xbar<-sum(Cau2$mid*Cau2$SoThep)/sum(Cau2$SoThep)
s2<-sum((Xbar-Cau2$mid)^2*Cau2$mid)/(n-1)
s<-sqrt(s2)
s<-round(s,2)
alpha<-1-0.97
zstar<-qnorm(1-alpha/2)
zstar<-round(zstar,2)
er<-zstar*s/sqrt(n)
er<-round(er,3)
Xbar-er;Xbar+er
#c so tap thep loai A la 27
#d 
p<-27/144
alpha<-1-0.98
zstar<-qnorm(1-alpha/2)
er<-zstar*sqrt(p*(1-p)/n)
p-er;p+er
#Cau 3
#nghi ngo luong phu nu thap hon nam gioi
#Goi x,y theo thu tu la luong dan ong va phu nu
#H0 : muyx=muyy H1: muyx > muyy 
n<-4
m<-4
df<-n+m-2
Xbar<-78
Ybar<-63.5
S1<-24.4^2
S2<-20.9^2
Sp2<-((n-1)*S1+(m-1)*S2^2)/(n+m-2)
T0<-(Xbar-Ybar)/sqrt(Sp2*(1/n+1/m))
alpha<-1-0.9
tstar<-qt(1-alpha,df)
abs(T0)>tstar
#False
#H0 chap nhan H0 bac bo H1 vay ket luan cuoc dieu tra chua dung
#pVALUE
p<-qt(T0,n-1)
p>= alpha
#False 

#De2
#cau a
m<-matrix(c(192,280,250,370,420,350,210,305,280,300,380,360,190,260,300,310,390,380),nrow =3,ncol =6 ,byrow = T)
#cau b
sc<-length(m[1,])
dem<-0
for(i in 1:sc){
    if(m[1,i] > 300)
    {    
        dem<- dem+1
    }
}
x<-dim(dem)
for(i in 1:sc){
    if(m[1,i] > 300)
    {    
     x<-append(x, m[1,i])
    }
}
#cau c
ABC<-m[1,]
XYZ<-m[2,]
MNL<-m[3,]
plot_colors<-c("red","blue","green")
plot(ABC,type = "o",col= "red",xlab="Thang",ylab = "Doanh thu",main = "doanh thu 6 thang dau nam")
lines(XYZ,type = "o",lty=2,col= "blue")
lines(MNL,type = "o",lty=3,col= "green")
legend("topleft",c("ABC","XYZ","MNL"),fill = plot_colors)
#Cau 2:
GHduoi<-c(45,50,55,60,65,70,75,80)
GHtren<-c(50,55,60,65,70,75,80,85)
SoTrai<-c(2,11,25,74,187,43,16,3)
Cau2<-data.frame(GHduoi,GHtren,SoTrai)
#Cau b H0: muy = muy0 = 65 H1:muy > muy0
muy0<-65
n<-sum(Cau2$SoTrai)
mid<-(GHtren+GHduoi)/2
Cau2$mid<-mid
Xbar<-sum(Cau2$mid*Cau2$SoTrai)/sum(Cau2$SoTrai)
s2<-sum((Xbar-Cau2$mid)^2*Cau2$SoTrai)/(n-1)
s<-sqrt(s2)
alpha<-0.01
zstar<-qnorm(1-alpha)
Z0<-(Xbar-muy0)/(s/sqrt(n))
Z0>zstar
#True chap nhan H1 bac bo H0 => loai phan ban moi mang lai ket qua voi y nghia 1%
#cau c So trai > 65 thuoc loai I 
Y<-sum(Cau2$SoTrai[Cau2$GHduoi >=65])
p<-Y/n
alpha<-1-0.98
zstar<-qnorm(1-alpha/2)
er<-zstar*sqrt(p*(1-p)/n)
p-er;p+er

#Cau 3
#cau a
DiemThi<-c(81,62,74,78,93,69,72,83,90,84)
DiemDA<-c(76,71,69,76,87,62,80,75,92,79)
Cau3<-data.frame(DiemThi,DiemDA)
#cau b
#H0 diem thi co phan phoi chuan
#H1 diem thi khong co phan phoi chuan
n<-length(DiemThi)
a <- rep(1, times = n)
Xbar<-mean(DiemThi)
s2<-var(DiemThi)
s<-sqrt(s2)
r<-2
df<-n-r-1
alpha<-0.05
kstar<-qchisq(1-alpha,df)
X1<-(DiemThi-Xbar)/s
pi<-pnorm(X1)
Ej<-pi*n
Q2<-sum((oj-Ej)^2/Ej)
Q2>=kstar
#True chap nhan H1 khong phai phan phoi chuan
shapiro.test(X1)
#cau c 
cor.test(DiemThi,DiemDA)
#diem thi va diem da co hoi quy
#cau 
plot(DiemThi,DiemDA)
reg<-lm(DiemDA~DiemThi)
abline(reg)

#Cau 1
X<-c(90,12,45,67,120,20,24,36,20,100,45,51,20,48,60,12)
demts<-function(x,y){
    dem<-0
    for(i in 1:length(y))
    {
        if(y[i] == x)
            dem<-dem+1
    }
    return (dem)
}
Mode<-function(x){
    kq<-unique(x)
    tam<-rep(0,length(kq))
    for(i in 1:length(kq))
        tam[i]<-demts(kq[i],x)
    if (min(tam)!=max(tam))
        for(i in 1:length(kq))
            if(tam[i] == max(tam))
                print(kq[i])
}
Mode(X)
#Cau 2
n<-100
Xbar<-5
sd<-2.5
alpha<-0.05
zstar<-qnorm(1-alpha/2)
er<-zstar*sd/sqrt(n)
Xbar-er;Xbar+er
#cach 2
tsum.test(mean.x = 5,s.x = 2.5,n.x = 100,alternative = "two.sided",conf.level = .95)
#cau b
er<-0.25
zstar<-er*sqrt(n)/sd
alpha<-2*(1-pnorm(zstar))
#Khoang tin cay 31.17%

#Cau 3
Ghd<-c(45,55,65,75,85,95)
Ght<-c(55,65,75,85,95,100)
Mid<-(Ghd+Ght)/2
ts<-c(10,30,45,80,30,5)
Cau3<-data.frame(Ghd,Ght,Mid,ts)
Xbar<-sum(Cau3$Mid*Cau3$ts)/sum(Cau3$ts)
n<-sum(Cau3$ts)
s2<-sum((Xbar-Cau3$Mid)^2*Cau3$ts)/(n-1)
s<-sqrt(s2)
alpha<-1-0.95
zstar<-qnorm(1-alpha/2)
er<-zstar*s/sqrt(n)
Xbar-er;Xbar+er
#cau c
#H0 > 77
#H1 <= 77
mu0<-77
alpha<-0.1
zstar<-qnorm(1-alpha/2)
Z0<-(Xbar-mu0)/(s/sqrt(n))
Z0 > zstar
#bac bo H1 co gia tri chu trang A thong bao la sai voi muc y nghia 90% 