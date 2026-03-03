#TODO: make this a lookup path that is configurable via local configuration.
# Add additional support for openJDK fallback cases.
if [[ $OSTYPE == "linux-gnu" ]]; then
  if [[ -d "/opt/java/jdk1.8.0_152" ]]; then
    JAVA_HOME="/opt/java/jdk1.8.0_152"
  elif [[ -d "/usr/lib/jvm/java-8-oracle" ]]; then
    JAVA_HOME="/usr/lib/jvm/java-8-oracle"
  elif [[ -d "/usr/lib/jvm/java-1.8.0-openjdk-amd64" ]]; then
    JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-amd64"
  elif [[ -d "/usr/lib/jvm/java" ]]; then
    JAVA_HOME="/usr/lib/jvm/java"
  else
    JAVA_HOME="/usr/lib/jvm/jre"
  fi
  export JAVA_HOME
  # Make sure javahome is first in our path before system java.
  path=($JAVA_HOME/bin $path)
elif [[ $OSTYPE[1,6] == "darwin" ]]; then
  JAVA_HOME=`/usr/libexec/java_home`
  export JAVA_HOME
fi
