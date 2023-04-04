#function fish_prompt
#    eval ~/go/bin/powerline-go -error $status -shell bare -modules "terraform-workspace,venv,cwd,perms,git,hg,jobs,exit,root"
#end

set -gx PATH ~/.rbenv/bin $PATH
fzf_configure_bindings --variables=\e\cv
