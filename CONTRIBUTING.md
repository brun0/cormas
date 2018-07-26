# Contribution Guide for CORMAS

This file is currently not complete but will be improve step by step.

# Contributing code
In a fresh Pharo 6.1, execute the following script in order to update Iceberg to the last version : 

```Smalltalk
MetacelloPharoPlatform select.
#(
    'BaselineOfTonel'
    'BaselineOfLibGit'
    'BaselineOfIceberg'
    'MonticelloTonel-Core'
    'MonticelloTonel-FileSystem'
    'MonticelloTonel-Tests'
    'Iceberg-UI' 
    'Iceberg-TipUI'
    'Iceberg-Plugin-Pharo' 
    'Iceberg-Plugin-Metacello' 
    'Iceberg-Plugin-GitHub' 
    'Iceberg-Plugin' 
    'Iceberg-Metacello-Integration' 
    'Iceberg-Libgit-Tonel' 
    'Iceberg-Libgit-Filetree' 
    'Iceberg-Libgit' 
    'Iceberg-Tests'
    'Iceberg-Memory'
    'Iceberg-UI-Tests'
    'Iceberg-Core' 
    'Iceberg-Changes' 
    'Iceberg-Adapters' 
    'Iceberg'
    'Iceberg-GitCommand'
    'Iceberg-SmartUI'
    'Iceberg-Pharo6'
    'LibGit-Core') 
do: [ :each | (each asPackageIfAbsent: [ nil ]) ifNotNil: #removeFromSystem ].
"update icons (iceberg needs some new)"
ThemeIcons current: ThemeIcons loadDefault.
"load iceberg"
Metacello new
  	baseline: 'Iceberg';
  	repository: 'github://pharo-vcs/iceberg:v1.1.1';
	onWarningLog;
  	load.
"Re-initialize libgit2"
(Smalltalk at: #LGitLibrary) initialize.

"In some case Pharo/Calypso can have a problem with Obsolete classes. If you encounter this problem just execute this command and retry your action:

Smalltalk compilerClass recompileAll

"
```
## Fork the Pharo repository

All changes you'll do will be versionned in your own fork of the [CORMAS repository](https://github.com/cormas/cormas). Then, from your fork you'll be able to issue pull requests to Cormas, where they will be reviewed, and luckily, integrated.

Go to Cormas github's repository and click on the fork button on the top right. Yes, this means that you'll need a github account to contribute to Cormas, yes.

## Load last dev version of Cormas
In your Pharo 6.1 image, load now the last development version of Cormas : 

```Smalltalk
Metacello new
        githubUser: 'XXX' project: 'Cormas' commitish: 'development' path: 'src';
        baseline: 'Cormas';
        load
```
where you replace XXX with your github user name.

## Setup Iceberg
You need an ssh key in order to commit on github. Open Iceberg tool, and then click on the settings. Check the box : "Use custom SSH keys".

## Send the PR to github
After doing the modification in your image, open Iceberg tool, commit the changes in your Cormas repository. Cherry-pick the modifications that you want to include in your commit. In the github interface, create a Pull Request from your commit.
Send the PR to Cormas main repository.

## Cleanups
Ounce your pull request is integrated, some cleanups are maybe required:
- remove your branch from your fork
- close the issue (tips: you can automatically close the issue n, by inserting the sentence: **close #n** when you merge your pull request).

# A step by step guide to help you commit and push
You made modifications in your image which you would like to share/upload on the github repository, but you are still not sure how to do? This step by step guide may help you. Note that this is simple guide. If requested, you can find more details in the other sections.
* In your pharo image, open Iceberg
* Select the Repository named 'cormas', right clic and select 'Synchronize repository...' , 
* A new window opens which will allow you to comment, commit and push
* when you push, it pushes to your own personnal branch of the cormas github repository. Therefore, you need to merge your personnal branch with the cormas master branch in order to share your modifications with everyone.
* To merge your personnal branch with the master branch (see why above), go to  https://github.com/cormas/cormas, select your personnal branch, and create a 'Pull Request' from your commit.
* This procedure will launch an automatic verification process that uses a deployment tool called Travis. This automatic process may take 7 to 8 minutes. When Travis has finish to verify, the operation will appear in green color meaning that it was succesful. After this operation, your personnal code branch of cormas on github, will be automatically merged with the cormas master branch (and your personnal branch will eventually be deleted automatically as well). It's all good.

# Release management

This project use semantic versionning to define the releases, meaning that each stable release of the project will be assigned a version number of the form `vX.Y.Z`. 

- **X** define the major version number
- **Y** define the minor version number 
- **Z** define the patch version number

- When a release contains only bug fixes, the patch number is incremented;
- When the release contains new backward compatible features, the minor version is incremented;
- When the release contains breaking changes, the major version is incremented. 

Thus, it should be safe to depend on a fixed major version and moving minor version of this project.

# Branch management 

This project uses gitflow management.

This project contains two main branches:
- **master** : This branch is a stable branch. Each version on this branch should be a stable release of Cormas, and ideally each commit modifying the source code of the project should be tagged with a version number.
- **development** : This branch contains the current development of this project. 

## Hot fix

If a bug is found in a stable version and the correction is backward compatible, it should be corrected in an hotfix branch. Once the correction is finished the hotfix branch should be merged into master and development and a new bugfix release should be done.