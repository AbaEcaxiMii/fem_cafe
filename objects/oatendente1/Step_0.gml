d_key=keyboard_check_pressed(global.d_key)


blink_hit_step(omira_loja)
touch=place_meeting(x,y,omira_loja)

if instance_exists(oTextbox){
	
	if oTextbox.npc_presence[oTextbox.page]{
		
	var _face=oTextbox.npc_face[oTextbox.page]
	if _face=1{sprite_index=satend_normal} else if _face=2{sprite_index=satend_feliz}
	else if _face=3{sprite_index=satend_triste}
		
	if oTextbox.made_sound{image_speed=1} else
	if not oTextbox.made_sound and image_index=0 {image_speed=0}
	
	
	} else {image_speed=0 image_index=0}
	
} else {image_speed=0 image_index=0 sprite_index=satend_normal}
	
if touch and omira_loja.accept_key and !omira_loja._textb{
	create_textbox("talk_lojaatend")
	talk=1
}