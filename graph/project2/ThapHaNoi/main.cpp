#include"graphics.h"
#include<math.h>
#include<stdlib.h>
#include<conio.h>
#include<iostream>
using namespace std;
 
#define DL 1 // delay
 
struct Thap{
    int x1,y1,x2,y2,x,y;
};
 
class ThapHN {
    private:
        Thap *t;
        int max,x,y;
    public:
 
    ThapHN(int x,int y);
 
    void init(int solg);
    void initvoid(int solg);
 
    friend void drawmove(ThapHN &a,ThapHN &b);
 
    friend void move(int solg,ThapHN &a,ThapHN &b,ThapHN &c)
    {
        if(solg==1)
            drawmove(a,c);
        else
        {
            move(solg-1,a,c,b);
            move(1,a,b,c);
            move(solg-1,b,a,c);
        }
    }
};
 
ThapHN::ThapHN(int x,int y)
{
    t=NULL;
    this->x=x;
    this->y=y;
    max=0;
}
 
void ThapHN::init(int solg)
{
    line(x,y,x,80);
    t=new Thap[solg];
    for(int i=0;i<solg;++i)
    {
        t[i].x=x;t[i].y=y;
        t[i].x1=x-100+i*20;
        t[i].x2=x+100-i*20;
        t[i].y1=y-20-20*i;
        if(i==0)t[i].y2=y;
        else t[i].y2=t[i-1].y1;
 
        setfillstyle(1,i+1);
        bar(t[i].x1,t[i].y1,t[i].x2,t[i].y2);
    }
    max=solg-1;
}
 
void ThapHN::initvoid(int solg)
{
    line(x,y,x,80);
    t=new Thap[solg];
    for(int i=0;i<solg;++i)
    {
        t[i].x1=x-100+i*20;
        t[i].x2=x+100-i*20;
        t[i].y1=y-20-20*i;
        if(i==0)t[i].y2=y;
        else t[i].y2=t[i-1].y1;
    }
    max=-1;
}
 
void drawmove(ThapHN &a,ThapHN &b)
{
    int ox,oy,ox1,oy1,ox2,oy2;
    char *size;
    char *cot;
    unsigned n=imagesize(a.t[a.max].x1,a.t[a.max].y1,a.t[a.max].x2,a.t[a.max].y2);
    size=(char*)malloc(n);
    getimage(a.t[a.max].x1,a.t[a.max].y1,a.t[a.max].x2,a.t[a.max].y2,size);
    n=imagesize(a.x,80,a.x,a.y);
    cot=(char*)malloc(n);
    getimage(a.x,80,a.x,a.y,cot);
 
    ox=a.t[a.max].x;oy=a.t[a.max].y;
    ox1=a.t[a.max].x1;ox2=a.t[a.max].x2;
    oy1=a.t[a.max].y1;oy2=a.t[a.max].y2;
 
    while(a.t[a.max].y2>60)
    {
        putimage(a.t[a.max].x1,a.t[a.max].y1,size,XOR_PUT);
        a.t[a.max].y--;
        a.t[a.max].y1--;
        a.t[a.max].y2--;
        putimage(a.t[a.max].x1,a.t[a.max].y1,size,XOR_PUT);
        putimage(a.x,80,cot,OR_PUT);
        delay(DL);
    }
 
 
    if(a.t[a.max].x<b.x)
        while(a.t[a.max].x!=b.x)
        {
            putimage(a.t[a.max].x1,a.t[a.max].y1,size,XOR_PUT);
            a.t[a.max].x2++;
            a.t[a.max].x1++;
            a.t[a.max].x++;
            putimage(a.t[a.max].x1,a.t[a.max].y1,size,XOR_PUT);
            delay(DL);
        }
    else
        while(a.t[a.max].x!=b.x)
        {
            putimage(a.t[a.max].x1,a.t[a.max].y1,size,XOR_PUT);
            a.t[a.max].x2--;
            a.t[a.max].x1--;
            a.t[a.max].x--;
            putimage(a.t[a.max].x1,a.t[a.max].y1,size,XOR_PUT);
            delay(DL);
        }
 
    b.max++;
    while(a.t[a.max].y2!=b.t[b.max].y2)
    {
        putimage(a.t[a.max].x1,a.t[a.max].y1,size,XOR_PUT);
        a.t[a.max].y1++;
        a.t[a.max].y2++;
        a.t[a.max].y++;
        putimage(a.t[a.max].x1,a.t[a.max].y1,size,XOR_PUT);
        delay(DL);
    }
    b.t[b.max].x1=a.t[a.max].x1;b.t[b.max].y1=a.t[a.max].y1;
    b.t[b.max].x2=a.t[a.max].x2;b.t[b.max].y2=a.t[a.max].y2;
    b.t[b.max].x=a.t[a.max].x;b.t[b.max].y=a.t[a.max].y;
 
    a.t[a.max].x1=ox1;a.t[a.max].x2=ox2;
    a.t[a.max].y1=oy1;a.t[a.max].y2=oy2;
    a.t[a.max].x=ox;a.t[a.max].y=oy;
    a.max--;
 
}
 
int main() {
    system("cls");
    int gd = DETECT, gm;
    int n;
    cout<<"^.^ Demo chuong trinh thap Ha Loi ^.^";
    while(1){
    	cout << "\nVi tu 5 dia tro len se rat lau nen nhap it dia thoi !!!!";
        cout << "\n\nNhap so dia (0 < n < 5): ";
        cin>>n;
        if(n > 0 && n < 5)
			break;
        else 
			cout << "\nNhap sai, nhap lai di ban oi !!!";
    }
    
    initgraph(&gd,&gm,"C:\\TC\\BGI");
    ThapHN a(100,300),b(100+200,300),c(100+400,300);
    a.init(n);
    b.initvoid(n);
    c.initvoid(n);
    cout << "Press any key to continue...\n";
    
    getch();
    move(n,a,b,c);
    cout << "Xong !"<<" So lan chuyen: " << pow(2,n)-1;
    getch();
    closegraph();
    return 0;
}
