//viet chuong trinh thuc hien cac cong viec sau:
//1. lan luoot nhap vao cac so nguyen tu ban phim, ket thuc khi go 0
//cac so nguyen nhap vao thi luu thanh 1 cay nhi phan timm kiem

#include<stdio.h>
struct nut
{
	int info;
	nut *left,*right;	
};

typedef nut Node;
//-----------------------------
Node *goc,*goc1;

void khoitao(Node *&goc)
{
	goc=NULL;
}
//------------------------------
void mocnut(Node *&goc, int X) //moc 1 nut gia tri X vao cay
{
	if (goc == NULL)
	{
		goc=new Node;
		goc->info=X;
		goc->left=NULL;
		goc->right=NULL;
	}
	else
		if(goc->info<X)
			mocnut(goc->left,X);
		else
			mocnut(goc->right,X);
}
//--------------------------------------
void taocay(Node *&goc)
{
	int tam;
	do
	{
	printf("\n Nhap mot so nguyen,0:dung ");
	scanf("%d", &tam);	
		if(tam!=0)
			mocnut(goc,tam);
	}	
	while(tam!=0);
}
//--------------------------------
void LNR(Node *goc)
{
	if (goc!=NULL)
	{
		LNR(goc->left);
		printf("%3d", goc->info);
		LNR(goc->right);
	}
}
//---------------------
void NLR(Node *goc)
{
	if(goc!=NULL)
	{
	printf("%3d", goc->info);
	NLR(goc->left);
	NLR(goc->right);
	}
}
void LRN(Node *goc)
{
	if(goc!=NULL)
	{
	LRN(goc->left);
	LRN(goc->right);
	printf("%3d", goc->info);
	}
}
//--------------------------
//tinh tong cac nut cua cay
int tongnut(Node *goc)
{
	if(goc==NULL)
		return 0;
	else
		return goc->info+tongnut(goc->left)+tongnut(goc->right);
}
//-------------------
//dem so nut cua cay
int demnut(Node *goc)
{
	if(goc==NULL)
		return 0;
	else
		return 1+demnut(goc->left)+demnut(goc->right);
}
//----------------------
//dem so nut la cua cay
int sonutla(Node *goc)
{
	if(goc==NULL)
		return 0;
	else
		if(goc->left==NULL && goc->right==NULL)
			return 1;
		else
			return sonutla(goc->left) +sonutla(goc->right);
}
//-----------------------------------------
//1. viet ham tinh chieu cao cua cay
int max(int a,int b)
{
	if(a>b) return a;
	else return b;
}
int chieucao(Node *goc)
{
	if(goc==NULL) return 0;
	else 
		if(goc->left==NULL && goc->right==NULL)
			return 1;
		else 
			return 1 +max(chieucao(goc->left),chieucao(goc->right));			
}
//2. dem xem co bao nhieu nut co cay con trai cao hon cay con phai
int demthp(Node *goc)
{
	if(goc==NULL) return 0;
	else
		if(chieucao(goc->left)>chieucao(goc->right))
			return 1+demthp(goc->left)+demthp(goc->right);
		else
			return demthp(goc->left)+demthp(goc->right);
}
//3.dem xem co bao nhieu nut mang gia tri chan
int demchan(Node *goc)
{
	if(goc==NULL) return 0;
	else 
		if(goc->info  %2 == 0)
			return 1+demchan(goc->left)+demchan(goc->right);
		else
			return demchan(goc->left)+demchan(goc->right);
} 
//4.tinh tong so nut la
int tongla(Node *goc)
{
	if(goc==NULL)
		return 0;
	else
		if(goc->left==NULL && goc->right==NULL)
			return goc->info;
		else
			return tongla(goc->left)+tongla(goc->right);
}
//5. tinh tong cac nut nhanh
int tongnhanh(Node *goc)
{
	return tongnut(goc) - tongla(goc);
}
//6. in ra tat ca cac nut o muc i (cau kho)
void inmuc(Node *goc, int i, int muc)
{
	if(goc!=NULL)
		if(muc==i)
			printf("%3d",goc->info);
		else
			{inmuc(goc->left,i,muc+1);
			inmuc(goc->right,i,muc+1);}
}
void chepcay(Node *goc,Node *&goc1)
{
	if(goc==NULL) goc1=NULL;
	else
	{
		goc1=new Node;
		goc1->info=goc->info;
		chepcay(goc->left,goc1->left);;
		chepcay(goc->right,goc1->right);
	}
}
void cayhoandoi(Node *&goc)
{
	Node *tam;
	if(goc!=NULL)
	{ 
		tam=goc->left;
		goc->left=goc->right;
		goc->right=tam;
		cayhoandoi(goc->left);
		cayhoandoi(goc->right);
	}
}
//----------------------------------------
int main()
{
	khoitao(goc);
	khoitao(goc1);
	taocay(goc);
	printf("\n Duyet cay inorder \n");
	LNR(goc);
	printf("\n");
	printf("\n Duyet cay preorder \n");
	NLR(goc);
	printf("\n");
	printf("\n Duyet cay postorder \n");
	LRN(goc);
//	chepcay(goc,goc1);
//	cayhoandoi(goc1);
//	printf("\n duyet cay LNR \n");
//	LNR(goc1);
//	inmuc(goc,4,1);
//	printf("\n so nut mang gia tri chan: %d \n", demchan(goc));
//	printf("\n tong cac nut la: %d", tongla(goc));
//	printf("\n tong cac nut nhanh: %d",tongnhanh(goc));
//	printf("\n chieu cao cua cay: %d \n", chieucao(goc));
//	printf("\n so nut cay trai cao hon cay phai: %d\n", demthp(goc));
//	printf("\n Tonng cac nut %d  \n", tongnut(goc));
//	printf("\n So nut cua cat %d \n", demnut(goc));
//	printf("\n So nut la cua cay %d \n", sonutla(goc));
//	printf("\n Duyet cay LNR \n");
//	LNR(goc);
//	printf("\n Duyet cay NLR \n");
//	NLR(goc);
	return 0;
}
