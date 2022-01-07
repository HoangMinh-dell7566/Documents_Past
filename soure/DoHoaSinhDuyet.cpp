#include<iostream>
#include<conio.h>
// -- Thu vien nguoi dung tu dinh nghia
#include"graph.h"
#include<graphics.h>
//-- Ngon ngu C++
using namespace std;
int continuee = 1;
//----------------------------------------------------
//--- PHAN SINH DUYET CAY (LY THUYET VA MO PHONG)
struct node
{
	int data; // node mang gia tri la data.
	node *pleft,*pright; //--- 1 node co 2 phan (trai - phai).
};
typedef node* tree;
//-----------------------------------------------
//-- Khoi tao cây
void init(tree &t)
{
	t=NULL;
}
//----------------------------------------------
//-- Tao new node
node* get_node(int data)
{
	node *p=new node();
	p->data=data;
	p->pleft=NULL;
	p->pright=NULL;
	return p;
}
//----------------------------------------------
//-- Chen 1 nut bat ky vao cay nhi phan
void insert(tree &t,node *p)
{
	//-- neu cay chua co nut thi chen vao goc
	if(t==NULL)
	{
		t=p;
	}
	//-- Neu co nut thì chen vao cay con
	else
	{
		if(p->data < t->data)
		{
			return insert(t->pleft,p);			
		}
		else 
		if(p->data > t->data)
		{
			return insert(t->pright,p);
		}
	}
}
//-----------------------------------------
//-- Dau vao cua cay
void input(tree &t)
{
	//-- Goi ham khoi tao
	init(t);
	int data;
	cout << "> Nhap vao day so, stop khi nhap 0: \n";
	while(cin>>data)
	{
		//-- Them data cho cay, khi gap 0 thi dung`
		if(data!=0)
		{
			insert(t,get_node(data));
		}
		else
		{
			break;
		}
	}
}
//-------------------------------------------
void SinhCay()
{
	tree t;
	input(t);
	DoHoaMoPhongVeCay();
}
//------------------------------------------------
//-------- Phan Duyet Cay

//-- 1. Ham duyet cay nhi phan theo chieu rong
void DuyetCayTheoChieuRong(tree &t) //-- Duyet tu tren xuong, sau do tu trai qua.
{
	// Neu nhu cay co so phan tu (>=1)
	if(t!=NULL)
	{
		//-- Tao queue de luu vet (a)
		queue<tree> a;
		//-- Sau do them vao queue goc
		a.push(t);
		//-- Trong khi queue khac rong
		while(!a.empty())
		{
			//-- Node p co tac dung quay lui lai cac Node truoc do
			node *p=a.front();
			//-- Xuat du lieu
			cout<<p->data<<" ";
			//-- Xu li xong xoa' trong queue
			a.pop();
			//------------------
			//-- Duyet tu tren xuong va tu left qua right
			if(p->pleft!=NULL)
			{
				//-- Day? node qua left
				a.push(p->pleft);
			}
			if(p->pright!=NULL)
			{
				//-- Day? node qua right
				a.push(p->pright);
			}
		}
	}
}
//---------------------------------------------------
//-- Ham Duyet theo chieu rong da dong goi
void DuyetCay1()
{
//	tree t;
//	input(t);
	cout << "1. Duyet cay theo chieu rong: 5 2 7 1 3 6 8";
//	DuyetCayTheoChieuRong(t);
	DoHoaMoPhongDuyetCayChieuRong();
}
//-------------------------------------------------
//-- 2. Ham Duyet cay nhi phan theo chieu sau
//----- Duyet LNR ---------------------------------
void DuyetLNR(tree &t)
{
	if(t == NULL)
		return;
	DuyetLNR(t->pleft);
	cout << t->data << " ";
	DuyetLNR(t->pright);
}
//-----------------------------------------------
//----- Duyet LRN
void DuyetLRN(tree &t)
{
	if(t == NULL)
		return;
	DuyetLNR(t->pleft);
	DuyetLNR(t->pright);
	cout << t->data << " ";	
}
//-----------------------------------------------
//----- Duyet NLR
void DuyetNLR(tree &t)
{
	if(t == NULL)
		return;
	cout << t->data << " ";
	DuyetLNR(t->pleft);
	DuyetLNR(t->pright);
}
//---------------------------------------------------
//-- Ham Duyet theo chieu sau da dong goi
void DuyetCay2()
{
//	tree t;
//	input(t);
	cout << "2. Co 3 cach duyet theo chieu sau, lan luot la:";
	cout << "\n  2.1. Duyet theo LNR: 1 2 3 5 6 7 8";
//	DuyetLNR(t);
	cout << "\n  2.2. Duyet theo LRN: 1 2 3 6 7 8 5";
//	DuyetLRN(t);
	cout << "\n  2.3. Duyet theo NLR: 5 1 2 3 6 7 8";
//	DuyetNLR(t);
	DoHoaMoPhongDuyetCayChieuSau();
}
//-------------------------------------------------------------
//--- Goi ham DuyetCay1 và DuyetCay2
void DuyetCay()
{
	//----------------- Phan Sinh Duyet Cay ---------------------------------
	//-- Dua ra OPTIONS -----------
	cout << "\n\n\nWHAT IS YOUR CHOICE?: ";
	cin >> tmp;
	//-- 1. Sinh va Duyet Cay Theo Chieu rong (bfs)
	if(tmp == 1)
	{
		DuyetCay1();
	}
	//-- 2. Sinh va Duyet cay theo Chieu sau (dfs)
	if(tmp == 2)
	{
		DuyetCay2();
	}
}

//--------------------------------------------------------
int main()
{
	initwindow(900,700);
	//------------------------------
	SinhCay();
	//--- Phan menu tinh ----
	menu();
	//----------------------------------------------------------
	DuyetCay();
	while(continuee == 1)
	{
		cout << "\n\n\n\nCONTINUE OR STOP? (CONTINUE is 1 and STOP is 0): ";
		cin >> continuee;
		if(continuee == 1)
		{
			DuyetCay();
		}
		else
		{
			cout << "\nPROGRAM STOP HERE>>>";
			cleardevice();
			//xóa màn hình
		}
	}
	getch();
	closegraph();
	return 0;
}
