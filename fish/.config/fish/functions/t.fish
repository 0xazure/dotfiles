function t
	tree -I '.git|node_modules|vendor|.DS_Store' --dirsfirst --filelimit 15 -L 1 -aC $1
end
