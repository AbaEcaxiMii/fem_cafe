//global.GameState = new GameStateCreate();
GameState = new GameStateCreate();
#region SIMPLE CAMERA

	Zoom = 2;
	ZoomTarget = 2;
	Ratio = display_get_height()/display_get_width();
	window_set_size(display_get_width(), display_get_height());
	surface_resize(application_surface, display_get_width(), display_get_height());
	display_set_gui_size(display_get_width(), display_get_height());
	window_set_fullscreen(true);
	alarm[0] = 1;
	
#endregion

#region SHADER
	UCRTParams = shader_get_uniform(SHD_CRT, "params");
	CRT = GameState.CRT;
	application_surface_draw_enable(false);
	
#endregion

GUIDrag = noone;
function MoveSlider()
{	
	if instance_exists(GUIDrag) return GUIDrag.Drag(device_mouse_x_to_gui(0));
	GUIDrag = instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), GUI_GraphicalUserInterface);
}

function ClickToggle()
{
	var _toggle = instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), GUI_GraphicalUserInterface);
	if (_toggle == noone) return;
	
	return _toggle.Click();
}

layer_set_visible(layer_get_id("Guide"), false);

