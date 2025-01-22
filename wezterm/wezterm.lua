local wezterm = require("wezterm")
local constants = require("constants")
local config = {
	force_reverse_video_cursor = true,
	colors = {
		foreground = "#dcd7ba",
		background = "#181616",

		cursor_bg = "#c8c093",
		cursor_fg = "#c8c093",
		cursor_border = "#c8c093",

		selection_fg = "#c8c093",
		selection_bg = "#2d4f67",

		scrollbar_thumb = "#16161d",
		split = "#16161d",

		ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
		brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
		indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
	},
}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Font setttings
config.font_size = 16
config.line_height = 1
config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font",
	"FiraCode Nerd Font Mono",
	"Ubuntu Mono",
})

-- Colors
config.colors = {}
config.colors.foreground = "#dcd7ba"
config.colors.background = "#181616"
config.colors.cursor_bg = "#c8c093"
config.colors.cursor_fg = "#c8c093"
config.colors.cursor_border = "#c8c093"
config.colors.selection_fg = "#c8c093"
config.colors.selection_bg = "#2d4f67"
config.colors.scrollbar_thumb = "#16161d"
config.colors.split = "#16161d"
config.colors.ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" }
config.colors.brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" }
config.colors.indexed = { [16] = "#ffa066", [17] = "#ff5d62" }
config.window_background_opacity = 0.95

-- Appearance
config.window_background_image = constants.bg_image
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Miscellaneous settings
config.max_fps = 165
config.prefer_egl = true
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.freetype_load_flags = "NO_HINTING"
config.font_shaper = "Harfbuzz"
config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"
config.window_background_opacity = 1
config.window_background_image_hsb = {
	brightness = 0.01, -- Reduce el brillo para oscurecer el fondo (valor entre 0.0 y 1.0)
	hue = 1, -- Ajusta el tono (hue), déjalo en 1.0 si no quieres cambiarlo
	saturation = 1, -- Ajusta la saturación; reduce si quieres colores más apagados
}
config.text_background_opacity = 1
return config
