if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    # Aliases
    alias ip 'ip -c'
    alias ls lsd
    alias grep rg
    alias code codium
    alias vim nvim
    alias e nvim

    # Bindings
    bind '[3;5~' kill-word  # ctrl + supr: delete word to the right
end
