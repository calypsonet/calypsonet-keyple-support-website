---
title: Integrating a smartcard reader solution
linkTitle: Reader integration
aliases:
  - /keyple-support/reader-plugins/
type: book
toc: true
weight: 40
---
## Properties of a smartcard reader solution through the Reader API
In order to operate smartcard reader solutions, a ticketing application on a Keyple-based terminal uses the « generic » [terminal reader API](https://terminal-api.calypsonet.org/specifications/reader-layer/reader-api/).
The use of this interface is independent of the Keyple solution. The Reader API categorizes the smartcard readers into 2 types:
- “simple” card readers, which only manage “synchronously” the card application selection,
- “observable” card readers, which also support “asynchronous” card application selection.

In general, all “contactless” reader solutions are observable, because for these readers the smartcard is always removable: it is necessarily necessary to notify applications of card insertion or removal events from the reader's RF field.
On the other hand, for some “contact” reader solutions, card presence is statically defined: these readers don't need to be observed.

## Properties of a smartcard reader solution through the Keyple Service API
For a Keyple-based terminal, smartcard reader solutions are interfaced using reader plug-ins. Keyple's Service API enables ticketing terminal applications to access “locally” 3 categories of reader solutions:
- a “simple” plugin enables only static configuration of smartcard readers → the most common case in embedded systems.
- an “observable” plugin enables the management of reader solutions that can be hot-plugged or hot-disconnected. → mainly 2 uses: readers connected over serial links (e.g. USB), or mobile solutions with an energy-saving mode (reader power supply cut off at standby).
- a “pool” plugin for interfacing with solutions offering dynamic allocation of reader resources according to the need. → this is how an HSM-type solution works.

## Integrating a smartcard reader solution into Keyple through the Plugin API
For a Keyple-based terminal, a dedicated plug-in for any smart card reader solution must implement Keyple's Plugin API:
- SPIs are differentiated in particular for the 2 reader types and the 3 plug-in categories.
- other features are linked to the native API capabilities of reader solutions:
    - autonomy to manage the Select Application command
    - autonomous synchronous, autonomous asynchronous or non-autonomous card insertion detection,
    - detection of card withdrawal at the end of a transaction, managed autonomously (synchronous or asynchronous) or non-autonomous,
    - ability to detect card removal during a card transaction

The Keyple project offers a [guide for developing plugins](https://keyple.org/learn/developer-guide/reader-plugin-add-on/) to integrate smartcard reader solutions.

##plugins available for interfacing with reader solutions
The Keyple project already hosts several [plugins for interfacing with "standard" smartcard reader solutions](https://keyple.org/components/standard-reader-plugins/) (PC/SC, Android NFC / OMAPI), or for emulating readers.

To illustrate some other ways of designing plugins, CNA has also released [additional plugins](../../add-ons/plugin-ext/).
