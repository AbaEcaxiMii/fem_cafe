depth=-bbox_bottom
if place_meeting(x,y,ointeragir) and not instance_exists(oTextbox){
textbox_id=create_textbox(text_id)
}
mask_index=snpc_defa
if not instance_exists(oTextbox){textbox_id=noone}

if textbox_id!=noone{
	
	if textbox_id.npc_presence[textbox_id.page]{
		
	var _face=textbox_id.npc_face[textbox_id.page]
	if _face=1{sprite_index=snpc_defa} else if _face=2{sprite_index=snpc_defa_feliz}
		
	if textbox_id.made_sound{image_speed=1} else
	if not textbox_id.made_sound and image_index=0 {image_speed=0}
	
	
	} else {image_speed=0 image_index=0 sprite_index=snpc_defa}
	
} else {image_speed=0 image_index=0 sprite_index=snpc_defa}