if place_meeting(x,y,ointeragir) and not instance_exists(oTextbox){
	if not array_contains(global.mission_inv,0){
		text_id="npc_quest1" what_do=1
		} else {
		text_id="npc_quest1-2" if omission_manager.mis_prog[0]=0{ what_do=2 }
	}
	
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
	
	
	} else {image_speed=0 image_index=0}
	
} else {image_speed=0 image_index=0 sprite_index=snpc_defa}

//oq fazer quando n tem texto, após conversa

if textbox_id=noone{

if what_do=1{mission_start(0)}
if what_do=2{mission_update(0)}

what_do=0
}

