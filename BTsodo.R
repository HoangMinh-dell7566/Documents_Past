# ve do thi
x<-seq(20,130,3)
y<-dnorm(x,70,13)
gh<-data.frame(z=x,gh=y)
plot(gh,type="l",lty=1,col='red',ylab='Normal density',xlab='muy = 70')
#ve khoang X < 60
z1<-60
t1<-subset(gh,z<=z1)
polygon(c(rev(t1$z),t1$z),
c(rep(0,nrow(t1)),t1$gh),col="lightblue")
#ve khoang X > 90
z2<-90
t2<-subset(gh,z>=z2)
polygon(c(rev(t2$z),t2$z),
c(rep(0,nrow(t2)),t2$gh),col="lightblue")
#ve khoang 60<X<90
z1<-60
z2<-90
t3<-subset(gh, z>=z1)
t4<-subset(gh, z<=z2)
polygon(c(rev(t4$z),t3$z),
c(rep(0,nrow(t4)),t3$gh),col="lightblue")

x = seq(-3, 3, 0.1)
cos = cos(x)
sin = sin(x)
plot(x, cos, type = 'l', col = 'blue')
lines(x, sin, col = 'red')
legend('topright',c("sin(x)", "cos(x)"), fill = c("red", "blue"))