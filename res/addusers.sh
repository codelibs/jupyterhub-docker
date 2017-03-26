#!/bin/sh

IFS="
"
for line in `cat userlist`; do
  test -z "$line" && continue
  user=`echo $line | cut -f 1 -d' '`
  mode=`echo $line | sed -e "s/^$user//"`
  echo "adding user $user"
  if [ x"$mode" = "x admin" ] ; then
    useradd -G sudo -m -s /bin/bash $user
  else
    useradd -m -s /bin/bash $user
  fi
  echo "$user:$user" | chpasswd
  echo chown -R $user /home/$user
done
