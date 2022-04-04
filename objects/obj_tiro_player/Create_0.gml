/// @description Insert description here
// You can write your code in this editor

//Timer do tiro
timer_tiro = room_speed * 6;

destruir_tiro_saiu_da_tela = function(){
	
	//Destruindo o tiro após 6 segundos
	if(timer_tiro >= 0){
		timer_tiro--;
	}
	else{
		instance_destroy();
	}
}



//Iniciando grande
image_xscale = 2;
image_yscale = image_xscale;


//Metodo para voltar o tiro pro tamanho normal

efeito_tamanho = function(){
	image_xscale = lerp(image_xscale, 1, 0.25);
	image_yscale = image_xscale;
}


//Metedo do efeito e desenho
efeito_tiro = function(){
	//Me desenhando
	draw_self();
	
	//Mudando o blend mode
	gpu_set_blendmode(bm_add);
	//Desenhando a sprite do efeito
	draw_sprite_ext(spr_brilho_tiro_player, 0, x, y, image_xscale * 1.1, image_yscale * 1.1, image_angle, c_red, 0.7);
	
	// Resetando o mode
	gpu_set_blendmode(bm_normal);
}

