flag_draw=1
TextCr()
//Caixa em si
txtb_sprite = global.txtb_spr
txtb_back_sprite = global.txtb_spr_back
border=8
txtb_back_alpha=global.trans_back_menus
//mode 0 = overworld 1= Dialogo normal na batalha 2= Dialogo nas batalhas
if dial_mode=0{
textbox_width=290
textbox_height=80
} else if dial_mode=1{
textbox_width=225
textbox_height=85
} else if dial_mode=2{
textbox_width=225
textbox_height=85
//border=4
}
//80

line_sep=12
line_width = textbox_width - border*2
txtb_image=0
txtb_image_spd= sprite_get_speed(txtb_back_sprite)/30
txtb_image_speaker=0
txtb_image_spd_speaker= 0
animation=0
txty=150
//150
tb_back=noone

//O texto
page = 0
can_superskip=0

text_length[0]= string_length(text[0])
old_draw_char=0
char[0,0]=""
draw_set_valign(fa_top)
draw_set_halign(fa_left)
char_x[0,0]=0
char_y[0,0]=0
draw_char=0
cool_draw_char=0
made_sound=0
setup = false

//sounds
snd_delay[0]=4
snd_count = snd_delay[0]

//options
option_link_id[0]=-1
option_pos=-1
option_wait_input=1
option_alpha=0
option_rot=irandom(360)
//efeitos
last_free_space=0
text_pause_timer = 0
//LEMBRA DO R
text_pause_time = 0 //diz quanto tempo demora a pausa, pode mudar o valor padrão no desenho
//14

camerax= camera_get_view_x(view_camera[0])
cameray= camera_get_view_y(view_camera[0])
cool_type_long_text=global.cool_type_long_text
cool_type_inv_text=global.cool_type_inv_text
inv_mode=0
_cool_type_inv_text_manger=0
sfx_play=0