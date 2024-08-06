#!/bin/bash
OWNER=admin_user
DESTINATION=/var/home/${OWNER}/scripts
/usr/bin/cat << __EOF__ > ../files.j2
/usr/bin/mkdir -p ${DESTINATION}
__EOF__
cd source
for SOURCE_FILE in $(/usr/bin/find . -type f) ; do
  FILE_NAME=$(/usr/bin/echo ${SOURCE_FILE} | cut -d/ -f2)

  /usr/bin/cat << __EOFEOF__ >> ../../files.j2
/usr/bin/cat << __EOF__ | base64 -d > ${DESTINATION}/${FILE_NAME}
__EOFEOF__

  /usr/bin/base64 ${SOURCE_FILE} >> ../../files.j2

  /usr/bin/cat << __EOFEOF__ >> ../../files.j2
__EOF__
__EOFEOF__

  /usr/bin/echo ${FILE_NAME} | /usr/bin/grep sh$  &> /dev/null
  RC=${?}
  if [ ${RC} -eq 0 ] ; then
    /usr/bin/cat << __EOF__ >> ../../files.j2
/usr/bin/chmod u+x ${DESTINATION}/${FILE_NAME}
__EOF__
  fi

done
/usr/bin/cat << __EOF__ >> ../../files.j2
/usr/bin/chown -R ${OWNER}: ${DESTINATION}
__EOF__
cd ..

