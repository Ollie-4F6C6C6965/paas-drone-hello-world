# check if $GPAAS_USER isn't blank, otherwise quit
if [ -z "$GPAAS_USER" ]
then
      echo "\$GPAAS_USER is empty, quitting."
      exit 1
fi

# log in to Cloud Foundry
cf login -u $GPAAS_USER -p "$GPAAS_PASS"

# set the target
cf target -o $GPAAS_ORG -s $GPAAS_SPACE

# list the apps
cf apps
