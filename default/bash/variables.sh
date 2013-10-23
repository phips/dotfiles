OS=$(uname)
HOST=$(uname -n)

case $OS in 
    'Linux')
        export PATH='/bin:/sbin:/usr/bin:/usr/sbin'
        ID=$(id -u)
    ;;
    'SunOS')
        ID=$(perl -e 'print $>')
    ;;
    'Darwin')
	export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'
        ID=$(id -u)
    ;;
esac

