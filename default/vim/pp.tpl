# FILENAME
#
### THIS FILE IS CENTRALLY MANAGED UNDER GIT! DO NOT EDIT LOCALLY! ###
###           CHECK THE FILE OUT FROM THE GIT REPOSITORY           ###
#

class CLASS (
    $enabled,
) {
    if ! ( $enabled ) {
        notify { "${module_name}_disabled":
            message => "Module ${module_name} has been disabled for this host"
        }
    }
    else {
        #
        # DO STUFF
        #
    }
}

# Footer - do not edit below here
# vim: set tw=79 ts=4 sw=4 et ft=puppet:
