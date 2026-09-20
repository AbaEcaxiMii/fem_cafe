if !flag_draw{exit}
atvx[0]=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/5 - (width[0])/2
atvy[0]=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2 - (height[0])/2

resx[0]=atvx[0]
resy[0]=camera_get_view_y(view_camera[0])- (height[0])

atvx[1]=atvx[0]+width[0]+2
atvy[1]=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2 - (height[1])/2

resx[1]=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])
resy[1]=atvy[1]
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_sprite_ext(back_sprite,image_index,_x[0],_y[0],width[0]/sprite_width,height[0]/sprite_height,0,image_blend,global.trans_back_menus)
draw_sprite_ext(sprite_index,image_index,_x[0],_y[0],width[0]/sprite_width,height[0]/sprite_height,0,image_blend,1)

draw_sprite_ext(back_sprite,image_index,_x[1],_y[1],width[1]/sprite_width,height[1]/sprite_height,0,image_blend,global.trans_back_menus)
draw_sprite_ext(sprite_index,image_index,_x[1],_y[1],width[1]/sprite_width,height[1]/sprite_height,0,image_blend,1)
//draw_text(x,y-10,y) draw_text(x+50,y-10,resy)

var r1 = color_get_red(color_start);
var g1 = color_get_green(color_start);
var b1 = color_get_blue(color_start);
var r2 = color_get_red(color_end);
var g2 = color_get_green(color_end);
var b2 = color_get_blue(color_end);

var r = lerp(r1, r2, transition_progress);
var g = lerp(g1, g2, transition_progress);
var b = lerp(b1, b2, transition_progress);

var _cc = make_color_rgb(r, g, b);
///////////////

///////retirado do primor
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text_outline(_x[0]+op_border,_y[0]+op_border,inv_name[pos_inv])
draw_text(_x[0]+op_border,_y[0]+op_border,inv_name[pos_inv])
var _yo=0

if array_length(inv[pos_inv])>0{

for(var i=_min;i<_max;i++){
	var _li=array_length(inv[pos_inv])
	var _c= c_white if pos=i and _li>0{_c=_cc}
	var _name
	if (i<_li) and _li>0{_name=inv[pos_inv][i].name} else {_name="-----------"}
	draw_text_outline(_x[0]+op_border,_y[0]+op_border*3 + 10*_yo,_name)
	draw_text_color(_x[0]+op_border,_y[0]+op_border*3 + 10*_yo,_name,_c,_c,_c,_c,1)
	_yo++
	if _yo>_num-1{_yo=0}

}

} else {
	var _name="Sem " + inv_name[pos_inv+5] 
	draw_text_outline(_x[0]+op_border,_y[0]+op_border*3,_name)
	draw_text(_x[0]+op_border,_y[0]+op_border*3,_name)
	}

draw_set_halign(fa_right)
draw_set_valign(fa_top)
draw_text_outline(_x[0]+width[0]-op_border,_y[0]+op_border,string(pos+1)+"/"+string(oitem_manager.equip_inv_max))
draw_text(_x[0]+width[0]-op_border,_y[0]+op_border,string(pos+1)+"/"+string(oitem_manager.equip_inv_max))

draw_set_halign(fa_left)
draw_set_valign(fa_top)

if status_ready and array_length(inv[pos_inv])>0{
//desenhando os status com icones
for(var i=0;i<st_length;i++){
	var _o=i var _p=0
	if i>=2 {_o=i-2 _p=5}
	draw_sprite(status_spr[i],0,_x[1]+op_border+op_space*_p,1+_y[1]+op_border + op_space*_o)
	draw_text_outline(10+_x[1]+op_border+op_space*_p,_y[1]+op_border + op_space*_o,status[i])
	draw_text(10+_x[1]+op_border+op_space*_p,_y[1]+op_border + op_space*_o,status[i])
}

var _party_l=array_length(global.party_members)
//desenhando as caras de quem pode usar o equipamento
for(var i=0;i<_party_l;i++){
	var _port=inv[pos_inv][pos].port
	var _n=global.party_members[i].id_number
	var _alpha=1
	if !array_contains(_port,_n){_alpha=0.5}
	
	draw_sprite_ext(global.icon_health[global.party_members[i].id_number],0,_x[1]+op_border*2+20*i,_y[1]+op_space*3,1,1,0,c_white,_alpha)
}
//descrição dos equipamentos
	var _desc=string(inv[pos_inv][pos].name)+" - "+ string(inv[pos_inv][pos].desc)
	draw_text_outline(_x[1]+op_border,_y[1]+op_space*4,_desc,line_sep,line_width)
	draw_text_ext(_x[1]+op_border,_y[1]+op_space*4,_desc,line_sep,line_width)
}

//////////////

var _armspr

_armspr[0]=oitem_manager.invp[member.id_number,0].spr
_armspr[1]=oitem_manager.invp[member.id_number,1].spr
_armspr[2]=oitem_manager.invp[member.id_number,2].spr
_armspr[3]=oitem_manager.invp[member.id_number,3].spr
_armspr[4]=oitem_manager.invp[member.id_number,4].spr

//desenhando os quipamentos selecionados em cima da caixa 1
var _stora_w=0
for(var i=0;i<5;i++){
//var _xima=_x[1]+(width[1])+op_border
//var _t=1.4 var _btw=(20*_t)+10 var _yy=_y[1]-40 //melhorar o btw
var _t=1.4 var _btw=(width[1]-(sprite_width*_t)*5)/4 var _yy=_y[1]-40
//fazer o ener mudar de acordo com quem tá selecionado
var _c=c_white var _sprx=_armspr[i]
if i=pos_inv{_c=c_aqua if array_length(inv[pos_inv])>0{_sprx=inv[pos_inv][pos].spr} }
draw_sprite_ext(back_sprite,0,_x[1]+_stora_w,_yy,_t,_t,0,_c,global.trans_back_menus)
draw_sprite_ext(sprite_index,0,_x[1]+_stora_w,_yy,_t,_t,0,_c,1)
draw_sprite(_sprx,0,_x[1]+_stora_w+op_border,_yy+op_border)
_stora_w+=sprite_width*_t+_btw
}

////////////////

var _st_c=c_white

if vender_mode{
	if array_length(inv[pos_inv])>0{
	st_up="("+string(inv[pos_inv][pos].price)+"$) "+string(global.exp)+"$" _st_c=c_green
	} else {
	st_up=string(global.exp)+"$" _st_c=c_green
	}
	
	}
else {st_up=oitem_manager.invp[member.id_number,pos_inv].name}
//texto dizendo qual equipamento está equipado
var _tt=0.75
draw_sprite_ext(back_sprite,0,_x[0],_y[0]-op_border/2-sprite_height*_tt,width[0]/sprite_width,_tt,0,c_aqua,global.trans_back_menus)
draw_sprite_ext(sprite_index,0,_x[0],_y[0]-op_border/2-sprite_height*_tt,width[0]/sprite_width,_tt,0,c_aqua,1)
draw_text_outline(_x[0]+op_border,_y[0]-op_border/2-sprite_height*_tt+op_border/2,st_up)
draw_text_color(_x[0]+op_border,_y[0]-op_border/2-sprite_height*_tt+op_border/2,st_up,_st_c,_st_c,_st_c,_st_c,1)