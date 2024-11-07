---
title: Basic Legacy SAM Personalization Tool
linkTitle: Basic Legacy SAM Personalizer
type: book
toc: true
weight: 30
---

<br>

#### What is the Calypso Basic Legacy SAM Personalization Tool?
The Calypso Basic Legacy SAM Personalization Tool is a desktop application designed to create a **SAM CPP** specifically
dedicated to the personalization of **Calypso Basic** cards by injecting the necessary keys.

**Key Features:**
- **SAM Dump**: Displays the SAM parameters and keys settings.
- **SAM Personalization**: Enables the transfer of keys and configurations from a origin **SAM SP** to a blank 
  **SAM CPP**.
- **Dual Reader Setup**: Requires a Target SAM Reader for the blank SAM and an Origin SAM Reader containing the 
  **SAM SP** with desired settings and keys.

#### Why use the Calypso Basic Legacy SAM Personalization Tool?
This tool helps for operators who need to prepare **SAM CPP** for field deployment of **Calypso Basic** card 
personalized with the [basic-card-personalizer](../basic-card-personalizer/) tool.

<br>

This user guide explains how to personalize a **SAM CPP** needed for **Calypso Basic** card keys injection.

<br>

## Hardware Requirements

This tool requires two PC/SC contact readers:

* **Target SAM Reader:** this reader holds the blank **SAM CPP** you want to personalize.
* **Origin SAM Reader:** this reader contains the **SAM SP** with the desired keys and settings.

<br>

## Installation

1. The software is available in a GitHub repository. Go to
   the [releases page](https://github.com/calypsonet/cna-tool-basic-card-perso-app/releases) to download it. (Note:
   the GitHub repository is private. Please request access from [CNA](https://calypsonet.org)). Choose the installation
   file that matches your operating system:
    * **Windows:** `.msi` package
    * **macOS:** `.dmg` package
    * **Linux:** `.deb` package
2. **Windows:** double-click the `.msi` package to start the installation.
3. **macOS:** open the `.dmg` file and drag the application to the Applications folder.
4. **Linux:** use your distribution's package manager to install the `.deb` package.
5. **Important note:** the installer does not automatically create a shortcut in the Start Menu (Windows) or
   Applications menu (macOS). You need to create one manually.

<br>

## Launch the Tool

1. After installation, find the executable in the installation directory:
    * **Windows:** `C:\Program Files\cna-tool-basic-legacysam-perso-app\`
    * **macOS:** `/Applications/cna-tool-basic-legacysam-perso-app/`
    * **Linux:** `/opt/cna-tool-basic-legacysam-perso-app/` (or your user's home directory)
2. Double-click the executable to launch the Calypso Basic Legacy SAM Personalization Tool.

<br>

## Application UI

The application window has a top menu and three tabs:

### Settings Menu

1. Click the **Settings** menu.
2. Select the **Target SAM Reader** name. This is where you will insert your blank SAM.
3. Select the **Origin SAM Reader** name. This SAM contains the data you want to transfer to the target SAM.
4. Enter the **Origin SAM Unlock Value** if required.

### Tabs

* **SAM Dump:** shows the detailed information and parameters of the SAM inserted in the target SAM reader.
* **SAM Personalization:** configure and execute the personalization process.
* **Application Info:** view logs and events related to the application and SAM readers. Useful for troubleshooting.

<br>

## Personalize a SAM CPP

1. Select the **SAM Personalization** tab.
2. Insert a blank SAM in the target SAM reader.
3. Insert the SAM SP in the origin SAM reader.
4. Set the parameters:
    * Parameter version and owner data (informative)
    * System keys KVC
    * Work keys KIF and KVC
    * Lock parameters
5. Click **Execute** to personalize your SAM.

<br>

## Refresh Reader Detection

If you connect or disconnect SAM readers while the application is running, you might need to switch between the tabs
(SAM Dump, SAM Personalization, Application Info) for the application to recognize the changes.

<br>

## Screenshots

### Installation
![Installation](/media/cna-tool-basic-legacysam-perso-app/install-dialog.png)

### Settings
![Settings](/media/cna-tool-basic-legacysam-perso-app/settings-dialog.png)

### SAM dump
![SAM dump](/media/cna-tool-basic-legacysam-perso-app/dump-tab.png)

### SAM personalization
![SAM personalization](/media/cna-tool-basic-legacysam-perso-app/personalization-tab.png)

### Application info
![Application info](/media/cna-tool-basic-legacysam-perso-app/info-and-logs-tab.png)

<br>

## Disclaimer

This tool is provided by CNA for its members. Only active CNA members are authorized to use this tool. A member is not
authorized to distribute this tool to other parties.

<br>

## User Requirements and Responsibilities

* **Target Audience:** users familiar with SAM personalization and the Calypso system.
* **Prerequisites:** necessary hardware (SAM readers) and software (drivers) installed and configured correctly.
* **Responsibilities:** ensure the correct selection of target and origin SAMs, and the proper handling of unlock values
  and other sensitive information.
* **Usage:** authorized personnel only. Misuse or unauthorized distribution is strictly prohibited.