//global.GameState = new GameStateCreate();
GameState = new GameStateCreate();

#region SHADER
	UCRTParams = shader_get_uniform(SHD_CRT, "params");
	CRT = GameState.CRT;
	application_surface_draw_enable(false);
	
#endregion

GUIDrag = noone;

layer_set_visible(layer_get_id("Guide"), false);

