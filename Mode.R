#ham tim phan tu yeu vi


#dem so lan xuat hien gtri x trong vector y
demts<-function(x,y){
dem<-0
for(i in 1:length(y)) if(y[i]==x) dem<-dem+1
return (dem)}

#viet ham mode
Mode<-function(x){
y<-unique(x)
tam<-rep(0,length(y))
for(i in 1:length(y)) 
tam[i]<-demts(y[i],x)
 if(min(tam)!=max(tam))
   for(i in 1:length(y)) 
	if(tam[i]==max(tam)) print(y[i])}
Mode(x)