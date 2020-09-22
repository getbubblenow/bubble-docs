#!/bin/bash

if [[ -z $(which markdown) ]] ; then
  echo "Installing markdown-to-html from npm..."
  sudo npm install markdown-to-html -g
fi

THISDIR=$(cd $(dirname $0) && pwd)
cd ${THISDIR}
for f in $(find . -type f -name "*.md" ) ; do

  # Files we'll use
  doc="$(echo $(basename ${f}) | sed -e 's/.md//')"
  TMP="./html/${doc}.tmp"
  HTML="./html/${doc}.html"

  # Convert to HTML
  echo "Converting ${f} to HTML"
  markdown $f > ${TMP}

  # Change links to .md to .html
  echo "Rewriting markdown links to HTML and creating ${HTML}"
  cat ${TMP} | sed -e 's/.md"/.html"/' > ${HTML}

  # Cleanup
  rm -f ${TMP}
done