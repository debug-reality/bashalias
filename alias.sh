# Usage: source <(curl -L https://tinyurl.com/k8salias)
# Usage: source <(curl -L https://bit.ly/kbash)
# Manitainer: Sandeep B Hulyalkar

alias k='kubectl'

# Run
alias krp='k run'
alias krpns='k run -n'
alias krpdry='k run --dry-run=client -o yaml'
alias krpdryns='k run --dry-run=client -o yaml -n'

# Create
alias kc='k create'
alias kcdry='k create --dry-run=client -o yaml'
alias kcns='k create ns'
alias kcd='k create deployment'
alias kcdns='k create deployment -n'
alias kcddry='k create deployment --dry-run=client -o yaml'
alias kcddryns='k create deployment --dry-run=client -o yaml -n'
alias kcj='k create job'
alias kcjns='k create job -n'
alias kcjdry='k create job --dry-run=client -o yaml'
alias kcjdryns='k create job --dry-run=client -o yaml -n'
alias kccj='k create cronjob'
alias kccjns='k create cronjob -n'
alias kcjdry='k create cronjob --dry-run=client -o yaml'
alias kcjdryns='k create cronjob --dry-run=client -o yaml -n'
alias kcsa='k create sa'
alias kcsans='k create sa -n'
alias kcsadry='k create sa --dry-run=client -o yaml'
alias kcsadryns='k create sa --dry-run=client -o yaml -n'
alias kccm='k create cm'
alias kccmns='k create cm -n'
alias kccmdry='k create cm --dry-run=client -o yaml'
alias kccmdryns='k create cm --dry-run=client -o yaml -n'

# Apply
alias ka='k apply'
alias kaf='k apply -f'

# Replace
alias kreff='k replace --force -f'

# Config, Context and Namespace
alias kcf='k config'
alias kcfgc='k config get-contexts'
alias kcfcc='k config current-context'
alias kcfuc='k config use-context'
alias kctx='k config use-context'
alias knsf='k config set-context --current --namespace'
alias kns='fn(){ k get ns --field-selector "metadata.name=$1" --ignore-not-found --no-headers | grep -E "^.+$" 1>/dev/null && k config set-context --current --namespace $1 || echo "No namespace \"$1\" found." && return 1;  unset -f fn; }; fn'

# Alias to display current context and namespace
# alias ctxns='echo "Context: $(k config current-context), Namespace: $(k config view --minify --output 'jsonpath={..namespace}')"'

