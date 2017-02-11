#!/bin/bash

if [ -f "/config/.megarc" ]; then
	echo "using extisting configuration file"
else
	echo "using default configuration file"
	cp "/root/sample.conf" "/config/.megarc"
fi

[ -n "$USERNAME" ] && sed -ir "s|^[;\s]*Username.*|Username = ${USERNAME}|" "/config/.megarc"
[ -n "$PASSWORD" ] && sed -ir "s|^[;\s]*Password.*|Password = ${PASSWORD}|" "/config/.megarc"
[ -n "$CACHE_TIMEOUT" ] && sed -ir "s|^[;\s]*Timeout.*|Timeout = ${CACHE_TIMEOUT}|" "/config/.megarc"
[ -n "$SPEED_LIMIT" ] && sed -ir "s|^[;\s]*SpeedLimit.*|SpeedLimit = ${SPEED_LIMIT}|" "/config/.megarc"
[ -n "$DOWNLOAD_SPEED_LIMIT" ] && sed -ir "s|^[;\s]*DownloadSpeedLimit.*|DownloadSpeedLimit = ${DOWNLOAD_SPEED_LIMIT}|" "/config/.megarc"
[ -n "$UPLOAD_SPEED_LIMIT" ] && sed -ir "s|^[;\s]*UploadSpeedLimit.*|UploadSpeedLimit = ${UPLOAD_SPEED_LIMIT}|" "/config/.megarc"
[ -n "$PROXY_SERVER" ] && sed -ir "s|^[;\s]*Proxy.*|Proxy = ${PROXY_SERVER}|" "/config/.megarc"

[ -n "${REMOTE_PATH}" ] || REMOTE_PATH="/Root"

megacopy --config "/config/.megarc" --version
megacopy --config "/config/.megarc" --local "/uploads" --remote "${REMOTE_PATH}"

exit 0
