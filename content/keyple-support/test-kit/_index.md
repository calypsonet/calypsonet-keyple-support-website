---
title: Calypso cards & SAMs for running Keyple
linkTitle: Card & SAM testing
type: book
toc: true
weight: 20
---

## Mock of readers and smartcards

To test Keyple middleware without hardware (no smart card reader, and no smart card), the project provides:
- the ['Stub' plugin](https://keyple.org/components/standard-reader-plugins/keyple-plugin-stub-lib/), which simulates a virtual smart card reader, with various specific characteristics.
- in addition, the simple examples demonstrating the implementation of Keyple include generators for simulating in [Java](https://github.com/eclipse-keyple/keyple-java-example/tree/main/Example_Card_Calypso/src/main/java/org/eclipse/keyple/card/calypso/example/common) and [C++](https://github.com/eclipse-keyple/keyple-cpp-example/tree/master/Example_Card_Calypso/src/main/common) the “static” behavior of a Calypso card or SAM to APDU commands.

## Availability of a test kit with Calypso cards and SAMs

For “operational” testing, smart card reader solutions need to be integrated into the terminal with reader plugins (based on the Plugin API).
<br>CNA [sells test kits](https://calypsonet.org/technical-support-documentation/) including [various Calypso cards](https://calypsonet.org/document/keyple-test-kit-user-manual-v2-190207/) from [all ranges (Prime, Light, Basic)](https://calypsonet.org/calypso-for-cards/) and samples of [test legacy SAMs](https://calypsonet.org/document/calypso-sam-test-f5-user-manual-v8-110619/).

### Calypso Prime PKI Profile - settings

<iframe src="https://keyple-support.calypsonet.org/keyple-support-test-kit/210813-KeypleTestKit-CalypsoPrimePkiProfile_v3.htm"></iframe>