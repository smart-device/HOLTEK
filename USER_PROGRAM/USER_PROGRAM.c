// Uploaded by http://smart-device.ir
	#include "USER_PROGRAM.h"

//==============================================
//**********************************************
//==============================================

#ifdef _CCV3_
	void __attribute((interrupt(0x04))) Interrupt_External(void)
#endif


#ifdef _CCV2_
	#pragma vector  Interrupt_External        @ 0x04
#endif
{
	//Insert your code here
}

//==============================================
//**********************************************
//==============================================
void USER_PROGRAM_INITIAL()
{
	//power-on initialize

	_pac=0;
	_pa=0;
	//_pbc=0;
	//_pb=0;
}

//==============================================
//**********************************************
//==============================================
void USER_PROGRAM()
{
	//Insert your code here
	if(SCAN_CYCLEF)
	{
		if(ANY_KEY_PRESSF) _pa4=1;
		else _pa4=0;

		GET_KEY_BITMAP();
		
		//key1
		if(DATA_BUF[0]&0x01)
		{
			//key press
		}
		else
		{
			//key no press
		}
		
		//key2
		if(DATA_BUF[0]&0x02)
		{
			//key press
		}
		else
		{
			//key no press
		}
		
		
		//.
		//.
		//.
		//.
		//.
		
		//key9
		if(DATA_BUF[1]&0x01)
		{
			//key press
		}
		else
		{
			//key no press
		}
		//key10
		if(DATA_BUF[1]&0x02)
		{
			//key press
		}
		else
		{
			//key no press
		}
		
	}
}





