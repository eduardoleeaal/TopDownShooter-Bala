/// @description Insert description here
// You can write your code in this editor

// Variavel do timer do movimento
timer_movimento = room_speed * random_range(4, 10);
timer_troca_direcao = timer_movimento;
//Variavel de vida
vida_inimigo = 3;

//Distancia minima para o inimigo seguir o player
distancia_min = 200;

//Metodo para definir velocidade e direção
define_movimento = function(){
//Definindo a direção dele	
direction = irandom(359);
//Fazendo ele olhar para onde esta indo
image_angle = direction;
// Dando uma velocidade aleatoria
speed = irandom_range(1, 2);
}


define_movimento();

// Metodo para ficar na room

fica_room = function(){
	//Olhar para onde está indo
	image_angle = direction;
	
	
	// Impedindo que eles saiam da room
	if(x + sprite_width / 2 > room_width or x - sprite_width / 2 < 0) hspeed *= -1;

	if(y - sprite_height / 2 < 0 or y + sprite_height / 2 > room_height) vspeed *= -1;

}

mudar_direcao = function(){
	//Diminuir o timer
	timer_troca_direcao--;
		
	if(timer_troca_direcao <= 0){
		define_movimento();
	
		timer_troca_direcao = timer_movimento;
	}
}

//Fazendo o inimigo seguir o player se o player chegar muito perto
seguir_player = function(){
	if(instance_exists(obj_player)){
		
		var _dist = point_distance(x, y, obj_player.x, obj_player.y);
		
		if(_dist < distancia_min){
			//Indo na direção do player
			var _dir = point_direction(x, y, obj_player.x, obj_player.y);
			direction = _dir;
			//Usando uma velocidade padrão
			speed = 1;
		}
	}
}

//Metodo de tomar bala

levar_dano = function(){
	// Retorna o ID do tiro do player
	var _colisao = instance_place(x, y, obj_tiro_player);
	
	if(place_meeting(x, y, _colisao)){
		if(vida_inimigo > 1){
			instance_destroy(_colisao);
			vida_inimigo--;
		}
		else{
			instance_destroy();	
		}
	}
}

