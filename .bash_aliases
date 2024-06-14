function _GREEN_ECHO() {
    echo -e "\033[0;32m$1\033[0m"
}

function _RED_ECHO() {
    echo -e "\033[0;31m$1\033[0m"
}

function _ORANGE_ECHO() {
    echo -e "\033[0;33m$1\033[0m"
}


alias xx='exit'
alias ealias='code ~/.bash_aliases && _GREEN_ECHO "Opening code with .bash_aliases file"'
alias sb='source ~/.bashrc && _GREEN_ECHO "Bashrc sourced!"'
alias sn='shutdown now'
alias rn='shutdown -r now'

alias upd='sudo nala update'
alias upg='sudo nala upgrade'
alias updg='sudo nala update && sudo nala upgrade'

alias ni='sudo nala install'
alias niy='sudo nala install -y'
alias nr='sudo nala remove'
alias nry='sudo nala remove -y'


# Force remove
function frmv() {
    # Check input variable is not empty
    if [ -z "$1" ]; then
        _RED_ECHO "Please provide a file name!"
        return
    fi

    # Iterate over the input files
    for file in "$@"; do
        # Check if the file exists
        if [ -f "$file" ]; then
            rm -f "$file"
            _GREEN_ECHO "File '$file' removed"
        else
            _ORANGE_ECHO "File '$file' does not exist"
        fi
    done
}