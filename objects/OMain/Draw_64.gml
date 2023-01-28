var _windowWidth = window_get_width();
var _windowHeight = window_get_height();
var _halign = draw_get_halign();

draw_set_halign(fa_center);
draw_text(_windowWidth / 2, 8, score);
draw_set_halign(_halign);

draw_text(8, 8, hp);
