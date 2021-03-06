//オブジェクト作成
void Create_Main_Object(){
	//---トップフレーム
	ObjectCreate(0, "top_bar_bmp", OBJ_BITMAP_LABEL, 0, 0, 0);
	ObjectSetInteger(0, "top_bar_bmp", OBJPROP_XDISTANCE, topBar_X);                  
	ObjectSetInteger(0, "top_bar_bmp", OBJPROP_YDISTANCE, topBar_Y);
	ObjectSet("top_bar_bmp", OBJPROP_SELECTABLE, true);
	
	//---メイン画像
	ObjectCreate(0, "amadeus_bmp", OBJ_BITMAP_LABEL, 0, 0, 0);
	ObjectSetString(0, "amadeus_bmp", OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\kurisu_normal.bmp");

	//---Nixie管
	for(int i=0 ; i<NIXIE_TUBE_SIZE ; i++){
		ObjectCreate(0, "nixie_tube_bmp"+i, OBJ_BITMAP_LABEL, 0, 0, 0);
		ObjectSetString(0, "nixie_tube_bmp"+i, OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\nixie_tube_minus.bmp");
	}
	
	//---損益表示切り替えボタン
	ObjectCreate(0, "profit_change_bmp", OBJ_BITMAP_LABEL, 0, 0, 0);
	ObjectSetString(0, "profit_change_bmp", OBJPROP_BMPFILE, 0, "::Experts\\Amadeus\\Image\\Main\\profit_change_jpy.bmp");
	ObjectSetString(0, "profit_change_bmp", OBJPROP_BMPFILE, 1, "::Experts\\Amadeus\\Image\\Main\\profit_change_pips.bmp");
	
	//---カメラボタン
	ObjectCreate(0, "camera_button_bmp", OBJ_BITMAP_LABEL, 0, 0, 0);
	ObjectSetString(0, "camera_button_bmp", OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\camera.bmp");
	

	//---設定ボタン
	ObjectCreate(0, "setting_button_bmp", OBJ_BITMAP_LABEL, 0, 0, 0);
	ObjectSetString(0, "setting_button_bmp", OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\setting_light.bmp");
	
	//---成績ボタン
	ObjectCreate(0, "result_button_bmp", OBJ_BITMAP_LABEL, 0, 0, 0);
	ObjectSetString(0, "result_button_bmp", OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\result_light.bmp");
	
	//---縮小化ボタン
	ObjectCreate(0, "close_button_bmp", OBJ_BITMAP_LABEL, 0, 0, 0);
	ObjectSetString(0, "close_button_bmp", OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\close_light.bmp");
	
	//---シャットダウンボタン
	ObjectCreate(0, "shutdown_button_bmp", OBJ_BITMAP_LABEL, 0, 0, 0);
	ObjectSetString(0, "shutdown_button_bmp", OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\shutdown_light.bmp");
	
	//---全通貨ペア決済ボタン
	ObjectCreate(0, "all_cut_bmp", OBJ_BITMAP_LABEL, 0, 0, 0);
	ObjectSetString(0, "all_cut_bmp", OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\all_cut_light.bmp");
	
	//---現通貨ペア決済ボタン
	ObjectCreate(0, "now_cut_bmp", OBJ_BITMAP_LABEL, 0, 0, 0);
	ObjectSetString(0, "now_cut_bmp", OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\now_cut_light.bmp");
	
	//---テキスト表示エリア
	ObjectCreate(0, "bottom_bar_bmp", OBJ_BITMAP_LABEL, 0, 0, 0);
	ObjectSetString(0, "bottom_bar_bmp", OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\bottom_bar.bmp");
	
	//---テキストフレームラベル
	for(int i=0 ; i<TEXT_LABEL_SIZE ; i++){
		ObjectCreate(0, "amadeus_text_label"+i, OBJ_LABEL, 0, 0, 0);
		ObjectSetInteger(0, "amadeus_text_label"+i, OBJPROP_COLOR, clrWhite);
		ObjectSetString(0, "amadeus_text_label"+i, OBJPROP_FONT, "メイリオ");
		ObjectSetInteger(0, "amadeus_text_label"+i, OBJPROP_FONTSIZE, 9);
		ObjectSet("amadeus_text_label"+i, OBJPROP_SELECTABLE, false);
	}
	
	//---次のろうそく足までの時間ラベル
	ObjectCreate(0, "next_candle_label", OBJ_LABEL, 0, 0, 0);
	ObjectSetInteger(0, "next_candle_label", OBJPROP_COLOR, clrRed);
	ObjectSetInteger(0, "next_candle_label", OBJPROP_FONTSIZE, 15);
	ObjectSetInteger(0, "next_candle_label", OBJPROP_ANCHOR, ANCHOR_RIGHT_UPPER);
	ObjectSetInteger(0, "next_candle_label", OBJPROP_CORNER, CORNER_RIGHT_UPPER);
	ObjectSetInteger(0, "next_candle_label", OBJPROP_XDISTANCE, 0);                  
	ObjectSetInteger(0, "next_candle_label", OBJPROP_YDISTANCE, 10);	
	ObjectSetString(0, "next_candle_label", OBJPROP_FONT, "メイリオ");

	Object_Reset(false);
}

//オブジェクト連動移動
void Object_Reset(bool chartChange_Flag){	
	//---top_barの座標を取得する
	int base_X = ObjectGetInteger(0, "top_bar_bmp", OBJPROP_XDISTANCE);
	int base_Y = ObjectGetInteger(0, "top_bar_bmp", OBJPROP_YDISTANCE);
	
	//---topbar自体に値を代入してから連動移動をするか？
	if(chartChange_Flag){
		ObjectSetInteger(0, "top_bar_bmp", OBJPROP_XDISTANCE, topBar_X);                  
		ObjectSetInteger(0, "top_bar_bmp", OBJPROP_YDISTANCE, topBar_Y);
		base_X = ObjectGetInteger(0, "top_bar_bmp", OBJPROP_XDISTANCE);
		base_Y = ObjectGetInteger(0, "top_bar_bmp", OBJPROP_YDISTANCE);
	}
	else{
		topBar_X = base_X;
		topBar_Y = base_Y;
	}
	
	//---メイン画像移動
	ObjectSetInteger(0, "amadeus_bmp", OBJPROP_XDISTANCE, base_X);                  
	ObjectSetInteger(0, "amadeus_bmp", OBJPROP_YDISTANCE, base_Y+(22));
	
	//---ニキシー管移動
	for(int i=0 ; i<NIXIE_TUBE_SIZE ; i++){
		ObjectSetInteger(0, "nixie_tube_bmp"+i, OBJPROP_XDISTANCE, base_X+(i*22+29));              
		ObjectSetInteger(0, "nixie_tube_bmp"+i, OBJPROP_YDISTANCE, base_Y+(24));
	}
	
	//---損益表示切り替え移動
	ObjectSetInteger(0, "profit_change_bmp", OBJPROP_XDISTANCE, base_X+(5));
	ObjectSetInteger(0, "profit_change_bmp", OBJPROP_YDISTANCE, base_Y+(24));
	
	//---テキスト表示エリア移動
	ObjectSetInteger(0, "bottom_bar_bmp", OBJPROP_XDISTANCE, base_X+(5));
	ObjectSetInteger(0, "bottom_bar_bmp", OBJPROP_YDISTANCE, base_Y+(301));
	
	//---テキストラベル移動
	for(int i=0 ; i<TEXT_LABEL_SIZE ; i++){
		ObjectSetInteger(0, "amadeus_text_label"+i, OBJPROP_XDISTANCE, base_X+(6));
		ObjectSetInteger(0, "amadeus_text_label"+i, OBJPROP_YDISTANCE, base_Y+(i*16+305));
	}
	
	//---カメラボタン移動
	ObjectSetInteger(0, "camera_button_bmp", OBJPROP_XDISTANCE, base_X+(157));
	ObjectSetInteger(0, "camera_button_bmp", OBJPROP_YDISTANCE, base_Y+(204));
	
	//---設定ボタン移動
	ObjectSetInteger(0, "setting_button_bmp", OBJPROP_XDISTANCE, base_X+(157));
	ObjectSetInteger(0, "setting_button_bmp", OBJPROP_YDISTANCE, base_Y+(252));
	
	//---成績ボタン移動
	ObjectSetInteger(0, "result_button_bmp", OBJPROP_XDISTANCE, base_X+(109));
	ObjectSetInteger(0, "result_button_bmp", OBJPROP_YDISTANCE, base_Y+(252));
	
	//---縮小化ボタン移動
	ObjectSetInteger(0, "close_button_bmp", OBJPROP_XDISTANCE, base_X+(61));
	ObjectSetInteger(0, "close_button_bmp", OBJPROP_YDISTANCE, base_Y+(252));
	
	//---シャットダウンボタン移動
	ObjectSetInteger(0, "shutdown_button_bmp", OBJPROP_XDISTANCE, base_X+(13));
	ObjectSetInteger(0, "shutdown_button_bmp", OBJPROP_YDISTANCE, base_Y+(252));
	
	//---全通貨ペア決済ボタン移動
	ObjectSetInteger(0, "all_cut_bmp", OBJPROP_XDISTANCE, base_X+(11));
	ObjectSetInteger(0, "all_cut_bmp", OBJPROP_YDISTANCE, base_Y+(89));
	
	//---現通貨ペア決済ボタン移動
	ObjectSetInteger(0, "now_cut_bmp", OBJPROP_XDISTANCE, base_X+(108));
	ObjectSetInteger(0, "now_cut_bmp", OBJPROP_YDISTANCE, base_Y+(89));
}

//ニキシー管表示
void Draw_Profit_Nixie(){
	profitAndLoss = 0;
 	
	//---損益を求める
	for(int i=0 ; i<OrdersTotal(); i++){
		OrderSelect(i, SELECT_BY_POS, MODE_TRADES);
		
		//---オーダーが買い・売り注文ならば
		if(OrderType() == OP_BUY || OrderType() == OP_SELL){
			//---表示形式がPipsならば
			if(!ObjectGetInteger(0, "profit_change_bmp", OBJPROP_STATE)){
				//---pipsに損益を求める
				double point = 0.0;
				
				if(OrderType() == OP_BUY)
					point = OrderClosePrice() - OrderOpenPrice();
				else
					point = OrderOpenPrice() - OrderClosePrice();
					
				int digit = MarketInfo(OrderSymbol(), MODE_DIGITS);
				
				//---pipsの桁を合わせる
				if(digit == 2|| digit == 3)
					profitAndLoss += point*100;
				else
					profitAndLoss += point*10000;
			}
			//---表示形式がJPYならば
			else{
				profitAndLoss += OrderProfit();
			}
		}
	}
	
	//---前の表示を消すためにニキシー管を初期化する
	for(int i=0 ; i<NIXIE_TUBE_SIZE; i++)
		ObjectSetString(0, "nixie_tube_bmp"+i, OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\nixie_tube_none.bmp");
		
	//---今後の判定用にpipsをstring型に変換
	string profitAndLossStr;
	
	if(!ObjectGetInteger(0, "profit_change_bmp", OBJPROP_STATE))
		profitAndLossStr = DoubleToString(profitAndLoss, 1);
	else
		profitAndLossStr = DoubleToString(profitAndLoss, 0);
	
	//---もし０よりも上ならば、"+"を先頭に付け足す
	if(profitAndLoss > 0)
		profitAndLossStr = "+"+profitAndLossStr;
	
	for(int i=0 ; i<StringLen(profitAndLossStr) ; i++){
		string profitAndLossChar = StringSubstr(profitAndLossStr, (StringLen(profitAndLossStr)-1)-i, 1);
		
		//---profitAndLossCharが数値以外ならば
		if(profitAndLossChar == "-" || profitAndLossChar == "." || profitAndLossChar == "+"){
			if(profitAndLossChar == ".")
				ObjectSetString(0, "nixie_tube_bmp"+((NIXIE_TUBE_SIZE-1)-i), OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\nixie_tube_dot.bmp");
			else if(profitAndLossChar == "-")
				ObjectSetString(0, "nixie_tube_bmp"+((NIXIE_TUBE_SIZE-1)-i), OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\nixie_tube_minus.bmp");
			else
				ObjectSetString(0, "nixie_tube_bmp"+((NIXIE_TUBE_SIZE-1)-i), OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\nixie_tube_plus.bmp");
		}
		//---profitAndLossCharが数値だったら。
		else{
			string filePass = "::Experts\\Amadeus\\Image\\Main\\nixie_tube_"+profitAndLossChar+".bmp";
			ObjectSetString(0, "nixie_tube_bmp"+((NIXIE_TUBE_SIZE-1)-i), OBJPROP_BMPFILE, filePass);
		}
	}

}

//任意の文字列を表示する。
void Print_String(){
	if(drawStringTime != 0){
		ObjectSetString(0, "amadeus_text_label0", OBJPROP_TEXT, firstString);
		ObjectSetString(0, "amadeus_text_label1", OBJPROP_TEXT, secondString);
		ObjectSetString(0, "amadeus_text_label2", OBJPROP_TEXT, thirdString);
		
		//---指定された時間になったら表示をリセットする。
		if(GetTickCount()-firstDrawTime >= drawStringTime*1000){
			drawStringTime = 0;
			firstString = "";
			secondString = "";
			thirdString = "";
		}
	}
	else{
		//---基本情報：現在のオーダー数
		totalOrder = 0;
		for(int i=0 ; i<OrdersTotal() ; i++){
			OrderSelect(i, SELECT_BY_POS, MODE_TRADES);
			
			if(OrderType() == OP_BUY || OrderType() == OP_SELL)
				totalOrder++;
		}
		ObjectSetString(0, "amadeus_text_label0", OBJPROP_TEXT, "　現在のオーダー数　　:"+totalOrder+"order");
		
		//---基本情報：累計取引回数/累計損益
		cumulativeOrder = 0;
		totalPips = 0;
		
		for(int i=0 ; i<OrdersHistoryTotal() ; i++){
			OrderSelect(i, SELECT_BY_POS, MODE_HISTORY);
			double point;
			
			if(OrderType() == OP_BUY || OrderType() == OP_SELL){
				if(OrderCloseTime() > startTime){
					cumulativeOrder++;
					
					if(OrderType() == OP_BUY)
						point = OrderClosePrice() - OrderOpenPrice();
					else
						point = OrderOpenPrice() - OrderClosePrice();
				
		
					int digit = MarketInfo(OrderSymbol(), MODE_DIGITS);
					
					//---pipsの桁を合わせる
					if(digit == 2|| digit == 3)
						totalPips += point*100;
					else
						totalPips += point*10000;
				}
			}
		}
		ObjectSetString(0, "amadeus_text_label1", OBJPROP_TEXT, "　累計取引回数　　　　:"+cumulativeOrder+ "回");
		ObjectSetString(0, "amadeus_text_label2", OBJPROP_TEXT, "　累計損益(pips)   　 　:"+DoubleToString(totalPips, 1)+"Pips");
	}
}

//任意の文字列をセットする。
void Set_String(string first, string second, string third, int time){
	firstDrawTime = GetTickCount();
	drawStringTime = time;
	firstString = first;
	secondString = second;
	thirdString = third;
}

//Amadeusの表情変化
void Makise_Expression(){
	static int eFrameCount; //フレーム計測用
	double pips = 0.0;		   //表情判定用
	int expressionNum = 0;     //表情
	
	//---表情の基準となるpipsを算出する
	for(int i=0 ; i<OrdersTotal(); i++){
		OrderSelect(i, SELECT_BY_POS, MODE_TRADES);
		
		//---オーダーが買い・売り注文ならば
		if(OrderType() == OP_BUY || OrderType() == OP_SELL){
			//---pipsに損益を求める
			double point = 0.0;
			
			if(OrderType() == OP_BUY)
				point = OrderClosePrice() - OrderOpenPrice();
			else
				point = OrderOpenPrice() - OrderClosePrice();
				
			int digit = MarketInfo(OrderSymbol(), MODE_DIGITS);
			
			//---pipsの桁を合わせる
			if(digit == 2|| digit == 3)
				pips += point*100;
			else
				pips += point*10000;
		}
	}
	
	//---表情変化させるために数値を設定する
	//---普通(-9 ~ 19)pisp
	if(pips >= -9 && pips <= 19)
		expressionNum = 0;
	//---ちょっとうれしい(20 ~ 49)pips
	else if(pips >= 20 && pips <= 49)
		expressionNum = 1;
	//---だいぶ嬉しい(50 ~)pips
	else if(pips >= 50)
		expressionNum = 2;
	//ちょと悲しい(-10 ~ -19)pips
	else if(pips <= -10 && pips >= -29)
		expressionNum = 3;
	//だいぶ悲しい(-20 ~ -59)pips
	else if(pips <= -30 && pips >= -49)
		expressionNum = 4;
	//めちゃくちゃ悲しい(-60以上)pips
	else if(pips <= -50)
		expressionNum = 5;
	
	switch(expressionNum){
		case 0:
			ObjectSetString(0, "amadeus_bmp", OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\kurisu_normal.bmp");
			break;
		case 1:
			ObjectSetString(0, "amadeus_bmp", OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\kurisu_winking.bmp");
			break;
		case 2:
			ObjectSetString(0, "amadeus_bmp", OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\kurisu_happy.bmp");
			break;
		case 3:
			ObjectSetString(0, "amadeus_bmp", OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\kurisu_angry.bmp");
			break;
		case 4:
			ObjectSetString(0, "amadeus_bmp", OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\kurisu_disappointed.bmp");
			break;
		case 5:
			ObjectSetString(0, "amadeus_bmp", OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\kurisu_sad.bmp");
			break;
	}
	
	//ウィンク処理
	if(expressionNum != 2){
		if(eFrameCount >= 80 && eFrameCount <= 82)
			ObjectSetString(0, "amadeus_bmp", OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\kurisu_close_eye.bmp");
			
		if(eFrameCount >= 110 && eFrameCount <= 112)
			ObjectSetString(0, "amadeus_bmp", OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\kurisu_close_eye.bmp");
			
		if(eFrameCount >= 170 && eFrameCount <= 172)
			ObjectSetString(0, "amadeus_bmp", OBJPROP_BMPFILE, "::Experts\\Amadeus\\Image\\Main\\kurisu_close_eye.bmp");
			
		if(eFrameCount > 172)
			eFrameCount = 0;
	}
	
	eFrameCount++;
}