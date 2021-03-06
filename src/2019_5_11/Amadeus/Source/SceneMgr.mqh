eScene mScene     = eScene_StartUp; 
eScene mNextScene = eScene_None;

//初期化
void SceneMgr_Initialize(){
	SceneMgr_InitializeModule(mScene);
}

//終了処理
void SceneMgr_Finalize(){
	SceneMgr_FinalizeModule(mScene);
}

//更新
void SceneMgr_Update(){
	if(mNextScene != eScene_None){
		SceneMgr_FinalizeModule(mScene);
		mScene = mNextScene;
		mNextScene = eScene_None;
		SceneMgr_InitializeModule(mScene);
	}
	switch(mScene){
	case eScene_StartUp:
		StartUp_Update();
		break;
	case eScene_Main:
		Main_Update();
		break;
	case eScene_Config:
		Config_Update();
		break;
	case eScene_Result:
		Result_Update();
		break;
	}
}

//イベント
void SceneMgr_Event(const int id, const long &lparam, const double &dparam, const string &sparam){
	switch(mScene){
	case eScene_StartUp:
		StartUp_Event(id, lparam, dparam, sparam);
		break;	
	case eScene_Main:
		Main_Event(id, lparam, dparam, sparam);
		break;
	case eScene_Config:
		Config_Event(id, lparam, dparam, sparam);
		break;
	case eScene_Result:
		Result_Event(id, lparam, dparam, sparam);
		break;
	}
}

//引数sceneモジュールを初期化する
void SceneMgr_InitializeModule(eScene scene){
	switch(scene){
	case eScene_StartUp:
		StartUp_Initialize();
		break;
	case eScene_Main:
		Main_Initialize();
		break;
	case eScene_Config:
		Config_Initialize();
		break;
	case eScene_Result:
		Result_Initialize();
		break;
	}
}

//引数sceneモジュールの終了処理を行う
void SceneMgr_FinalizeModule(eScene scene){
	switch(scene){
	case eScene_StartUp:
		StartUp_Finalize();
		break;
	case eScene_Main:
		Main_Finalize();
		break;
	case eScene_Config:
		Config_Finalize();
		break;
	case eScene_Result:
		Result_Finalize();
		break;
	}
}

//引数 nextScene にシーンを変更する
void SceneMgr_ChangeScene(eScene NextScene){
    mNextScene = NextScene;
}