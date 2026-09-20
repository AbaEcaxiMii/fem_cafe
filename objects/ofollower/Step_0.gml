mask_index=sdown
switch(oPlayer.toRecordSprite[record]){
	case oPlayer.sdown: sprite_index= sdown image_xscale=1 break
	case oPlayer.sup: sprite_index= sup image_xscale=1 break}
	if oPlayer.xscale=1{
if xscale=1{
	switch(oPlayer.toRecordSprite[record]){
	case oPlayer.sleft: sprite_index= sleft image_xscale=1 break
	case oPlayer.sright: sprite_index= sright image_xscale=1 break}
} else if xscale=-1{
	switch(oPlayer.toRecordSprite[record]){
	case oPlayer.sleft: sprite_index= sleft image_xscale=xscale break
	case oPlayer.sright: sprite_index= sright image_xscale=1 break}
}}
if oPlayer.xscale=-1{
if xscale=1{
	if oPlayer.toRecordSprite[record]=oPlayer.sright{
	switch(oPlayer.toRecord_Xscale[record]){
	case -1: sprite_index= sleft image_xscale=1 break
	case 1: sprite_index= sright image_xscale=1 break}
	}
} else if xscale=-1{
	switch(oPlayer.toRecordSprite[record]){
	case oPlayer.sright: sprite_index= sright image_xscale=oPlayer.toRecord_Xscale[record] break}
}}

var _ih= sprite_get_height(sdown)/2
var _ph= sprite_get_height(oPlayer.sdown)/2
var _difh= _ph-_ih
	
target_x=oPlayer.pos_x[record]
target_y=oPlayer.pos_y[record] + _difh
image_speed=1
if (target_x=xprevious and target_y=yprevious) or instance_exists(obattle_manager) {image_index=0}

if !instance_exists(obattle_manager){
depth= -bbox_bottom

if instance_exists(obattle_manager){ //or place_meeting(x,y,[oenemy_overworld])
	image_alpha = clamp(image_alpha - 0.05,0,1)
} else {
	image_alpha = clamp(image_alpha + 0.05,0,1)
}

//step
// Calcule a distância para o ponto B
var dist_x = target_x - x;
var dist_y = target_y - y;
var distance = point_distance(x, y, target_x, target_y);

// Calcule a direção para o ponto B
var dir = point_direction(x, y, target_x, target_y);

// Se o objeto está longe o suficiente do ponto B
if (distance > 0) {
    // Calcule a velocidade desejada
    var target_speed;
    if (distance > deceleration_distance) {
        // Acelere até a velocidade máxima
        target_speed = min(max_speed, speed + acceleration);
    } else {
        // Desacelere ao se aproximar do ponto B
        var deceleration = max_speed * (distance / deceleration_distance);
        target_speed = max(0, min(max_speed, deceleration));
    }
    
    // Atualize a velocidade
    speed_x = lengthdir_x(target_speed, dir);
    speed_y = lengthdir_y(target_speed, dir);
    
    // Mova o objeto
    x += speed_x;
    y += speed_y;
}

// Se o objeto estiver muito próximo do ponto B, pare-o
if (distance < 1) {
    x = target_x;
    y = target_y;
    speed_x = 0;
    speed_y = 0;
}
}