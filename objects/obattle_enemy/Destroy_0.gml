play_enemie_sfx(sfx_enemies_deathnew_part1)
var _index_row=array_get_index(obattle_manager.row_entities[enemy_row],id)
array_delete(obattle_manager.row_entities[enemy_row],_index_row,1)
instance_create_depth(x,y,depth,oenemy_anim_die,{id_number: id_number, dying_sprite: dying_sprite})
obattle_manager.exp_gain_total+=exp_reward
