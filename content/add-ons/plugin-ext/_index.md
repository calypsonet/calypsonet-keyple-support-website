---
title: Keyple plugins for proprietary smart card readers
linkTitle: "Keyple reader extensions"
type: book
toc: false
weight: 20
---

## Additional 'Reader Plugins' provided by CNA
The Keyple project already hosts several [plugins for interfacing with "standard" smartcard reader solutions](https://keyple.org/components/standard-reader-plugins/) (PC/SC, Android NFC / OMAPI), or for emulating readers.

In addition, CNA has released the following plugins under the [Eclipse Public License version 2](https://www.eclipse.org/legal/epl-2.0/) to illustrate further integration patterns:
- When the native library of a reader solution is **publicly available**, the plugin can be compiled autonomously.
- When it is **not publicly available**, a mock is provided as a substitute; the actual native library must be obtained directly from the manufacturer to build the plugin.

**Four plugins** target Android-based embedded ticketing terminals, each equipped with a contactless card reader and one or more SAM contact slots:
- **Famoco** — interfaces with SAM readers only; the contactless reader on Famoco terminals relies on the standard Android NFC API, which Keyple supports natively.
- **Coppernic**, **Arrive** and **Bluebird** — manage both SAM readers and an observable contactless reader (capable of detecting card insertion and removal).

**Two additional plugins** target server or workstation environments:
- The **Legacy HSM** plugin enables a Calypso legacy HSM to be interfaced on a Linux server equipped with a Spirtech HSM.
- The **Paragon ID Gen5XX** plugin provides access to the 4 SAM slot readers of Gen5XX PC/SC devices on Windows and Linux. It is designed to complement the standard Keyple PC/SC plugin, which handles the contactless interface of the same device.

<table id="external-resource-table-1" class="table table-striped">
    <thead>
    <tr>
        <th scope="col" class="text-center">Name</th>
        <th scope="col" class="text-center">Supported Device</th>
        <th scope="col" class="text-center">Native reader library accessibility</th>
        <th scope="col" class="text-center">Interface</th>
        <th scope="col" class="text-center">OS</th>
        <th scope="col" class="text-center">Language</th>
    </tr>
    </thead>
    <tbody id="external-resource-table-1-content">
    <tr>
        <td class="text-center"><a href="https://github.com/calypsonet/keyple-plugin-cna-coppernic-cone2-java-lib" target="_blank" rel="noopener">Coppernic</a></td>
        <td class="text-center">C-One v2</td>
        <td class="text-center">public</td>
        <td class="text-center" rowspan="4">Internal</td>
        <td class="text-center" rowspan="4">Android</td>
        <td class="text-center" rowspan="4">Kotlin</td>
    </tr>
    <tr>
        <td class="text-center"><a href="https://github.com/calypsonet/keyple-plugin-cna-famoco-se-communication-java-lib" target="_blank" rel="noopener">Famoco</a></td>
        <td class="text-center">FX100, FX105, FX200, FX205, FX300, FX915, FX920</td>
        <td class="text-center">public</td>
    </tr>
    <tr>
        <td class="text-center"><a href="https://github.com/calypsonet/keyple-plugin-cna-arrive-android-jvm-lib" target="_blank" rel="noopener">Arrive</a></td>
        <td class="text-center">Axio Touch Validator/MTBorne validator, Magnetic Axio Touch Validator, Axio 4 Validator, Infigo Driver Console, Voyager Embedded Ticketing Vending Machine, Coppernic C-One, Coppernic C-One V2, Zebra TC77, ACTIA PSDT</td>
        <td class="text-center">private</td>
    </tr>
    <tr>
        <td class="text-center"><a href="https://github.com/calypsonet/keyple-plugin-cna-bluebird-specific-nfc-java-lib" target="_blank" rel="noopener">Bluebird</a></td>
        <td class="text-center">EF501, EF551</td>
        <td class="text-center">private</td>
    </tr>
    <tr>
        <td class="text-center"><a href="https://github.com/calypsonet/keyple-plugin-cna-legacyhsm-java-lib" target="_blank" rel="noopener">Legacy HSM</a></td>
        <td class="text-center">Spirtech HSM</td>
        <td class="text-center">private</td>
        <td class="text-center">IP</td>
        <td class="text-center">Linux</td>
        <td class="text-center">Java</td>
    </tr>
    <tr>
        <td class="text-center"><a href="https://github.com/calypsonet/keyple-plugin-cna-paragonid-gen5xx-pcsc-jvm-lib" target="_blank" rel="noopener">Paragon ID Gen5XX</a></td>
        <td class="text-center">GEN5XX CCID, CPL108</td>
        <td class="text-center">public</td>
        <td class="text-center">PC/SC</td>
        <td class="text-center">Windows, Linux, macOS</td>
        <td class="text-center">Java</td>
    </tr>
    </tbody>
</table>

Some special features of the Android plugins:
- The embedded terminals targeted by these plugins only support static configurations for their readers. However, the **Coppernic** and **Famoco** plugins implement the *observable plugin* pattern: when the terminal enters standby mode, its readers lose power and behave as if unplugged, so the plugin must detect and report these connect/disconnect events autonomously.
- All four Android plugins expose “configurable” readers to enable support for specific communication protocols. In addition, the **Bluebird** plugin can be configured to support the Enhanced Contactless Polling (ECP) protocol specific to Apple NFC devices.
<script type="text/javascript">
document.body.onload = function() {
    initExternalResourceTable("external-resource-table-1");
    initExternalResourceTable("external-resource-table-2");
    initExternalResourceTable("external-resource-table-3");
};
</script>

<style>
    .rotated {
        writing-mode: sideways-lr; text-orientation: mixed;
    }
    .rotatedd {
        writing-mode: vertical-rl; text-orientation: mixed;
    }
    .rotateddd {
        transform: rotate(-90deg);
    }
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
			<th scope="col" colspan="2">Plugin API implemented interfaces for each plugin</th>
			<th scope="col">Coppernic</th>
			<th scope="col">Famoco</th>
			<th scope="col">Arrive</th>
			<th scope="col">Bluebird</th>
			<th scope="col">Legacy<br>HSM</th>
			<th scope="col">Paragon ID<br>Gen5XX</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th scope="rowgroup" rowspan="4">plugin</th>
			<td>PluginSpi</td>
			<td>✓</td>
			<td>✓</td>
			<td>✓</td>
			<td>✓</td>
			<td>✓</td>
			<td>✓</td>
		</tr>
		<tr>
			<td>ObservablePluginSpi</td>
			<td>✓</td>
			<td>✓</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>AutonomousObservablePluginSpi</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>✓</td>
		</tr>
		<tr>
			<td>PoolPluginSpi</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<th scope="rowgroup" rowspan="4">contact</th>
			<td>ReaderSpi</td>
			<td>✓</td>
			<td>✓</td>
			<td>✓</td>
			<td>✓</td>
			<td>✓</td>
			<td>✓</td>
		</tr>
		<tr>
			<td>ConfigurableReaderSpi</td>
			<td>✓</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>AutonomousSelectionReaderSpi</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>PoolReaderSpi</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<th scope="rowgroup" rowspan="12">contact<br>-less</th>
			<td>ReaderSpi</td>
			<td>✓</td>
			<td rowspan="12" class="hachured"></td>
			<td>✓</td>
			<td>✓</td>
			<td rowspan="12" class="hachured"></td>
			<td rowspan="12" class="hachured"></td>
		</tr>
		<tr>
			<td>ConfigurableReaderSpi</td>
			<td>✓</td>
			<td>✓</td>
			<td>✓</td>
		</tr>
		<tr>
			<td>ObservableReaderSpi</td>
			<td>✓</td>
			<td>✓</td>
			<td>✓</td>
		</tr>
		<tr>
			<td>CardInsertionWaiterAsynchronousSpi<br><s>WaitForCardInsertionAutonomousSpi</s></td>
			<td></td>
			<td>✓</td>
			<td>✓</td>
		</tr>
		<tr>
			<td>CardInsertionWaiterBlockingSpi<br><s>WaitForCardInsertionBlockingSpi</s></td>
			<td>✓</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>CardInsertionWaiterNonBlockingSpi<br><s>WaitForCardInsertionNonBlockingSpi</s></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>CardRemovalWaiterAsynchronousSpi<br><s>WaitForCardRemovalAutonomousSpi</s></td>
			<td></td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<td>CardRemovalWaiterBlockingSpi<br><s>WaitForCardRemovalBlockingSpi</s></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>CardRemovalWaiterNonBlockingSpi<br><s>WaitForCardRemovalNonBlockingSpi</s></td>
			<td>✓</td>
			<td></td>
			<td>✓</td>
		</tr>
		<tr>
			<td>CardPresenceMonitorBlockingSpi</td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td><s>DontWaitForCardRemovalDuring
-ProcessingSpi</s></td>
			<td>✓</td>
			<td>✓</td>
			<td>✓</td>
		</tr>
		<tr>
			<td><s>WaitForCardRemovalDuring
-ProcessingBlockingSpi</s></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</tbody>
</table>
