accept_key = keyboard_check_pressed( vk_space );

textbox_X = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-144;

//setup
if setup == false
{	
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop through the pages
	page_number = array_length(text);
	
	for(var p = 0; p < page_number; p++)
	{
		//find how many characters are on each page and store that number in the "text_length" array
	    text_length[p] = string_length(text[p]);
	
	   //get the x position for the textbox
	     //no character (center the textbox)
	    text_x_offset[p] = 44;
	}
}



//typing the text
if draw_char < text_length[page]
{
	draw_char += text_spd;
	draw_chr = clamp(draw_char, 0, text_length[page]);
}
	
	
//flip through pages
if accept_key
{
	//if the typing is done
	if draw_char == text_length[page]
	{
		//next page
		if page < page_number-1
		{
			page++;
			draw_char = 0;
		}
		
		//destroy textbox
		else
		{
			  instance_destroy();
		}
	}
	
	//if not done typing
	else
	{
		draw_char = text_length[page];
	}
}


//draw the texbox
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr);
txtb_spr_h = sprite_get_height(txtb_spr);
//back of textbox
draw_sprite_ext(txtb_spr, txtb_img, textbox_X + text_x_offset[page], textbox_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);


//draw the text
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(textbox_X + text_x_offset[page] + border_x, textbox_y + border_y, _drawtext, line_sep, line_width);