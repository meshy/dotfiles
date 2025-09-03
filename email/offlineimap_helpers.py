"""
Ref: https://wiki.archlinux.org/index.php/OfflineIMAP#python2-keyring

Accessed 2018 Feb 25, 1100 GMT.

To set the password:

    >>> import keyring
    >>> keyring.set_password("offlineimap", "charleswdenton-gmail.com", "MYPASSWORD")
    >>> import readline
    >>> readline.clear_history()
"""
import keyring


def get_password(account):
    return keyring.get_password('offlineimap', account)
