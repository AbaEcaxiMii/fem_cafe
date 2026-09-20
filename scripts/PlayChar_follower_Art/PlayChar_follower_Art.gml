function follower_skin( _type){
	switch(_type){
	///inicio
	
		//Recy
		case 0:
		switch(oParty_manager.alter_member[0]){
			case 0:
			sdown= sRecyDown 
			sup= sRecyUp 
			sleft= sRecySide
			sright= sRecySide
			xscale=spr_xscale(sleft,sright)
			break
			case 1:
			sright=sRecySideS
			sleft=sRecySideS
			sup=sRecyUpS
			sdown=sRecyDownS
			xscale=spr_xscale(sleft,sright)
			break
		}
		break
		
		//Sophia
		case 1:
		
		sdown= ssophia_down 
		sup= ssophia_up 
		sleft= ssophia_side
		sright= ssophia_side
		xscale=spr_xscale(sleft,sright)
		
		break
		
		//Emma
		case 2:
		sdown= semma_down
		sup= semma_up
		sleft= semma_side
		sright= semma_side
		xscale=spr_xscale(sleft,sright)
		
		break
		
		//Aurélio (jeito certo de escrever)
		case 3:
		
		sdown= saur_down
		sup= saur_up
		sleft= saur_side
		sright= saur_side
		xscale=spr_xscale(sleft,sright)
		
		break
		
		//Rato
		case 4:

		sdown= sratodown
		sup= sratoup
		sleft= sratoside
		sright= sratoside
		xscale=spr_xscale(sleft,sright)
		
		break
		
	///fim
	}
	
}

function battle_sprites(_type){
	switch(_type){
		case 0:
		sbackb= sUIbattle_background_recy
		sprite_idle= srecy_idle
		sprite_dead= srecy_dead
		smini= srecy_mini
		break
		
		case 1:
		sbackb= sUIbattle_background_sophia
		sprite_idle=sshopia_idle
		sprite_dead= srecy_dead
		smini= ssophia_mini
		break
		
		case 2:
		sbackb= sUIbattle_background_emma
		sprite_idle=semma_idle
		sprite_dead= srecy_dead
		smini= semma_mini
		break
		
		case 3:
		sbackb= sUIbattle_background_aur
		sprite_idle=saur_idle
		sprite_dead= srecy_dead
		smini= saur_mini
		break
		
		case 4:
		sbackb= sUIbattle_background_aur
		sprite_idle=sratodown
		sprite_dead= srecy_dead
		smini= srecy_mini
		break
		
		case 100:
		sbackb= sUIbattle_background_aur
		sprite_idle=s_default_down
		sprite_dead= srecy_dead
		smini= srecy_mini
		break
	}
}

function followers_spawner()
{
	instance_destroy(ofollower)
	for(var i=array_size-1;i>=0;i--){
	pos_x[i]=oPlayer.x
	pos_y[i]=oPlayer.y
	toRecordSprite[i]=oPlayer.sprite_index
	toRecord_Xscale[i]=oPlayer.image_xscale
}
	for (var i=1;i<global.party_length;i++){
		if i<4 {instance_create_depth(oPlayer.x,oPlayer.y,depth,ofollower,{record: 6*i,number: i});}
		//quanto maior o record, mais distante ele fica do recy
	}
}

function spr_xscale(_sleft,_sright){if _sleft!=_sright {return 1} else {return -1}}

function fundo_medidor_cor(cor, _hue=20, _brilho_fator=1.2) {
    var h = color_get_hue(cor);
    var s = color_get_saturation(cor);
    var v = color_get_value(cor);
    
	h -=_hue
	h = clamp(h,0,255)
	v = min(v * _brilho_fator, 255)
    
    return make_color_hsv(h, s, v);
}

function multi_var(_data, _pos, _status){
	_status[st_pos]= _data
	_pos++
}

function draw_pie(_x , _y , _value, _max, _colour, _radius, _transparency, _inversed=0){
	if (_value > 0) { // no point even running if there is nothing to display (also stops /0
	    var circle_i, circle_len, circle_tx, circle_ty, circle_val;
    
	    var numberofsections = 60 // there is no draw_get_circle_precision() else I would use that here
	    var sizeofsection = 360/numberofsections
		var _value_tototal=(_value/_max)
		if _inversed{_value_tototal--}
		
	    circle_val = abs(_value_tototal) * numberofsections 
    
	    if (circle_val > 1) { // HTML5 version doesnt like triangle with only 2 sides 
    
	        draw_set_colour(_colour);
	        draw_set_alpha(_transparency);
        
	        draw_primitive_begin(pr_trianglefan);
	        draw_vertex(_x, _y);
        
	        for(circle_i=0; circle_i<=circle_val; circle_i++) {
	            circle_len = (circle_i*sizeofsection)+90; // the 90 here is the starting angle
	            circle_tx = lengthdir_x(_radius, circle_len);
	            circle_ty = lengthdir_y(_radius, circle_len);
	            draw_vertex(_x+circle_tx, _y+circle_ty);
	        }
	        draw_primitive_end();
        
	    }
		draw_set_colour(c_white)
	    draw_set_alpha(1);
	}
}

