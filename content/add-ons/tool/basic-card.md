---
title: Calypso keyset basic card personalization tool
linkTitle: 🚫 Basic Card Personalizer
aliases:
  - /assistance-tools/basic-card-personalizer/
type: book
toc: true
weight: 40
---

<br>

#### What is the Calypso Basic Card Personalization Tool?  

The Calypso Basic Card Personalization Tool is a desktop application designed for personalizing **Calypso Basic** cards by
injecting Application Identifiers (AID) and security keys.

**Key Features:**
- **AID and Key Injection**: Enables the injection of AID and encryption keys into a blank **Calypso Basic** card.
- **Dual Reader Setup**: Requires a Target Card Reader for the blank card and a SAM Reader containing the **SAM CPP** for secure key injection.

#### Why use the Calypso Basic Card Personalization Tool?

This tool is essential for operators seeking to personalize **Calypso Basic** cards for use on their network by
injecting keys stored in the **SAM CV/CV** available in the field. It utilizes a **SAM CPP** that has
been personalized using the [basic-legacysam-personalizer]({{< relref "./basic-sam/" >}}) tool.

<br>

This user guide explains how to personalize a **Calypso Basic** card (AID and keys injection).

<br>

## Hardware Requirements

This tool requires two PC/SC readers:

* **Target Card Reader:** this contactless reader holds the **blank card** you want to personalize.
* **SAM Reader:** this contact reader contains the **SAM CPP** used for keys injection.

<br>

## Installation

1. The software is available in a GitHub repository. Go to
   the [releases page](https://github.com/calypsonet/cna-tool-basic-legacysam-perso-app/releases) to download it. (Note:
   the GitHub repository is private. Please request access from [CNA](https://calypsonet.org)). Choose the installation
   file that matches your operating system:
    * **Windows:** `.msi` package
    * **macOS:** `.dmg` package (available in both arm64 version for Apple Silicon Macs and x64 version for Intel Macs)
    * **Linux:** `.deb` package
2. **Windows:** double-click the `.msi` package to start the installation process.
3. **macOS:**
    * Open the `.dmg` file and drag the application to the Applications folder
    * Since the application is not signed with an Apple developer certificate, you'll need to authorize it:
        1. When first launching the app, you may see a security warning
        2. Go to System Settings > Privacy & Security
        3. Scroll down to find the message about the blocked application
        4. Click "Open Anyway" to authorize the application
4. **Linux:** use your distribution's package manager to install the `.deb` package.
5. **Important note:** currently, the installer does not automatically create a shortcut in the Start Menu (Windows) or
   Applications menu (macOS). If you want quick access, you will need to create a shortcut manually.

<br>

## Launch the Tool

1. Once the installation is complete, you can find the executable in the installation directory. The default location
   varies depending on your operating system:
    * **Windows:** `C:\Program Files\cna-tool-basic-card-perso-app\`
    * **macOS:** `/Applications/cna-tool-basic-card-perso-app/`
    * **Linux:** `/opt/cna-tool-basic-card-perso-app/` (or in your user's home directory if you installed it
      locally)
2. Double-click the executable to launch the **Calypso Basic Card Personalization Tool**.

<br>

## Application UI

The application window has a top menu and two tabs:

### Settings Menu

1. Click the **Settings** menu.
2. Select the **Target Card Reader** name. This is where you will present your blank Calypso Basic card.
3. Select the **SAM Reader** name.
4. Enter the **SAM Unlock Value** if required.
5. Select the directory for the log file.

### Tabs

* **Basic Card Personalization:** configure and personalize the card. Set parameters like AID, KVC, and KIFs, and
  start/stop the personalization process.
* **Application Info:** view logs and events related to the application and card reader. Useful for troubleshooting.

<br>

## Personalize a Card

1. Select the **Basic Card Personalization** tab.
2. Insert the **SAM CPP** into the SAM reader.
3. Enter the personalization parameters:
    * **AID**
    * **System keys KVC**
    * **Work keys KIF and KVC**
4. Click **Start** to begin scanning for the card.
5. Present a blank card to the card reader's antenna.

<br>

## Refresh Reader Detection

If you connect or disconnect card readers while the application is running, switch between the tabs (Basic Card
Personalization, Application Info) to make the application recognize the changes.

<br>

## Screenshots

### Installation
{{< figure src="/media/cna-tool-basic-card-perso-app/install-dialog.png" alt="Installation" >}}

### Settings
{{< figure src="/media/cna-tool-basic-card-perso-app/settings-dialog.png" alt="Settings" >}}

### Card personalization
{{< figure src="/media/cna-tool-basic-card-perso-app/personalization-tab.png" alt="Card personalization" >}}

### Application info
{{< figure src="/media/cna-tool-basic-card-perso-app/info-and-logs-tab.png" alt="Application info" >}}

<br>

## Disclaimer

This tool is provided by CNA for its members. Only active CNA members are authorized to use this tool. A member is not
authorized to distribute this tool to other parties.

<br>

## User Requirements and Responsibilities

* **Target Audience:** users familiar with Calypso Basic card personalization. Basic knowledge of smart card technology
  and security concepts is assumed.
* **Prerequisites:** necessary hardware (card reader, SAM reader) and software (drivers) installed and configured
  correctly.
* **Responsibilities:** ensure correct selection of the target card and SAM, proper handling of unlock values and
  sensitive information, and entering the correct personalization parameters (AID, KVC, KIFs).
* **Usage:** authorized personnel only. Misuse or unauthorized distribution is strictly prohibited.