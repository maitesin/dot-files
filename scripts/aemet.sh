#!/usr/bin/env bash

BASE_URL=https://datosclima.es/capturadatos/
BASE_FILE=Aemet2020-
EXTENSION=.rar

process_url() {
  URL=$1; shift
  MONTH=$1; shift

  mkdir "${MONTH}"
  pushd "${MONTH}" || exit
    wget "${URL}"
    process_rar "${BASE_FILE}${MONTH}${EXTENSION}" "${MONTH}"
  popd || exit
  cp "${MONTH}"/"${MONTH}".txt .
}

process_rar() {
  rar_file=$1; shift
  month=$1; shift
  result_file="${month}.txt"

  unrar e "${rar_file}"

  touch "${result_file}"

  for xls in *.xls
  do
    xls2csv "${xls}" | grep Almassora | cut -d',' -f 4 | cut -d' ' -f 1 | cut -d'"' -f 2 >> "${result_file}"
  done
}

TMP=$(mktemp -d)
echo "HELLO FROM ${TMP}"
pushd "${TMP}" || exit

process_url "${BASE_URL}${BASE_FILE}01${EXTENSION}" "01"

for month in $(seq -w 2 12)
do
  process_url "${BASE_URL}${BASE_FILE}${month}${EXTENSION}" "${month}"
done

popd || exit

cp "${TMP}"/*.txt .
