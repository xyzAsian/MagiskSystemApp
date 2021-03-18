SKIPUNZIP=1

# extract verify.sh
ui_print "- Extracting verify.sh"
unzip -o "$ZIPFILE" 'verify.sh' -d "$TMPDIR" >&2
if [ ! -f "$TMPDIR/verify.sh" ]; then
  ui_print    "*********************************************************"
  ui_print    "! Unable to extract verify.sh!"
  ui_print    "! This zip may be corrupted, please try downloading again"
  abort "*********************************************************"
fi
. $TMPDIR/verify.sh

check_architecture

# extract libs
ui_print "- Extracting module files"

extract "$ZIPFILE" 'module.prop' "$MODPATH"
extract "$ZIPFILE" 'post-fs-data.sh' "$MODPATH"
extract "$ZIPFILE" 'uninstall.sh' "$MODPATH"
#extract "$ZIPFILE" 'sepolicy.rule' "$MODPATH"

if [ "$ARCH" = "x86" ] || [ "$ARCH" = "x64" ]; then
  ui_print "- Extracting x86 libraries"
  ui_print "*********************************************************"
  ui_print "not support x86 and x64 yet"
  abort "*********************************************************"

  if [ "$IS64BIT" = true ]; then
    ui_print "- Extracting x64 libraries"
  fi
else
  ui_print "- Extracting arm libraries"


  if [ "$IS64BIT" = true ]; then
    ui_print "- Extracting arm64 libraries"

  fi
fi

set_perm_recursive "$MODPATH" 0 0 0755 0644
