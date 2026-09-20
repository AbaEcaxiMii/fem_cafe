///pause
pausado = false;
sprite_pause = -1;
msg_i=0
function msg_pause(_text)
{
	msg[msg_i]=_text msg_i++
}
msg_pause("Aproveita pra tomar agua")
msg_pause("Todos precisam de um intervalo")
msg_pause("Você tá usando isso numa speedrun?")
msg_pause("Eu gosto de Mexirica")
msg_pause("[Text not found]")
msg_pause("Também jogue Ekorella")
msg_pause("Aperte ESC para sair do jogo\nF3 para reiniciar") //checar se funciona essa mensagem
msg_pause("Fazer essas mensagens é estramente divertido")
msg_pause("Vai olhar um guia né?")
msg_pause("O streamer já vai voltar, só espera")
msg_pause("Não tenha pressa, eu tenho o dia todo")
msg_pause("Quando eu to escrevendo isso faz 2 semans que lançou o cap5") //não tira
msg_pause("Pausar não vai resolver os seus problemas, só atrasa-los")
msg_pause("Eu suporto o meu trabalho")
msg_pause("Todos tem voz, mas poucos ditam a verdade")
msg_pause("Recy, o verdadeiro nome")
msg_pause("O miojo tá pronto")
msg_pause("Sinto que está esquecendo alguma coisa")
msg_pause("UuUuUuUuU! Olha a [Mensagem assustadora] ai ai ai, que medinho~")
msg_pause("O custo de escapar a morte é sacrificar todo o prazer da vida")
msg_pause("endoftext")
msg_pause("")
msg_l=array_length(msg)

room_warp_activation=0
room_warp_array=array_create(0)
room_select=0
array_push(room_warp_array,Rtestroom)
array_push(room_warp_array,Rteste_undertale_box)
array_push(room_warp_array,Rloja)
array_push(room_warp_array,Rsave)
