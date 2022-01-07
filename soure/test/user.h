#include <iostream>
#include <conio.h>
#include <Windows.h>
#include<graphics.h>
#include<queue>
#define MAX 50
using namespace std;
int tmp;
int x = 10; 
int y = 11;
int dl = 300;
//-----------------------------------------------
// Hàm tô màu.
void textcolor(int x)
{
	HANDLE mau;
	mau=GetStdHandle(STD_OUTPUT_HANDLE);
	SetConsoleTextAttribute(mau,x);
}
//---------------------------------------------
// Ham dich chuyen con tro den toa do x, y
void gotoxy(int x,int y)
{    
	HANDLE hConsoleOutput;    
	COORD Cursor_an_Pos = {x-1,y-1};   
	hConsoleOutput = GetStdHandle(STD_OUTPUT_HANDLE);    
	SetConsoleCursorPosition(hConsoleOutput , Cursor_an_Pos);
}
//-------------------------------------------
//-- Ham SetColor (de ve lai color hien tai)
void SetColor(WORD color)
{
    HANDLE hConsoleOutput;
    hConsoleOutput = GetStdHandle(STD_OUTPUT_HANDLE);
 
    CONSOLE_SCREEN_BUFFER_INFO screen_buffer_info;
    GetConsoleScreenBufferInfo(hConsoleOutput, &screen_buffer_info);
 
    WORD wAttributes = screen_buffer_info.wAttributes;
    color &= 0x000f;
    wAttributes &= 0xfff0;
    wAttributes |= color;
 
    SetConsoleTextAttribute(hConsoleOutput, wAttributes);
}
//----------------------------------------------------------
//-- Ham SetBGColor (De dat lai color BackGround)
void SetBGColor(WORD color)
{
    HANDLE hConsoleOutput;
    hConsoleOutput = GetStdHandle(STD_OUTPUT_HANDLE);
 
    CONSOLE_SCREEN_BUFFER_INFO screen_buffer_info;
    GetConsoleScreenBufferInfo(hConsoleOutput, &screen_buffer_info);
 
    WORD wAttributes = screen_buffer_info.wAttributes;
    color &= 0x000f;
    color <<= 4;
    wAttributes &= 0xff0f;
    wAttributes |= color;
 
    SetConsoleTextAttribute(hConsoleOutput, wAttributes);
}


// Hàm lay key bat su kien tu ban phim - tu tim hieu
/* GetAsyncKeyState(VK_ESCAPE) => b?t s? ki?n phím Esc */ 




