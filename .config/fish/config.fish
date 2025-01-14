function fish_greeting
echo -n "   ██████     ███████";                    echo \t\t\t\tUser: (set_color --bold green)$(whoami)(set_color normal) @ (set_color --bold green)$(hostname)(set_color normal)(set_color white)
echo -n " ██████████   ███  ████   █████  ██   ██"; echo \tDate and Time: (set_color --bold green)$(date '+%A %d %B %Y - %H:%M')(set_color normal)
echo -n "████    ████  ███    ██  ██  ███ ██   ██"; echo \tSystem Uptime: (set_color --bold green)(system_profiler SPSoftwareDataType -detailLevel mini | awk -F "Time since boot: " '/Time since boot:/ {print $2}')(set_color normal)
echo -n "████    ████  ███    ██ ████████ ██   ██"; echo \t"Memory Available: $(set_color --bold green) $(df -h /System/Volumes/Data | awk '/\/System\/Volumes\/Data/ {avail_gi=$4; avail_go=avail_gi * 1024 * 1024 * 1024 / 1000000000; printf "%.2f Go\n", avail_go}')"(set_color normal)
echo -n " ██████████   ███  ████ ███       █████";  echo \t\tCurrent SSID: (set_color --bold green)(ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}')(set_color normal)
echo -n "███ █████     ███████     █████    ███";   echo \t\tTo-Do: (set_color --bold green)(cat $HOME/dotfiles/.todo)(set_color normal)
end

function todo
    echo $argv > $HOME/dotfiles/.todo
    clear ; fish_greeting ;
end

starship init fish | source
zoxide init --cmd cd fish | source
source "$HOME/.config/fish/abbreviations.fish"
nvm use lts >/dev/null

alias ..="cd .."
alias docker-kill="docker system prune -a -f"
alias docker-delete-volume="docker rm \$(docker ps -a -q) -f && docker volume prune"
alias my-ip="curl ifconfig.me"
alias bun-build="bun run build"
alias create-vite="bun create vite"
alias c="clear"
alias ls="exa --long"
alias ll="exa --long -la"
alias cat="bat"
alias git-add="git add --all"
alias git-origin="git push origin main"
alias git-deploy="git push deploy main"
