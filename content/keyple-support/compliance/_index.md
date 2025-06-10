---
title: Interoperability & compliance of Keyple-based ticketing terminal solutions
linkTitle: Terminal compliance
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

## Variations of Keyple libraries sets
Different sets of Keyple libraries are available depending on the programming <span style="color: DarkOrange;">language</span>: Java or C++.

For the reader and Calypso software layers, Keyple maintenance is performed for the last two <span style="color: DarkOrange;">generation</span>s of libraries:
- the nominal branch (the most recent) based on Eclipse Keypop terminal APIs, for which upgrades and fixes are actively produced: Service & Calypso Card Keyple libraries with a major version number greater than or equal to 3.0.0.
- and the <b>legacy</b> branch based on CNA terminal APIs, for which only patches continue to be supplied: Service & Calypso Card Keyple libraries with a major version number between 2.0.0 and 3.0.0 (Keyple libraries prior to 2.0.0 are archived).

Further, Keyple's Calypso libraries' <span style="color: DarkOrange;">feature</span>s have also been regularly enhanced: first Prime Regular, then Extended and PKI. Command injection countermeasures have also moved from a permissive to a stricter implementation.

## **Reader** software layer
For terminals integrating contactless and/or contact readers, the [Keyple's ‘Core’ libraries](https://keyple.org/components/core/) have been designed to meet the terminal requirements for the reader layer.
- In order to declare that a configuration of Keyple Core libraries and a smart card reader plugin are indeed compliant with the terminal requirements for the reader layer, the main condition is that the plugin used to interface the reader has been implemented according to the [Keyple plugin development guide](https://keyple.org/learn/developer-guide/reader-plugin-add-on/).

The Keyple project hosts plugins for interfacing reader solutions based on standardized APIs: PC/SC and Android NFC. Pending the future certification programme for reader layer libraries, CNA plans to [publish the self-declarations of conformity of the Keyple Core libraries for reader solutions](https://calypsonet.org/registered-readers/) interfaced with these plugins:
- [Keyple Java Service with PC/SC plugin set](https://keyple-support.calypsonet.org/keyple-support/compliance/#keyple-java-service-sets-definitions-for-pcsc--android-nfc-plugins-still-span-stylecolor-darkorangeupdatedspan)
- [Keyple Java Service with Android NFC plugin set](https://keyple-support.calypsonet.org/keyple-support/compliance/#keyple-java-service-sets-definitions-for-pcsc--android-nfc-plugins-still-span-stylecolor-darkorangeupdatedspan)
- [Keyple Legacy Java Service with PC/SC plugin set](https://keyple-support.calypsonet.org/keyple-support/compliance/#keyple-legacy-java-service-sets-definitions-for-pcsc--android-nfc-plugins-still-span-stylecolor-darkorangefixedspan)
- [Keyple Legacy Java Service with Android NFC plugin set](https://keyple-support.calypsonet.org/keyple-support/compliance/#keyple-legacy-java-service-sets-definitions-for-pcsc--android-nfc-plugins-still-span-stylecolor-darkorangefixedspan)
- [Keyple C++ Service with PC/SC plugin set](https://keyple-support.calypsonet.org/keyple-support/compliance/#keyple-legacy-c-service-set-definition-for-pcsc-plugin-still-span-stylecolor-darkorangefixedspan)

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
		<td>not yet supported</td>
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

### Terminal requirements support declarations
For "contactless" readers, the 'RL-CL-RFSTA.2' rule defines the need for the product's RF properties to be certified according to the scheme defined by the STA. This RF certification of a smart card reader is under the manufacturer's responsibility.
- All NFC readers are "self-declared" by NFC reader manufacturers as compliant with the NFC Forum. This NFC declaration is recognized by the STA and thus implicitly considered as compliant with STA certification.
- Most of PC/SC contactless readers are by default not STA-certified.

For reader solutions with the 'Selection' applicability, rules regulate “DF Name” processing.
- For legacy library sets, these rules are respected, but the API used to set the DF Name to be selected was then accessed at the Calypso layer, instead of the reader layer.
- Nominal versions of library sets correctly handle DF Name settings at the reader layer.

Except for RF certification and ‘DF Name’ selection rules, all other terminal requirements defined by CNA for the reader layer, applicable according to the properties of the PC/SC or NFC reader solutions, are fully supported by default.

All other reader layer requirements are fully supported if the reader plugin is developed in accordance with the development guide.

### 'Keyple Java Service sets' definitions for PC/SC & Android NFC plugins (still <span style="color: DarkOrange;">updated</span>)
<table>
	<thead>
		<tr>
			<th scope="col" colspan="2"><i>Generic</i> Product Identification</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Set Name</th>
		<td>Keyple <b>Java</b> Service + <i>specific plugin</i> set</td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2023/11/28 or after</td>
	</tr>
	<tr>
		<th scope="row" rowspan="2">Library Versions</th>
		<td><ul>
			<li>keypop-card-java-api (internal API) : 2.0+</li>
			<li>keypop-reader-java-api (public API): 2.0+</li>
            <br/>
			<li>keyple-common-java-api (internal API): 2.0+</li>
			<li>keyple-plugin-java-api (internal API): 2.2 to 2.3+</li>
			<li>keyple-service-java-lib: 3.0.0 to 3.3.5+</li>
			<li>keyple-util-java-lib: 2.3.0 to 2.4.0+</li>
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
		<td><span style="color: DarkOrange;">Keyple <b>Java</b> Service with <b>PC/SC</b> plugin set</span></td>
		<td><span style="color: DarkOrange;">Keyple <b>Java</b> Service with <b>Android NFC</b> plugin set</span></td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td colspan="2">2023/11/28 or <span style="color: DarkOrange;">after</span></td>
	</tr>
	<tr>
		<th scope="row" rowspan="2"><i>Specific</i> Plugin Library Version<br/>(in addition of Keyple Java Service libraries</th>
		<td><ul>
			<li>keyple-plugin-pcsc-java-lib: 2.0.0 to 2.4.2+</li>   
		</ul></td>
		<td><ul>
			<li>keyple-plugin-android-nfc-java-lib: 2.0.0 to 3.0.0+</li>   
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
			<li>keypop-reader-java-api (public API): 2.0+</li>
		</ul></td>
	</tr>
</tbody>
</table>

### 'Keyple Legacy Java Service sets' definitions for PC/SC & Android NFC plugins (still <span style="color: DarkOrange;">fixed</span>)

<table>
	<thead>
		<tr>
			<th scope="col" colspan="2"><i>Generic</i> Product Identification</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Set Name</th>
		<td>Keyple <b>Legacy Java</b> Service + <i>specific plugin</i> set</td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2021/10/06 or after</td>
	</tr>
	<tr>
		<th scope="row" rowspan="2">Library Versions</th>
		<td><ul>
            <li>calypsonet-terminal-reader-java-api (public API): 1.0 to 1.3</li>
            <li>calypsonet-terminal-card-java-api (internal API): 1.0</li>
            <br/>
            <li>keyple-plugin-java-api (internal API): 2.0 to 2.3</li>
            <li>keyple-common-java-api (internal API): 2.0</li>
            <li>keyple-service-java-lib: 2.0.0 to 2.3.6+ (<3.0.0)</li>
            <li>keyple-util-java-lib: 2.0.0 to 2.3.1</li>
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
		<td><span style="color: DarkOrange;">Keyple <b>Legacy Java</b> Service with <b>PC/SC</b> plugin set</span></td>
		<td><span style="color: DarkOrange;">Keyple <b>Legacy Java</b> Service with <b>Android NFC</b> plugin set</span></td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td colspan="2">2022/10/26 or <span style="color: DarkOrange;">after</span></td>
	</tr>
	<tr>
		<th scope="row" rowspan="2"><i>Specific</i> Plugin Library Version<br/>(in addition of Keyple Java Service libraries</th>
		<td><ul>
			<li>keyple-plugin-pcsc-java-lib: 2.0.0 to 2.4.2+</li>   
		</ul></td>
		<td><ul>
			<li>keyple-plugin-android-nfc-java-lib: 2.0.0 to 3.0.0+</li>   
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
            <li>calypsonet-terminal-card-java-api (internal API): 1.0</li>
        </ul></td>
	</tr>
	<tr>
		<th scope="row">Ticketing Layer</th>
		<td>Any ticketing application based on:<ul>			
            <li>calypsonet-terminal-reader-java-api (public API): 1.0 to 1.3</li>
		</ul></td>
	</tr>
</tbody>
</table>

### 'Keyple Legacy C++ Service set' definition for PC/SC plugin (still <span style="color: DarkOrange;">fixed</span>)

<table>
	<thead>
		<tr>
			<th scope="col" colspan="2"><i>Generic</i> Product Identification</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Set Name</th>
		<td>Keyple <b>Legacy C++</b> Service + <i>specific plugin</i> set</td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2022/07/06 or after</td>
	</tr>
	<tr>
		<th scope="row" rowspan="2">Library Versions</th>
		<td><ul>
            <li>calypsonet-terminal-reader-cpp-api (public API): 1.0 to 1.1</li>
            <li>calypsonet-terminal-card-cpp-api (internal API): 1.0</li>
            <br/>
            <li>keyple-plugin-cpp-api (internal API): 2.0</li>
            <li>keyple-common-cpp-api (internal API): 2.0</li>
            <li>keyple-service-cpp-lib: 2.0.1 to 2.1.1.1+ (<2.2)</li>
            <li>keyple-util-cpp-lib: 2.0.0 to 2.3.0.4</li>
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
		<td><span style="color: DarkOrange;">Keyple <b>C++</b> Service with <b>PC/SC</b> plugin set</span></td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td colspan="2">2022/10/26 or <span style="color: DarkOrange;">after</span></td>
	</tr>
	<tr>
		<th scope="row" rowspan="2"><i>Specific</i> Plugin Library Version<br/>(in addition of Keyple Java Service libraries</th>
		<td><ul>
			<li>keyple-plugin-pcsc-cpp-lib: 2.0.0 to 2.1.0.1+</li>   
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
            <li>calypsonet-terminal-card-cpp-api (internal API): 1.0</li>
        </ul></td>
	</tr>
	<tr>
		<th scope="row">Ticketing Layer</th>
		<td>Any ticketing application based on:<ul>			
            <li>calypsonet-terminal-reader-cpp-api (public API): 1.0 to 1.1</li>
		</ul></td>
	</tr>
</tbody>
</table>

## **Calypso** software layer
The [Keyple's ‘Calypso’ libraries](https://keyple.org/components/card-extensions/) have also been implemented to meet the terminal requirements for the Calypso layer, regardless of the reader solutions used.
2 conditions must be met to guarantee « complete » compliance with the requirements of the Calypso layer:
- the versions of Keyple's Calypso libraries must be [compliant with versions 2.0 or higher of the terminal Calypso APIs](https://terminal-api.calypsonet.org/compliance/#from-reader-api-version-20--calypso-card-api-version-20),
- & the reader software layer used as a basis (Keyple's ‘Core’ libraries + reader plugins) must comply with the terminal requirements for the reader layer.

Pending the future certification programme for Calypso layer libraries, CNA has [published the self-declarations of conformity of the Keyple Calypso libraries ](https://calypsonet.org/registered-calypso-layer-libraries/) (independently of interfaced reader solutions, but on the basis of a compliant reader software layer):
- [Keyple Java Calypso Prime PKI set 2](https://keyple-support.calypsonet.org/keyple-support/compliance/#keyple-java-calypso-prime-pki-set-2-definition-still-span-stylecolor-darkorangeupdatedspan)
- [Keyple Java Calypso Prime PKI set](https://keyple-support.calypsonet.org/keyple-support/compliance/#keyple-java-calypso-prime-pki-set-definition)
- [Keyple Java Calypso Prime Extended set](https://keyple-support.calypsonet.org/keyple-support/compliance/#keyple-java-calypso-prime-extended-set-definition)
- [Keyple Legacy Java Calypso Prime Extended set 2](https://keyple-support.calypsonet.org/keyple-support/compliance/#keyple-legacy-java-calypso-prime-extended-set-2-definition-still-span-stylecolor-darkorangefixedspan)
- [Keyple Legacy Java Calypso Prime Extended set](https://keyple-support.calypsonet.org/keyple-support/compliance/#keyple-legacy-java-calypso-prime-extended-set-definition)
- [Keyple Legacy Java Calypso Prime Regular set](https://keyple-support.calypsonet.org/keyple-support/compliance/#keyple-legacy-java-calypso-prime-regular-set-definition)
- [Keyple Legacy C++ Calypso Prime Regular set 2](https://keyple-support.calypsonet.org/keyple-support/compliance/#keyple-legacy-c-calypso-prime-regular-set-2-definition-still-span-stylecolor-darkorangefixedspan)
- [Keyple Legacy C++ Calypso Prime Regular set](https://keyple-support.calypsonet.org/keyple-support/compliance/#keyple-legacy-c-calypso-prime-regular-set-definition)

### Terminal requirements support declarations
For the various Keyple Calypso library sets, all applicabilities and terminal requirements are supported, except for those listed in the table below.
- For requirements for which support is conditional on the availability of specific features, support has been integrated at the same time as the addition of the corresponding feature.
- Prior to the integration of Eclipse Keypop, Keyple libraries were based on terminal APIs implemented and published by CNA: the Keyple libraries sets corresponding to these old configurations contain the word “legacy” in their name.

For older configurations, the 'CL-CSS-RESPLE.1' requirement, the countermeasure was initially implemented in a ‘permissive’ way, requiring applications to set only card commands for which the response size can be predetermined. More recent configurations benefit from a more 'strict' implementation of the countermeasure, which is compliant regardless of the processing set at application level as indicated [in the Calypso development guide](https://keyple.org/learn/user-guide/calypso-application/#legacy-card-authentication).

The lack of official support for the “HCE” functionality and the related 'CL-SEL-SNHEADER.2' requirement is not a limitation to correctly processing Calypso HCE solutions, as the HCE token data can still be recovered as described [in the Calypso development guide](https://keyple.org/learn/user-guide/calypso-application/#hce-service-handling).

About the 'CL-PERF-HFLOW.1' requirement, the Keyple Calypso libraries have been designed to optimize card & SAM command exchanges with the best possible performance, depending on the terminal architecture:
- for an [embedded architecture](https://terminal-api.calypsonet.org/specifications/calypso-layer/calypso-card-api/#_regular_-secure-session-span-stylecolor-redoptimized-for-fast-embedded-performancespan) (saving latencies of between 1 and 10 milliseconds on transmissions with local readers),
- for a [distributed architecture](https://terminal-api.calypsonet.org/specifications/calypso-layer/calypso-card-api/#_regular_-secure-session-span-stylecolor-redoptimized-for-an-efficient-distributed-systemspan) (saving latencies of between 10 and 100 milliseconds on network exchanges with remote readers).

Concerning the 'CL-CMD-GETPUT.1' requirement, the “Get/Put Data” applicability support is limited to the management of the 'Get Data' command. The optional 'Put Data' command is not supported.

<table>
	<thead>
		<tr>
			<th scope="col" rowspan="2">Keyple Calypso layer libraries</th>
			<th scope="colgroup" colspan="2">Active maintenance</th>
			<th scope="col" rowspan="2">Limitation</th>
			<th scope="colgroup" colspan="2">Unsupported</th>
		</tr>
		<tr>
			<th scope="col">Java</th>
			<th scope="col">C++</th>
            <th scope="col">Calypso card applicability</th>
			<th scope="col">Requirement</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Calypso Prime <b>PKI</b> set <b>2</b></th>
		<td><span style="color: DarkOrange;">evolution</span></td>
		<td><span style="color: DarkOrange;">evolution</span></td>
		<td>-</td>
		<td rowspan="2"><ul><li>HCE</li></ul></td>
		<td rowspan="2"><ul><li>CL-SEL-SNHEADER.2</li></ul></td>
	</tr>
	<tr>
		<th scope="row">Calypso Prime <b>PKI</b> set</th>
		<td>no</td>
		<td>-</td>
		<td>permissive CL-CSS-RESPLE.1</td>
	</tr>
	<tr>
		<th scope="row"><b>Legacy</b> Calypso Prime <b>Extended</b> set 2</th>
		<td><span style="color: DarkOrange;">patch</span></td>
		<td>-</td>
		<td>-</td>
		<td rowspan="3"><ul><li>Prime PKI</li><li>HCE</li></ul></td>
		<td rowspan="3"><ul>
			<li>CL-SEL-SNHEADER.2</li>
			<li>CL-RAT-PKIMODE.2</li>
			<li>CL-SV-PKIMODE.1</li>
			<li>CL-PKI-ALGO.1</li>
			<li>CL-PKI-VERIF.2</li>
			<li>CL-PKI-PUBKEY.1</li>
			<li>CL-PKI-RQMODE.1</li>			
		</ul></td>
	</tr>
	<tr>
		<th scope="row">Calypso Prime <b>Extended</b> set</th>
		<td>no</td>
		<td>-</td>
		<td rowspan="2">permissive CL-CSS-RESPLE.1</td>
	</tr>
	<tr>
		<th scope="row"><b>Legacy</b> Calypso Prime <b>Extended</b> set</th>
		<td>no</td>
		<td>-</td>
	</tr>
	<tr>
		<th scope="row"><b>Legacy</b> Calypso Prime <b>Regular</b> set 2</th>
		<td>-</td>
		<td><span style="color: DarkOrange;">patch</span></td>
		<td>-</td>
		<td rowspan="2"><ul><li>Prime PKI</li><li>Prime Extended</li><li>HCE</li></ul></td>
		<td rowspan="2"><ul>
			<li>CL-SEL-SNHEADER.2</li>
			<li>CL-RAT-PKIMODE.2</li>
			<li>CL-SV-PKIMODE.1</li>
			<li>CL-PKI-ALGO.1</li>
			<li>CL-PKI-VERIF.2</li>
			<li>CL-PKI-PUBKEY.1</li>
			<li>CL-PKI-RQMODE.1</li>			
		</ul></td>
	</tr>
	<tr>
		<th scope="row"><b>Legacy</b> Calypso Prime <b>Regular</b> set</th>
		<td>no</td>
		<td>no</td>
		<td>permissive CL-CSS-RESPLE.1</td>
	</tr>
</tbody>
</table>

### 'Keyple Java Calypso Prime PKI set 2' definition (still <span style="color: DarkOrange;">updated</span>)

<table>
	<thead>
		<tr>
			<th scope="col" colspan="2">Product Identification</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Set Name</th>
		<td><span style="color: DarkOrange;">Keyple <b>Java</b> Calypso Prime <b>PKI</b> set <b>2</b></span></td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2025/04/11 or <span style="color: DarkOrange;">after</span></td>
	</tr>
	<tr>
		<th scope="row">Library Versions</th>
		<td><ul>
			<li>keypop-calypso-card-java-api (public API): 2.1+</li>
			<li>keypop-calypso-crypto-legacysam-java-api (public API) : 0.7+</li>
			<li>keypop-calypso-crypto-symmetric-java-api (internal API): 0.1+</li>
			<li>keypop-calypso-crypto-asymmetric-java-api (internal API): 0.2+</li>
            <br/>
			<li>keyple-card-calypso-java-lib: 3.1.8+</li>
			<li>keyple-card-calypso-crypto-legacysam-java-lib: 0.9.0+</li>
			<li>keyple-card-calypso-crypto-pki-java-lib: 0.2.1+</li>
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
			<li>keypop-reader-java-api (public API): 2.0+</li>
			<li>keypop-card-java-api (internal API): 2.0+</li>
            <br/>
			<li>keyple-plugin-java-api (internal API): 2.2 to 2.3+</li>
			<li>keyple-common-java-api (internal API): 2.0+</li>
			<li>keyple-service-java-lib: 3.0.0 to 3.2.3+</li>
			<li>keyple-util-java-lib: 2.4.0+</li>
		</ul>Integrated with reader plugin implementing the Keyple Plugin API.</td>
	</tr>
	<tr>
		<th scope="row">Ticketing Layer</th>
		<td>Any ticketing application based on:<ul>			
			<li>keypop-reader-java-api (public API): 2.0+</li>
			<li>keypop-calypso-card-java-api (public API): 2.1+</li>
			<li>keypop-calypso-crypto-legacysam-java-api (public API) : 0.7+</li>
		</ul></td>
	</tr>
</tbody>
</table>

### 'Keyple Java Calypso Prime PKI set' definition

<table>
	<thead>
		<tr>
			<th scope="col" colspan="2">Product Identification</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Set Name</th>
		<td><span style="color: DarkOrange;">Keyple <b>Java</b> Calypso Prime <b>PKI</b> set</span></td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2024/04/17 to 2025/04/10</td>
	</tr>
	<tr>
		<th scope="row">Library Versions</th>
		<td><ul>
			<li>keypop-calypso-card-java-api (public API): 2.1</li>
			<li>keypop-calypso-crypto-legacysam-java-api (public API) : 0.5 to 0.6</li>
			<li>keypop-calypso-crypto-symmetric-java-api (internal API): 0.1</li>
			<li>keypop-calypso-crypto-asymmetric-java-api (internal API): 0.2</li>
            <br/>
			<li>keyple-card-calypso-java-lib: 3.1.1 to 3.1.7</li>
			<li>keyple-card-calypso-crypto-legacysam-java-lib: 0.6.0 to 0.9.0</li>
			<li>keyple-card-calypso-crypto-pki-java-lib: 0.2.0 to 0.2.1</li>
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
			<li>keypop-reader-java-api (public API): 2.0</li>
			<li>keypop-card-java-api (internal API): 2.0</li>
            <br/>
			<li>keyple-plugin-java-api (internal API): 2.2 to 2.3</li>
			<li>keyple-common-java-api (internal API): 2.0</li>
			<li>keyple-service-java-lib: 3.0.0 to 3.3.5</li>
			<li>keyple-util-java-lib: 2.3.0 to 2.4.0</li>
		</ul>Integrated with reader plugin implementing the Keyple Plugin API.</td>
	</tr>
	<tr>
		<th scope="row">Ticketing Layer</th>
		<td>Any ticketing application based on:<ul>			
			<li>keypop-reader-java-api (public API): 2.0</li>
			<li>keypop-calypso-card-java-api (public API): 2.1</li>
			<li>keypop-calypso-crypto-legacysam-java-api (public API) : 0.5 to 0.7</li>
		</ul></td>
	</tr>
</tbody>
</table>

### 'Keyple Java Calypso Prime Extended set' definition
<table>
	<thead>
		<tr>
			<th scope="col" colspan="2">Product Identification</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Set Name</th>
		<td><span style="color: DarkOrange;">Keyple <b>Java</b> Calypso Prime <b>Extended</b> set</span></td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2023/11/28 to 2024/04/16</td>
	</tr>
	<tr>
		<th scope="row">Library Versions</th>
		<td><ul>
			<li>keypop-calypso-card-java-api (public API): 2.0 to 2.1</li>
			<li>keypop-calypso-crypto-legacysam-java-api (public API) : 0.3 to 0.6</li>
			<li>keypop-calypso-crypto-symmetric-java-api (internal API): 0.1</li>
            <br/>
			<li>keyple-card-calypso-java-lib: 3.0.0 to 3.1.2</li>
			<li>keyple-card-calypso-crypto-legacysam-java-lib: 0.4.0 to 0.7.1</li>
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
			<li>keypop-reader-java-api (public API): 2.0</li>
			<li>keypop-card-java-api (internal API): 2.0</li>
            <br/>
			<li>keyple-plugin-java-api (internal API): 2.2 to 2.3</li>
			<li>keyple-common-java-api (internal API): 2.0</li>
			<li>keyple-service-java-lib: 3.0.0 to 3.2.3</li>
			<li>keyple-util-java-lib: 2.3.0 to 2.4.0</li>
		</ul>Integrated with reader plugin implementing the Keyple Plugin API.</td>
	</tr>
	<tr>
		<th scope="row">Ticketing Layer</th>
		<td>Any ticketing application based on:<ul>			
			<li>keypop-reader-java-api (public API): 2.0</li>
			<li>keypop-calypso-card-java-api (public API): 2.0 to 2.1</li>
			<li>keypop-calypso-crypto-legacysam-java-api (public API) : 0.3 to 0.6</li>
		</ul></td>
	</tr>
</tbody>
</table>

### 'Keyple Legacy Java Calypso Prime Extended set 2' definition (still <span style="color: DarkOrange;">fixed</span>)
<table>
	<thead>
		<tr>
			<th scope="col" colspan="2">Product Identification</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Set Name</th>
		<td><span style="color: DarkOrange;">Keyple <b>Legacy Java</b> Calypso Prime <b>Extended</b> set <b>2</b></span></td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2025/04/11 or <span style="color: DarkOrange;">after</span></td>
	</tr>
	<tr>
		<th scope="row">Library Versions</th>
		<td><ul>
			<li>calypsonet-terminal-calypso-java-api (public API): 1.8</li>
			<li>calypsonet-terminal-calypso-crypto-legacysam-java-api (public API): 0.2</li>
            <br/>
			<li>keyple-card-calypso-java-lib: 2.3.15+ (<3.0.0)</li>
			<li>keyple-card-calypso-crypto-legacysam-java-lib: 0.3.0</li>
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
			<li>calypsonet-terminal-reader-java-api (public API): 1.2 to 1.3</li>
			<li>calypsonet-terminal-card-java-api (internal API): 1.0</li>
            <br/>
			<li>keyple-plugin-java-api (internal API): 2.1 to 2.3</li>
			<li>keyple-common-java-api (internal API): 2.0</li>
			<li>keyple-service-java-lib: 2.2.0 to 2.3.6+ (<3.0.0)</li>
			<li>keyple-util-java-lib: 2.3.0 to 2.3.1</li>
		</ul>Integrated with reader plugin implementing the Keyple Plugin API.</td>
	</tr>
	<tr>
		<th scope="row">Ticketing Layer</th>
		<td>Any ticketing application based on:<ul>
			<li>calypsonet-terminal-reader-java-api (public API): 1.2 to 1.3</li>
			<li>calypsonet-terminal-calypso-java-api (public API): 1.8</li>
			<li>calypsonet-terminal-calypso-crypto-legacysam-java-api (public API) : 0.2</li>
		</ul></td>
	</tr>
</tbody>
</table>


### 'Keyple Legacy Java Calypso Prime Extended set' definition
<table>
	<thead>
		<tr>
			<th scope="col" colspan="2">Product Identification</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Set Name</th>
		<td><span style="color: DarkOrange;">Keyple <b>Legacy Java</b> Calypso Prime <b>Extended</b> set</span></td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2022/12/22 to 2023/11/27</td>
	</tr>
	<tr>
		<th scope="row">Library Versions</th>
		<td><ul>
			<li>calypsonet-terminal-calypso-java-api (public API): 1.5 to 1.8</li>
			<li>calypsonet-terminal-calypso-crypto-legacysam-java-api (public API): 0.1 to 0.2</li>
            <br/>
			<li>keyple-card-calypso-java-lib: 2.3.1 to 2.3.14</li>
			<li>keyple-card-calypso-crypto-legacysam-java-lib: 0.1.0 to 0.3.0</li>
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
			<li>calypsonet-terminal-reader-java-api (public API): 1.0 to 1.3</li>
			<li>calypsonet-terminal-card-java-api (internal API): 1.0</li>
            <br/>
			<li>keyple-plugin-java-api (internal API): 2.0 to 2.3</li>
			<li>keyple-common-java-api (internal API): 2.0</li>
			<li>keyple-service-java-lib: 2.1.1 to 2.3.6</li>
			<li>keyple-util-java-lib: 2.3.0 to 2.3.1</li>
		</ul>Integrated with reader plugin implementing the Keyple Plugin API.</td>
	</tr>
	<tr>
		<th scope="row">Ticketing Layer</th>
		<td>Any ticketing application based on:<ul>
			<li>calypsonet-terminal-reader-java-api (public API): 1.0 to 1.3</li>
			<li>calypsonet-terminal-calypso-java-api (public API): 1.5 to 1.8</li>
			<li>calypsonet-terminal-calypso-crypto-legacysam-java-api (public API) : 0.1 to 0.2</li>
		</ul></td>
	</tr>
</tbody>
</table>

### 'Keyple Legacy Java Calypso Prime Regular set' definition
<table>
	<thead>
		<tr>
			<th scope="col" colspan="2">Product Identification</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Set Name</th>
		<td><span style="color: DarkOrange;">Keyple <b>Legacy Java</b> Calypso Prime <b>Regular</b> set</span></td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2022/02/01 to 2022/12/22</td>
	</tr>
	<tr>
		<th scope="row">Library Versions</th>
		<td><ul>
			<li>calypsonet-terminal-calypso-java-api (public API): 1.1 to 1.4</li>
			<li>calypsonet-terminal-calypso-crypto-legacysam-java-api (public API): 0.1</li>
            <br/>
			<li>keyple-card-calypso-java-lib: 2.1.0 to 2.3.0</li>
			<li>keyple-card-calypso-crypto-legacysam-java-lib: 0.0.0 to 0.2.0</li>
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
			<li>calypsonet-terminal-reader-java-api (public API): 1.0 to 1.3</li>
			<li>calypsonet-terminal-card-java-api (internal API): 1.0</li>
            <br/>
			<li>keyple-plugin-java-api (internal API): 2.0 to 2.3</li>
			<li>keyple-common-java-api (internal API): 2.0</li>
			<li>keyple-service-java-lib: 2.1.1 to 2.3.5+ (<3.0.0)</li>
			<li>keyple-util-java-lib: 2.3.0 to 2.3.1</li>
		</ul>Integrated with reader plugin implementing the Keyple Plugin API.</td>
	</tr>
	<tr>
		<th scope="row">Ticketing Layer</th>
		<td>Any ticketing application based on:<ul>
			<li>calypsonet-terminal-reader-java-api (public API): 1.0 to 1.1</li>
			<li>calypsonet-terminal-calypso-java-api (public API): 1.1 to 1.4</li>
			<li>calypsonet-terminal-calypso-crypto-legacysam-java-api (public API) : 0.1</li>
		</ul></td>
	</tr>
</tbody>
</table>

### 'Keyple Legacy C++ Calypso Prime Regular set 2' definition (still <span style="color: DarkOrange;">fixed</span>)
<table>
	<thead>
		<tr>
			<th scope="col" colspan="2">Product Identification</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Set Name</th>
		<td><span style="color: DarkOrange;">Keyple <b>Legacy C++</b> Calypso Prime <b>Regular</b> set <b>2</b></span></td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2025/04/17 or <span style="color: DarkOrange;">after</span></td>
	</tr>
	<tr>
		<th scope="row">Library Versions</th>
		<td><ul>
			<li>calypsonet-terminal-calypso-cpp-api (public API): 1.4</li>
            <br/>
			<li>keyple-card-calypso-cpp-lib: 2.2.5.5+ (<2.2.6.0)</li>
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
			<li>calypsonet-terminal-reader-cpp-api (public API): 1.0 to 1.1</li>
			<li>calypsonet-terminal-card-cpp-api (internal API): 1.0</li>
            <br/>
			<li>keyple-plugin-cpp-api (internal API): 2.0</li>
			<li>keyple-common-cpp-api (internal API): 2.0</li>
			<li>keyple-service-cpp-lib: 2.0.1.0 to 2.1.1.1+ (<2.2.0.0)</li>
			<li>keyple-util-cpp-lib: 2.3.0.0 to 2.3.0.4</li>
		</ul>Integrated with reader plugin implementing the Keyple Plugin API.</td>
	</tr>
	<tr>
		<th scope="row">Ticketing Layer</th>
		<td>Any ticketing application based on:<ul>
			<li>calypsonet-terminal-reader-cpp-api (public API): 1.0 to 1.1</li>
			<li>calypsonet-terminal-calypso-cpp-api (public API): 1.4</li>
		</ul></td>
	</tr>
</tbody>
</table>

### 'Keyple Legacy C++ Calypso Prime Regular set' definition
<table>
	<thead>
		<tr>
			<th scope="col" colspan="2">Product Identification</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Set Name</th>
		<td><span style="color: DarkOrange;">Keyple <b>Legacy C++</b> Calypso Prime <b>Regular</b> set</span></td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2022/07/06 to 2025/04/17</td>
	</tr>
	<tr>
		<th scope="row">Library Versions</th>
		<td><ul>
			<li>calypsonet-terminal-calypso-cpp-api (public API): 1.0 to 1.4</li>
            <br/>
			<li>keyple-card-calypso-cpp-lib: 2.1.0 to 2.2.5.4</li>
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
			<li>calypsonet-terminal-reader-cpp-api (public API): 1.0 to 1.1</li>
			<li>calypsonet-terminal-card-cpp-api (internal API): 1.0</li>
            <br/>
			<li>keyple-plugin-cpp-api (internal API): 2.0</li>
			<li>keyple-common-cpp-api (internal API): 2.0</li>
			<li>keyple-service-cpp-lib: 2.0.1 to 2.1.1.1</li>
			<li>keyple-util-cpp-lib: 2.0.0 to 2.3.0.4</li>
		</ul>Integrated with reader plugin implementing the Keyple Plugin API.</td>
	</tr>
	<tr>
		<th scope="row">Ticketing Layer</th>
		<td>Any ticketing application based on:<ul>
			<li>calypsonet-terminal-reader-cpp-api (public API): 1.0 to 1.1</li>
			<li>calypsonet-terminal-calypso-cpp-api (public API): 1.0 to 1.4</li>
		</ul></td>
	</tr>
</tbody>
</table>

## **Ticketing** software layer
For a ticketing terminal solution built on the Keyple framework, the responsibility for complying with the [requirements for the ticketing software layer](https://calypsonet.org/document/ticketing-layer-requirements-v2-0-200430/) lies exclusively with the developers of the terminal application using the [‘public’ Reader & Calypso terminal APIs](https://terminal-api.calypsonet.org/specifications/).