# Get
alias kg='k get'
alias kgy='kgy_f() { k get -o yaml "$@" | cy; }; kgy_f'
alias kgyy='kgyy_f() { k get -o yaml "$@" | yq e -; }; kgyy_f'
alias kga='k get all'
# Pod
alias kgp='k get pod'
alias kgpw='k get pod -w'
alias kgpns='k get pod -n'
alias kgpnsw='k get pod -w -n'
alias kgpa='k get pod -A'
alias kgpaw='k get pod -w -A'
alias kgpy='kgpy_f() { k get pod -o yaml "$@" | cy; }; kgpy_f'
alias kgpyy='kgpyy_f() { k get pod -o yaml "$@" | yq e -; }; kgpyy_f'
# job
alias kgj='k get job'
alias kgjw='k get job -w'
alias kgjns='k get job -n'
alias kgjnsw='k get job -w -n'
alias kgja='k get job -A'
alias kgjaw='k get job -w -A'
alias kgjy='kgjy_f() { k get job -o yaml "$@" | cy; }; kgjy_f'
alias kgjyy='kgjyy_f() { k get job -o yaml "$@" | yq e -; }; kgjyy_f'
# cronjob
alias kgcj='k get cronjob'
alias kgcjw='k get cronjob -w'
alias kgcjns='k get cronjob -n'
alias kgcjnsw='k get cronjob -w -n'
alias kgcja='k get cronjob -A'
alias kgcjaw='k get cronjob -w -A'
alias kgcjy='kgcjy_f() { k get cronjob -o yaml "$@" | cy; }; kgcjy_f'
alias kgcjyy='kgcjyy_f() { k get cronjob -o yaml "$@" | yq e -; }; kgcjyy_f'
# service
alias kgsvc='k get svc'
alias kgsvcns='k get svc -n'
alias kgsvca='k get svc -A'
alias kgsvcy='kgsy_f() { k get svc -o yaml "$@" | cy; }; kgsy_f'
alias kgsvcyy='kgsyy_f() { k get svc -o yaml "$@" | yq e -; }; kgsyy_f'
# deployment
alias kgd='k get deployment'
alias kgdw='k get deployment -w'
alias kgdns='k get deployment -n'
alias kgdnsw='k get deployment -w -n'
alias kgda='k get deployment -A'
alias kgdaw='k get deployment -w -A'
alias kgdy='kgdy_f() { k get deployment -o yaml "$@" | cy; }; kgdy_f'
alias kgdyy='kgdyy_f() { k get deployment -o yaml "$@" | yq e -; }; kgdyy_f'
# node
alias kgn='k get node'
alias kgny='kgny_f() { k get node -o yaml "$@" | cy; }; kgny_f'
alias kgnyy='kgnyy_f() { k get node -o yaml "$@" | yq e -; }; kgnyy_f'
# namespace
alias kgns='k get ns'
alias kgnsy='kgnsy_f() { k get ns -o yaml "$@" | cy; }; kgnsy_f'
alias kgnsyy='kgnsyy_f() { k get ns -o yaml "$@" | yq e -; }; kgnsyy_f'
# ingress
alias kging='k get ingress'
alias kgingns='k get ingress -n'
alias kginga='k get ingress -A'
alias kgingy='kgiy_f() { k get ingress -o yaml "$@" | cy; }; kgiy_f'
alias kgingyy='kgiyy_f() { k get ingress -o yaml "$@" | yq e -; }; kgiyy_f'
# secret
alias kgsec='k get secret'
alias kgsecns='k get secret -n'
alias kgseca='k get secret -A'
alias kgsecy='kgsecy_f() { k get secret -o yaml "$@" | cy; }; kgsecy_f'
alias kgsecyy='kgsecyy_f() { k get secret -o yaml "$@" | yq e -; }; kgsecyy_f'
# pv
alias kgpv='k get pv'
alias kgpvy='kgpvy_f() { k get pv -o yaml "$@" | cy; }; kgpvy_f'
alias kgpvyy='kgpvyy_f() { k get pv -o yaml "$@" | yq e -; }; kgpvyy_f'
# pvc
alias kgpvc='k get pvc'
alias kgpvcns='k get pvc -n'
alias kgpvca='k get pvc -A'
alias kgpvcy='kgpvcy_f() { k get pvc -o yaml "$@" | cy; }; kgpvcy_f'
alias kgpvcyy='kgpvcyy_f() { k get pvc -o yaml "$@" | yq e -; }; kgpvcyy_f'
# sc
alias kgsc='k get sc'
alias kgscy='kgscy_f() { k get sc -o yaml "$@" | cy; }; kgscy_f'
alias kgscyy='kgscyy_f() { k get sc -o yaml "$@" | yq e -; }; kgscyy_f'
# role
alias kgr='k get role'
alias kgrns='k get role -n'
alias kgra='k get role -A'
alias kgry='kgry_f() { k get role -o yaml "$@" | cy; }; kgry_f'
alias kgryy='kgryy_f() { k get role -o yaml "$@" | yq e -; }; kgryy_f'
# rolebinding
alias kgrb='k get rolebinding'
alias kgrbns='k get rolebinding -n'
alias kgrba='k get rolebinding -A'
alias kgrby='kgrby_f() { k get rolebinding -o yaml "$@" | cy; }; kgrby_f'
alias kgrbyy='kgrbyy_f() { k get rolebinding -o yaml "$@" | yq e -; }; kgrbyy_f'
# clusterrole
alias kgcr='k get clusterrole'
alias kgcry='kgcry_f() { k get clusterrole -o yaml "$@" | cy; }; kgcry_f'
alias kgcryy='kgcryy_f() { k get clusterrole -o yaml "$@" | yq e -; }; kgcryy_f'
# clusterrolebinding
alias kgcrb='k get clusterrolebinding'
alias kgcrby='kgcrby_f() { k get clusterrolebinding -o yaml "$@" | cy; }; kgcrby_f'
alias kgcrbyy='kgcrbyy_f() { k get clusterrolebinding -o yaml "$@" | yq e -; }; kgcrbyy_f'
# configmap
alias kgcm='k get cm'
alias kgcmns='k get cm -n'
alias kgcma='k get cm -A'
alias kgcmy='kgcmy_f() { k get cm -o yaml "$@" | cy; }; kgcmy_f'
alias kgcmyy='kgcmyy_f() { k get cm -o yaml "$@" | yq e -; }; kgcmyy_f'
# Network policy
alias kgnp='k get netpol'
alias kgnpns='k get netpol -n'
alias kgnpa='k get netpol -A'
alias kgnpy='kgnpy_f() { k get netpol -o yaml "$@" | cy; }; kgnpy_f'
alias kgnpyy='kgnpyy_f() { k get netpol -o yaml "$@" | yq e -; }; kgnpyy_f'
# limit range
alias kglr='k get limits'
alias kglry='kglry_f() { k get limits -o yaml "$@" | cy; }; kglry_f'
alias kglryy='kglryy_f() { k get limits -o yaml "$@" | yq e -; }; kglryy_f'
# Resource quota
alias kgrq='k get quota'
alias kgrqy='kgrqy_f() { k get quota -o yaml "$@" | cy; }; kgrqy_f'
alias kgrqyy='kgrqyy_f() { k get quota -o yaml "$@" | yq e -; }; kgrqyy_f'
# Events
alias kge='k get events'
alias kgew='k get events -w'
alias kgens='k get events -n'
alias kgensw='k get events -w -n'


