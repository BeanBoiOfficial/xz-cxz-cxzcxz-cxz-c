dark = surface_create(room_width,room_height)
surface_set_target(dark)
draw_clear_alpha(c_black,0.9)
surface_reset_target()

camera = view_camera[0]