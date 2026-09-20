draw_self()

draw_text(x+20,y-32,global.party_length)
for(var i=0;i<global.party_length;i++){
		///desenhar o sprite
		draw_text(x+20,(y-20)+12*i,global.party_members[i].name)
}