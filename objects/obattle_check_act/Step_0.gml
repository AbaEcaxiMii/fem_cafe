right_key = keyboard_check(global.right)
left_key = keyboard_check(global.left)
up_key = keyboard_check(global.up)
down_key = keyboard_check(global.down)
confirmar_key = keyboard_check(global.confirmar)
cancelar_key = keyboard_check_pressed(global.cancelar)
angle+=1
var _x=x+(right_key - left_key)*4
var _y=y+(down_key-up_key)*4
_x=clamp(_x,camera_get_view_x(view_camera[0]),camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]))
_y=clamp(_y,camera_get_view_y(view_camera[0]),camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0]))
x=_x
y=_y
if cancelar_key{ delete_me=1}
if delete_me{if timer_delete--<=0{instance_destroy() change_info_text(,3)}}

if instance_place(x,y,obattle_enemy)!=noone and !confirmar_key{enemy_to_check=instance_place(x,y,obattle_enemy)}



