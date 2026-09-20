confirmar_key=keyboard_check_pressed(global.confirmar)

touch=place_meeting(x,y,oloja_mouse)
var _touch_mouse=function(){
	var _brilhar=0
	if (touch and oloja_mouse.mouse_can_move and oloja_mouse.cooldown_after_free_move<=0){_brilhar=1}
	return _brilhar
	}
blink_hit_step(_touch_mouse())

if instance_exists(oTextbox){
	
	if oTextbox.npc_presence[oTextbox.page]{
		
	var _face=oTextbox.npc_face[oTextbox.page]
	if _face=1{sprite_index=satend_normal} else if _face=2{sprite_index=satend_feliz}
	else if _face=3{sprite_index=satend_triste}
		
	if oTextbox.made_sound{image_speed=1} else
	if not oTextbox.made_sound and image_index=0 {image_speed=0}
	
	
	} else {image_speed=0 image_index=0}
	
} else {image_speed=0 image_index=0 sprite_index=satend_normal}
	
if confirmar_key and _touch_mouse(){
	create_textbox("talk_lojaatend")
	talk=1
}