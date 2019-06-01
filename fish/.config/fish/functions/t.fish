function t
	tree -I '.git|node_modules|vendor|.DS_Store' --dirsfirst --filelimit 20 -L 1 -aC $argv[1]
end