# Get Labels
alias kglb='kgl_f() { k get "$@" -o yaml | yq e '.metadata.labels' -; }; kgl_f'
alias kgplb='kgpl_f() { k get pod "$@" -o yaml | yq e '.metadata.labels' -; }; kgpl_f'
alias kgdlb='kgdl_f() { k get deployment "$@" -o yaml | yq e '.metadata.labels' -; }; kgdl_f'
# Label
alias klb='k label'
alias klbp='k label pod'
alias klbpns='k label pod -n'
alias klbd='k label deployment'
alias klbdns='k label deployment -n'
alias klbns='k label ns'


# Annotations
alias kgan='kgan_f() { k get "$@" -o yaml | yq e '.metadata.annotations' -; }; kgan_f'
alias kgpan='kgpan_f() { k get pod "$@" -o yaml | yq e '.metadata.annotations' -; }; kgpan_f'
alias kgdan='kgdan_f() { k get deployment "$@" -o yaml | yq e '.metadata.annotations' -; }; kgdan_f'

# Describe
alias kd='k describe'
alias kdp='k describe pod'
alias kdpns='k describe pod -n'
alias kdj='k describe job'
alias kdjns='k describe job -n'
alias kdcj='k describe cronjob'
alias kdcjns='k describe cronjob -n'
alias kdsvc='k describe svc'
alias kdsvcns='k describe svc -n'
alias kdd='k describe deployment'
alias kddns='k describe deployment -n'
alias kdn='k describe node'
alias kdns='k describe namespace'
alias kding='k describe ingress'
alias kdingns='k describe ingress -n'
alias kdsec='k describe secret'
alias kdsecns='k describe secret -n'
alias kdpv='k describe pv'
alias kdpvc='k describe pvc'
alias kdpvcns='k describe pvc -n'
alias kdsc='k describe sc'
alias kdr='k describe role'
alias kdrns='k describe role -n'
alias kdrb='k describe rolebinding'
alias kdrbns='k describe rolebinding -n'
alias kdcr='k describe clusterrole'
alias kdcrb='k describe clusterrolebinding'
alias kdc='k describe cm'
alias kdcns='k describe cm -n'
alias kdnp='k describe netpol'
alias kdnpns='k describe netpol -n'
alias kdlr='k describe limits'
alias kdrq='k describe quota'


# Edit
alias ke='k edit'
alias kep='k edit pod'
alias kepns='k edit pod -n'
alias kej='k edit job'
alias kejns='k edit job -n'
alias kecj='k edit cronjob'
alias kecjns='k edit cronjob -n'
alias ked='k edit deployment'
alias kedns='k edit deployment -n'
alias kesvc='k edit svc'
alias kesvcns='k edit svc -n'
alias kens='k edit ns'
alias keing='k edit ingress'
alias keingns='k edit ingress -n'
alias kesec='k edit secret'
alias kesecns='k edit secret -n'
alias kesc='k edit sc'
alias kecr='k edit clusterrole'
alias kecrb='k edit clusterrolebinding'
alias kecm='k edit cm'
alias kecmns='k edit cm -n'
alias kenp='k edit netpol'
alias kenpns='k edit netpol -n'
alias kelr='k edit limits'
alias kerq='k edit quota'


