/*----------定数----------*/
#define NIXIE_TUBE_SIZE 8
#define TEXT_LABEL_SIZE 3
#define BUTTON_SIZE 4

/*----------シーン列挙体----------*/
enum eScene{
	eScene_StartUp,
    eScene_Main,   
    eScene_Config,   
    eScene_Result,  

    eScene_None,  
};