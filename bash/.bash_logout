# ~/.bash_logout: executed by bash(1) when login shell exits.

# #####################################################################
# PERSONALIZACIONES
# #####################################################################
if [ -f ~/.bash_logout.local ]; then
    # shellcheck source=${HOME}/.bash_logout.local
    # shellcheck disable=SC1091
    . ~/.bash_logout.local
fi

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

# END
