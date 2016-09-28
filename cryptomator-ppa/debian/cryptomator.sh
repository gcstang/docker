#/bin/sh
java \
  -Xmx512m \
  -Dcryptomator.logPath=~/.Cryptomator/cryptomator.log \
  -Dcryptomator.upgradeLogPath=~/.Cryptomator/upgrade.log \
  -Dcryptomator.settingsPath=~/.Cryptomator/settings.json \
  -jar /usr/share/java/cryptomator/Cryptomator-##CRYPTOMATOR_VERSION##.jar
