# shellcheck source=${HOME}/.profile
# shellcheck disable=SC1091
#if [ -f "${HOME}"/.profile ]; then
#    source "${HOME}"/.profile
#fi

echo -e "Ejecutando .bash_profile"

# Keychain
# ~~~~~~~~
if [ -f "/usr/bin/keychain" ]; then
    /usr/bin/keychain --confhost  --agents gpg,ssh --ignore-missing -k others --systemd  --eval id_rsa id_dsa --quiet
    # shellcheck source=${HOME}/.keychain/${HOSTNAME}-sh
    # shellcheck disable=SC1091
    source "${HOME}/.keychain/${HOSTNAME}-sh"
else
    command -v keychain >/dev/null 2>&1 || { echo -e "apt install keychain\n\nSaliendo.\n" >&2; exit 1;}
fi

# END
