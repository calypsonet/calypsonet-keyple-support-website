---
title: Introduction to Keyple
linkTitle: Introduction to Keyple
type: book
toc: true
weight: 10
---
## Objectives for ticketing terminals

<span style="color: red;">**Ensure interoperability between ticketing terminals and contactless cards**</span>
- CNA has specified a set of [requirements for the different software layers of a ticketing terminal](https://keyple-support.calypsonet.org/keyple-support/introduction/#ticketing-terminal-requirements).

<span style="color: red;">**Enable ticketing applications to be portable independently of terminal solutions**</span>
- [CNA (the Calypso Networks Association)](https://calypsonet.org/) has standardized interfaces for the different software layers of a terminal: the [ticketing terminal APIs](https://terminal-api.calypsonet.org/).
- the [open-source **Eclipse Keypop**  project](https://keypop.org/) offers Java and C++ code translations of these interfaces for ticketing terminals .

<span style="color: red;">**Facilitate the implementation of ticketing terminals**</span>
- The [open-source **Eclipse Keyple** project](https://keyple.org/) initiated by CNA is a first reference implementation of the ticketing terminal interfaces.


## [Ticketing terminal requirements](https://calypsonet.org/calypso-for-terminals/#section-how-to-implement-calypso-in-a-ticketing-terminal)
To ensure interoperability between ticketing terminal solutions and contactless card solutions, CNA has specified requirements addressing specifically the 3 different software layers of ticketing terminals:
- [reader layer requirements](https://calypsonet.org/document/reader-layer-requirements-v2-0-200422/)
- [solution layer requirements](https://calypsonet.org/document/calypso-layer-requirements-v2-0-200423/)
- [ticketing layer requirements](https://calypsonet.org/document/ticketing-layer-requirements-v2-0-200430/)
  <br>(These 3 documents can be downloaded by registering on the CNA website.)

Generally, interoperability problems between cards and terminals are often due to non-compliance with one of these requirements.

Most of these terminal requirements are universal:
- The reader layer requirements are generic and have no connection with the Calypso solution; they apply to any terminal solution operating smart card readers.
- For a ticketing system using a contactless solution other than Calypso, solution-specific requirements can be defined for the software layer specific to this solution (as for Calypso).
- The requirements for the ticketing layer target terminal applications according to specific ticketing use cases: they are not necessarily linked to the Calypso solution.

## [Ticketing terminal APIs](https://terminal-api.calypsonet.org/)
The 'reader' and 'Calypso' APIs have been designed with a structure compatible with the terminal architecture on which the terminal requirements are based. So a solution implementing these APIs can meet the requirements of the reader and Calypso layers (responsibility for fulfilling the requirements of the ticketing layer lies with the applications).

### Portability of ticketing terminal applications
Another advantage of standardizing terminal APIs is that it also brings portability of terminal applications independently of reader or Calypso middleware solutions.

### Certification of ticketing terminal solutions
In the near future, for example, CNA plans to offer a certification service to check whether ticketing terminal solutions actually comply with terminal requirements for the reader and Calypso layers.
The middleware to be certified will then have to be based on standardized ticketing terminal APIs in order to be verified by the certification tool.


## [Keypop API](https://keypop.org/)
Eclipse Keypop offers Java and C++ code conversions of the API definitions for ticketing terminals: these faithfully follow the interface definitions issued by CNA.
These Java and C++ APIs are hosted by the Eclipse Foundation under the MIT open source license: a very permissive license that offers great flexibility to the middleware solutions implementing them (proprietary or open source).
These interfaces guarantee the independence of the terminal applications using them, from the middleware solutions implementing them.
- Eclipse Keyple is an initial reference implementation.
- Other projects have expressed interest in proposing alternative implementations of Keypop APIs.

## [Keyple middleware](https://keyple.org/)
Eclipse Keyple is an open source middleware solution implementing the Keypop APIs.

### Openness
Two implementations of Keyple are available in Java and C++, hosted by the Eclipse Foundation under the Eclipse Public License version 2.0. This license offers great flexibility to terminal solutions (proprietary or open source) using Keyple libraries.
<br>Keyple is a truly open project: it does not belong to one particular company, which can decide at any time to close the project for further development. The advantage of joining the Eclipse Foundation is that it guarantees that the solution respects intellectual property rights, and that the project's governance is open. Anyone in the open source community can contribute, the project is driven by its contributors.

### Scalability
In addition to implementing the terminal APIs in compliance with the terminal's requirements, the Keyple solution also provides extension capabilities:
- Plugin APIs can be used to interface any smart card reader hardware solution.
- Distributed APIs can be used to design distributed architectures for remote control of smartcard readers, regardless of communication mode.

### Completeness & maintenability
The 2 main strengths of the Keyple solution:
- The Keyple Calypso module is probably the most complete Calypso middleware on the market: it supports all card transaction features.
- Keyple's modular design enables the solution to be easily maintained and flexibly upgraded (a sustained rate of 80 software component upgrades per year over the last 3 years). In the near future, Keyple will be able to offer rapidly the OpenSAM support.

### Getting started practical
To use, integrate or extend Keyple, it is not necessary to have complete knowledge of the inner working of Keyple. The “learn” section of the Keyple website offers a number of [practical guides](https://keyple.org/learn/user-guide/) addressing different needs:
- designing a stand-alone embedded terminal application,
- designing a distributed terminal application,
- developing a Calypso-based application,
- managing an HSM solution, or simulating an HSM solution with a smartcard reader farm,
- develop a plugin to interface another smartcard reader solution,
- develop a new extension library to handle other types of smartcard solution.

The Keyple project also includes many simple [examples in Java and C++ code](https://keyple.org/learn/code-samples/) to illustrate all these types of development.

CNA's technical support also offers a more advanced Calypso example on implementing the Keyple solution with an open source [complete Keyple ticketing demonstrator](../ticketing-demo/): including remote ticket reloading, embedded validation and control.
<br>CNA also [supplies test cards and SAMs](../test-kit/) for running Keyple.
