#ham xd may chayj nhnh nhat
PC_faster<-function(A){
kt<-dim(A)
sh<-kt[1]
sc<-kt[2]
tam<-rep(1,sc)
for(i in 1:sh) tam<-tam*A[i,]
tbn<-exp(1/sh*log(tam))
for(i in 1:sc) if(tbn[i]==min(tbn))
print(i)}
