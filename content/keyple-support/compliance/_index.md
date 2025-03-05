---
title: Interoperability & compliance of Keyple-based ticketing terminal solutions
linkTitle: Terminal compliance
type: book
toc: true
weight: 25
---
In order to guarantee interoperability between smart cards and terminals, the [‘Calypso Networks Association’ (CNA)](https://calypsonet.org/) encourages ticketing operators to [follow various specifications and certification processes](https://calypsonet.org/calypso-certification/#section-certification-for-terminals).

## Contactless reader *communication protocol*
For compliance with the contactless reader communication protocol, CNA supports the certification programme [standardised by the ‘Smart Ticketing Alliance’ (STA)](https://www.smart-ticketing.org/certification-1 ) for [‘Public Transport Readers’ (PT Readers)](https://www.smart-ticketing.org/certification-program ).
Several test laboratories are approved for [‘Proximity Coupling Device’ (PCD) certification](https://www.cna-paycert-certification.eu/rf-interface-2/ ) under the supervision of the ‘Certification Body’ Paycert.

## Separation and **functional logic** of the various software layers
To guarantee the functional capability of the ticketing terminals, CNA has proposed a software architecture with a distribution of responsibilities per layer, and has [defined dedicated functional requirements for each software layer](https://calypsonet.org/calypso-for-terminals/#section-how-to-implement-calypso-in-a-ticketing-terminal
).

### **Reader** software layer
For terminals integrating contactless and/or contact readers, the [Keyple's ‘Core’ libraries](https://keyple.org/components/core/) have been designed to meet the terminal requirements for the reader layer.
2 conditions must be met to guarantee « complete » compliance with the requirements of the reader layer:
- the versions of Keyple's core libraries must be [compliant with versions 2.0 or higher of the terminal Reader APIs](https://terminal-api.calypsonet.org/compliance/#from-reader-api-version-20--calypso-card-api-version-20),
- & the plugins used to interface with smart card readers must [follow the plugin development guide](https://keyple.org/learn/developer-guide/reader-plugin-add-on/).

Pending the future certification programme for reader layer libraries, CNA plans to [publish the self-declarations of conformity of the Keyple Core libraries for reader solutions](https://calypsonet.org/registered-readers/) interfaced with PC/SC and Android NFC plugins. 

### **Calypso** software layer
The [Keyple's ‘Calypso’ libraries](https://keyple.org/components/card-extensions/) have also been implemented to meet the terminal requirements for the Calypso layer, regardless of the reader solutions used.
2 conditions must be met to guarantee « complete » compliance with the requirements of the Calypso layer:
- the versions of Keyple's Calypso libraries must be [compliant with versions 2.0 or higher of the terminal Calypso APIs](https://terminal-api.calypsonet.org/compliance/#from-reader-api-version-20--calypso-card-api-version-20),
- & the reader software layer used as a basis (Keyple's ‘Core’ libraries + reader plugins) must comply with the terminal requirements for the reader layer.

Pending the future certification programme for Calypso layer libraries, CNA has [published the self-declarations of conformity of the Keyple Calypso libraries ](https://calypsonet.org/registered-calypso-layer-libraries/) (independently of interfaced reader solutions, but on the basis of a compliant reader software layer). 

### **Ticketing** software layer
For a ticketing terminal solution built on the Keyple framework, the responsibility for complying with the [requirements for the ticketing software layer](https://calypsonet.org/document/ticketing-layer-requirements-v2-0-200430/) lies exclusively with the developers of the terminal application using the [‘public’ Reader & Calypso terminal APIs](https://terminal-api.calypsonet.org/specifications/).
