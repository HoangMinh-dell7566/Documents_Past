#include<iostream>
#include<conio.h>
#include<queue>
using namespace std;
struct nut
{
	int info;
	nut *left,*right;	
};

typedef nut Node;
typedef nut* tree;
//-----------------------------
Node *goc;

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
void DuyetCayTheoChieuRong(Node *goc) //-- Duyet tu tren xuong, sau do tu trai qua.
{
	// Neu nhu cay co so phan tu (>=1)
		if(goc==NULL) return;
		//-- Tao queue de luu vet (a)
		queue<tree> a;
		//-- Sau do them vao queue goc
		a.push(goc);
		//-- Trong khi queue khac rong
		while(!a.empty())
		{
			//-- Node p co tac dung quay lui lai cac Node truoc do
			nut *p=a.front();
			//-- Xuat du lieu
			cout<<p->info<<" ";
			//-- Xu li xong xoa' trong queue
			a.pop();
			//------------------
			//-- Duyet tu tren xuong va tu left qua right
			if(goc->left!=NULL) a.push(goc->left);
			if(goc->right!=NULL) a.push(goc->right);
		}
}

//-------------------------------------------------
//-- 2. Ham Duyet cay nhi phan theo chieu sau
//----- Duyet LNR ---------------------------------
void DuyetLNR(Node *goc)
{
	if(goc == NULL)
		return;
	DuyetLNR(goc->left);
	cout << goc->info << " ";
	DuyetLNR(goc->right);
}
//-----------------------------------------------
//----- Duyet LRN
void DuyetLRN(Node *goc)
{
	if(goc == NULL)
		return;
	DuyetLNR(goc->left);
	DuyetLNR(goc->right);
	cout << goc->info << " ";	
}
//-----------------------------------------------
//----- Duyet NLR
void DuyetNLR(Node *goc)
{
	if(goc == NULL)
		return;
	cout << goc->info << " ";
	DuyetLNR(goc->left);
	DuyetLNR(goc->right);
}
int main(){
	khoitao(goc);
	taocay(goc);
	cout<<"Duyet theo chieu rong: ";
	DuyetCayTheoChieuRong(goc);
	cout<<"duyet theo chieu sau:";
	cout << "2. Co 3 cach duyet theo chieu sau, lan luot la:";
	cout << "\n  2.1. Duyet theo LNR: ";
	DuyetLNR(goc);
	cout << "\n  2.2. Duyet theo LRN: ";
	DuyetLRN(goc);
	cout << "\n  2.3. Duyet theo NLR: ";
	DuyetNLR(goc);
}
