#!/bin/bash -e

# Run install scripts.
. ./.extra/setup.sh
. ./.extra/update.sh
. ./.extra/symlink.sh
. ./.extra/install.sh
. ./.extra/test.sh
. ./.extra/extra.sh

