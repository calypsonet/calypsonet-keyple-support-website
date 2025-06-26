---
title: CNA member Keyple extension to manage contactless memory ticket solutions
linkTitle: 🚫 Storage Card
type: book
toc: true
weight: 300
---

<br>

For a long time, the Calypso card product range was limited to ‘Calypso Prime’, in order to cater for season ticket holders and regular travellers. But to manage 'occasional' travelers with single or limited-use card products, many ticketing systems used contactless memory ticketing solutions (such as Mifare UL, CT512, ST25) in addition to Calypso cards. Since then, the Calypso card range has been expanded with the Calypso Light and Calypso Basic solutions.
Pending migration to support Light and Basic products, many ticketing systems still require their terminals to handle Calypso cards alongside contactless memory ticket solutions. To assist CNA members and facilitate the management of contactless memory tickets on Calypso terminals based on the Keyple middleware: CNA offers its members the privilege of benefiting from Keyple extensions enabling them to process contactless memory tickets.
- 🌍All the APIs needed to support memory tickets are open source and hosted by the Keypop and Keyple projects.
- 🌍CNA also offers open source examples of contactless memory ticket processing.
- 🚫Only CNA members can benefit from CNA libraries supporting contactless memory ticket processing.

## Involved software components
In addition to the [Keyple global component dependency guide](https://keyple.org/components/overview/components-map/), the diagram below focuses on the components involved in handling contactless memory tickets.
{{< figure src="/media/cna-storagecard-support/storagecard_component_dependencies.svg" caption="" numbered="" >}}

## Terminal Interface to drive a transaction with contactless memory tickets
In order to facilitate the design of ticketing processing on a terminal interacting with contactless memory tickets, CNA has defined a dedicated universal interface: the [Storage Card API](https://terminal-api.calypsonet.org/specifications/card-layer-storagecard/storagecard-api/).

## Keypop API to drive a transaction with contactless memory tickets
An open source [Java translation of the Storage Card API](https://keypop.org/apis/card-layer-storagecard/storagecard-api/) definition has been released within the Eclipse Keypop project.

## CNA Library to process contactless memory tickets
In order to assist CNA members who need to combine Calypso card processing with contactless memory ticket processing on their Keyple-based ticketing terminals, CNA provides its members with a dedicated card extension: the [CNA Storage Card Lib](https://github.com/calypsonet/keyple-card-cna-storagecard-java-lib).

## Reader support for contactless memory tickets
To integrate smart card reader solutions with the Keyple middleware in a generic way, until now the Keyple project offered a simple plugin interface
- This [Keyple Plugin API](https://keyple.org/components/core/keyple-plugin-api/) needs to be implemented by a specific plugin for the various reader solutions.
- A [guide to developing plugins](https://keyple.org/learn/developer-guide/reader-plugin-add-on/) for reader solutions is also provided by the Keyple project.

Proprietary contactless ticket solutions do not support the level 4 of the ISO 14443 standard: these solutions are therefore not compatible with the “APDU command” envelope format defined by the ISO 7816-4 standard. Communication with contactless tickets therefore relies on exchanges of non-standardized “byte blocks”: specific processing by reader solutions is required to handle memory tickets.

### Native support of contactless memory tickets by PC/SC readers
The PC/SC standard has defined an [APDU 'Storage Card' envelope format](https://pcscworkgroup.com/Download/Specifications/pcsc3_v2.01.09.pdf) to standardize the way data blocks are exchanged with contactless memory tickets. This envelope format is used by the Storage Card library proposed by CNA.
Thus, the [PC/SC plugin](https://keyple.org/components/standard-reader-plugins/keyple-plugin-pcsc-lib/) proposed by the Keyple project is natively compliant to support communication with contactless memory tickets.

### Keyple interface for extending a plugin to manage memory ticket command wrapping
To support contactless memory tickets on Keyple terminals using reader solutions other than PC/SC, the reader plugin needs to manage the APDU wrapping of command blocks specific to contactless ticket solutions.
To facilitate and factorize the integration of APDU wrapping for plugins for reader solutions other than PC/SC, the Keyple project offers an additional API: the '[Plugin Storage Card API](https://keyple.org/components/core/keyple-plugin-storagecard-api/)'.

A reader plugin that uses this API can then be extended to support contactless memory tickets if it is interfaced with a library implementing this API.
- In the Keyple project, the [Android NFC plugin](https://github.com/eclipse-keyple/keyple-plugin-android-nfc-java-lib/tree/storage-card-api) has been updated to use this interface, enabling an NFC reader to integrate support for Mifare UltraLight tickets (as CT512 or ST25 products are not part of the NFC standard). (feature currently available in the ‘storage-card-api’ branch, integration in progress in the main branch)
- Among the Keyple 'add-ons' offered by CNA, the open source [plugin for Bluebird readers](https://github.com/calypsonet/keyple-plugin-cna-bluebird-specific-nfc-java-lib/tree/storagecard) has also evolved to use this API and thus support Mifare UL, CT512, and ST25 tickets (feature currently available in the ‘storagecard’ branch, integration in progress in the main branch)

### CNA Library to add contactless memory ticket command wrapping to Keyple plugins
To assist CNA members needing to integrate contactless memory ticket processing on a Keyple-based terminal with readers other than PC/SC: CNA provides a members-only library that enables APDU wrapping of ticket commands to be integrated into a Keyple plugin: the [Plugin Storage Card library](https://github.com/calypsonet/keyple-plugin-cna-storagecard-java-lib).

## example of a terminal application processing contactless memory tickets
All the applications of the CNA advanced ticketing demonstrator will be updated to integrate the processing of contactless ticketing solutions in addition to Calypso cards.
- The first application to integrate this support is the distributed ticket reloading service (for the time being in the 'storagecard' branch).
  - [contactless ticket memory selection](https://github.com/calypsonet/keyple-demo-ticketing-reloading-remote/blob/storagecard/client/keyple-mobile-android/app/src/main/kotlin/org/calypsonet/keyple/demo/reload/remote/domain/TicketingService.kt#L65)
  - [contactless memory ticket data writing](https://github.com/calypsonet/keyple-demo-ticketing-reloading-remote/blob/storagecard/server/src/main/java/org/calypsonet/keyple/demo/reload/remote/server/card/CardRepository.java#L207)
