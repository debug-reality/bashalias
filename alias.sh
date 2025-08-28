# Usage: source <(curl -L https://jtyr.io/source/kubectl)

TOOLS_DIR="${TOOLS_DIR:-/tmp/tools}"
TOOLS_BIN_DIR="$TOOLS_DIR/bin"

function get_goyq() {
    YQ="$TOOLS_BIN_DIR/yq"
    YQ_VERSION='4.30.4'

    if [[ -e $YQ ]]; then
        return
    fi

    curl -fSL -o "$YQ" "https://github.com/mikefarah/yq/releases/download/v$YQ_VERSION/yq_linux_amd64"
    chmod +x "$YQ"
}

function get_gojq() {
    GOJQ="$TOOLS_BIN_DIR/gojq"
    GOJQ_VERSION='0.12.9'

    if [[ -e $GOJQ ]]; then
        return
    fi

    curl -fSL -o - "https://github.com/itchyny/gojq/releases/download/v$GOJQ_VERSION/gojq_v${GOJQ_VERSION}_linux_amd64.tar.gz" | tar xzf - -C "$TOOLS_DIR" gojq_v${GOJQ_VERSION}_linux_amd64/gojq
    mv "$TOOLS_DIR/gojq_v${GOJQ_VERSION}_linux_amd64/gojq" "$TOOLS_BIN_DIR"
    rm -fr "$TOOLS_DIR/gojq_v${GOJQ_VERSION}_linux_amd64"
}

function get_kubecolor() {
    KUBECOLOR="$TOOLS_BIN_DIR/kubecolor"
    KUBECOLOR_VERSION='0.0.21'

    if [[ -e $KUBECOLOR ]]; then
        return
    fi

    curl -fSL -o - "https://github.com/kubecolor/kubecolor/releases/download/v$KUBECOLOR_VERSION/kubecolor_${KUBECOLOR_VERSION}_Linux_x86_64.tar.gz" | tar xzf - -C "$TOOLS_BIN_DIR" kubecolor
}

