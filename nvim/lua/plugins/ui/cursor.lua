return {
	"sphamba/smear-cursor.nvim",

	opts = {
		smear_between_buffers = true,
		smear_between_neighbor_lines = true,
		scroll_buffer_space = true, -- draw smear in buffer space instead of screen space when scrolling
		smear_insert_mode = true, -- smear in insert mode

		stiffness = 0.7, -- faster smear, default: 0.6
		distance_stop_animating = 0.2, -- faster smear, default: 0.1, max: 1, increase to 0.5
	}
}
