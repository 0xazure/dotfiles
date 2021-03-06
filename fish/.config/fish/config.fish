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
    alias isvg 'rsvg-convert | icat'

    set --export PATH "$HOME/.dotfiles/bin" /usr/local/bin ~/.cargo/bin /usr/bin /bin /usr/sbin /sbin

    set --export EDITOR nvim
    set --export VISUAL nvim

    set --local FISH_CONFIG_LOCAL (dirname (status -f))"/local.fish"
    if test -f $FISH_CONFIG_LOCAL
        source $FISH_CONFIG_LOCAL
    end

    set --local ASDF_PATH /usr/local/opt/asdf/asdf.fish
    if test -f $ASDF_PATH
        source $ASDF_PATH
    end

    starship init fish | source
end
