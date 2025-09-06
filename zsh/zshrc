lugins=(
	git
	zsh-pyenv
	docker
	docker-compose
	kubectl
	microk8s
  helm
)

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$PATH:$HOME/google-cloud-sdk/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export KUBECONFIG="$HOME/.kube/teleport"

alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin
source <(pulumi gen-completion zsh)
alias p="pulumi"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# local bin
export PATH=$PATH:$HOME/.local/bin

eval "$(starship init zsh)"

export PATH=$PATH:$HOME/.linkerd2/bin

export PATH=$HOME/.gloo/bin:$PATH

export STARSHIP_CONFIG="$HOME/.config/starship.toml"

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

eval "$(bw completion --shell zsh); compdef _bw bw;"

export PATH="$PATH:/opt/mssql-tools/bin"

fpath=($HOME/.oh-my-zsh/custom/completions $HOME/.oh-my-zsh/custom/completions $HOME/.oh-my-zsh/custom/completions $HOME/.oh-my-zsh/plugins/helm $HOME/.oh-my-zsh/plugins/microk8s $HOME/.oh-my-zsh/plugins/kubectl $HOME/.oh-my-zsh/plugins/docker-compose $HOME/.oh-my-zsh/plugins/docker $HOME/.oh-my-zsh/custom/plugins/zsh-pyenv $HOME/.oh-my-zsh/plugins/git $HOME/.oh-my-zsh/functions $HOME/.oh-my-zsh/completions $HOME/.oh-my-zsh/cache/completions /usr/local/share/zsh/site-functions /usr/share/zsh/vendor-functions /usr/share/zsh/vendor-completions /usr/share/zsh/functions/Calendar /usr/share/zsh/functions/Chpwd /usr/share/zsh/functions/Completion /usr/share/zsh/functions/Completion/AIX /usr/share/zsh/functions/Completion/BSD /usr/share/zsh/functions/Completion/Base /usr/share/zsh/functions/Completion/Cygwin /usr/share/zsh/functions/Completion/Darwin /usr/share/zsh/functions/Completion/Debian /usr/share/zsh/functions/Completion/Linux /usr/share/zsh/functions/Completion/Mandriva /usr/share/zsh/functions/Completion/Redhat /usr/share/zsh/functions/Completion/Solaris /usr/share/zsh/functions/Completion/Unix /usr/share/zsh/functions/Completion/X /usr/share/zsh/functions/Completion/Zsh /usr/share/zsh/functions/Completion/openSUSE /usr/share/zsh/functions/Exceptions /usr/share/zsh/functions/MIME /usr/share/zsh/functions/Math /usr/share/zsh/functions/Misc /usr/share/zsh/functions/Newuser /usr/share/zsh/functions/Prompts /usr/share/zsh/functions/TCP /usr/share/zsh/functions/VCS_Info /usr/share/zsh/functions/VCS_Info/Backends /usr/share/zsh/functions/Zftp /usr/share/zsh/functions/Zle)

autoload -Uz compinit && compinit -i

alias pbcopy='xclip -sel clip'
alias pbpaste='xclip -sel clip -o'

# Gatling
export GATLING_HOME=$HOME/.local/share/applications/gatling
export PATH="$PATH:$GATLING_HOME/bin"

# Jetbrain
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
export PATH="$HOME/.gvm/go/bin:$PATH"

# alias docker=podman

export EDITOR=nvim

export PATH="$PATH:$HOME/.local/share/scalapbc/bin"

