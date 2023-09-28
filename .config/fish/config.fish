if status is-interactive
  # Commands to run in interactive sessions can go here
  export PATH="$HOME/.cargo/bin:$PATH"

  # fish_ssh_agent
  begin
    set -lx SHELL $__fish_bin_dir/fish
    eval (keychain --eval --agents ssh -Q --quiet ~/.ssh/github_sticky --nogui --noask)
  end
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/miniconda3/bin/conda
    eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

