# check if $GPAAS_USER isn't blank, otherwise quit
if [ -z "$GPAAS_USER" ]
then
      echo "\$GPAAS_USER is empty, quitting."
      exit 1
fi

# set api endpoint and login
cf login -a $GPAAS_API -u $GPAAS_USER -p "$GPAAS_PASS"

# set the target
cf target -o $GPAAS_ORG -s $GPAAS_SPACE

# push the apps
cf push $GPAAS_APP_NAME
