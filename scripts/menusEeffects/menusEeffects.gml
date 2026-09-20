function screen_shake(_length, _time){
	with(ocamera){
		shake_length= _length
		shake_time= _time
		alarm[0]= shake_time
	}
}

function party_show_mode(_a){
if instance_exists(oMenu_health){oMenu_health.mode=_a}
}

function key_change_adjust_name(_name, _number){
					if _name=vk_right {status[_number]="Right"} else
					if _name=vk_left {status[_number]="Left"} else
					if _name=vk_up {status[_number]="Up"} else
					if _name=vk_down {status[_number]="Down"} else
					if _name=vk_lalt {status[_number]="Alt"} else
					if _name=vk_backspace {status[_number]="Back"} else
					if _name=vk_lcontrol {status[_number]="Ctrl"} else
					if _name=vk_control {status[_number]="Ctrl"} else
					if _name=vk_space {status[_number]="Space"} else
					if _name=vk_enter {status[_number]="Enter"} else
					if _name=vk_tab {status[_number]="Tab"} else
					if _name=vk_shift {status[_number]="Shift"} else {status[_number]=chr(_name)}
}