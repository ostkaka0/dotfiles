#!/bin/sh
set -e # exit on error

LC_ALL=C #Keep month/week names consistent
LC_ALL="en_US.UTF-8"
LANG=en_US.UTF-8
LC_TIME="en_US.UTF-8"

readonly SRC_DIR="/home/ost"
readonly DST_DIR="/mnt/LINUX_BACKUP/home_backup"
readonly DATETIME="$(date '+%Y-%m-%d__%H_%M_%S')"
readonly BACKUP_PATH="${DST_DIR}/${DATETIME}"
readonly LATEST="${DST_DIR}/LATEST"
readonly LATEST_TMP="${DST_DIR}/LATEST_TMP"

readonly WEEKDAY="${DST_DIR}/$(LC_TIME=en_US.UTF-8 date '+%a')"
readonly MONTH="${DST_DIR}/$(LC_TIME=en_US.UTF-8 date '+%b')"
readonly YEAR="${DST_DIR}/$(date '+%Y')"

echo "SRC_DIR:     $SRC_DIR"
echo "DST_DIR:     $DST_DIR"
echo "BACKUP_PATH: $BACKUP_PATH"
echo "LATEST:      $LATEST"
echo "WEEKDAY:     $WEEKDAY"
echo "MONTH:       $MONTH"
echo "YEAR:        $YEAR"

mount /dev/sdb2 /mnt/LINUX_BACKUP
if [ ! -d $DST_DIR ]; then
  echo "ERROR: /mnt/LINUX_BACKUP/home_backup not found!"
  # umount -f /mnt/LINUX_BACKUP
  exit 1
fi

#if [ -d "/mnt/LINUX_BACKUP/home_backup/TODAY/" ]; then
    rsync -avH --delete \
    --exclude-from=/home/ost/backup_exclude.txt \
    --link-dest=${LATEST} \
    --log-file=/tmp/rsync_home_backup_log.txt \
    $SRC_DIR/ $BACKUP_PATH
#fi

#rm -rf "$(readlink ${LATEST})"
ln -s --relative "${BACKUP_PATH}" "${LATEST_TMP}"
mv -T "${LATEST_TMP}" "${LATEST}" # Atomic update of LATEST


rm -rf "${WEEKDAY}"
ln -s --relative "${BACKUP_PATH}" "${WEEKDAY}"
rm -rf "${MONTH}"
ln -s --relative "${BACKUP_PATH}" "${MONTH}"
rm -rf "${YEAR}"
ln -s --relative "${BACKUP_PATH}" "${YEAR}"

# Delete old backups, but keep some
DIR_LIST="$(find $DST_DIR -maxdepth 1)"
while IFS= read -r LINE; do
    if [ "$LINE" == "$DST_DIR" ]; then continue; fi
    #echo "$LINE"
    if [ -L "$LINE" ] || ! [ -d "$LINE" ]; then continue; fi
    #echo "!!! $LINE"

    while IFS= read -r LINK; do
        if [ "$LINK" == "$DST_DIR" ]; then continue; fi
        if ! [ -L "$LINK" ]; then continue; fi
        #echo "${LINK}"
        #echo "$LINE  ?= $(readlink ${LINK})"
        #echo "$LINE  ?= $(realpath ${LINK})"
        #if (! [ -L "${LINK}" ]) || (! [ -d "$LINK" ]); then continue; fi
        if [ "$(realpath ${LINK})" == "${LINE}" ]; then
            echo "LINK FOUND! ${LINK} -> ${LINE}"
            continue 2
        fi
        #echo "NOPE!"
    done <<< "$DIR_LIST"
    echo "Deleting $LINE"
    rm -rf "${LINE}"
done <<< "$DIR_LIST"

# umount -f /mnt/LINUX_BACKUP # Doesn't work for some reason
