function scr_music_play(_music){
	var actual_music = global.music
	var new_music = _music

if new_music != actual_music{

global.music= new_music
if new_music != noone{
audio_stop_sound(global.music)
audio_play_sound(global.music, 100, true);
audio_play_sound(sfx_stage_lightbits_med, 100, false);
} else{
	audio_stop_sound(global.music)
}
}

}

function set_song_ingame(_song, _fadeOutCurrentSong=0, _fadeIn=0, _setTime=0){

with (oMusicManager){
	targetSongAsset= _song
	endFadeOutTime= _fadeOutCurrentSong
	startFadeInTime= _fadeIn
	song_set_time= _setTime
}

}

function play_sfx(_snd){
	audio_play_sound(_snd,90,false)
}

function play_enemie_sfx(_snd){
	audio_play_sound(_snd,80,false)
}

////////////luz - adicionar depois

function create_light(_x,_y,_c=c_white,_inten=1,_xsc=1,_ysc=1,_alvo=-10){
	var _luz=instance_create_depth(_x,_y,0,oluz_thing)
	_luz.image_blend=_c
	_luz.image_xscale=_xsc
	_luz.image_yscale=_ysc
	_luz.image_alpha=_inten
	_luz.alvo=_alvo
	return _luz
}