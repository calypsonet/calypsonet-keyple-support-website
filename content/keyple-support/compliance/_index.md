---
title: Interoperability & compliance of Keyple-based ticketing terminal solutions
linkTitle: Terminal compliance
type: book
toc: true
weight: 25
---
In order to guarantee interoperability between smart cards and terminals, the [‘Calypso Networks Association’ (CNA)](https://calypsonet.org/) encourages ticketing operators to [follow various specifications and certification processes](https://calypsonet.org/calypso-certification/#section-certification-for-terminals).

# Contactless reader *communication protocol*
For compliance with the contactless reader communication protocol, CNA supports the certification programme [standardised by the ‘Smart Ticketing Alliance’ (STA)](https://www.smart-ticketing.org/certification-1 ) for [‘Public Transport Readers’ (PT Readers)](https://www.smart-ticketing.org/certification-program ).
Several test laboratories are approved for [‘Proximity Coupling Device’ (PCD) certification](https://www.cna-paycert-certification.eu/rf-interface-2/ ) under the supervision of the ‘Certification Body’ Paycert.

# Separation and **functional logic** of the various software layers
To guarantee the functional capability of the ticketing terminals, CNA has proposed a software architecture with a distribution of responsibilities per layer, and has [defined dedicated functional requirements for each software layer](https://calypsonet.org/calypso-for-terminals/#section-how-to-implement-calypso-in-a-ticketing-terminal
).

## **Reader** software layer
For terminals integrating contactless and/or contact readers, the [Keyple's ‘Core’ libraries](https://keyple.org/components/core/) have been designed to meet the terminal requirements for the reader layer.
2 conditions must be met to guarantee « complete » compliance with the requirements of the reader layer:
- the versions of Keyple's core libraries must be [compliant with versions 2.0 or higher of the terminal Reader APIs](https://terminal-api.calypsonet.org/compliance/#from-reader-api-version-20--calypso-card-api-version-20),
- & the plugins used to interface with smart card readers must [follow the plugin development guide](https://keyple.org/learn/developer-guide/reader-plugin-add-on/).

Pending the future certification programme for reader layer libraries, CNA plans to [publish the self-declarations of conformity of the Keyple Core libraries for reader solutions](https://calypsonet.org/registered-readers/) interfaced with PC/SC and Android NFC plugins. 

## **Calypso** software layer
The [Keyple's ‘Calypso’ libraries](https://keyple.org/components/card-extensions/) have also been implemented to meet the terminal requirements for the Calypso layer, regardless of the reader solutions used.
2 conditions must be met to guarantee « complete » compliance with the requirements of the Calypso layer:
- the versions of Keyple's Calypso libraries must be [compliant with versions 2.0 or higher of the terminal Calypso APIs](https://terminal-api.calypsonet.org/compliance/#from-reader-api-version-20--calypso-card-api-version-20),
- & the reader software layer used as a basis (Keyple's ‘Core’ libraries + reader plugins) must comply with the terminal requirements for the reader layer.

Pending the future certification programme for Calypso layer libraries, CNA has [published the self-declarations of conformity of the Keyple Calypso libraries ](https://calypsonet.org/registered-calypso-layer-libraries/) (independently of interfaced reader solutions, but on the basis of a compliant reader software layer). 

### Terminal requirements support declarations
For the various Keyple Calypso library sets, all applicabilities and terminal requirements are supported, with the exception of those listed in the table below.

<table>
	<thead>
		<tr>
			<th scope="col" rowspan="2">Calypso layer libraries</th>
			<th scope="colgroup" colspan="2">Unsupported applicability</th>
			<th scope="col" rowspan="2">Unsupported Requirement</th>
		</tr>
		<tr>
			<th scope="col">Calypso card</th>
			<th scope="col">Feature</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Keyple <b>Java</b> Calypso Prime <b>PKI</b> set</th>
		<td><ul><li>HCE</li></ul></td>
		<td>-</td>
		<td><ul><li>CL-SEL-SNHEADER.2</li></ul></td>
	</tr>
	<tr>
		<th scope="row">Keyple <b>Java</b> Calypso Prime <b>Extended</b> set</th>
		<td><ul><li>Prime PKI</li><li>HCE</li></ul></td>
		<td>-</td>
		<td><ul>
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
		<th scope="row">Keyple <b>Legacy Java</b> Calypso Prime <b>Extended</b> set</th>
		<td><ul><li>Prime PKI</li><li>HCE</li></ul></td>
		<td>-</td>
		<td><ul>
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
		<th scope="row">Keyple <b>Legacy Java</b> Calypso Prime <b>Regular</b> set</th>
		<td><ul><li>Prime PKI</li><li>Prime Extended</li><li>HCE</li></ul></td>
		<td>-</td>
		<td><ul>
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
		<th scope="row">Keyple <b>Legacy C++</b> Calypso Prime <b>Regular</b> set</th>
		<td><ul><li>Prime PKI</li><li>Prime Extended</li><li>HCE</li></ul></td>
		<td>-</td>
		<td><ul>
			<li>CL-SEL-SNHEADER.2</li>
			<li>CL-RAT-PKIMODE.2</li>
			<li>CL-SV-PKIMODE.1</li>
			<li>CL-PKI-ALGO.1</li>
			<li>CL-PKI-VERIF.2</li>
			<li>CL-PKI-PUBKEY.1</li>
			<li>CL-PKI-RQMODE.1</li>			
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
		<td>Keyple <b>Java</b> Calypso Prime <b>PKI</b> set</td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2024/04/17 or after</td>
	</tr>
	<tr>
		<th scope="row">Library Versions</th>
		<td><ul>
			<li>keypop-calypso-card-java-api (external API): 2.1+</li>
			<li>keypop-calypso-crypto-legacysam-java-api (external API) : 0.5 to 0.6+</li>
			<li>keypop-calypso-crypto-symmetric-java-api (internal API): 0.1+</li>
			<li>keypop-calypso-crypto-asymmetric-java-api (internal API): 0.2+</li>
			<li>keyple-card-calypso-java-lib: 3.1.1 to 3.1.2+</li>
			<li>keyple-card-calypso-crypto-legacysam-java-lib: 0.6.0 to 0.7.1+</li>
			<li>keyple-card-calypso-crypto-pki-java-lib: 0.2.0+</li>
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
			<li>keypop-reader-java-api (external API): 2.0+</li>
			<li>keypop-card-java-api (internal API): 2.0+</li>
			<li>keyple-plugin-java-api (internal API): 2.2 to 2.3+</li>
			<li>keyple-common-java-api (internal API): 2.0+</li>
			<li>keyple-service-java-lib: 3.0.0 to 3.2.3+</li>
			<li>keyple-util-java-lib: 2.3.0 to 2.4.0+</li>
		</ul>Integrated with reader plugin implementing the Keyple Plugin API.</td>
	</tr>
	<tr>
		<th scope="row">Ticketing Layer</th>
		<td>Any ticketing application based on:<ul>			
			<li>keypop-reader-java-api (external API): 2.0+</li>
			<li>keypop-calypso-card-java-api (external API): 2.1+</li>
			<li>keypop-calypso-crypto-legacysam-java-api (external API) : 0.5 to 0.6+</li>
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
		<td>Keyple <b>Java</b> Calypso Prime <b>Extended</b> set</td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2023/11/28 or after</td>
	</tr>
	<tr>
		<th scope="row">Library Versions</th>
		<td><ul>
			<li>keypop-calypso-card-java-api (external API): 2.0 to 2.1+</li>
			<li>keypop-calypso-crypto-legacysam-java-api (external API) : 0.3 to 0.6+</li>
			<li>keypop-calypso-crypto-symmetric-java-api (internal API): 0.1+</li>
			<li>keyple-card-calypso-java-lib: 3.0.0 to 3.1.2+</li>
			<li>keyple-card-calypso-crypto-legacysam-java-lib: 0.4.0 to 0.7.1+	</li>
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
			<li>keypop-reader-java-api (external API): 2.0+</li>
			<li>keypop-card-java-api (internal API): 2.0+</li>
			<li>keyple-plugin-java-api (internal API): 2.2 to 2.3+</li>
			<li>keyple-common-java-api (internal API): 2.0+</li>
			<li>keyple-service-java-lib: 3.0.0 to 3.2.3+</li>
			<li>keyple-util-java-lib: 2.3.0 to 2.4.0+</li>
		</ul>Integrated with reader plugin implementing the Keyple Plugin API.</td>
	</tr>
	<tr>
		<th scope="row">Ticketing Layer</th>
		<td>Any ticketing application based on:<ul>			
			<li>keypop-reader-java-api (external API): 2.0+</li>
			<li>keypop-calypso-card-java-api (external API): 2.0 to 2.1+</li>
			<li>keypop-calypso-crypto-legacysam-java-api (external API) : 0.3 to 0.6+</li>
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
		<td>Keyple <b>Lecacy Java</b> Calypso Prime <b>Extended</b> set</td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2022/12/22 to 2023/11/27</td>
	</tr>
	<tr>
		<th scope="row">Library Versions</th>
		<td><ul>
			<li>calypsonet-terminal-calypso-java-api (external API): 1.5 to 1.8</li>
			<li>calypsonet-terminal-calypso-crypto-legacysam-java-api (external API): 0.1 to 0.2</li>
			<li>keyple-card-calypso-java-lib: 2.3.1 to 2.3.12+ (<3.0.0)</li>
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
			<li>calypsonet-terminal-reader-java-api (external API): 1.0 to 1.3</li>
			<li>calypsonet-terminal-card-java-api (internal API): 1.0</li>
			<li>keyple-plugin-java-api (internal API): 2.0 to 2.3</li>
			<li>keyple-common-java-api (internal API): 2.0</li>
			<li>keyple-service-java-lib: 2.1.1 to 2.3.5+ (<3.0.0)</li>
			<li>keyple-util-java-lib: 2.3.0 to 2.3.1</li>
		</ul>Integrated with reader plugin implementing the Keyple Plugin API.</td>
	</tr>
	<tr>
		<th scope="row">Ticketing Layer</th>
		<td>Any ticketing application based on:<ul>
			<li>calypsonet-terminal-reader-java-api (external API): 1.0 to 1.3</li>
			<li>calypsonet-terminal-calypso-java-api (external API): 1.5 to 1.8</li>
			<li>calypsonet-terminal-calypso-crypto-legacysam-java-api (external API) : 0.1 to 0.2</li>
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
		<td>Keyple <b>Lecacy Java</b> Calypso Prime <b>Regular</b> set</td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2022/02/01 to 2022/12/22</td>
	</tr>
	<tr>
		<th scope="row">Library Versions</th>
		<td><ul>
			<li>calypsonet-terminal-calypso-java-api (external API): 1.1 to 1.4</li>
			<li>calypsonet-terminal-calypso-crypto-legacysam-java-api (external API): 0.1</li>
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
			<li>calypsonet-terminal-reader-java-api (external API): 1.0 to 1.3</li>
			<li>calypsonet-terminal-card-java-api (internal API): 1.0</li>
			<li>keyple-plugin-java-api (internal API): 2.0 to 2.3</li>
			<li>keyple-common-java-api (internal API): 2.0</li>
			<li>keyple-service-java-lib: 2.1.1 to 2.3.5+ (<3.0.0)</li>
			<li>keyple-util-java-lib: 2.3.0 to 2.3.1</li>
		</ul>Integrated with reader plugin implementing the Keyple Plugin API.</td>
	</tr>
	<tr>
		<th scope="row">Ticketing Layer</th>
		<td>Any ticketing application based on:<ul>
			<li>calypsonet-terminal-reader-java-api (external API): 1.0 to 1.1</li>
			<li>calypsonet-terminal-calypso-java-api (external API): 1.1 to 1.4</li>
			<li>calypsonet-terminal-calypso-crypto-legacysam-java-api (external API) : 0.1</li>
		</ul></td>
	</tr>
</tbody>
</table>

### 'Keyple Legacy C++ Calypso Prime PKI set' definition
<table>
	<thead>
		<tr>
			<th scope="col" colspan="2">Product Identification</th>
		</tr>
	</thead>
<tbody>
	<tr>
		<th scope="row">Set Name</th>
		<td>Keyple <b>Lecacy C++</b> Calypso Prime <b>Regular</b> set</td>
	</tr>
	<tr>
		<th scope="row">Set Version</th>
		<td>2022/02/01 to 2023/06/20</td>
	</tr>
	<tr>
		<th scope="row">Library Versions</th>
		<td><ul>
			<li>calypsonet-terminal-calypso-cpp-api (external API): 1.0 to 1.4</li>
			<li>keyple-card-calypso-cpp-lib: 2.1.0 to 2.2.5.3</li>
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
			<li>calypsonet-terminal-reader-cpp-api (external API): 1.0 to 1.1</li>
			<li>calypsonet-terminal-card-cpp-api (internal API): 1.0</li>
			<li>keyple-plugin-cpp-api (internal API): 2.0</li>
			<li>keyple-common-cpp-api (internal API): 2.0</li>
			<li>keyple-service-cpp-lib: 2.0.1 to 2.1.1.1</li>
			<li>keyple-util-cpp-lib: 2.0.0 to 2.3.0.4</li>
		</ul>Integrated with reader plugin implementing the Keyple Plugin API.</td>
	</tr>
	<tr>
		<th scope="row">Ticketing Layer</th>
		<td>Any ticketing application based on:<ul>
			<li>calypsonet-terminal-reader-cpp-api (external API): 1.0 to 1.1</li>
			<li>calypsonet-terminal-calypso-cpp-api (external API): 1.0 to 1.4</li>
		</ul></td>
	</tr>
</tbody>
</table>

## **Ticketing** software layer
For a ticketing terminal solution built on the Keyple framework, the responsibility for complying with the [requirements for the ticketing software layer](https://calypsonet.org/document/ticketing-layer-requirements-v2-0-200430/) lies exclusively with the developers of the terminal application using the [‘public’ Reader & Calypso terminal APIs](https://terminal-api.calypsonet.org/specifications/).
