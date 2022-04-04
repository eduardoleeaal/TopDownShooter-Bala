/// @description Insert description here
// You can write your code in this editor

velocidade	= 4;
vspd		= 0;
hspd		= 0;
vel_tiro	= 10;

espera_tiro = 0;
demora_tiro = room_speed * 0.2;

movimento = function(){
	var up, down, left, right;
	
	// Pegando os inputs
	up = keyboard_check(ord("W"));
	down = keyboard_check(ord("S"));
	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));
	
	// Checando 
	vspd = (down - up);
	hspd = (right - left);
	// Dando uma velocidade
	y += vspd * velocidade;
	x += hspd * velocidade;
	
	// Arrumando a animação
	if(vspd != 0 || hspd != 0){
		image_speed = 1;
	}
		else{
			image_speed = 0;
		}
}

atirando = function(){
	
	// Pegando a direção do player
	var _dir = point_direction(x, y, mouse_x, mouse_y);
	image_angle = _dir;
	
	
	// Criando o tiro
	//Checando se o player ta apertando o botão esquerdo do mouse
	var _mouse_click = mouse_check_button(mb_left);
	
	if(espera_tiro <= 0){
		if(_mouse_click){
			var _tiro = instance_create_layer(x, y, "Tiros", obj_tiro_player);
			_tiro.direction = _dir;
			_tiro.speed = vel_tiro;
			//Dando um tempo para atirar
			espera_tiro = demora_tiro;
			
		}
	}
	else{//Se eu ainda não posso atirar
		//Eu diminui a espera até poder
		espera_tiro--;
		
	}
	
	//Colocando a sprite de atirar se ele estiver atirando
	if(mouse_check_button(mb_left)) sprite_index = spr_player_atirando;
	if(mouse_check_button_released(mb_left)) sprite_index = spr_player_andando;
	
}