// Hàm co chuc nang la duy chuyen den toa do x,y, nhap vao chuoi duoc to mau
void NoiDung(int x, int y, char *a, int color)
// x, y la toa do con tro nguoi dung muon dich chuyen toi, a la chuoi truyen vao, color la mau truyen vao
{
	gotoxy(x, y);
	textcolor(color);
	cout << a;
	textcolor(6);
}
//-- Mo phong tao cay
void DoHoaMoPhongVeCay() //-- 5 7 2 3 1 6 8
{
	delay(dl);
	setlinestyle(3,1,3);
	//-- 7 8 3 5 2 6 9
	setcolor(8);
	//---- node goc (7)
	settextstyle(0,0,4);
	outtextxy(435,53,"6"); // giam x 15, giam y 17
	circle(450,70,25);
	
	//-- Tu (7) ve 2 ham line()	
	
	delay(dl);
	line(467,87,583,153); //-- tang x1,y1 17, giam x2,y2 di 17
	delay(dl);
	settextstyle(0,0,4);
	outtextxy(585,153,"8");
	circle(600,170,25);
	
	//--- Tu (7) ve 2 ham line()
	delay(dl);
	line(433,87,317,153); //-- giam x1,y2 17, tang y1,x2 17
	delay(dl);
	settextstyle(0,0,4);
	outtextxy(285,153,"3"); //-- Giam x 15, giam y 17 
	circle(300,170,25);
	
	//-- Tu (2) ve 2 ham line()
	
	
	
	//-- Node la (3)
	delay(dl);
	line(317,187,383,253); //-- tang x1,y1 di 17, giam x2,y2 17
	delay(dl);
	settextstyle(0,0,4);
	outtextxy(385,253,"5"); //-- Giam x 15, giam y 17 
	circle(400,270,25);
	
	
	
	
	//-- Node la (1)
	delay(dl);
	line(283,187,217,253); //-- Giam x1,y2,x2 di 17, tang y1 17
	delay(dl);
	settextstyle(0,0,4);
	outtextxy(185,253,"2"); //-- Giam x 15, giam y 17 
	circle(200,270,25);
	

		
	
	
	//-- Node la (6)
	delay(dl);
	line(583,187,517,253); //-- tang y1, giam x1,x2,y2
	delay(dl);
	settextstyle(0,0,4);
	outtextxy(483,253,"7"); //-- Giam x 15, giam y 17
	circle(500,270,25);
	
	
	
	
	
	//-- Node la (8)
	delay(dl);
	line(617,187,683,253);
	delay(dl);
	settextstyle(0,0,4);
	outtextxy(685,253,"9"); //-- Giam x 15, giam y 17
	circle(700,270,25);
	
}
//--------------------------------------------------------------
void TatDen()
{
	delay(dl);
	//-- tat den 1 ----------
	setcolor(8);
	settextstyle(0,0,4);
	outtextxy(185,253,"2"); //-- Giam x 15, giam y 17 
	circle(200,270,25);
	
	//-- tat den 2 -------------------------------------------
	settextstyle(0,0,4);
	outtextxy(285,153,"3"); //-- Giam x 15, giam y 17 
	circle(300,170,25);	
	
	//--- tat den 3 -------------
	settextstyle(0,0,4);
	outtextxy(385,253,"5"); //-- Giam x 15, giam y 17 
	circle(400,270,25);
	
	//-- Tat den 5 ---------------------------
	settextstyle(0,0,4);
	outtextxy(435,53,"6"); // giam x 15, giam y 17
	circle(450,70,25);
		
	//---- tat den 6 -----------------------
	settextstyle(0,0,4);
	outtextxy(483,253,"7"); //-- Giam x 15, giam y 17
	circle(500,270,25);
	
	//--- Tat den 7 ---------
	settextstyle(0,0,4);
	outtextxy(585,153,"8"); //-- Gian x 15, giam y 17
	circle(600,170,25);	
		
	//--- tat den 8 --------------------
	settextstyle(0,0,4);
	outtextxy(685,253,"9"); //-- Giam x 15, giam y 17
	circle(700,270,25);			
}	
//----------------------------------------------------------------
//-- Duyet chieu rong --------------------------------------------
void DoHoaMoPhongDuyetCayChieuRong()
{
	TatDen();
	//-- Duyet cay theo chieu rong
	delay(dl); 
	setcolor(6);
	settextstyle(0,0,2);
	outtextxy(15,380,"Chieu Rong:");
	rectangle(8,370,195,410);
	//-------------------------------------------------------------------
	
	//-- bat den 5 ------------------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(435,53,"6"); // giam x 15, giam y 17
	circle(450,70,25);
	
	//--- in 5 ----------------------
	setcolor(9);
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(225,378,"6"); //-- Giam x 10, giam y 12
	circle(235,390,20);
	
	
	//-- bat den 2 ------------------------------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(285,153,"3"); //-- Giam x 15, giam y 17 
	circle(300,170,25);
	
	//--- in 2 ---------------------------
	setcolor(9);
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(325,378,"3"); //-- Giam x 10, giam y 12
	circle(335,390,20);
	
	
	//-- bat den 7 ------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(585,153,"8"); //-- giam x 15, giam y 17
	circle(600,170,25);
	
	//--- in 7 ----------
	setcolor(9);
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(425,378,"8"); //-- Giam x 10, giam y 12
	circle(435,390,20);
	
	
	//--- bat den 1 ---------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(185,253,"2"); //-- Giam x 15, giam y 17 
	circle(200,270,25);
	
	//-- in 1 ------------------
	setcolor(9);
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(525,378,"2"); //-- Giam x 10, giam y 12
	circle(535,390,20);

	
	//--- bat den 3 -------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(385,253,"5"); //-- Giam x 15, giam y 17 
	circle(400,270,25);
	
	//-- in 3 ---------------
	setcolor(9);
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(625,378,"5"); //-- Giam x 10, giam y 12
	circle(635,390,20);
	
	
	//--- bat den 6 ------------------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(483,253,"7"); //-- Giam x 15, giam y 17
	circle(500,270,25);
	
	//--- in 6 --------------------------------------
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(725,378,"7"); //-- Giam x 10, giam y 12
	circle(735,390,20);
	
	
	//--- bat den 8 ------------------------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(685,253,"9"); //-- Giam x 15, giam y 17
	circle(700,270,25);
	
	//--- in 8 -----------------------
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(825,378,"9"); //-- Giam x 10, giam y 12
	circle(835,390,20);
		
}
//----------------------------------------------------------------
//-- Duyet chieu sau (3 cach) --------------------------
void DoHoaDuyetLNR()
{
	TatDen();
	//---------------------------------------
	
	//-- Duyet LNR -----------------------------------------------
	delay(dl);
	setcolor(6);
	settextstyle(0,0,2);
	outtextxy(75,450,"LNR:");
	rectangle(8,440,195,480);
	
	//--- bat den 1 --------------------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(185,253,"2"); //-- Giam x 15, giam y 17 
	circle(200,270,25);
	
	//-- in 1 -----------------
	setcolor(9);
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(225,448,"2"); //-- Giam x 10, giam y 12
	circle(235,460,20);
	

	
	//-- bat den 2 -----------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(285,153,"3"); //-- Giam x 15, giam y 17 
	circle(300,170,25);
	
	//-- in 2 ----------------------
	setcolor(9);
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(325,448,"3"); //-- Giam x 10, giam y 12
	circle(335,460,20);
	

	
	//--- bat den 3 ---------------------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(385,253,"5"); //-- Giam x 15, giam y 17 
	circle(400,270,25);
	
	//--- in 3 -----------------------
	setcolor(9);
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(425,448,"5"); //-- Giam x 10, giam y 12
	circle(435,460,20);
	

	
	//-- bat den 5 ------------------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(435,53,"6"); // giam x 15, giam y 17
	circle(450,70,25);
	
	//-- in 5 ------------------------
	setcolor(9);
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(525,448,"7"); //-- Giam x 10, giam y 12
	circle(535,460,20);
	

	
	//--- bat den 6 ------------------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(483,253,"7"); //-- Giam x 15, giam y 17
	circle(500,270,25);
	
	//---- in 6 ---------------------
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(625,448,"6"); //-- Giam x 10, giam y 12
	circle(635,460,20);

	
	//-- bat den 7 ------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(585,153,"8"); //-- giam x 15, giam y 17
	circle(600,170,25);	
	
	//--- in 7 --------------------
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(725,448,"8"); //-- Giam x 10, giam y 12
	circle(735,460,20);
	

	
	//--- bat den 8 ------------------------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(685,253,"9"); //-- Giam x 15, giam y 17
	circle(700,270,25);	
	
	//-- in 8 ----------------------------------
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(825,448,"9"); //-- Giam x 10, giam y 12
	circle(835,460,20);
}
//-------------------------------------------------------------------
void DoHoaDuyetLRN()
{
	TatDen();
	//-- Duyet LRN -------------------------------------------
	delay(dl);
	setcolor(6);
	settextstyle(0,0,2);
	outtextxy(75,520,"LRN:");
	rectangle(8,510,195,550);
	//-------------------------------------
	
	//-- bat den 1 ----------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(185,253,"2"); //-- Giam x 15, giam y 17 
	circle(200,270,25);	
	
	//--- in 1 -------------------
	setcolor(9);
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(225,518,"2"); //-- Giam x 10, giam y 12
	circle(235,530,20);
	
	
	//-- bat den 2 -------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(285,153,"3"); //-- Giam x 15, giam y 17 
	circle(300,170,25);	
	
	//-- in 2 ----------------------------
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(325,518,"5"); //-- Giam x 10, giam y 12
	circle(335,530,20);
	
	
	//--- bat den 3 -------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(385,253,"5"); //-- Giam x 15, giam y 17 
	circle(400,270,25);	
	
	//---- in 3 ----------------------------
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(425,518,"3"); //-- Giam x 10, giam y 12
	circle(435,530,20);
	
	
	//---- bat den 6 -----------------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(483,253,"7"); //-- Giam x 15, giam y 17
	circle(500,270,25);	
	
	//--- in 6 -------------------------------------
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(525,518,"7"); //-- Giam x 10, giam y 12
	circle(535,530,20);
	
	
	//--- bat den 7 ---------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(585,153,"8"); //-- Gian x 15, giam y 17
	circle(600,170,25);	
	
	//-- in 7 ---------------------------------------
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(625,518,"9"); //-- Giam x 10, giam y 12
	circle(635,530,20);
	
	
	//--- bat den 8 --------------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(685,253,"9"); //-- Giam x 15, giam y 17
	circle(700,270,25);	
	
	//-- in 8 ------------------------------------------
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(725,518,"8"); //-- Giam x 10, giam y 12
	circle(735,530,20);
	
	
	//-- bat den 5 ------------------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(435,53,"6"); // giam x 15, giam y 17
	circle(450,70,25);	
	
	//-- in 5 -----------------------------------------
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(825,518,"6"); //-- Giam x 10, giam y 12
	circle(835,530,20);
			
}
//------------------------------------------------------------------
void DoHoaDuyetNLR()
{
	TatDen();
	//--- Duyet NLR
	delay(dl);
	setcolor(6);
	settextstyle(0,0,2);
	outtextxy(75,590,"NLR:");
	rectangle(8,580,195,620);
	//-------------------------------------
	
	//-- bat den 5 ------------------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(435,53,"6"); // giam x 15, giam y 17
	circle(450,70,25);	
	
	//-- in 5 ----------------------------------------
	setcolor(9);
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(225,588,"6"); //-- Giam x 10, giam y 12
	circle(235,600,20);
		
	
	//--- bat den 1 ---------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(185,253,"2"); //-- Giam x 15, giam y 17 
	circle(200,270,25);	
	
	//-- in 1 -----------------------------------------
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(325,588,"3"); //-- Giam x 10, giam y 12
	circle(335,600,20);
	
	
	//-- bat den 2 -----------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(285,153,"3"); //-- Giam x 15, giam y 17 
	circle(300,170,25);	
	
	//-- in 2 -----------------------------
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(425,588,"2"); //-- Giam x 10, giam y 12
	circle(435,600,20);
	
	
	//--- bat den 3 -------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(385,253,"5"); //-- Giam x 15, giam y 17 
	circle(400,270,25);	
	
	//--- in 3 -----------------------------
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(525,588,"5"); //-- Giam x 10, giam y 12
	circle(535,600,20);
	
	
	//--- bat den 6 ------------------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(483,253,"7"); //-- Giam x 15, giam y 17
	circle(500,270,25);	
	
	//-- in 6 ---------------------------------------
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(625,588,"7"); //-- Giam x 10, giam y 12
	circle(635,600,20);
	
	
	//-- bat den 7 ----------------------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(585,153,"8"); //-- giam x 15, giam y 17
	circle(600,170,25);	
	
	//-- in 7 -----------------------------------------
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(725,588,"8"); //-- Giam x 10, giam y 12
	circle(735,600,20);
	
	
	//--- bat den 8 ------------------------------
	delay(dl);
	setcolor(9);
	settextstyle(0,0,4);
	outtextxy(685,253,"9"); //-- Giam x 15, giam y 17
	circle(700,270,25);	
	
	//-- in 8 -------------------------------------------
	delay(dl);
	settextstyle(1,0,3);
	outtextxy(825,588,"9"); //-- Giam x 10, giam y 12
	circle(835,600,20);
		
}
//---------------------------------------------------------------------
void DoHoaMoPhongDuyetCayChieuSau()
{
	//-- Duyet Cay theo chieu sau
	//-----------------------------------

	DoHoaDuyetLNR();
	//---------------------------
	DoHoaDuyetLRN();
	//----------------------------
	DoHoaDuyetNLR();
	
}
//----------------------------------------------------------
//---------------------------------------------------------------------------

