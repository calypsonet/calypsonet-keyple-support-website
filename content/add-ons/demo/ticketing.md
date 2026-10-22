---
title: Keyple-based advanced ticketing demonstrator
linkTitle: 🌍 Advanced Ticketing Demos
aliases:
  - /keyple-support/ticketing-demo/
type: book
toc: true
weight: 110
---
To illustrate an advanced implementation of the Keyple Java middleware for Calypso-based ticketing systems, CNA has released a complete ticketing demonstrator under the <a href="https://opensource.org/license/bsd-3-clause" target="_blank" rel="noopener">3-Clause BSD License</a>.

It covers the lifecycle of a contactless transit ticket: personalization of the card, sale and loading of the tickets (season pass, multi-trip ticket), access validation, and ticket inspection.

## Keyple integration patterns

Each component of the demonstrator illustrates a way of integrating Keyple in a ticketing system, with its own optimization targets.

<style>
    .hachured {
        background-image: repeating-linear-gradient(
        45deg,
        transparent,
        transparent 5px,
        rgba(0, 0, 0, 0.1) 5px,
        rgba(0, 0, 0, 0.1) 10px
        );
        color: black;
    }
</style>
<table>
	<thead>
		<tr>
			<th scope="col" rowspan="2">Ticketing service & repository</th>
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
			<th scope="row"><a href="https://github.com/calypsonet/keyple-demo-ticketing/tree/main/src/sales" target="_blank" rel="noopener">Sales</a></th>
			<td>distributed Calypso application
                <ul><li>server with the ticketing intelligence, based on Keyple</li>
                <li>light clients, Keyple-based or not (Keyple Interop libraries, Server JSON API)</li></ul>
            </td>
			<td>Integrated on the distributed client side</td>
			<td>Integrated on the distributed server side</td>
			<td>
                <ul><li>Limit the number of network messages between client and server</li>
                <li>Enable the client to be hosted on any light terminal, without Keyple dependency</li></ul>
            </td>
		</tr>
		<tr>
			<th scope="row"><a href="https://github.com/calypsonet/keyple-demo-ticketing/tree/main/src/validation" target="_blank" rel="noopener">Validation</a></th>
			<td rowspan="2">standalone Calypso terminal application based on Keyple</td>
			<td rowspan="2">Locally embedded</td>
			<td>Locally embedded</td>
			<td rowspan="2">Limit the number of card and SAM commands during the card transaction</td>
		</tr>
		<tr>
			<th scope="row"><a href="https://github.com/calypsonet/keyple-demo-ticketing/tree/main/src/inspection" target="_blank" rel="noopener">Inspection</a></th>
			<td>Locally embedded, optional (card authenticated by PKI, or read without authentication)</td>
		</tr>
		<tr>
			<th scope="row"><a href="https://github.com/calypsonet/keyple-demo-ticketing/tree/main/src/common" target="_blank" rel="noopener">Common ticketing data processing</a></th>
			<td>support library for the data model of the card</td>
			<td colspan="3" class="hachured"></td>
		</tr>
	</tbody>
</table>

## Supported cards

- **Calypso cards**: the demonstrator works with the generic Calypso application of the cards of the [CNA test kit](../../../basics/test-kit/).
- **Storage cards** (MIFARE Ultralight, ST25 SRT512, MIFARE Classic 1K): handled by the Android applications with the [CNA storage card libraries](../../card-ext/storage-card/), reserved for CNA members.

The cards and terminals supported by each application are detailed in the functional documentation of the demonstrator.

## Functional documentation

The use cases, business rules, and messages of the demonstrator, as well as the data model of the card and the procedures executed on it, specific to the demonstrator, are described in its functional documentation, attached as PDF and HTML files to each release.

## Getting the demonstrator

- **Source code**: the <a href="https://github.com/calypsonet/keyple-demo-ticketing" target="_blank" rel="noopener">keyple-demo-ticketing</a> repository, whose README describes the components, the supported terminals and platforms, and how to build and install them.
- **Applications and functional documentation**: attached to each <a href="https://github.com/calypsonet/keyple-demo-ticketing/releases/latest" target="_blank" rel="noopener">release</a> of the repository.
- **Proprietary components** (plugins of the Bluebird and Arrive terminals, storage card libraries): <a href="https://github.com/calypsonet/keyple-demo-ticketing#proprietary-plugins-available-on-request" target="_blank" rel="noopener">available on request</a> from CNA; without them, the demonstrator is built with mocks.
