---
title: Interoperability & compliance of Keyple-based ticketing terminal solutions
linkTitle: Terminal compliance
aliases:
  - /keyple-support/compliance/
type: book
toc: true
weight: 30
---
In order to guarantee interoperability between smart cards and terminals, the [‘Calypso Networks Association’ (CNA)](https://calypsonet.org/) encourages ticketing operators to [follow various specifications and certification processes](https://calypsonet.org/calypso-certification/#section-certification-for-terminals).

## Contactless reader *communication protocol*
For compliance with the contactless reader communication protocol, CNA supports the certification programme [standardised by the ‘Smart Ticketing Alliance’ (STA)](https://www.smart-ticketing.org/certification-1 ) for [‘Public Transport Readers’ (PT Readers)](https://www.smart-ticketing.org/certification-program ).
Several test laboratories are approved for [‘Proximity Coupling Device’ (PCD) certification](https://www.cna-paycert-certification.eu/rf-interface-2/ ) under the supervision of the ‘Certification Body’ Paycert.

## Separation and **functional logic** of the various software layers
To guarantee the functional capability of the ticketing terminals, CNA has proposed a software architecture with a distribution of responsibilities per layer, and has [defined dedicated functional requirements for each software layer](https://calypsonet.org/calypso-for-terminals/#section-how-to-implement-calypso-in-a-ticketing-terminal
).

## **Reader** software layer
For terminals integrating contactless and/or contact readers, the [Keyple's ‘Core’ libraries](https://keyple.org/components/core/) have been designed to meet the terminal requirements for the reader layer.
- In order to declare that a configuration of Keyple Core libraries and a smart card reader plugin are indeed compliant with the terminal requirements for the reader layer, the main condition is that the plugin used to interface the reader has been implemented according to the [Keyple plugin development guide](https://keyple.org/learn/developer-guide/reader-plugin-add-on/).

The Keyple project hosts plugins for interfacing reader solutions based on standardized APIs: PC/SC and Android NFC. Pending the future certification programme for reader layer libraries, CNA plans to [publish the self-declarations of conformity of the Keyple Core libraries for reader solutions](https://calypsonet.org/registered-readers/) interfaced with these plugins.

### Applicability et supported rules
For a smart card reader solution integrated with the “Keyple Core” software libraries, the applicability of the “reader layer” requirements depends primarily on the characteristics of the reader solution.

However, the Keyple Core libraries have a limitation regarding applicability: they do not support “Channels.”
- In fact, the `keyple-service-lib` component (in versions < 4) does not support multiple logical channels: with this version of Keyple Core, it is not possible to manage transactions across different logical channels on the same reader.
- Therefore, the `Channels` applicability must necessarily be set to false in the declaration of conformity.

For readers with `Contactless` applicability, compliance with requirement `RL-CL-RFSTA.2`, which mandates that the readers’ RF communication be certified by the STA (Smart Ticketing Alliance) or the NFC Forum, is the responsibility of the reader manufacturer.

Regarding the `Polling`, `RF Shut-off`, and `Protocol` application modes:
- Support for the associated requirements falls outside the scope of Keyple; it depends on the low-level driver specific to the reader solution.
- In 2026, verification of compliance with these requirements was transferred to the STA’s RF certification process.
- NFC Forum readers do not allow for configuring RF protocol polling. The RF field is not turned off by applications but rather by the device’s power-saving mode.

However, since keyple-service-lib 2.0.0, Keyple Core is capable of properly supporting all other applicable “reader layer” requirements for any integrated reader solution through a “reader plugin” that complies with the [Keyple plugin development guide](https://keyple.org/learn/developer-guide/reader-plugin-add-on/)
- For example, the `detection` applicability requires that the plugin implement the `ObservableReaderSpi` SPI. All requirements related to the `detection` applicability are supported.
- The `presence` applicability is always supported for a reader solution integrated with Keyple that also supports the “detection” applicability. The methodology used to manage card presence depends on the SPIs ( `CardPresenceMonitorBlockingSpi`, `CardRemovalWaiterNonBlockingSpi`, `CardRemovalWaiterAsynchronousSpi`, `CardRemovalWaiterBlockingSpi` ) implemented by the reader plugin.

Depending on the conditions of applicability, and provided that a compliant reader plugin is available, the Keyple Core software layer ensures that all of these requirements are properly supported by the reader layer:
`RL-CT-T0T1.2`, `RL-PON-IDENTIFY.2`, `RL-PON-FILTER.2`, `RL-DET-INSNOTIF.1`, `RL-DET-REMCTRL.1`, `RL-DET-REMNOTIF.1`, `RL-DET-REMCFG.1`, `RL-CMD-USED.1`, `RL-CMD-SHORT.2`, `RL-CMD-EXTENDED.2`, `RL-CMD-GROUP.2`, `RL-CMD-STOP.2`, `RL-CLA-ACCEPTED.2`, `RL-SW-ANALYSIS.2`, `RL-SW-61XX.1`, `RL-SW-6CXX.1`, `RL-SW-CASE4.2`, `RL-PERF-TIME.1`, `RL-SEL-USAGE.2`, `RL-SEL-CLA.1`, `RL-SEL-P2LC.2`, `RL-SEL-DFNAME.1`

### Properties of PC/SC and NFC reader solutions
<table>
	<thead>
		<tr>
			<th scope="col" rowspan="2">Applicability</th>
			<th scope="colgroup" colspan="2">Generic feature support for</th>
		</tr>
		<tr>
			<th scope="col">PC/SC readers</th>
			<th scope="col">Android NFC readers</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<td>Contact</td>
		<td><ul><li>yes, for PC/SC readers with a contact interface (both ISO 7816-3 T=0 & T=1 protocols are supported)</li><li>no, otherwise</li></ul></td>
		<td>no</td>
	</tr>
	<tr>
		<td>Contactless</td>
		<td><ul>
            <li>yes, for PC/SC readers with a contactless interface (at least both ISO 14443-4 type A & B protocols are supported)</li>
            <li>no, otherwise</li>
        </ul></td>
		<td>yes</td>
	</tr>
	<tr>
		<td>Detection</td>
		<td>yes</td>
		<td>yes</td>
	</tr>
	<tr>
		<td>Channels</td>
		<td>not yet supported by Keyple Core</td>
		<td>no</td>
	</tr>
	<tr>
		<td>Extended</td>
		<td>no</td>
		<td>no</td>
	</tr>
	<tr>
		<td>Polling</td>
		<td>no<br/>(some PC/SC reader solutions may provide configurable RF polling, but this setting is then managed through specific APIs that are not part of the PC/SC standard)</td>
		<td>no</td>
	</tr>
	<tr>
		<td>Presence</td>
		<td>yes</td>
		<td>no</td>
	</tr>
	<tr>
		<td>Protocol</td>
		<td>yes, all contactless readers support both ISO 14443 type A & B (optional proprietary protocols can be supported in addition to ISO 14443-4)</td>
		<td>yes, all NFC readers support both ISO 14443 type A & B (& additional proprietary mode ISO 14443-3A / JIS 6319-4, etc...)</td>
	</tr>
	<tr>
		<td>Selection</td>
		<td>yes<br/>(with a limitation for 'legacy' library sets, the DF Name selection API was managed at the Calypso software layer, instead of the reader software layer)</td>
		<td>yes<br/>(with a limitation for 'legacy' library sets, the DF Name selection API was managed at the Calypso software layer, instead of the reader software layer)</td>
	</tr>
	<tr>
		<td>Shut-off RF</td>
    	<td>no<br/>(some PC/SC reader solutions may feature configurable RF field shut-off, but this setting is then managed through specific APIs that are not part of the PC/SC standard)</td>
		<td>no</td>
	</tr>
</tbody>
</table>

### "Keyple Java Service 2026.10.14 set" definitions for PC/SC & Android NFC plugins
<table>
	<thead>
		<tr>
			<th scope="col" colspan="2"><i>Generic</i> Product Identification</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Set Name</th>
		<td>Keyple <b>Java</b> Service 2026.10.14 + <i>specific plugin</i></td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2026/10/14 or after</td>
	</tr>
	<tr>
		<th scope="row" rowspan="2">Library Versions</th>
		<td><ul>
			<li>keypop-card-java-api (internal API) : 2.0+</li>
			<li>keypop-reader-java-api (public API): 2.1+</li>
            <br/>
			<li>keyple-common-java-api (internal API): 2.0+</li>
			<li>keyple-plugin-java-api (internal API): 2.3+</li>
			<li>keyple-service-java-lib: 3.5.0+</li>
			<li>keyple-util-java-lib: 2.5.0+</li>
		</ul></td>
	</tr>
	<tr>
		<td>library of a reader plugin implementing the Keyple Plugin API</td>
    </tr>
</tbody>
</table>

<table>
	<thead>
		<tr>
			<th scope="col" colspan="3"><i>Specific</i> Product Identification</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Set Name</th>
		<td><span style="color: DarkOrange;">Keyple <b>Java</b> Service 2026.10.14 with <b>PC/SC</b> plugin</span></td>
		<td><span style="color: DarkOrange;">Keyple <b>Java</b> Service 2026.10.14 with <b>Android NFC</b> plugin</span></td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td colspan="2">2026/10/14 or <span style="color: DarkOrange;">after</span></td>
	</tr>
	<tr>
		<th scope="row" rowspan="2"><i>Specific</i> Plugin Library Version<br/>(in addition of Keyple Java Service libraries</th>
		<td><ul>
			<li>keyple-plugin-pcsc-java-lib: 2.6.3+</li>   
		</ul></td>
		<td><ul>
			<li>keyple-plugin-android-nfc-java-lib: 3.2.2+</li>   
		</ul></td>
	</tr>
</tbody>
</table>

<table>
	<thead>
		<tr>
			<th scope="col" colspan="2">Product Compatibility</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Smart Card<br/>Solution Layer</th>
		<td>Any smart card solution library based on:<ul>
			<li>keypop-card-java-api (internal API): 2.0+</li>
        </ul></td>
	</tr>
	<tr>
		<th scope="row">Ticketing Layer</th>
		<td>Any ticketing application based on:<ul>			
			<li>keypop-reader-java-api (public API): 2.1+</li>
		</ul></td>
	</tr>
</tbody>
</table>

### "Keyple C++ Service 2026.09.22 set" definition for PC/SC plugin

<table>
	<thead>
		<tr>
			<th scope="col" colspan="2"><i>Generic</i> Product Identification</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Set Name</th>
		<td>Keyple <b>C++</b> 2026.09.22 Service + <i>specific plugin</i></td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2026/09/22 or after</td>
	</tr>
	<tr>
		<th scope="row" rowspan="2">Library Versions</th>
		<td><ul>
			<li>keypop-card-cpp-api (internal API) : 2.0+</li>
			<li>keypop-reader-cpp-api (public API): 2.1+</li>
            <br/>
			<li>keyple-common-cpp-api (internal API): 2.0+</li>
			<li>keyple-plugin-cpp-api (internal API): 2.3+</li>
			<li>keyple-service-cpp-lib: 3.4.1+</li>
			<li>keyple-util-cpp-lib: 2.4.1+</li>
		</ul></td>
	</tr>
	<tr>
		<td>library of a reader plugin implementing the Keyple Plugin API</td>
    </tr>
</tbody>
</table>

<table>
	<thead>
		<tr>
			<th scope="col" colspan="2"><i>Specific</i> Product Identification</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Set Name</th>
		<td><span style="color: DarkOrange;">Keyple <b>C++</b> 2026.09.22 Service with <b>PC/SC</b> plugin set</span></td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td colspan="2">2026/09/22 or <span style="color: DarkOrange;">after</span></td>
	</tr>
	<tr>
		<th scope="row" rowspan="2"><i>Specific</i> Plugin Library Version<br/>(in addition of Keyple C++ Service libraries</th>
		<td><ul>
			<li>keyple-plugin-pcsc-cpp-lib: 2.6.3+</li>   
		</ul></td>
	</tr>
</tbody>
</table>

<table>
	<thead>
		<tr>
			<th scope="col" colspan="2">Product Compatibility</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Smart Card<br/>Solution Layer</th>
		<td>Any smart card solution library based on:<ul>
            <li>keypop-card-cpp-api (internal API): 2.0+</li>
        </ul></td>
	</tr>
	<tr>
		<th scope="row">Ticketing Layer</th>
		<td>Any ticketing application based on:<ul>			
            <li>keypop-reader-cpp-api (public API): 2.1+</li>
		</ul></td>
	</tr>
</tbody>
</table>

## **Calypso** software layer
The [Keyple's ‘Calypso’ libraries](https://keyple.org/components/card-extensions/) have also been implemented to meet the terminal requirements for the Calypso layer, regardless of the reader solutions used.
2 conditions must be met to guarantee « complete » compliance with the requirements of the Calypso layer:
- the versions of Keyple's Calypso libraries must be [compliant with versions 2.0 or higher of the terminal Calypso APIs](https://terminal-api.calypsonet.org/compliance/#from-reader-api-version-20--calypso-card-api-version-20),
- & the reader software layer used as a basis (Keyple's ‘Core’ libraries + reader plugins) must comply with the terminal requirements for the reader layer.

Pending the future certification programme for Calypso layer libraries, CNA has [published the self-declarations of conformity of the Keyple Calypso libraries ](https://calypsonet.org/registered-calypso-layer-libraries/) (independently of interfaced reader solutions, but on the basis of a compliant reader software layer).

### Calypso functional scope managed by Keyple
Supported Calypso card solutions:
- Using the  "Keyple Card Calypso Library" component in version 2.3.1+ or after: all Calypso Prime Extended features are supported → available both for Java and C++ implementations
- Starting from the "Keyple Card Calypso Crypto PKI Library" component in version 0.2+ or later: all Calypso Prime PKI features are supported → currently available only for the Java implementation; C++ porting is planned for the first quarter of 2027
- From the "Keyple Card Calypso Library" component in version 2.1+: all Calypso Prime Regular, Light and Basic features are supported.

Supported Calypso SAM Solutions:
- Since "Keyple Card Calypso Library" component in version 2.1+: Calypso secure processing is optimized based on the capabilities of security modules such as SAM-C1, SAM-S1E, and SAM-S1D. (Support for the C-SAM F solution has not been tested.)
- The middleware is ready to receive a future extension to manage Open SAM, thanks to the use of the "Calypso Crypto Symmetric API" interface.

### Terminal requirements support declarations
All terminal requirements defined for the Calypso software layer that are necessary to ensure proper interoperability with Calypso card and SAM solutions are fully handled by the Keyple  Calypso extension libraries.
Only a few requirements are, exceptionally, partially supported; here are the explanations.

The `CL-SEL-SNHEADER.2` requirement, which is used to support the Calypso `HCE` feature, is not supported. The middleware does not provide a way to automate the validation of HCE tokens. This lack has a limited impact: the project provides a [development guide for managing HCE token validity](https://keyple.org/learn/user-guide/calypso-application/#hce-service-handling).

Regarding the 'CL-PERF-HFLOW.1' requirement, the Keyple Calypso libraries have been designed to optimize card & SAM command exchanges with the best possible performance, depending on the terminal architecture:
- for an [embedded architecture](https://terminal-api.calypsonet.org/specifications/calypso-layer/calypso-card-api/#_regular_-secure-session-span-stylecolor-redoptimized-for-fast-embedded-performancespan) (saving latencies of between 1 and 10 milliseconds on transmissions with local readers),
- for a [distributed architecture](https://terminal-api.calypsonet.org/specifications/calypso-layer/calypso-card-api/#_regular_-secure-session-span-stylecolor-redoptimized-for-an-efficient-distributed-systemspan) (saving latencies of between 10 and 100 milliseconds on network exchanges with remote readers).

Support for requirements specific to the Prime PKI feature (`CL-PKI-ALGO.1`, `CL-PKI-VERIF.2`, `CL-PKI-PUBKEY.1`, `CL-PKI-RQMODE.1`) is only included in versions where this feature is available (Keyple Card Calypso Crypto PKI Library 0.2+).

`CL-SV-RECOVERY.1` is not supported: this requirement appears to be unnecessary. If a Stored Value transaction presents a risk of card communication interruption that needs to be handled: in this case, the SV transaction can be performed within a secure Calypso session that is closed with a “not ratified” state. In the event of a card communication interruption at the end of the transaction, the transaction recovery can then be easily managed based on the card’s ratification status.

### "Keyple Java Calypso Prime PKI 2026.10.14 set" definition
<table>
	<thead>
		<tr>
			<th scope="col" colspan="2">Product Identification</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Set Name</th>
		<td><span style="color: DarkOrange;">Keyple <b>Java</b> Calypso Prime <b>PKI</b> 2026.10.14 set</span></td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2026/10/14 or <span style="color: DarkOrange;">after</span></td>
	</tr>
	<tr>
		<th scope="row">Library Versions</th>
		<td><ul>
			<li>keypop-calypso-card-java-api (public API): 2.3+</li>
			<li>keypop-calypso-crypto-legacysam-java-api (public API) : 1.0+</li>
			<li>keypop-calypso-crypto-symmetric-java-api (internal API): 0.1+</li>
			<li>keypop-calypso-crypto-asymmetric-java-api (internal API): 0.2+</li>
            <br/>
			<li>keyple-card-calypso-java-lib: 3.3.0+</li>
			<li>keyple-card-calypso-crypto-legacysam-java-lib: 1.0.2+</li>
			<li>keyple-card-calypso-crypto-pki-java-lib: 0.2.4+</li>
		</ul></td>
	</tr>
</tbody>
</table>

<table>
	<thead>
		<tr>
			<th scope="col" colspan="2">Product Compatibility</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Reader Layer</th>
		<td>Keyple Core Java set:<ul>			
			<li>keypop-reader-java-api (public API): 2.1+</li>
			<li>keypop-card-java-api (internal API): 2.0+</li>
            <br/>
			<li>keyple-plugin-java-api (internal API): 2.3+</li>
			<li>keyple-common-java-api (internal API): 2.0+</li>
			<li>keyple-service-java-lib: 3.5.0+</li>
			<li>keyple-util-java-lib: 2.5.0+</li>
		</ul>Integrated with reader plugin implementing the Keyple Plugin API.</td>
	</tr>
	<tr>
		<th scope="row">Ticketing Layer</th>
		<td>Any ticketing application based on:<ul>			
			<li>keypop-reader-java-api (public API): 2.1+</li>
			<li>keypop-calypso-card-java-api (public API): 2.3+</li>
			<li>keypop-calypso-crypto-legacysam-java-api (public API) : 1.0+</li>
		</ul></td>
	</tr>
</tbody>
</table>

### "Keyple C++ Calypso Prime Extended 2026.09.22 set" definition
<table>
	<thead>
		<tr>
			<th scope="col" colspan="2">Product Identification</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Set Name</th>
		<td><span style="color: DarkOrange;">Keyple <b>C++</b> Calypso Prime <b>Extended</b> 2026.09.22 set</span></td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2026/09/22 or <span style="color: DarkOrange;">after</span></td>
	</tr>
	<tr>
		<th scope="row">Library Versions</th>
		<td><ul>
			<li>keypop-calypso-card-cpp-api (public API): 2.2+</li>
			<li>keypop-calypso-crypto-legacysam-cpp-api (public API) : 1.0+</li>
			<li>keypop-calypso-crypto-symmetric-cpp-api (internal API): 0.1+</li>
            <br/>
			<li>keyple-card-calypso-cpp-lib: 3.2.2+</li>
			<li>keyple-card-calypso-crypto-legacysam-cpp-lib: 1.0.1+</li>
		</ul></td>
	</tr>
</tbody>
</table>

<table>
	<thead>
		<tr>
			<th scope="col" colspan="2">Product Compatibility</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Reader Layer</th>
		<td>Keyple Core Java set:<ul>			
			<li>keypop-reader-cpp-api (public API): 2.1+</li>
			<li>keypop-card-cpp-api (internal API): 2.0+</li>
            <br/>
			<li>keyple-plugin-cpp-api (internal API): 2.3+</li>
			<li>keyple-common-cpp-api (internal API): 2.0+</li>
			<li>keyple-service-java-lib: 3.4.1+</li>
			<li>keyple-util-java-lib: 2.4.1+</li>
		</ul>Integrated with reader plugin implementing the Keyple Plugin API.</td>
	</tr>
	<tr>
		<th scope="row">Ticketing Layer</th>
		<td>Any ticketing application based on:<ul>			
			<li>keypop-reader-java-api (public API): 2.1+</li>
			<li>keypop-calypso-card-java-api (public API): 2.2+</li>
			<li>keypop-calypso-crypto-legacysam-java-api (public API) : 1.0+</li>
		</ul></td>
	</tr>
</tbody>
</table>

## **Ticketing** software layer
For a ticketing terminal solution built on the Keyple framework, the responsibility for complying with the [requirements for the ticketing software layer](https://calypsonet.org/document/ticketing-layer-requirements-v2-0-200430/) lies exclusively with the developers of the terminal application using the [‘public’ Reader & Calypso terminal APIs](https://terminal-api.calypsonet.org/specifications/).
