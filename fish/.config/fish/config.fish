if status --is-interactive
	abbr --add g git
	abbr --add ga git add
	abbr --add gc git commit
	abbr --add gco git checkout --branch
	abbr --add gco git checkout
	abbr --add gf git fetch origin
	abbr --add gfa git fetch --all
	abbr --add gfu git fetch upstream
	abbr --add gst git status
	abbr --add gra git rebase --abort
	abbr --add grc git rebase --continue

	abbr --add rot13 tr '[A-Za-z]' '[N-ZA-Mn-za-m]'

	if command --search --quiet exa
		abbr --add l exa
		abbr --add ls exa
		abbr --add ll exa -l
		abbr --add la exa -la
	else
		abbr --add l ls
		abbr --add ll ls -l
		abbr --add la ls -la
	end

	alias cat 'bat'
  alias du 'dust'

	set --export PATH /usr/local/bin ~/.cargo/bin /usr/bin /bin /usr/sbin /sbin

	starship init fish | source
end
