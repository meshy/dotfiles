"""
Ref: https://wiki.archlinux.org/index.php/OfflineIMAP#python2-keyring

Accessed 2018 Feb 25, 1100 GMT.
"""
import keyring


def get_password(account):
    return keyring.get_password('offlineimap', account)
