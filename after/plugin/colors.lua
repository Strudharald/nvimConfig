function ColorMyPencils(color)
	--color = color or "kanagawa-wave"
	color = color or "gruvbox"
    vim.o.background = "dark"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0,"Normal",{bg="none"})
	vim.api.nvim_set_hl(0,"NormalFloat",{bg="none"})
end
ColorMyPencils()
