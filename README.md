# Git-Submergify

A shell script to merge related child repositories into one parent repository.

Requires Git >= 2.9.0

## Usage

1. Copy this script into the directory where you wish to create the local parent directory

```bash
cd /name/of/local/directory
curl -o git-submergify.sh https://github.com/TheWillGabriel/git-submergify/raw/master/git-submergify.sh
```

2. Create an empty GitHub repository as the new remote parent _note: You must be authorized to connect to your GitHub account [using SSH](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)

3. Run the script

Interactive mode:

```bash
./git-submergify -i
```

Non-interactive mode:

```bash
./git-submergify GIT_USERNAME PARENT_NAME "CHILD_1 CHILD_2 CHILD_3 [...]"
```