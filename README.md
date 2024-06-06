# Ubuntu-quickstart

This quickstart file installs all the basic software you would need for Ubuntu (24.04).\
You can fork this repository and add or remove software as you see fit.

[![GitHub release](https://img.shields.io/github/release/RasseTheBoy/Ubuntu-quickstart?include_prereleases=&sort=semver&color=blue)](https://github.com/RasseTheBoy/Ubuntu-quickstart/releases/)
[![24.04](https://img.shields.io/badge/24.04-working-green)](https://github.com/RasseTheBoy/Ubuntu-quickstart/releases/)
[![>24.04](https://img.shields.io/badge/%3E24.04-not%20tested-red)](https://github.com/RasseTheBoy/Ubuntu-quickstart/releases/)

## Table of Contents

- [Ubuntu-quickstart](#ubuntu-quickstart)
  - [Table of Contents](#table-of-contents)
  - [One-liner command](#one-liner-command)
  - [Manual Installation](#manual-installation)
    - [Step 1: Install quickstart file](#step-1-install-quickstart-file)
    - [Step 2: Make the file executable](#step-2-make-the-file-executable)
    - [Step 3: Run the file](#step-3-run-the-file)
    - [Step 4: Wait](#step-4-wait)
    - [(Step 4.1: Optional)](#step-41-optional)
    - [Step 5: Done](#step-5-done)

## One-liner command

Run these commands in your terminal to install all the basic software you need on your Ubuntu machine.

```bash
curl -o quickstart_test.sh -fsSL https://raw.githubusercontent.com/RasseTheBoy/Ubuntu-quickstart/main/quickstart.sh
chmod +x quickstart_test.sh
./quickstart_test.sh
rm quickstart_test.sh
```

## Manual Installation

This is a step-by-step tutorial on how to install all the basic software you need on your Ubuntu machine.

### Step 1: Install quickstart file

Install the `quickstart.sh` file to your home machine.

```bash
curl -o quickstart_test.sh -fsSL https://raw.githubusercontent.com/RasseTheBoy/Ubuntu-quickstart/main/quickstart.sh
```

### Step 2: Make the file executable

Make the file executable by running the following command:

```bash
chmod +x quickstart.sh
```

### Step 3: Run the file

Run the file by running the following command:

```bash
./quickstart.sh
```

### Step 4: Wait

Wait for the script to finish running. It will take a while.\
The download speed will depend on your internet connection;
and the installation speed will depend on your machine's specs.

### (Step 4.1: Optional)

If you want to remove the file after running it, run the following command:

```bash
rm quickstart.sh
```

### Step 5: Done

You're done! You now have all the basic software you need installed on your machine.
