# PHP Nulled Script Scanner v2.2

This script attempts to detect backdoors and hidden code in PHP scripts downloaded from suspicious sources.
Checks for some common and uncommon strings found in unsafe scripts that may lead to ads, backdoors, etc.
It uses recursive grep searching to output the suspected filename and line.

This script is not foolproof and all output should be examined by someone with at least an intermediate
knowledge of their system. If something doesn't look right, backup the suspected file to an offline
storage device and delete original the file from your web server. A lot of times, these shady files can
be reverse engineered to provide a unique insight into the vulnerability.
