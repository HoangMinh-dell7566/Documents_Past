#include<iostream>
#include<conio.h>
#include"user.h"
#include<graphics.h>
#define max 10
//-- Ngon ngu C++
using namespace std;
int continuee = 1;
//----------------------------------------------------
//--- PHAN SINH DUYET CAY (LY THUYET VA MO PHONG)
struct node
{
	int data; // node mang gia tri kieu int.
	node *pleft,*pright; //--- 2 con tro tro den 2 cay con (trai - phai).
};
typedef node* tree;
//-----------------------------------------------
//-- Khoi tao cây
void init(tree &t)
{
	t=NULL;
}
//----------------------------------------------
//-- Tao nut moi
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
void input(tree &t)
{
	//-- khoi tao cay
	init(t);
	int data;
	cout << "Nhap vao day so, nhap 0 de dung: \n";
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
		//-- Sau do them goc cua cay vao queue
		a.push(t);
		while(!a.empty())
		{
			//--tao Node p la nut dau tien trong queue a
			node *p=a.front();
			//-- Xuat du lieu
			cout<<p->data<<" ";
			//-- sau khi da xuat dc but dau tien thi xoa nut do di
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
//void DuyetCay1()
//{
//	tree t;
//	input(t);
//	
//}
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
//void DuyetCay2()
//{
//	tree t;
//	input(t);
//	
//}
//-------------------------------------------------------------
//--- Goi ham DuyetCay1 và DuyetCay2
void DuyetCay(tree t)
{

	//----------------- Phan Sinh Duyet Cay ---------------------------------
	//-- Dua ra OPTIONS -----------
	cout << "\n\n\nWHAT IS YOUR CHOICE?: ";
	cin >> tmp;
	//-- 1. Sinh va Duyet Cay Theo Chieu rong (bfs)
	if(tmp == 1)
	{
		cout << "1. Duyet cay theo chieu rong:";
		DuyetCayTheoChieuRong(t);
		DoHoaMoPhongDuyetCayChieuRong();
	}
	//-- 2. Sinh va Duyet cay theo Chieu sau (dfs)
	if(tmp == 2)
	{
		cout << "2. Co 3 cach duyet theo chieu sau, lan luot la:";
		cout << "\n  2.1. Duyet theo LNR: ";
	//	2 3 5 6 7 8 9
		DuyetLNR(t);
		cout << "\n  2.2. Duyet theo LRN: ";
	//	2 5 3 6 9 8 7
		DuyetLRN(t);
		cout << "\n  2.3. Duyet theo NLR: ";
	//	 7 3 2 5 6 8 9
		DuyetNLR(t);
		DoHoaMoPhongDuyetCayChieuSau();
	}
}

//--------------------------------------------------------
int main()
{
	initwindow(900,700);
	//------------------------------

	//--- Phan menu tinh ----
	//----------------------------------------------------------
	tree t;
	input(t);
	DoHoaMoPhongVeCay();
	textcolor(2);
	cout << "Cac chuc nang chinh cua chuong trinh:"<<endl;
	textcolor(6);
	cout << "1. Duyet cay theo chieu rong"<<endl;
	cout << "2. Duyet cay theo chieu sau"<<endl;
	DuyetCay(t);
	while(continuee == 1)
	{
		cout << "\n\n\n\nCONTINUE OR STOP? (CONTINUE is 1 and STOP is 0): ";
		cin >> continuee;
		if(continuee == 1)
		{
			DuyetCay(t);
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
