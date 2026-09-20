var _finalVol = global.musicVol*global.masterVol
song_time=audio_sound_get_track_position(songInst)
if songAsset!=targetSongAsset
{
	
	if audio_is_playing(songInst)
	{
		array_push(fadeOutInst,songInst)
		array_push(fadeOutInstVol,fadeInInstVol)
		array_push(fadeOutInstTime,endFadeOutTime)
		songInst=noone
		songAsset=noone
	}
	
	//tocar a music se a velha já parou de tocar (tirar os //)
	//if array_lenght(fadeOutInst)==0
	//{
		if audio_exists(targetSongAsset)
		{
			song_playing=targetSongAsset
			songInst=audio_play_sound(targetSongAsset,4,true,0,song_set_time)
			audio_sound_gain(songInst,0,0)
			fadeInInstVol=0
		}
		songAsset= targetSongAsset
	//}
}

if audio_is_playing(songInst)
{
	if startFadeInTime>0 //fade a music
	{
		if fadeInInstVol<1{fadeInInstVol+=1/startFadeInTime} else fadeInInstVol=1
	} else {
		//imediatamente cmc a music se o fade in for 0
		fadeInInstVol=1
	}
	
	audio_sound_gain(songInst, fadeInInstVol*_finalVol, 0)
}

//fading songs out
for(var i=0;i<array_length(fadeOutInst); i++)
{
	
	if fadeOutInstTime[i]>0 //fade out a music
	{
		if fadeOutInstVol[i]>0{fadeOutInstVol[i]-=1/fadeOutInstTime[i]}
	} else {
		//imediatamente terminar a music se o fade out for 0
		fadeOutInstVol[i]=0
	}
	
	audio_sound_gain(fadeOutInst[i], fadeOutInstVol[i]*_finalVol, 0)
	
	if fadeOutInstVol[i]<=0
	{
		if audio_is_playing(fadeOutInst[i]) {audio_stop_sound(fadeOutInst[i])}
		array_delete(fadeOutInst,i,1)
		array_delete(fadeOutInstVol,i,1)
		array_delete(fadeOutInstTime,i,1)
		i--
	}	
}