function draw_circular_bar(_x , _y , _value, _max, _colour, _radius, _transparency, _width, _inversed=0, _start_angle=90 , _angle_max=360, _special_medidor=0){

	if (_value > 0) { // no point even running if there is nothing to display (also stops /0
	    var circle_i, circle_len, circle_tx, circle_ty, circle_val;
    
	    var numberofsections = 60 // there is no draw_get_circle_precision() else I would use that here
	    var sizeofsection = _angle_max/numberofsections
		var _value_tototal=(_value/_max)
		if _inversed{_value_tototal--}
    
		circle_val = abs(_value_tototal) * numberofsections 
    
	    if (circle_val > 1) { // HTML5 version doesnt like triangle with only 2 sides 
    
	        piesurface = surface_create(_radius*2,_radius*2)
            
	        draw_set_colour(_colour);
	        draw_set_alpha(_transparency);
        
	        surface_set_target(piesurface)
        
	        draw_clear_alpha(c_blue,0.7)
	        draw_clear_alpha(c_black,0)
        
	        draw_primitive_begin(pr_trianglefan);
	        draw_vertex(_radius, _radius);
        
	        for(circle_i=0; circle_i<=circle_val; circle_i++) {
	            circle_len = (circle_i*sizeofsection)+_start_angle; // the 90 here is the starting angle
	            circle_tx = lengthdir_x(_radius, circle_len);
	            circle_ty = lengthdir_y(_radius, circle_len);
	            draw_vertex(_radius+circle_tx, _radius+circle_ty);
	        }
        
	        draw_primitive_end();
			
	        draw_set_alpha(1);
        
	        gpu_set_blendmode(bm_subtract)
	        draw_set_colour(c_black)
	        draw_circle(_radius, _radius,_radius-_width,false)
			
			var _ang_sep_medidor=0
			if _special_medidor{
				var _sep_medidor=10
				for (var i = 0; i < _sep_medidor; i++){
					draw_sprite_ext(smedidor_separacao,0,_radius, _radius,1,11,_ang_sep_medidor,c_white,1)
					_ang_sep_medidor+=360/_sep_medidor
				}
				_ang_sep_medidor=0
			}
			
	        gpu_set_blendmode(bm_normal)

	        surface_reset_target()
     
	        draw_surface(piesurface,_x-_radius, _y-_radius)
        
	        surface_free(piesurface)
			
			draw_set_colour(c_white)
        
	    }
    
	}

}

function draw_sprite_outline(_sprite,_image,_x,_y,_xscale=1,_yscale=1,_angle=0,_colour=c_white,_alpha=1,_offset=1){
	gpu_set_fog(true,_colour,0,0)
	// 8 direções principais
	draw_sprite_ext(_sprite, _image, _x-_offset, _y, _xscale, _yscale, _angle, c_white, _alpha);
	draw_sprite_ext(_sprite, _image, _x+_offset, _y, _xscale, _yscale, _angle, c_white, _alpha);
	draw_sprite_ext(_sprite, _image, _x, _y-_offset, _xscale, _yscale, _angle, c_white, _alpha);
	draw_sprite_ext(_sprite, _image, _x, _y+_offset, _xscale, _yscale, _angle, c_white, _alpha);
	draw_sprite_ext(_sprite, _image, _x-_offset, _y-_offset, _xscale, _yscale, _angle, c_white, _alpha);
	draw_sprite_ext(_sprite, _image, _x+_offset, _y-_offset, _xscale, _yscale, _angle, c_white, _alpha);
	draw_sprite_ext(_sprite, _image, _x-_offset, _y+_offset, _xscale, _yscale, _angle, c_white, _alpha);
	draw_sprite_ext(_sprite, _image, _x+_offset, _y+_offset, _xscale, _yscale, _angle, c_white, _alpha);
	gpu_set_fog(false,_colour,0,0)
	
}
