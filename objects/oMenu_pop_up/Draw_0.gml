var _xscale=width/sprite_get_width(sTextbox)
var _yscale=height/sprite_get_height(sTextbox)
draw_sprite_ext(sTextbox_back,0,x,y,_xscale,_yscale,0,c_white,global.trans_back_menus*image_alpha)
draw_sprite_ext(sTextbox,0,x,y,_xscale,_yscale,0,c_white,image_alpha)
draw_text(x+op_border,y+op_border-1,text)
var _spr=global.icon_health[id_number]
draw_sprite(_spr,0,x-op_border-sprite_get_width(_spr)/2,y+height/2)