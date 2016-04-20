# ServerUtils
This repo contains my scripts for managing multiple debian servers.
Most of this scripts will probably not be relevant for you, but it is easier for me to just dump my stuff in here ;)

## backup.s&#8203;h
This utility will backup your data to a network storage server, mounted over NFS.
Following data is backed up:
* MySQL databases
* system packages (apt)
* custom additional folders

The tool needs the following binaries to be installed:
* obnam (for incremental backups)
* apt-clone (for package backup)
* mysql (obviously..)
* dpkg-repack (for package backup)
* nfs-common (for mounting remote storage as nfs [default])
* glusterfs-client (for mounting remote storage as glusterfs)

Every backup after the first one is incremental.
Obnam uses deduplication and you can delete any backup generation without manipulating the others. For more information see obnam.org.

### sample backup.conf storage configurations
```
# mount via NFS
REMOTE_STORAGE_PATH="00.00.00.00:/vol-00000-1"
REMOTE_STORAGE_TYPE="nfs"
REMOTE_STORAGE_OPTIONS=""

# mount via GlusterFS
REMOTE_STORAGE_PATH="00.00.00.00:/vol-00000-1"
REMOTE_STORAGE_TYPE="glusterfs"
REMOTE_STORAGE_OPTIONS=""

# mount via Samba
REMOTE_STORAGE_PATH="//00.00.00.00/vol-00000-1"
REMOTE_STORAGE_TYPE="cifs"
REMOTE_STORAGE_OPTIONS="-o username=xxx -o password=xxx"
```

|Tool|Usage|
|---|---|
|biggest_files|returns a list of the biggest files in a given directory|
|dirsize|returns the size of a given directory|
|fail2ban|unblock an ip from a fail2ban jail|
|filesize|returns the size of a given file|
|watchl|uses the 'watch' binary to display live updating data|
|killpts|kills a session from another user, maybe because of ssh session timeout|
|open_ports|returns a list of currently open ports|
|scripts/add_ftp_users.sh|add additional ftp users with custom directories, mainly used for usage with ajenti.org|
|scripts/check_backupdir|check if the backup remote directory is still mounted|
|scripts/check_mailqueue|check if the mailqueue contains too many mails|
|scripts/preload_wordpress_cache|preloads a webpage to create for example a wordpress cache|
|scripts/system_reboot_message|sends mail if the system reboots|
|scripts/update_adminer|updates the adminer repo and fixes permissions|
|scripts/update_etherpad|updates the etherpad repo and fixes permissions|
|scripts/update_letsencrypt|updates the letsencrypt repo and fixes permissions|
