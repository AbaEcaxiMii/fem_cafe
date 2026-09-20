
if alpha>0
depth= -bbox_bottom

depth= oPlayer.depth-10

if state=0{
	
	if global.flag[1]{
		
		if place_meeting(x,y,ointeragir) and !instance_exists(oTextbox){
		textbox_id=create_textbox("peças bloqueando computador2")
		}
		
		if instance_exists(oTextbox)
		{
			if oTextbox.text_id="peças bloqueando computador abrir"{ss=1}
		} else if !instance_exists(oTextbox) and ss>0{
			global.can_move=false
			if ss=1{
				ta=1 if alpha=1 {
					oPlayer.sprite_index=sRecyDown oPlayer.x=x_last oPlayer.y=y_last-50
					x=x_last y=y_last image_index=2 ss=2
					}
			} else if ss=2 {
				ta=0
				if alpha=0 {global.flag[0]=1 global.can_move=true state=1}
			}
			
		}
		
	} else {
	
		if place_meeting(x,y,ointeragir) and not instance_exists(oTextbox){
		create_textbox("peças bloqueando computador1")
		}
	
	}
	
} else if state=1{
	
	if place_meeting(x,y,ointeragir) and not instance_exists(oTextbox){
		create_textbox("peças bloqueando computador3")
		}
	
}