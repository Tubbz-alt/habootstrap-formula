#!/bin/sh
systemctl -q is-active pacemaker && exit

ARGS="-y --name $NAME"
if [ -n "$INTERFACE" ]; then
	ARGS="$ARGS -i $INTERFACE"
fi
if [ -n "$WATCHDOG" ]; then
	ARGS="$ARGS -w $WATCHDOG"
fi
if [ -n "$SBD" ]; then
	ARGS="$ARGS --enable-sbd"
	if [ -n "$SBD_DEVICE" ]; then
		ARGS="$ARGS -s $SBD_DEVICE"
	fi
fi
/usr/sbin/crm cluster init $ARGS
