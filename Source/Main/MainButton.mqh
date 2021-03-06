//押されたボタンを管理する
void Push_Button(const string &sparam){

	//---全通貨ペア決済ボタン処理
	if(sparam == "all_cut_bmp"){
		int cnt = OrdersTotal();
		int pos = 0;
		
		//---OrderTypeが売りと買いのすべてのオーダーを決済する
		for(int i=0 ; i<cnt ; i++){
			OrderSelect(pos, SELECT_BY_POS, MODE_TRADES);
			
			if(OrderType() == OP_BUY || OrderType() == OP_SELL)
				OrderClose(OrderTicket(), OrderLots(), OrderClosePrice(), 5, Green);
			else
				pos++;
		}
	}
	
	//---現通貨ペア決済ボタン処理
	else if(sparam == "now_cut_bmp"){
		int cnt = OrdersTotal();
		int pos = 0;
		
		//---OrderTypeが売りと買い and OrderSymbolが現在のチャートのオーダーを決済する	
		for(int i=0 ; i<cnt ; i++){
			OrderSelect(pos, SELECT_BY_POS, MODE_TRADES);
			
			if(OrderType() == OP_BUY || OrderType() == OP_SELL){
				if(OrderSymbol() == Symbol())
					OrderClose(OrderTicket(), OrderLots(), OrderClosePrice(), 5, Green);
				else
					pos++;
			}else{
				pos++;
			}
		}
	}
	
	//---カメラボタン処理
	else if(sparam == "camera_button_bmp"){
		//---ファイルネーム作成
		string fileName = "";
		datetime localTime = TimeLocal();
		fileName += TimeMonth(localTime)+"月"+TimeDay(localTime)+"日";
		fileName += TimeHour(localTime)+"時"+TimeMinute(localTime)+"分"+TimeSeconds(localTime)+"秒.jpg";
		
		//---テキストラベル設定
		ObjectSetString(0, "amadeus_text_label0", OBJPROP_TEXT, "");
		ObjectSetString(0, "amadeus_text_label1", OBJPROP_TEXT, "　　　　------保存中------");
		ObjectSetString(0, "amadeus_text_label2", OBJPROP_TEXT, "");
		
		//---スクリーンショットを保存して、文字列セット
		Set_String("スクリーンショットを保存しました。", "Name : ("+fileName+")", "  MQL4\\Files\\AmadeusImage\\", 5);
		WindowScreenShot("AmadeusImage\\"+fileName, ChartGetInteger(0, CHART_WIDTH_IN_PIXELS), ChartGetInteger(0, CHART_HEIGHT_IN_PIXELS), 0);
	}
	
	//---設定画面ボタン処理
	else if(sparam == "setting_button_bmp"){
		Set_String("設定画面はまだ未完です", "許してクレメンス", "　　　　　　　　　　　　　byダル", 2);
	}
	
	//---成績画面ボタン処理
	else if(sparam == "result_button_bmp"){
		Set_String("成績・収支報告画面はまだ未完です", "許してクレメンス", "　　　　　　　　　　　　　byダル", 2);
	}
	
	//---画面縮小ボタン処理
	else if(sparam == "close_button_bmp"){
		ObjectsDeleteAll();
	
		ObjectCreate(0, "open_button_bmp", OBJ_BITMAP_LABEL, 0, 0, 0);
		ObjectSetString(0, "open_button_bmp", OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\open.bmp");
		ObjectSetInteger(0, "open_button_bmp", OBJPROP_XDISTANCE, topBar_X+(61));                  
		ObjectSetInteger(0, "open_button_bmp", OBJPROP_YDISTANCE, topBar_Y+(252));
	}
	
	//---画面拡大ボタン処理
	else if(sparam == "open_button_bmp"){
		ObjectDelete(0, "open_button_bmp");
		Create_Main_Object();
	}
	
	//---シャットダウンボタン処理
	else if(sparam == "shutdown_button_bmp"){
		ExpertRemove();
	}
}