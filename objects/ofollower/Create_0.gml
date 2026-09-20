image_alpha = 0

follower_skin(global.party_members[number].id_number)

//create
// Defina as variáveis iniciais
target_x = 0;  // Coordenada X do ponto B
target_y = 0;  // Coordenada Y do ponto B
acceleration = 6;  // Aceleração
max_speed = acceleration+2;  // Velocidade máxima
deceleration_distance = 10;  // Distância a partir de que o objeto começa a desacelerar

// Inicialize a velocidade
speed_x = 0;
speed_y = 0;

x=oPlayer.pos_x[record]
y=oPlayer.pos_y[record]