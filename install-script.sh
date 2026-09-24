# this install script:
#
# 1. links the components repo into ~/.config/hypr/tasty-components in a way that is robust enough to survive an git update
#       if there is already a symlink, replace it with a new one
# 2. copies tasty-config.lua-init to ~/.config/hypr/tasty-config.lua
#       unless there is already a tasty-config.lua file there, in which case it prompts if we want to overwrite (default: no)
#
#
# a separate script installs this all from a base fedora install

