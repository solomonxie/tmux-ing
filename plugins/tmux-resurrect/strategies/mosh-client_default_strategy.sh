#!/usr/bin/env bash

# "mosh-client default strategy"
#
# Example mosh-client process:
#   mosh-client -# charm tmux at | <server-ip> 60001
#
# When executed, the above will fail. This strategy handles that.

ORIGINAL_COMMAND="$1"
DIRECTORY="$2"

mosh_command() {
	local args="$ORIGINAL_COMMAND"

	args="${args#*-#}"
	args="${args%|*}"

	echo "mosh $args"
}

main() {
	echo "$(mosh_command)"
}
main
