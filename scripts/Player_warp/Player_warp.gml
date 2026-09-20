function player_dir_warp(_dir){
	if _dir=0{
		with oPlayer{
		_sface = sleft
		_imface=xscale
		player_dir=0}
	} else if _dir=1{ //90
		with oPlayer{
		_sface = sup
		_imface=1
		player_dir=90}
	} else if _dir=2{ //180
		with oPlayer{
		_sface = sright
		_imface=1
		player_dir=180
		}
	} else if _dir=3{ //270
		with oPlayer{
		_sface = sdown
		_imface=1
		player_dir=270
		}
	}
	
	with oPlayer{sprite_index=_sface image_xscale=_imface}
}