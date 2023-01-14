function ColourMyPencils(colour)
	colour = colour or "onedark"
	vim.cmd.colorscheme(colour)
end

ColourMyPencils()
