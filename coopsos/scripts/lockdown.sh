#!/system/bin/sh
MAX_ATTEMPTS=10
LOCK_TIME=86400
ATTEMPTS_FILE="/data/system/failed_attempts.txt"
FAILED_ATTEMPTS=0
[ -f $ATTEMPTS_FILE ] && FAILED_ATTEMPTS=$(cat $ATTEMPTS_FILE)
if [ "$FAILED_ATTEMPTS" -ge "$MAX_ATTEMPTS" ]; then
    echo "Locked for 1 day."
    sleep $LOCK_TIME
    echo "0" > $ATTEMPTS_FILE
else
    FAILED_ATTEMPTS=$((FAILED_ATTEMPTS + 1))
    echo "$FAILED_ATTEMPTS" > $ATTEMPTS_FILE
fi
