#!/bin/bash
set -Eeuo pipefail

BASE_DIR="/etc/bird"

country_asn() {
	curl "https://www.cc2asn.com/data/$1_asn" | sed 's/AS//g' | sed '$!s/$/,/'
}

echo -e "define china_asn = [" > ${BASE_DIR}/asn_cn.conf
country_asn cn >> ${BASE_DIR}/asn_cn.conf
echo -e "];\n" >> ${BASE_DIR}/asn_cn.conf

