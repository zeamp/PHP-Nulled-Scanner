#!/usr/bin/env bash

#  ____ ____ ____ _________ ____ ____ ____ ____ ____ ____
# ||P |||H |||P |||       |||N |||U |||L |||L |||E |||D ||
# ||__|||__|||__|||_______|||__|||__|||__|||__|||__|||__||
# |/__\|/__\|/__\|/_______\|/__\|/__\|/__\|/__\|/__\|/__\|
#
# PHP Nulled Script Scanner v3
# by @zeampzpvy
#
# This script attempts to detect backdoors and hidden code in PHP scripts downloaded from suspicious sources.
# Checks for some common and uncommon strings found in unsafe scripts that may lead to ads, backdoors, etc.
# It uses recursive grep searching to output the suspected filename and line.
#
# This script is not foolproof and all output should be examined by someone with at least an intermediate
# knowledge of their system. If something doesn't look right, backup the suspected file to an offline
# storage device and delete original the file from your web server. A lot of times, these shady files can
# be reverse engineered to provide a unique insight into the vulnerability and edited to run safely.
#

LOG="scanner.txt"

# Mirror output to terminal AND log file
exec > >(tee -a "$LOG") 2>&1

clear
echo "=================================================="
echo " PHP NULLED SCRIPT SCANNER"
echo " Version 3"
echo "=================================================="
echo " Log file : $LOG"
echo " Started  : $(date)"
echo "=================================================="
echo

read -rp "Enter the path to your PHP root directory: " PHPROOT
echo

if [[ ! -d "$PHPROOT" ]]; then
    echo "[FATAL] '$PHPROOT' is not a valid directory."
    exit 1
fi

echo "[INFO] Target directory: $PHPROOT"
echo "[INFO] Scan in progress..."
echo

PATTERNS=(
    "shell_exec"
    "system"
    "passthru"
    "eval"
    "base64_decode"
    "edoced_46esab"
    "phpinfo"
    "php_uname"
    "fopen"
    "fclose"
    "readfile"
    "chmod"
)

TOTAL=${#PATTERNS[@]}
COUNT=1

for PATTERN in "${PATTERNS[@]}"; do
    echo "--------------------------------------------------"
    echo "[CHECK $COUNT/$TOTAL] Searching for: $PATTERN"
    MATCHES=$(grep -Rni --color=never "$PATTERN" "$PHPROOT" | tee /tmp/scanner.tmp)

    if [[ -s /tmp/scanner.tmp ]]; then
        echo "[WARNING] Matches found for '$PATTERN'"
    else
        echo "[OK] No matches found"
    fi

    rm -f /tmp/scanner.tmp
    echo
    ((COUNT++))
done

echo "=================================================="
echo "[DONE] Scan completed successfully"
echo "[DONE] Finished at: $(date)"
echo "[DONE] Review results in: $LOG"
echo "=================================================="
echo
