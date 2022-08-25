if status is-interactive
  # Commands to run in interactive sessions can go here
  export PATH="$HOME/.cargo/bin:$PATH"

  # fish_ssh_agent
  begin
    set -lx SHELL $__fish_bin_dir/fish
    eval (keychain --eval --agents ssh -Q --quiet ~/.ssh/github_sticky --nogui --noask)
  end
end
