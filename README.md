# ScaleBrowse

Readme is a WIP. Based off Vivaldi browser. See [here](https://chromium.googlesource.com/chromium/src/+/main/docs/windows_build_instructions.md) for instructions on how to setup to build (the actual build here is kicked off by `make build` or `build.bat`, though).

## Setting up the repository

To set up the repository, simply run `make init`. This will clone the Vivaldi browser, checkout the current working branch, apply all the patches to a branch, and then make another branch for additional patches you might want to make.

## Creating a patch

To create a patch, you can use the `make create-patches` command. This will create patches files for all the commits that have been applied to the branch. If you wish to reset your patching branch, you can use the `make reset` command. This will reset your patching branch to the original branch.

## Rebasing patches

After a new Vivaldi release has been release and pushed to GitHub by Astrid, this browsers commits can be updated with `make rebase-patches`. This will rebase the patches onto the new commit. After that, you will want to run `make create-patches` to create new patches files for the new commits.
