#function fish_prompt
#    eval ~/go/bin/powerline-go -error $status -shell bare -modules "terraform-workspace,venv,cwd,perms,git,hg,jobs,exit,root"
#end

set -gx PATH ~/.rbenv/bin $PATH
fzf_configure_bindings --variables=\e\cv

set -q KREW_ROOT; and set -gx PATH $PATH $KREW_ROOT/.krew/bin; or set -gx PATH $PATH $HOME/.krew/bin

oh-my-posh init fish --config ~/src/dotfiles/oh-my-posh.omp.json | source
