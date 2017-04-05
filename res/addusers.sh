#!/bin/sh

IFS="
"
for line in `cat userlist`; do
  test -z "$line" && continue
  uid=`echo $line | awk '{print $1}'`
  user=`echo $line | awk '{print $2}'`
  mode=`echo $line | awk '{print $3}'`
  echo "adding user $user"
  if [ x"$mode" = "xadmin" ] ; then
    useradd -G sudo -m -s /bin/bash -u $uid $user
  else
    useradd -m -s /bin/bash -u $uid $user
  fi
  echo "$user:$user" | chpasswd
  chown -R $user /home/$user
done
