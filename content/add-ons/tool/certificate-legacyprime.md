---
title: Calypso Legacy Prime Certificate Generation Tool
linkTitle: 🌍 Legacy Prime Certificates
type: book
toc: true
weight: 430
---

<br>

#### What is the Calypso Legacy Prime Certificate Generation Tool?

The **Calypso Legacy Prime Certificate Generation Tool** is a set of libraries and demonstration applications designed to manage the generation and validation of certificates compliant with the **Calypso Legacy Prime** specification.

It allows for the creation of a chain of trust from a **Prime Certificate Authority (PCA)** to **Intermediate CAs** and finally to **Calypso Cards**.

**Key Features:**
- **Certificate Generation**: Create CA (Certificate Authority) and Card certificates.
- **Certificate Store**: Manage PCA public keys and CA certificates for validation.
- **Certificate Validation**: Parse and validate certificate signatures using RSA 2048-bit keys.
- **Hybrid Cryptography**: Support for RSA 2048-bit (for CAs) and ECC secp256r1 (for cards).
- **ISO 9796-2 PSS**: Implementation of RSA signatures with message recovery to optimize certificate size.

#### Why use the Calypso Legacy Prime Certificate Generation Tool?

This tool is essential for developers and operators who need to:
- Implement a PKI (Public Key Infrastructure) for Calypso Legacy Prime systems.
- Generate valid card certificates for secure transactions.
- Understand and test the Calypso certificate chain of trust.
- Integrate certificate management into their own back-office or personalization systems.

<br>

## Involved software components

The solution is divided into three main components:

1.  **JVM API**: Defines the generic interfaces for certificate generation, storage, and signing.
2.  **JVM Lib**: The reference Java implementation of the API, providing the cryptographic logic and certificate building.
3.  **Demonstration App**: A console-based application showing how to use the libraries in various scenarios.

{{< figure src="/media/cna-tool-certificate-legacyprime/api_class_diagram.svg" caption="Class diagram of the Calypso Legacy Prime Certificate API" numbered="true" >}}

<br>

## How to use the API

### 1. Initialize the Service

```java
CalypsoCertificateLegacyPrimeService service =
    CalypsoCertificateLegacyPrimeService.getInstance();

CalypsoCertificateLegacyPrimeApiFactory factory =
    service.getCalypsoCertificateLegacyPrimeApiFactory();

CalypsoCertificateLegacyPrimeStore store =
    factory.getCalypsoCertificateLegacyPrimeStore();
```

### 2. Load PCA Public Key

The store manages the root of trust by holding PCA public keys.

```java
// From a raw RSA modulus (256 bytes)
byte[] pcaPublicKeyModulus = ...;
store.addPcaPublicKey(pcaKeyReference, pcaPublicKeyModulus);
```

### 3. Generate CA Certificate

Use the factory to create a generator and provide a signer implementation (SPI).

```java
CalypsoCaCertificateLegacyPrimeGenerator caGenerator =
    factory.createCalypsoCaCertificateLegacyPrimeGenerator(
        issuerKeyReference,
        customSigner);

byte[] caCertificate = caGenerator
    .withCaPublicKey(caKeyReference, caPublicKey)
    .withStartDate(2024, 1, 1)
    .withEndDate(2034, 12, 31)
    .withCaRights(0x0A) // May sign CA and Card
    .generate();

// Add the generated CA to the store for further card signing
store.addCalypsoCaCertificateLegacyPrime(caCertificate);
```

### 4. Generate Card Certificate

```java
CalypsoCardCertificateLegacyPrimeGenerator cardGenerator =
    factory.createCalypsoCardCertificateLegacyPrimeGenerator(
        caKeyReference,
        customSigner);

byte[] cardCertificate = cardGenerator
    .withCardAid(cardAid)
    .withCardPublicKey(cardEccPublicKey) // 64 bytes (X+Y)
    .withCardSerialNumber(serialNumber)
    .withStartDate(2024, 1, 1)
    .withEndDate(2029, 12, 31)
    .generate();
```

<br>

## Demonstration Project

An open-source [demonstration project](https://github.com/calypsonet/cna-demo-calypso-certificate-legacyprime-generator-app) is available to illustrate the full lifecycle:

- **In-Memory Demo**: Quick demonstration with ephemeral keys.
- **Advanced Demo**: Shows how to manage persistent keys in **PEM format**.
- **Self-Signed CA**: Demonstrates a root CA configuration.

### Prerequisites
- **Java 11** or higher.
- **Gradle 7** or higher.

### Quick Launch
```bash
# Build the demo
./gradlew build

# Run the in-memory demonstration
java -cp "build/classes/java/main:..." \
  org.calypsonet.demo.calypso.certificate.legacyprime.generator.CalypsoCertificateDemoInMemory
```

<br>

## Certificate Formats

| Certificate Type | Size | Signature Type |
|---|---|---|
| **CA Certificate** | 384 bytes | RSA 2048-bit (ISO 9796-2 PSS) |
| **Card Certificate** | 316 bytes | RSA 2048-bit with message recovery |

<br>

## Resources

- **GitHub Repositories**:
    - [UML API](https://github.com/calypsonet/calypsonet-terminal-calypso-certificate-legacyprime-uml-api) (Design and specifications)
    - [JVM API](https://github.com/calypsonet/calypsonet-terminal-calypso-certificate-legacyprime-jvm-api)
    - [JVM Lib](https://github.com/calypsonet/calypsonet-terminal-calypso-certificate-legacyprime-jvm-lib)
    - [Console Demo](https://github.com/calypsonet/cna-demo-calypso-certificate-legacyprime-generator-app)
- **License**:
    - API: **MIT License**
    - Library: **EPL-2.0**
    - Demo: **3-Clause BSD License**

<br>

## Disclaimer

This software is provided by CNA to facilitate the implementation of Calypso systems. Users are responsible for the secure management of their private keys and the integrity of their PKI infrastructure.
