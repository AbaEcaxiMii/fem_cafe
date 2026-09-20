if keyboard_check_pressed(vk_escape) game_end();
if keyboard_check_pressed(vk_f3) game_restart();
if keyboard_check_pressed(vk_f4){
var _full= window_get_fullscreen()	
window_set_fullscreen(0)
window_center()
}

////
//if mouse_check_button(mb_left) MoveSlider() else GUIDrag = noone;
//if mouse_check_button_pressed(mb_left) ClickToggle();

#region UPDATE CAMERA

	ZoomTarget = clamp(ZoomTarget + MOUSE_WHEEL * ZOOM_SPEED, ZOOM_MIN, ZOOM_MAX);
	Zoom = abs(Zoom - ZoomTarget) < 0.01 ? ZoomTarget : lerp(Zoom, ZoomTarget, 0.4);

	var _width  = min(VIEW_WIDTH * Zoom, room_width) >> 0;
	if (_width & 1) _width++;
	var _height = _width * Ratio;

	var _widthHalf = _width/2;
	var _heightHalf = _height/2;

	x = clamp(x + INPUT_HOR * 4, _widthHalf,  room_width - _widthHalf);
	y = clamp(y + INPUT_VER * 4, _heightHalf, room_height - _heightHalf);

	camera_set_view_size(VIEW, _width, _height);
	camera_set_view_pos(VIEW, x - _widthHalf, y - _heightHalf);
	
#endregion