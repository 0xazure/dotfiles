function idot
	set color "#c5c8c6"
	set font_family "Fira Code"
	set font_size 8.50

	dot \
	-Tsvg \
	-Gbgcolor=transparent \
	-Ecolor=$color \
	-Efontcolor=$color \
	-Efontname=$font_family \
	-Efontsize=$font_size \
	-Ncolor=$color \
	-Nfontcolor=$color \
	-Nfontname=$font_family \
	-Nfontsize=$font_size \
	$argv \
	| rsvg-convert \
    | icat
end
