

if time>0{
	game_set_speed(spd,gamespeed_fps)
} else {
	game_set_speed(30,gamespeed_fps)
	instance_destroy()
}

time--