function get_tools() {
    mkdir -p "$TOOLS_BIN_DIR"

    if [[ ${PATH:0:${#TOOLS_BIN_DIR}} != "$TOOLS_BIN_DIR" ]]; then
        export PATH="$TOOLS_BIN_DIR:$PATH"
    fi

    get_goyq
    get_gojq
    get_kubecolor
}

function set_ps1() {
    PS1='($(kubectl config get-contexts --no-headers | awk "function n(x) {return x==\"\"?\"default\":x} \\$1 == \"*\" {print(\"\[\033[01;33m\]\"\\$2\"\[\033[00m\]/\[\033[01;36m\]\"n(\\$5)\"\[\033[00m\]\")}")) \u@\h \[\033[01;34m\]\w\[\033[00m\] \[\033[01;32m\]\$\[\033[00m\] '
}

function config_vim() {
    cat <<END > ~/.vimrc
set paste
set pastetoggle=<F4>
set tabstop=2
set shiftwidth=2
set expandtab
END
}

function config_tmux() {
    cat <<END > ~/.tmux.conf
unbind-key C-b
set-option -g prefix C-a
bind-key C-a send-prefix
#set -g mouse on
END
}

if [[ -n $KUBECOLOR ]] && [[ -e $KUBECOLOR ]]; then
    alias k='kubecolor'
else
    alias k='kubectl'
fi

# Create, Apply, Run, Replace
alias krun='k run'
alias krund='k run --dry-run=client -o yaml'
alias kc='k create'
alias kcd='k create --dry-run=client -o yaml'
alias ka='k apply'
alias kaf='k apply -f'
# Force replace rersources
alias krff='k replace --force -f'

# Get
alias kg='k get'
alias kgy='kgy_f() { k get -o yaml "$@" | cy; }; kgy_f'
alias kgyy='kgyy_f() { k get -o yaml "$@" | yq e -; }; kgyy_f'
alias kga='k get all'
alias kgp='k get pod'
alias kgpy='kgpy_f() { k get pod -o yaml "$@" | cy; }; kgpy_f'
alias kgpyy='kgpyy_f() { k get pod -o yaml "$@" | yq e -; }; kgpyy_f'
alias kgj='k get job'
alias kgjy='kgjy_f() { k get job -o yaml "$@" | cy; }; kgjy_f'
alias kgjyy='kgjyy_f() { k get job -o yaml "$@" | yq e -; }; kgjyy_f'
alias kgcj='k get cronjob'
alias kgcjy='kgcjy_f() { k get cronjob -o yaml "$@" | cy; }; kgcjy_f'
alias kgcjyy='kgcjyy_f() { k get cronjob -o yaml "$@" | yq e -; }; kgcjyy_f'
alias kgs='k get svc'
alias kgsy='kgsy_f() { k get svc -o yaml "$@" | cy; }; kgsy_f'
alias kgsyy='kgsyy_f() { k get svc -o yaml "$@" | yq e -; }; kgsyy_f'
alias kgd='k get deployment'
alias kgdy='kgdy_f() { k get deployment -o yaml "$@" | cy; }; kgdy_f'
alias kgdyy='kgdyy_f() { k get deployment -o yaml "$@" | yq e -; }; kgdyy_f'
alias kgn='k get node'
alias kgny='kgny_f() { k get node -o yaml "$@" | cy; }; kgny_f'
alias kgnyy='kgnyy_f() { k get node -o yaml "$@" | yq e -; }; kgnyy_f'
alias kgns='k get ns'
alias kgnsy='kgnsy_f() { k get ns -o yaml "$@" | cy; }; kgnsy_f'
alias kgnsyy='kgnsyy_f() { k get ns -o yaml "$@" | yq e -; }; kgnsyy_f'
alias kgi='k get ingress'
alias kgiy='kgiy_f() { k get ingress -o yaml "$@" | cy; }; kgiy_f'
alias kgiyy='kgiyy_f() { k get ingress -o yaml "$@" | yq e -; }; kgiyy_f'
alias kgsec='k get secret'
alias kgsecy='kgsecy_f() { k get secret -o yaml "$@" | cy; }; kgsecy_f'
alias kgsecyy='kgsecyy_f() { k get secret -o yaml "$@" | yq e -; }; kgsecyy_f'
alias kgpv='k get pv'
alias kgpvy='kgpvy_f() { k get pv -o yaml "$@" | cy; }; kgpvy_f'
alias kgpvyy='kgpvyy_f() { k get pv -o yaml "$@" | yq e -; }; kgpvyy_f'
alias kgpvc='k get pvc'
alias kgpvcy='kgpvcy_f() { k get pvc -o yaml "$@" | cy; }; kgpvcy_f'
alias kgpvcyy='kgpvcyy_f() { k get pvc -o yaml "$@" | yq e -; }; kgpvcyy_f'
alias kgsc='k get sc'
alias kgscy='kgscy_f() { k get sc -o yaml "$@" | cy; }; kgscy_f'
alias kgscyy='kgscyy_f() { k get sc -o yaml "$@" | yq e -; }; kgscyy_f'

# Labels
alias kgl='kgl_f() { k get "$@" -o json | yq e '.metadata.labels' -; }; kgl_f'
alias kgpl='kgpl_f() { k get pod "$@" -o json | yq e '.metadata.labels' -; }; kgpl_f'
alias kgdl='kgdl_f() { k get deployment "$@" -o json | yq e '.metadata.labels' -; }; kgdl_f'

# Annotations
alias kgan='kgan_f() { k get "$@" -o json | yq e '.metadata.annotations' -; }; kgan_f'
alias kgpan='kgpan_f() { k get pod "$@" -o json | yq e '.metadata.annotations' -; }; kgpan_f'
alias kgdan='kgdan_f() { k get deployment "$@" -o json | yq e '.metadata.annotations' -; }; kgdan_f'

# Describe
alias kd='k describe'
alias kdp='k describe pod'
alias kdj='k describe job'
alias kdcj='k describe cronjob'
alias kdd='k describe deployment'
alias kds='k describe svc'
alias kdn='k describe node'
alias kdns='k describe namespace'
alias kdi='k describe ingress'
alias kdsec='k describe secret'
alias kdpv='k describe pv'
alias kdpvc='k describe pvc'
alias kdsc='k describe sc'

# Edit
alias ke='k edit'
alias kep='k edit pod'
alias kej='k edit job'
alias kecj='k edit cronjob'
alias ked='k edit deployment'
alias kes='k edit svc'
alias kens='k edit ns'
alias kei='k edit ingress'
alias kesec='k edit secret'

# Delete
alias kdel='k delete'
alias kdelf='k delete -f'
alias kdelp='k delete pod'
alias kdelj='k delete job'
alias kdelcj='k delete cronjob'
alias kdeld='k delete deployment'
alias kdels='k delete svc'
alias kdelns='k delete ns'
alias kdeli='k delete ingress'
alias kdelsec='k delete secret'
alias kdelsc='k delete sc'
alias kdelfin='k patch -p "{\"metadata\":{\"finalizers\":null}}" --type=merge'

# Expose
alias kex='k expose'
alias kexp='k expose pod'
alias kexd='k expose deploy'


# Other
alias kv='k version --short'

alias kar='k api-resources --sort-by name'

alias kac='k auth can-i'

alias ktn='k top node'
alias ktp='k top pod'


alias kexpl='k explain'
alias kexplr='k explain --recursive=true'


# Context and Namespace
alias kctx='k config use-context'
alias knsf='k config set-context --current --namespace'
alias kns='fn(){ k get ns --field-selector "metadata.name=$1" --ignore-not-found --no-headers | grep -E "^.+$" 1>/dev/null && k config set-context --current --namespace $1 || echo "No namespace \"$1\" found." && return 1;  unset -f fn; }; fn'

# Alias to display current context and namespace
# alias ctxns='echo "Context: $(k config current-context), Namespace: $(k config view --minify --output 'jsonpath={..namespace}')"'

alias kx='k exec'
alias kl='k logs'
alias klf='k logs -f'

alias kshell='k shell'
alias kgansr='k api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found'
alias cleanyaml="yq e '"'del(.. | select(tag == "!!map") | (.status, .creationTimestamp, .generation, .selfLink, .uid, .resourceVersion, .managedFields, ."kubectl.kubernetes.io/last-applied-configuration"))'"' -"
alias cleanjson="gojq '"'del(.. | select(. == "" or . == null)) | walk(if type == "object" then del(.status, .creationTimestamp, .generation, .selfLink, .uid, .resourceVersion, .managedFields, ."kubectl.kubernetes.io/last-applied-configuration") else . end) | del(.. | select(. == {}))'"'"
alias cy='cleanyaml'
alias cyy="cleanyaml | yq e '"'del(.. | select((. == "" and tag == "!!str") or tag == "!!null")) | del(... | select(tag == "!!map" and length == 0))'"' -"
alias cj='cleanjson'

# Enable kubectl completion for k and all k* aliases
# if command -v kubectl &> /dev/null; then
#     source <(kubectl completion bash)
#     if [ $? -eq 0 ]; then
#         # completion for k alias
#         complete -F __start_kubectl k
        
#         # completion for all k aliases
#         for alias_name in $(alias | awk -F'[ =]' '/^alias k/{print $2}'); do
#             complete -F __start_kubectl "$alias_name" 2>/dev/null
#         done
#     fi
# fi

# Enable kubectl completion for k and all k* aliases
# if command -v kubectl &>/dev/null; then
#   source <(kubectl completion bash)
#   complete -F __start_kubectl k
#   # Enable for all k* aliases that are kubectl wrappers
#   for aliasname in kg kgp kgpy kgj kgjy kgs kgsy kgd kgdy kgn kgny kgns kgi kgiy kgsec kgsecy kgpv kgpvc kgsc \
#     kgy kgyy kga kgpyy kgjyy kgsyy kgdyy kgnyy kgnsy kgnsyy kgiyy kgsecyy kgpvcy kgpvcyy kgscy kgscyy \
#     kcd ka kaf krun krund kc kdel kdelf kdelp kdelj kdeld kdels kdelns kdeli kdelsec kdelfin \
#     kdp kdj kdd kds kdn kdns kdi kdsec kdpv kdpvc kdsc ke kep kej ked kes kens kei kesec \
#     kx kl klf kshell kgansr kctx knsf kns; do
#     complete -F __start_kubectl $aliasname 2>/dev/null
#   done
# fi

complete -o default -F __start_kubectl kgns

# Helm aliasses
alias h='helm'
alias hin='helm install'
alias hind='helm install --dry-run --debug'
# Upgrade or Install
alias hup='helm upgrade --install'
alias hupd='helm upgrade --install --dry-run --debug'
alias hun='helm uninstall'
# Helm releases
alias hl='helm list'
alias hla='helm list -a'
# Helm repos
alias hrl='helm repo list'
alias hru='helm repo update'
# helm template
alias ht='helm template'

# Docker build
alias dob='docker build'
alias dobt='docker build -t'
alias dormi='docker rmi'
alias dops='docker ps'
alias dopsa='docker ps -a'
alias dopush='docker push'
alias dopull='docker pull'

# Podman
alias pmb='podman build'
alias pmbt='podman build -t'
alias pmrmi='podman rmi'
alias pmps='podman ps'
alias pmpsa='podman ps -a'
alias pmpush='podman push'
alias pmpull='podman pull'

# Run prompt and vim config setup automatically
set_ps1
config_vim
