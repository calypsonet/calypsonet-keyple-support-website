---
title: Keyple-based advanced ticketing demonstrator
linkTitle: Advanced Keyple demo
type: book
toc: false
weight: 40
---
To illustrate an advanced implementation of the Keyple Java middleware for Calypso-based ticketing systems, CNA has released a full ticketing demonstrator under the Eclipse Public License version 2.0.

<table>
	<thead>
		<tr>
			<th scope="col" rowspan="2">Ticketing Service & repository</th>
			<th scope="col" rowspan="2">Keyple integration</th>
			<th scope="colgroup" colspan="2">Smartcard readers involved</th>
			<th scope="col" rowspan="2">Optimization targets</th>
		</tr>
		<tr>
			<th scope="col">Calypso card</th>
			<th scope="col">Calypso SAM</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th scope="row"><a href="https://github.com/calypsonet/keyple-java-demo-remote" target="_blank" rel="noopener">Remote sales & reloading</a></th>
			<td>distributed Calypso applications
                <ul><li>server with ticketing intelligence, based on Keyple</li>
                <li>light client, Keyple-based or not</li></ul>
            </td>
			<td>Integrated on the distributed client side</td>
			<td>Integrated on the distributed server side</td>
			<td>
                <ul><li>Limit the number of network messages between client and server</li>
                <li>Enable client to be hosted on any light terminal without Keyple dependency</li></ul>
            </td>
		</tr>
		<tr>
			<th scope="row"><a href="https://github.com/calypsonet/keyple-android-demo-validation" target="_blank" rel="noopener">Validation</a></th>
			<td rowspan="2">standalone Calypso terminal application based on Keyple</td>
			<td rowspan="2">Locally embedded</td>
			<td rowspan="2">Locally embedded</td>
			<td rowspan="2">Limit the number of card and SAM commands during the card transaction</td>
		</tr>
		<tr>
			<th scope="row"><a href="https://github.com/calypsonet/keyple-android-demo-control" target="_blank" rel="noopener">Control</a></th>
		</tr>
	</tbody>
</table>

## Stand-alone validation and control terminals

The architecture of validation and control tools is very similar, with only the ticketing transaction differing:
- For validation, the terminal checks that a valid ticket is present, records an event and authorizes access.
- For control, the terminal checks that a recent validation event is valid.
  The ticketing data format is just an example defined for demonstration purposes.

<table>
	<thead>
		<tr>
			<th scope="col">Terminal application</th>
			<th scope="col">Language</th>
			<th scope="col">OS</th>
			<th scope="col">Supported devices</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th scope="row">Validation</th>
			<td rowspan="2">Kotlin</td>
			<td rowspan="2">Android</td>
			<td rowspan="2">Any Android device having
                <ul><li>a contactless reader</li>
                <li>& a SAM reader</li></ul>
            </td>
		</tr>
		<tr>
			<th scope="row">Control</th>
		</tr>
	</tbody>
</table>

These demos can be installed on various Android terminals such as Coppernic, Famoco, Flowbird, or Bluebird using the plugins provided by CNA.

Validation scenario:
- An autonomous validator on Android-based ticketing terminal that seamlessly starts a secure session when a contactless card is detected.
- The machine checks the last transport event and the available ticketing contracts.
- If access is granted, a new event is written.

Control scenario:
- A hand-held inspection terminal on Android portable terminal that allows an operator to check the content of a card.
- The application verifies the validity of the last transport event regarding the current time and location.
- Finally, it displays the result.

## Remote sales and reloading distributed service

This demo requires a client/server environment:
- On the server side, the back-office includes a Java server application to process the ticketing sale and manage the Calypso secure session to reload contracts in remote cards. The server manages a pool of Calypso SAM using the PC/SC plugin and the Calypso SAM resource manager.
- On the client side, <span style="color: red;">any</span> terminal with a contactless reader provides the means to a customer to make the ticket purchase. The Calypso card commands are fully managed by the back-office ticketing server using the Keyple Distributed solution.

<table>
	<thead>
		<tr>
			<th scope="col" colspan="2">Terminal application</th>
			<th scope="col">Language / folder</th>
			<th scope="col">OS</th>
			<th scope="col">Supported devices</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th scope="row" colspan="2">Sales / Reloading server<br>(Keyple based)</th>
			<td><a href="https://github.com/calypsonet/keyple-demo-ticketing-reloading-remote/tree/main/server" target="_blank" rel="noopener">Java</a></td>
			<td>Windows, Linux, macOS</td>
			<td>Java Server with PC/SC SAM readers</td>
		</tr>
		<tr>
			<th scope="rowgroup" rowspan="4">Sales / Reloading client</th>
			<th scope="row">Keyple-based</th>
			<td><a href="https://github.com/calypsonet/keyple-demo-ticketing-reloading-remote/tree/main/client/android" target="_blank" rel="noopener">Kotlin</a></td>
			<td rowspan="2">Android</td>
			<td rowspan="2">Android NFC phone</td>
		</tr>
		<tr>
			<th scope="rowgroup" rowspan="3">Keyple-less</th>
			<td><a href="https://github.com/calypsonet/keyple-demo-ticketing-reloading-remote/tree/main/client/android-light" target="_blank" rel="noopener">Kotlin</a></td>
		</tr>
		<tr>
			<td><a href="https://github.com/calypsonet/keyple-demo-ticketing-reloading-remote/tree/main/client/dotnet" target="_blank" rel="noopener">.NET C#</a></td>
			<td>Windows</td>
			<td>Windows PC with a PC/SC reader</td>
		</tr>
		<tr>
			<td><a href="https://github.com/calypsonet/keyple-demo-ticketing-reloading-remote/tree/kmm/client/kmp" target="_blank" rel="noopener">
                <ul><li>Kotlin Multiplatform</li>
                <li>& Compose Multiplatform</li></ul>
            </a></td>
			<td>Windows, Linux, macOS, Android, iOS</td>
			<td>
                <ul><li><span style="color: red;">any</span> NFC mobile</li>
                <li><span style="color: red;">any</span> PC with a PC/SC reader</li></ul>
            </td>
		</tr>
	</tbody>
</table>