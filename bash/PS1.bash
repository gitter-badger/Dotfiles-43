#! /bin/bash -
# PS1 printing and toggle functions

# vars

_value_on=true
_value_off=false
PROMPT_DIRTRIM=2
PROMPT_COMMAND=_build_PS1
_exit=0

# toggle functions

function _toggle_date {
    if [[ "$_show_date" = "$_value_on" ]]; then
        _show_date="$_value_off"
    else
        _show_date="$_value_on"
    fi
}

function _toggle_user {
    if [[ "$_show_user" = "$_value_on" ]]; then
        _show_user="$_value_off"
    else
        _show_user="$_value_on"
    fi
}

function _toggle_host {
    if [[ "$_show_host" = "$_value_on" ]]; then
        _show_host="$_value_off"
    else
        _show_host="$_value_on"
    fi
}

function _toggle_jobs {
    if [[ "$_show_jobs" = "$_value_on" ]]; then
        _show_jobs="$_value_off"
    else
        _show_jobs="$_value_on"
    fi
}

function _toggle_tty {
    if [[ "$_show_tty" = "$_value_on" ]]; then
        _show_tty="$_value_off"
    else
        _show_tty="$_value_on"
    fi
}

function _toggle_shell_name {
    if [[ "$_show_shell_name" = "$_value_on" ]]; then
        _show_shell_name="$_value_off"
    else
        _show_shell_name="$_value_on"
    fi
}

function _toggle_time {
    if [[ "$_show_time" = "$_value_on" ]]; then
        _show_time="$_value_off"
    else
        _show_time="$_value_on"
    fi
}

function _toggle_dir {
    if [[ "$_show_dir" = "$_value_on" ]]; then
        _show_dir="$_value_off"
    else
        _show_dir="$_value_on"
    fi
}

function _toggle_history {
    if [[ "$_show_history" = "$_value_on" ]]; then
        _show_history="$_value_off"
    else
        _show_history="$_value_on"
    fi
}

function _dirtrim {
    if [[ -z "$1" ]]; then
        PROMPT_DIRTRIM=2
    else
        PROMPT_DIRTRIM="$1"
    fi
}
# toggle vars

_show_date="$_value_off"
_show_user="$_value_on"
_show_host="$_value_off"
_show_jobs="$_value_on"
_show_tty="$_value_off"
_show_shell_name="$_value_off"
_show_time="$_value_on"
_show_dir="$_value_on"
_show_history="$_value_on"

# display functions

function _date_prompt {
    if [[ "$_show_date" = "$_value_on" ]]; then
        echo '\D{%e %B %Y} '
    fi
}

function _user_prompt {
    if [[ "$_show_user" = "$_value_on" ]]; then
        if [[ "$_show_host" = "$_value_on" ]]; then
            echo '\u@\h'
        else
            echo '\u'
        fi
    fi
}

function _jobs_prompt {
    if [[ "$_show_jobs" = "$_value_on" ]]; then
        echo '{\jj} '
    fi
}

function _tty_prompt {
    if [[ "$_show_tty" = "$_value_on" ]]; then
        echo '\l '
    fi
}

function _shell_name_prompt {
    if [[ "$_show_shell_name" = "$_value_on" ]]; then
        echo '\s-\V '
    fi
}

function _time_prompt {
    if [[ "$_show_time" = "$_value_on" ]]; then
        echo '\t⧖ '
    fi
}

function _dir_prompt {
    if [[ "$_show_dir" = "$_value_on" ]]; then
        echo '∈\w '
    fi
}

function _history_prompt {
    if [[ "$_show_history" = "$_value_on" ]]; then
        echo '#\!'
    fi
}

# build PS1

function _build_PS1 {
    _exit="$?"
    local highlight
    local exit

    if [[ "$_exit" = "0" ]]; then
        highlight="$BGreen"
        exit='✔︎'
    else
        highlight="$BRed"
        exit="✘ $_exit"
    fi

    PS1="$CS$Yellow$CE$(_time_prompt)$(_date_prompt)$NC$CS$BRed$CE$(_jobs_prompt)$NC$CS$BMagenta$CE$(_history_prompt)$NC[$CS$highlight$CE$exit$NC] $CS$Green$CE$(_tty_prompt)$(_shell_name_prompt)$NC$CS$BCyan$CE$(_user_prompt)$(_dir_prompt)$NC$CS$BYellow$CE\$("$__gps1")$NC"'\$ '
}