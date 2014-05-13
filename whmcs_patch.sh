#!/bin/bash
#
# WHCMS patch script
#
# before you run: download and extract patch and update WHMCS_SOURCE and other vars
# 
# this script moves files from already extracted patch to your custom WHMCS paths

#path to extracted archive
WHMCS_SOURCE='/home/username/whmcs'

#admin folder name
WHMCS_ADMIN='adminpath'

#relative paths
WHMCS_PATH='../public_html'
WHMCS_ATTACHMENTS='../whmcs_attachments'
WHMCS_CRONS='../whmcs_crons'
WHMCS_DOWNLOADS='../whmcs_downloads'
WHMCS_TEMPLATES_C='../whmcs_templates_c'

cd $WHMCS_SOURCE

#copy files to custom paths first
if [ -d attachments ]; then
  echo "Copying attachments/..."
  cp -R attachments/* $WHMCS_ATTACHMENTS/.
  rm -rf attachments
fi

if [ -d crons ]; then
  echo "Copying crons/..."
  cp -R crons/* $WHMCS_CRONS/.
  rm -rf crons
fi

if [ -d downloads ]; then
  echo "Copying downloads/..."
  cp -R downloads/* $WHMCS_DOWNLOADS/.
  rm -rf downloads
fi

if [ -d templates_c ]; then
  echo "Copying templates_c/..."
  cp -R templates_c/* $WHMCS_TEMPLATES_C/.
  rm -rf templates_c
fi

#rename admin folder if necessary
if [ ! "$WHMCS_ADMIN" == "admin" ]; then
  echo "Renaming admin directory..."
  mv admin $WHMCS_ADMIN
fi

#copy the rest of the patch
echo "Copying patch files to path..."
cp -R * $WHMCS_PATH/.

echo ""
echo "All done! If no errors, confirm version in admin area."
echo ""
