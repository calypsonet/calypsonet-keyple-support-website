---
title: Keyple-based advanced ticketing demonstrator
linkTitle: 🌍 Advanced Ticketing Demo
aliases:
  - /keyple-support/ticketing-demo/
type: book
toc: true
weight: 110
---
To illustrate an advanced implementation of the Keyple Java middleware for Calypso-based ticketing systems, CNA has released **Keyple Demo Ticketing**, a complete ticketing demonstrator, under the <a href="https://opensource.org/license/bsd-3-clause">3-Clause BSD License</a>.

It covers the lifecycle of a contactless transit ticket: personalization of the card, sale and loading of the tickets (season pass, multi-trip ticket), access validation, and ticket inspection.

<br>

## Keyple integration patterns

Each component of the demonstrator illustrates a way of integrating Keyple in a ticketing system, with its own optimization targets.

| Component | Keyple integration | Optimization targets |
|---|---|---|
| [**Sales**](https://github.com/calypsonet/keyple-demo-ticketing/tree/main/src/sales) | Distributed application. The server, based on Keyple, holds the ticketing logic and the SAM. The light clients give access to the card, with or without Keyple (Keyple Interop libraries, Server JSON API). | Few network messages between client and server. Client on any light terminal, without Keyple. |
| [**Validation**](https://github.com/calypsonet/keyple-demo-ticketing/tree/main/src/validation) and [**Inspection**](https://github.com/calypsonet/keyple-demo-ticketing/tree/main/src/inspection) | Standalone Android applications based on Keyple, with the card and the SAM read locally. Inspection also works without a SAM (card authenticated by PKI, or read without authentication). | Few card and SAM commands during the transaction. |
| [**Common**](https://github.com/calypsonet/keyple-demo-ticketing/tree/main/src/common) | Library of the data model of the card. | — |

<br>

## Supported cards

- **Calypso cards**: the demonstrator works with the generic Calypso application of the [CNA test kit](../../../basics/test-kit/) cards.
- **Storage cards** (MIFARE Ultralight, ST25 SRT512, MIFARE Classic 1K): handled by the Android applications with the [CNA storage card libraries](../../card-ext/storage-card/), reserved for CNA members.

The cards and terminals supported by each application are detailed in the functional documentation of the demonstrator.

<br>

## Getting the demonstrator

- **Source code**: the <a href="https://github.com/calypsonet/keyple-demo-ticketing">keyple-demo-ticketing</a> repository, whose README describes the components, the supported terminals and platforms, and how to build and install them.
- **Applications**: attached to each release of the repository (see the <a href="https://github.com/calypsonet/keyple-demo-ticketing/releases/latest">latest release</a>).
- **Functional documentation**: attached as PDF and HTML files to each release. It describes the use cases, the business rules, and the messages of the demonstrator, as well as the data model of the card and the procedures executed on it.

{{% callout note %}}
The plugins of the Bluebird and Arrive terminals are open source (see [Keyple reader extensions](../../plugin-ext/)): integrators who have the native library of the terminal manufacturer can build them, then add them to the demonstrator. The storage card libraries are reserved for CNA members, and available on request. Without these components, the demonstrator is built with mocks: these terminals are not available, and the storage cards are not handled (see the <a href="https://github.com/calypsonet/keyple-demo-ticketing#proprietary-components">README</a>).
{{% /callout %}}