# Delete
alias kdel='k delete'
alias kdelf='k delete -f'
alias kdelp='k delete pod'
alias kdelpns='k delete pod -n'
alias kdelj='k delete job'
alias kdeljns='k delete job -n'
alias kdelcj='k delete cronjob'
alias kdelcjns='k delete cronjob -n'
alias kdeld='k delete deployment'
alias kdeldns='k delete deployment -n'
alias kdelsvc='k delete svc'
alias kdelsvcns='k delete svc -n'
alias kdelns='k delete ns'
alias kdeling='k delete ingress'
alias kdelingns='k delete ingress -n'
alias kdelsec='k delete secret'
alias kdelsecns='k delete secret -n'
alias kdelsc='k delete sc'
alias kdelcr='k delete clusterrole'
alias kdelcrb='k delete clusterrolebinding'
alias kdelcm='k delete cm'
alias kdelcmns='k delete cm -n'
alias kdelnp='k delete netpol'
alias kdelnpns='k delete netpol -n'
alias kdellr='k delete limits'
alias kdelrq='k delete quota'

alias kdelfin='k patch -p "{\"metadata\":{\"finalizers\":null}}" --type=merge'

# Expose
alias kex='k expose'
alias kexp='k expose pod'
alias kexpns='k expose pod -n'
alias kexd='k expose deploy'
alias kexpdns='k expose deploy -n'


# Other
alias kv='k version --short'

alias kar='k api-resources --sort-by name'

alias kac='k auth can-i'

alias ktn='k top node'
alias ktp='k top pod'


alias kexpl='k explain'
alias kexplr='k explain --recursive=true'


alias kx='k exec'
alias kxns='k exec -n'
alias kxit='k exec -it'
alias kxitns='k exec -it -n'
alias kl='k logs'
alias klns='k logs -n'
alias klf='k logs -f'
alias klfns='k logs -f -n'

alias kshell='k shell'
alias kgansr='k api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found'
alias cleanyaml="yq e '"'del(.. | select(tag == "!!map") | (.status, .creationTimestamp, .generation, .selfLink, .uid, .resourceVersion, .managedFields, ."kubectl.kubernetes.io/last-applied-configuration"))'"' -"
alias cleanjson="gojq '"'del(.. | select(. == "" or . == null)) | walk(if type == "object" then del(.status, .creationTimestamp, .generation, .selfLink, .uid, .resourceVersion, .managedFields, ."kubectl.kubernetes.io/last-applied-configuration") else . end) | del(.. | select(. == {}))'"'"
alias cy='cleanyaml'
alias cyy="cleanyaml | yq e '"'del(.. | select((. == "" and tag == "!!str") or tag == "!!null")) | del(... | select(tag == "!!map" and length == 0))'"' -"
alias cj='cleanjson'

# Helm aliasses
alias h='helm'
alias hi='helm install'
alias hidr='helm install --dry-run --debug'
# Upgrade or Install
alias hup='helm upgrade --install'
alias hupdr='helm upgrade --install --dry-run --debug'
alias hu='helm uninstall'
# Helm releases
alias hl='helm list'
alias hlns='helm list -n'
alias hla='helm list -a'
# Helm repos
alias hrl='helm repo list'
alias hru='helm repo update'
# helm template
alias ht='helm template --debug'
alias htns='helm template --debug -n'

# Docker
alias d='docker'
alias db='docker build'
alias dbt='docker build -t'
alias dt='docker tag'
alias dr='docker run'
alias drnm='docker run --name'
alias drde='docker run --detach'
alias drdenm='docker run --detach --name'
alias dimgs='docker images'
alias drmi='docker rmi'
alias drm='docker rm'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dpush='docker push'
alias dpull='docker pull'

# Podman
alias p='podman'
alias pb='podman build'
alias pbt='podman build -t'
alias pt='podman tag'
alias pr='podman run'
alias prnm='podman run --name'
alias prde='podman run --detach'
alias prdenm='podman run --detach --name'
alias pimgs='podman images'
alias prmi='podman rmi'
alias prm='podman rm'
alias pps='podman ps'
alias ppsa='podman ps -a'
alias ppush='podman push'
alias ppull='podman pull'

# Kubectl aliasses autocompletion
source <(curl -L https://raw.githubusercontent.com/cykerway/complete-alias/refs/heads/master/complete_alias)
complete -F _complete_alias "${!BASH_ALIASES[@]}"


# Run prompt and vim config setup automatically

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

set_ps1
config_vim

# cat >> ~/.inputrc <<'EOF'
# "\e[A": history-search-backward
# "\e[B": history-search-forward
# set show-all-if-ambiguous on
# set completion-ignore-case on
# EOF

# bind -f  ~/.inputrc
