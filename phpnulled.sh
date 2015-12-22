#!/usr/local/bin/bash
#  ____ ____ ____ _________ ____ ____ ____ ____ ____ ____ 
# ||P |||H |||P |||       |||N |||U |||L |||L |||E |||D ||
# ||__|||__|||__|||_______|||__|||__|||__|||__|||__|||__||
# |/__\|/__\|/__\|/_______\|/__\|/__\|/__\|/__\|/__\|/__\|
#
# PHP Nulled Script Scanner v2.1 by @m3th4mp (http://www.geekdime.com)
#
# This script attempts to detect backdoors and hidden code in PHP scripts downloaded from suspicious sources.
# Checks for some common and uncommon strings found in unsafe scripts that may lead to ads, backdoors, etc.
# It uses recursive grep searching to output the suspected filename and line.
#
# This script is not foolproof and all output should be examined by someone with at least an intermediate
# knowledge of their system. If something doesn't look right, backup the suspected file to an offline
# storage device and delete original the file from your web server. A lot of times, these shady files can
# be reverse engineered to provide a unique insight into the vulnerability.
#
echo "PHP Nulled Script Scanner v2.1"
echo "By @m3th4mp http://www.geekdime.com"
echo ""
echo "Please input the location to your PHP files below."
echo "Example: /home/mh/public_html/wordpress/"
echo ""
read -p "Location: " phplocation
echo ""
echo "We will now scan $phplocation..."
echo ""
echo "Checking for shell execution strings..."
grep -Rn "shell_exec" $phplocation
echo "Done."
echo ""
echo "Checking for base64 strings..."
grep -Rn "base64_decode" $phplocation
echo "Done."
echo ""
echo "Checking for base64 reverse strings..."
grep -Rn "edoced_46esab" $phplocation
echo "Done."
echo ""
echo "Checking for fopen strings..."
grep -Rn "fopen" $phplocation
echo "Done."
echo ""
echo "Checking for fclose strings..."
grep -Rn "fclose" $phplocation
echo "Done."
echo ""
echo "Checking for phpinfo strings..."
grep -Rn "phpinfo" $phplocation
echo "Done."
echo ""
echo "Checking for system strings..."
grep -Rn "system" $phplocation
echo "Done."
echo ""
echo "Checking for uname strings..."
grep -Rn "php_uname" $phplocation
echo "Done."
echo ""
echo "Checking for chmod strings..."
grep -Rn "chmod" $phplocation
echo "Done."
echo ""
echo "Checking for readfile strings..."
grep -Rn "readfile" $phplocation
echo "Done."
echo ""
echo "Checking for eval strings..."
grep -Rn "eval" $phplocation
echo "Done."
echo ""
echo "Checking for passthru strings..."
grep -Rn "passthru" $phplocation
echo "Done."
echo ""
echo "Scan completed."
echo ""