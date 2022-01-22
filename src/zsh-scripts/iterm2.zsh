# Usage:
# source iterm2.zsh
# iTerm2 tab color commands
# https://iterm2.com/documentation-escape-codes.html

if [[ -n "$ITERM_SESSION_ID" ]]; then
    tab-color() {
        echo -ne "\033]6;1;bg;red;brightness;$1\a"
        echo -ne "\033]6;1;bg;green;brightness;$2\a"
        echo -ne "\033]6;1;bg;blue;brightness;$3\a"
    }

    tab-red() { tab-color 95 25 25 }
    tab-green() { tab-color 0 255 0 }
    tab-orange() { tab-color 255 200 0 }
    tab-blue() { tab-color 100 170 160 }
    tab-reset() { echo -ne "\033]6;1;bg;*;default\a" }

    function iterm2_tab_precmd() {
        tab-reset
    }

    function iterm2_tab_preexec() {
        if [[ "$1" =~ "^ssh " ]]; then
            if [[ "$1" =~ "prod" ]]; then
                tab-red
            elif [[ "$1" =~ "stage" ]]; then
                tab-orange
            else
                tab-blue
            fi
        # elif [[ "$1" =~ "???" ]]; then
        # else
        #     tab-green
        fi
    }
    autoload -U add-zsh-hook
    add-zsh-hook precmd  iterm2_tab_precmd
    add-zsh-hook preexec iterm2_tab_preexec
fi
