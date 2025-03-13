---
title: Calypso cards & SAMs for running Keyple
linkTitle: Card & SAM testing
type: book
toc: true
weight: 20
---

# Mock of readers and smartcards

To test Keyple middleware without hardware (no smart card reader, and no smart card), the project provides:
- the ['Stub' plugin](https://keyple.org/components/standard-reader-plugins/keyple-plugin-stub-lib/), which simulates a virtual smart card reader, with various specific characteristics.
- in addition, the simple examples demonstrating the implementation of Keyple include generators for simulating in [Java](https://github.com/eclipse-keyple/keyple-java-example/tree/main/Example_Card_Calypso/src/main/java/org/eclipse/keyple/card/calypso/example/common) and [C++](https://github.com/eclipse-keyple/keyple-cpp-example/tree/master/Example_Card_Calypso/src/main/common) the “static” behavior of a Calypso card or SAM to APDU commands.

# Availability of a test kit with Calypso cards and SAMs

For “operational” testing, smart card reader solutions need to be integrated into the terminal with reader plugins (based on the Plugin API).
<br>CNA [sells test kits](https://calypsonet.org/technical-support-documentation/) including [various Calypso cards](https://calypsonet.org/document/keyple-test-kit-user-manual-v2-190207/) from [all ranges (Prime, Light, Basic)](https://calypsonet.org/calypso-for-cards/) and samples of [test legacy SAMs](https://calypsonet.org/document/calypso-sam-test-f5-user-manual-v8-110619/).

## Calypso Prime PKI Profile - settings
### Application 1

<style id="210813-KeypleTestKit-CalypsoPrimePkiProfile_v3_app1_31732_Styles">
<!--table
	{mso-displayed-decimal-separator:"\,";
	mso-displayed-thousand-separator:" ";}
@page
	{margin:.75in .7in .75in .7in;
	mso-header-margin:.3in;
	mso-footer-margin:.3in;}
.font0
	{color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;}
.font5
	{color:red;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;}
.font6
	{color:black;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;}
.font7
	{color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;}
.font8
	{color:red;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;}
.font9
	{color:windowtext;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;}
tr
	{mso-height-source:auto;}
col
	{mso-width-source:auto;}
br
	{mso-data-placement:same-cell;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:Normal;
	mso-style-id:0;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
.xl64
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;}
.xl65
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dotted windowtext;
	white-space:normal;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl66
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"General\;General\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dotted windowtext;
	white-space:normal;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl67
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"General\;General\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dotted windowtext;
	white-space:normal;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl68
	{mso-style-parent:style0;
	font-weight:700;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dotted windowtext;
	background:#F2F2F2;
	mso-pattern:black none;}
.xl69
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	border-top:none;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dotted windowtext;
	background:#F2F2F2;
	mso-pattern:black none;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dotted windowtext;
	background:#F2F2F2;
	mso-pattern:black none;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#F2F2F2;
	mso-pattern:black none;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:none;
	border-left:.5pt dotted windowtext;
	background:#F2F2F2;
	mso-pattern:black none;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt dotted windowtext;
	background:#F2F2F2;
	mso-pattern:black none;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;}
.xl75
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;}
.xl77
	{mso-style-parent:style0;
	vertical-align:middle;}
.xl78
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"0\;0\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dotted windowtext;
	white-space:normal;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl79
	{mso-style-parent:style0;
	vertical-align:middle;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	font-weight:700;
	mso-number-format:Scientific;
	vertical-align:middle;}
.xl81
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	font-weight:700;
	mso-number-format:Scientific;
	text-align:left;
	vertical-align:middle;
	background:#FFFF99;
	mso-pattern:black none;}
.xl83
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl84
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl85
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl86
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl87
	{mso-style-parent:style0;
	font-weight:700;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#F2F2F2;
	mso-pattern:black none;}
.xl88
	{mso-style-parent:style0;
	font-weight:700;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#F2F2F2;
	mso-pattern:black none;}
-->
</style>

<table border=0 cellpadding=0 cellspacing=0 width=1044 style='border-collapse:
 collapse;table-layout:fixed;width:780pt'>
 <col width=87 span=12 style='width:65pt'>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl74 width=174 style='height:15.0pt;width:130pt'>Type:</td>
  <td colspan=3 class=xl76 width=261 style='width:195pt'>Calypso Stored Value</td>
  <td class=xl74 width=87 style='width:65pt'>AID:</td>
  <td colspan=2 class=xl82 width=174 style='width:130pt'>A000000291 FF <font
  class="font8">9201</font><font class="font0">h</font></td>
  <td class=xl80 width=87 style='width:65pt'></td>
  <td class=xl80 width=87 style='width:65pt'></td>
  <td class=xl79 width=87 style='width:65pt'></td>
  <td class=xl79 width=87 style='width:65pt'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl74 style='height:15.0pt'></td>
  <td class=xl74></td>
  <td class=xl76></td>
  <td></td>
  <td class=xl74></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
  <td class=xl75 width=87 style='width:65pt'></td>
  <td class=xl75 width=87 style='width:65pt'></td>
  <td class=xl75 width=87 style='width:65pt'></td>
  <td class=xl75 width=87 style='width:65pt'></td>
  <td></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl74 style='height:15.0pt'>Startup:</td>
  <td colspan=2>Session Modifications:</td>
  <td></td>
  <td colspan=7 class=xl76>highest referenced value supported by the product</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl74 style='height:15.0pt'></td>
  <td class=xl74></td>
  <td colspan=2 class=xl76>Application Type:</td>
  <td></td>
  <td colspan=7 rowspan=2 class=xl81 width=609 style='width:455pt'>coding {<font
  class="font7">PKI mode </font><font class="font9">not</font><font
  class="font7"> supported</font><font class="font0">} / {Extended mode </font><font
  class="font8">supported</font><font class="font0">} / {</font><font
  class="font6">with</font><font class="font0"> Calypso stored value} / {</font><font
  class="font6">with</font><font class="font0"> Calypso PIN} / {ratification
  mode: </font><font class="font6">as</font><font class="font0"> supported by
  the product}						</font></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl74 style='height:15.0pt'></td>
  <td class=xl74></td>
  <td class=xl76></td>
  <td class=xl76></td>
  <td class=xl77></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl74 style='height:15.0pt'></td>
  <td class=xl74></td>
  <td colspan=2 class=xl76>Application SubType:</td>
  <td class=xl74>20h</td>
  <td colspan=7 class=xl76>referenced Calypso file structure '20h': <font
  class="font6">Stored Value</font></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl74 style='height:15.0pt'></td>
  <td class=xl74></td>
  <td class=xl76></td>
  <td></td>
  <td class=xl74></td>
  <td class=xl74></td>
  <td class=xl76></td>
  <td class=xl75 width=87 style='width:65pt'></td>
  <td class=xl75 width=87 style='width:65pt'></td>
  <td class=xl75 width=87 style='width:65pt'></td>
  <td class=xl75 width=87 style='width:65pt'></td>
  <td></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl74 style='height:15.0pt'><font class="font5">AES</font><font
  class="font0"> Calypso keyset:</font></td>
  <td class=xl74></td>
  <td class=xl74>KIF</td>
  <td class=xl74>KVC</td>
  <td class=xl74>ALG</td>
  <td colspan=2 style='mso-ignore:colspan'>diversified from</td>
  <td colspan=4 class=xl76>issued from the 'Calypso SAM-TEST-F5v8'</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl74 style='height:15.0pt'></td>
  <td class=xl74></td>
  <td class=xl76>#1 Issuer</td>
  <td class=xl74>01h</td>
  <td class=xl74><font class="font5">74</font><font class="font0">h</font></td>
  <td class=xl74><font class="font5">A0</font><font class="font0">h</font></td>
  <td colspan=2 class=xl81 width=174 style='width:130pt'>MK_SV1<font
  class="font7">_</font><font class="font5">A1</font></td>
  <td class=xl75 width=87 style='width:65pt'></td>
  <td class=xl75 width=87 style='width:65pt'></td>
  <td class=xl75 width=87 style='width:65pt'></td>
  <td></td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td height=21 class=xl74 style='height:16.0pt'></td>
  <td class=xl74></td>
  <td class=xl76>#2 Load</td>
  <td class=xl74>07h</td>
  <td class=xl74><font class="font5">74</font><font class="font0">h</font></td>
  <td class=xl74><font class="font5">A0</font><font class="font0">h</font></td>
  <td colspan=2 class=xl81 width=174 style='width:130pt'>MK_SV2<font
  class="font7">_</font><font class="font5">A1</font></td>
  <td colspan=2 class=xl75 width=174 style='width:130pt'>shared Calypso<span
  style='mso-spacerun:yes'>  </span>PIN:</td>
  <td class=xl75 width=87 style='width:65pt'>30303030h</td>
  <td class=xl75 width=87 style='width:65pt'>&quot;0000&quot;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl74 style='height:15.0pt'></td>
  <td class=xl74></td>
  <td class=xl76>#3 Debit</td>
  <td class=xl74>10h</td>
  <td class=xl74><font class="font5">74</font><font class="font0">h</font></td>
  <td class=xl74><font class="font5">A0</font><font class="font0">h</font></td>
  <td colspan=2 class=xl81 width=174 style='width:130pt'>MK_SV3<font
  class="font7">_</font><font class="font5">A1</font></td>
  <td class=xl77></td>
  <td class=xl77></td>
  <td class=xl77></td>
  <td class=xl77></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl74 style='height:15.0pt'></td>
  <td class=xl74></td>
  <td class=xl74></td>
  <td class=xl74></td>
  <td class=xl74></td>
  <td class=xl74></td>
  <td class=xl74></td>
  <td class=xl75 width=87 style='width:65pt'></td>
  <td class=xl75 width=87 style='width:65pt'></td>
  <td class=xl75 width=87 style='width:65pt'></td>
  <td class=xl75 width=87 style='width:65pt'></td>
  <td></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl74 style='height:15.0pt'>File structure:</td>
  <td class=xl74></td>
  <td class=xl74></td>
  <td class=xl74></td>
  <td class=xl74></td>
  <td class=xl74></td>
  <td class=xl75 width=87 style='width:65pt'></td>
  <td class=xl75 width=87 style='width:65pt'></td>
  <td class=xl75 width=87 style='width:65pt'></td>
  <td class=xl75 width=87 style='width:65pt'></td>
  <td></td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td height=21 class=xl64 style='height:16.0pt'></td>
  <td class=xl64></td>
  <td class=xl64></td>
  <td class=xl64></td>
  <td class=xl64></td>
  <td class=xl64></td>
  <td class=xl64></td>
  <td class=xl71 width=87 style='width:65pt'>Group 0</td>
  <td class=xl72 width=87 style='border-left:none;width:65pt'>Group 1</td>
  <td class=xl72 width=87 style='border-left:none;width:65pt'>Group 2</td>
  <td class=xl72 width=87 style='border-left:none;width:65pt'>Group 3</td>
  <td class=xl73 width=87 style='border-left:none;width:65pt'>EF Sharing</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td colspan=2 height=40 class=xl87 style='border-right:.5pt dotted black;
  height:30.0pt'>File</td>
  <td class=xl68 style='border-left:none'>Type</td>
  <td class=xl68 style='border-left:none'>LID</td>
  <td class=xl68 style='border-left:none'>SFI</td>
  <td class=xl68 style='border-left:none'>Rec. Num.</td>
  <td class=xl68 style='border-left:none'>Rec. Size</td>
  <td class=xl69 width=87 style='border-left:none;width:65pt'>Read<br>
    Rehabilitate</td>
  <td class=xl69 width=87 style='border-left:none;width:65pt'>Update<br>
    Invalidate</td>
  <td class=xl69 width=87 style='border-left:none;width:65pt'>Write<br>
    Decrease</td>
  <td class=xl69 width=87 style='border-left:none;width:65pt'>Append<br>
    Increase</td>
  <td class=xl70 width=87 style='border-left:none;width:65pt'>Data Ref.</td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td colspan=2 height=21 class=xl83 style='border-right:.5pt dotted black;
  height:16.0pt'>DF</td>
  <td class=xl65 width=87 style='border-top:none;border-left:none;width:65pt'>DF</td>
  <td class=xl65 width=87 style='border-top:none;border-left:none;width:65pt'>1000h</td>
  <td class=xl66 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
  <td class=xl78 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
  <td class=xl78 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
  <td class=xl66 width=87 style='border-top:none;border-left:none;width:65pt'>Session
  1</td>
  <td class=xl66 width=87 style='border-top:none;border-left:none;width:65pt'>Session
  3</td>
  <td class=xl66 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
  <td class=xl66 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
  <td class=xl67 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td colspan=2 height=21 class=xl85 style='border-right:.5pt dotted black;
  height:16.0pt'>Load Log</td>
  <td class=xl65 width=87 style='border-top:none;border-left:none;width:65pt'>Cyclic</td>
  <td class=xl65 width=87 style='border-top:none;border-left:none;width:65pt'>1014h</td>
  <td class=xl66 width=87 style='border-top:none;border-left:none;width:65pt'>14h</td>
  <td class=xl78 width=87 style='border-top:none;border-left:none;width:65pt'>1</td>
  <td class=xl78 width=87 style='border-top:none;border-left:none;width:65pt'>29</td>
  <td class=xl66 width=87 style='border-top:none;border-left:none;width:65pt'>Always</td>
  <td class=xl66 width=87 style='border-top:none;border-left:none;width:65pt'>Never</td>
  <td class=xl66 width=87 style='border-top:none;border-left:none;width:65pt'>Never</td>
  <td class=xl66 width=87 style='border-top:none;border-left:none;width:65pt'>Never</td>
  <td class=xl67 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td colspan=2 height=21 class=xl85 style='border-right:.5pt dotted black;
  height:16.0pt'>Purchase Log</td>
  <td class=xl65 width=87 style='border-top:none;border-left:none;width:65pt'>Cyclic</td>
  <td class=xl65 width=87 style='border-top:none;border-left:none;width:65pt'>1015h</td>
  <td class=xl66 width=87 style='border-top:none;border-left:none;width:65pt'>15h</td>
  <td class=xl78 width=87 style='border-top:none;border-left:none;width:65pt'>3</td>
  <td class=xl78 width=87 style='border-top:none;border-left:none;width:65pt'>29</td>
  <td class=xl66 width=87 style='border-top:none;border-left:none;width:65pt'>Always</td>
  <td class=xl66 width=87 style='border-top:none;border-left:none;width:65pt'>Never</td>
  <td class=xl66 width=87 style='border-top:none;border-left:none;width:65pt'>Never</td>
  <td class=xl66 width=87 style='border-top:none;border-left:none;width:65pt'>Never</td>
  <td class=xl67 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
 </tr>
 <![endif]>
</table>

### Application 2

<style id="210813-KeypleTestKit-CalypsoPrimePkiProfile_v3_app2_908_Styles">
<!--table
	{mso-displayed-decimal-separator:"\,";
	mso-displayed-thousand-separator:" ";}
@page
	{margin:.75in .7in .75in .7in;
	mso-header-margin:.3in;
	mso-footer-margin:.3in;}
.font0
	{color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;}
.font5
	{color:red;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;}
.font6
	{color:black;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;}
.font7
	{color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;}
.font8
	{color:red;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;}
.font9
	{color:windowtext;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;}
tr
	{mso-height-source:auto;}
col
	{mso-width-source:auto;}
br
	{mso-data-placement:same-cell;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:Normal;
	mso-style-id:0;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
.xl66
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"0\;0\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	white-space:normal;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl67
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"General\;General\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	white-space:normal;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl68
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:middle;
	white-space:normal;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl69
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:middle;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl70
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;}
.xl71
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dotted windowtext;
	white-space:normal;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl72
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"General\;General\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dotted windowtext;
	white-space:normal;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl73
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"General\;General\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dotted windowtext;
	white-space:normal;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl74
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl75
	{mso-style-parent:style0;
	font-weight:700;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dotted windowtext;
	background:#F2F2F2;
	mso-pattern:black none;}
.xl76
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	border-top:none;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dotted windowtext;
	background:#F2F2F2;
	mso-pattern:black none;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dotted windowtext;
	background:#F2F2F2;
	mso-pattern:black none;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#F2F2F2;
	mso-pattern:black none;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:none;
	border-left:.5pt dotted windowtext;
	background:#F2F2F2;
	mso-pattern:black none;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt dotted windowtext;
	background:#F2F2F2;
	mso-pattern:black none;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;}
.xl82
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;}
.xl85
	{mso-style-parent:style0;
	vertical-align:middle;}
.xl86
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"0\;0\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dotted windowtext;
	white-space:normal;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl87
	{mso-style-parent:style0;
	vertical-align:middle;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	font-weight:700;
	mso-number-format:Scientific;}
.xl89
	{mso-style-parent:style0;
	color:red;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dotted windowtext;
	white-space:normal;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl90
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl91
	{mso-style-parent:style0;
	color:black;}
.xl92
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#F2F2F2;
	mso-pattern:black none;
	white-space:normal;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl93
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	mso-number-format:"General\;General\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#F2F2F2;
	mso-pattern:black none;
	white-space:normal;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl94
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:none;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl95
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:none;
	white-space:normal;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl96
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl97
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"General\;General\;\0022-\0022";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:none;
	border-left:.5pt dotted windowtext;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"General\;General\;\0022-\0022";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt dotted windowtext;
	border-bottom:none;
	border-left:.5pt dotted windowtext;
	white-space:normal;}
.xl99
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"0\;0\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt dotted windowtext;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"0\;0\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"0\;0\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt dotted windowtext;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"0\;0\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	font-weight:700;
	mso-number-format:Scientific;
	text-align:left;
	background:#FFFF99;
	mso-pattern:black none;}
.xl104
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl105
	{mso-style-parent:style0;
	font-weight:700;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#F2F2F2;
	mso-pattern:black none;}
.xl106
	{mso-style-parent:style0;
	font-weight:700;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#F2F2F2;
	mso-pattern:black none;}
.xl107
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl108
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl109
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#F2F2F2;
	mso-pattern:black none;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl110
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#F2F2F2;
	mso-pattern:black none;
	padding-left:6px;
	mso-char-indent-count:1;}
.xl111
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	mso-number-format:"0\;0\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dotted windowtext;
	background:#F2F2F2;
	mso-pattern:black none;
	white-space:normal;}
.xl112
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	mso-number-format:"0\;0\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#F2F2F2;
	mso-pattern:black none;
	white-space:normal;}
.xl113
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	mso-number-format:"0\;0\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#F2F2F2;
	mso-pattern:black none;
	white-space:normal;}
.xl114
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl115
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted windowtext;
	border-bottom:none;
	border-left:none;}
.xl116
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl117
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:.5pt dotted windowtext;
	border-bottom:none;
	border-left:none;}
.xl118
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;}
.xl119
	{mso-style-parent:style0;
	color:windowtext;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid black;
	border-left:none;}
.xl120
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"General\;General\;\0022-\0022";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt dotted windowtext;
	white-space:normal;}
.xl121
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"0\;0\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl122
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"0\;0\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl123
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"0\;0\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt dotted windowtext;
	white-space:normal;}
.xl124
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"0\;0\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	color:windowtext;
	mso-number-format:"0\;0\;\0022-\0022";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	color:windowtext;
	text-align:center;
	vertical-align:middle;}
.xl127
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	background:#FFFF99;
	mso-pattern:black none;
	white-space:normal;}
-->
</style>

<table border=0 cellpadding=0 cellspacing=0 width=1044 style='border-collapse:
 collapse;table-layout:fixed;width:780pt'>
 <col width=87 span=12 style='width:65pt'>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl81 width=174 style='height:15.0pt;width:130pt'>Type:</td>
  <td colspan=3 class=xl84 width=261 style='width:195pt'>Calypso Transport</td>
  <td class=xl81 width=87 style='width:65pt'>AID:</td>
  <td colspan=2 class=xl103 width=174 style='width:130pt'>A000000291 FF <font
  class="font8">9101</font><font class="font0">h</font></td>
  <td class=xl88 width=87 style='width:65pt'></td>
  <td class=xl88 width=87 style='width:65pt'></td>
  <td class=xl87 width=87 style='width:65pt'></td>
  <td class=xl87 width=87 style='width:65pt'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl81 style='height:15.0pt'></td>
  <td class=xl81></td>
  <td class=xl84></td>
  <td></td>
  <td class=xl81></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
  <td class=xl83 width=87 style='width:65pt'></td>
  <td class=xl83 width=87 style='width:65pt'></td>
  <td class=xl83 width=87 style='width:65pt'></td>
  <td class=xl83 width=87 style='width:65pt'></td>
  <td></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl81 style='height:15.0pt'>Startup:</td>
  <td colspan=2>Session Modifications:</td>
  <td></td>
  <td colspan=7 class=xl84>highest referenced value supported by the product</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl81 style='height:15.0pt'></td>
  <td class=xl81></td>
  <td colspan=2 class=xl84>Application Type:</td>
  <td></td>
  <td colspan=7 rowspan=2 class=xl127 width=609 style='width:455pt'>coding {<font
  class="font7">PKI mode </font><font class="font8">supported</font><font
  class="font0">} / {Extended mode </font><font class="font8">supported</font><font
  class="font0">} / {</font><font class="font6">with</font><font class="font0">
  Calypso stored value} / {</font><font class="font6">with</font><font
  class="font0"> Calypso PIN} / {ratification mode: </font><font class="font6">as</font><font
  class="font0"> supported by the product}						</font></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl81 style='height:15.0pt'></td>
  <td class=xl81></td>
  <td class=xl84></td>
  <td class=xl84></td>
  <td class=xl85></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl81 style='height:15.0pt'></td>
  <td class=xl81></td>
  <td colspan=2 class=xl84>Application SubType:</td>
  <td class=xl81><font class="font5">02</font><font class="font0">h</font></td>
  <td colspan=7 class=xl84>referenced Calypso file structure <font class="font7">'02</font><font
  class="font0">h': </font><font class="font8">Revision 2 Minimum with MF files</font></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl81 style='height:15.0pt'></td>
  <td class=xl81></td>
  <td class=xl84></td>
  <td></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl84></td>
  <td class=xl83 width=87 style='width:65pt'></td>
  <td class=xl83 width=87 style='width:65pt'></td>
  <td class=xl83 width=87 style='width:65pt'></td>
  <td class=xl83 width=87 style='width:65pt'></td>
  <td></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl81 style='height:15.0pt'><font class="font5">AES</font><font
  class="font0"> Calypso keyset:</font></td>
  <td class=xl81></td>
  <td class=xl81>KIF</td>
  <td class=xl81>KVC</td>
  <td class=xl81>ALG</td>
  <td colspan=2 style='mso-ignore:colspan'>diversified from</td>
  <td colspan=4 class=xl84>issued from the 'Calypso SAM-TEST-F5v8'</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl81 style='height:15.0pt'></td>
  <td class=xl81></td>
  <td class=xl84>#1 Issuer</td>
  <td class=xl81>21h</td>
  <td class=xl81><font class="font5">74</font><font class="font0">h</font></td>
  <td class=xl81><font class="font5">A0</font><font class="font0">h</font></td>
  <td colspan=2 class=xl82 width=174 style='width:130pt'>MK_RT1<font
  class="font7">_</font><font class="font5">A1</font></td>
  <td class=xl83 width=87 style='width:65pt'></td>
  <td class=xl83 width=87 style='width:65pt'></td>
  <td class=xl83 width=87 style='width:65pt'></td>
  <td></td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td height=21 class=xl81 style='height:16.0pt'></td>
  <td class=xl81></td>
  <td class=xl84>#2 Load</td>
  <td class=xl81>27h</td>
  <td class=xl81><font class="font5">74</font><font class="font0">h</font></td>
  <td class=xl81><font class="font5">A0</font><font class="font0">h</font></td>
  <td colspan=2 class=xl82 width=174 style='width:130pt'>MK_RT2<font
  class="font7">_</font><font class="font5">A1</font></td>
  <td colspan=2 class=xl83 width=174 style='width:130pt'>shared Calypso<span
  style='mso-spacerun:yes'>  </span>PIN:</td>
  <td class=xl83 width=87 style='width:65pt'>30303030h</td>
  <td class=xl83 width=87 style='width:65pt'>&quot;0000&quot;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl81 style='height:15.0pt'></td>
  <td class=xl81></td>
  <td class=xl84>#3 Debit</td>
  <td class=xl81>30h</td>
  <td class=xl81><font class="font5">74</font><font class="font0">h</font></td>
  <td class=xl81><font class="font5">A0</font><font class="font0">h</font></td>
  <td colspan=2 class=xl82 width=174 style='width:130pt'>MK_RT3<font
  class="font7">_</font><font class="font5">A1</font></td>
  <td class=xl85></td>
  <td class=xl85></td>
  <td class=xl85></td>
  <td class=xl85></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl81 style='height:15.0pt'></td>
  <td class=xl81></td>
  <td class=xl84></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl82 width=87 style='width:65pt'></td>
  <td class=xl82 width=87 style='width:65pt'></td>
  <td class=xl85></td>
  <td class=xl85></td>
  <td class=xl85></td>
  <td class=xl85></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl81 style='height:15.0pt'><font class="font5">PKI</font><font
  class="font0"> settings:</font></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl82 width=87 style='width:65pt'></td>
  <td class=xl82 width=87 style='width:65pt'></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl81 style='height:15.0pt'></td>
  <td class=xl81></td>
  <td class=xl84 colspan=2 style='mso-ignore:colspan'>PO Key Pair (ECC)</td>
  <td class=xl81></td>
  <td class=xl81>not initialized</td>
  <td class=xl82 width=87 style='width:65pt'></td>
  <td class=xl82 width=87 style='width:65pt'></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl81 style='height:15.0pt'></td>
  <td class=xl81></td>
  <td class=xl84>CACert</td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81>not initialized</td>
  <td class=xl82 width=87 style='width:65pt'></td>
  <td class=xl82 width=87 style='width:65pt'></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl81 style='height:15.0pt'></td>
  <td class=xl81></td>
  <td class=xl84>POCert</td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81>not initialized</td>
  <td class=xl82 width=87 style='width:65pt'></td>
  <td class=xl82 width=87 style='width:65pt'></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl81 style='height:15.0pt'></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl83 width=87 style='width:65pt'></td>
  <td class=xl83 width=87 style='width:65pt'></td>
  <td class=xl83 width=87 style='width:65pt'></td>
  <td class=xl83 width=87 style='width:65pt'></td>
  <td></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl81 style='height:15.0pt'>File structure:</td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl81></td>
  <td class=xl83 width=87 style='width:65pt'></td>
  <td class=xl83 width=87 style='width:65pt'></td>
  <td class=xl83 width=87 style='width:65pt'></td>
  <td class=xl83 width=87 style='width:65pt'></td>
  <td></td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td height=21 class=xl70 style='height:16.0pt'></td>
  <td class=xl70></td>
  <td class=xl70></td>
  <td class=xl70></td>
  <td class=xl70></td>
  <td class=xl70></td>
  <td class=xl70></td>
  <td class=xl78 width=87 style='width:65pt'>Group 0</td>
  <td class=xl79 width=87 style='border-left:none;width:65pt'>Group 1</td>
  <td class=xl79 width=87 style='border-left:none;width:65pt'>Group 2</td>
  <td class=xl79 width=87 style='border-left:none;width:65pt'>Group 3</td>
  <td class=xl80 width=87 style='border-left:none;width:65pt'>EF Sharing</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td colspan=2 height=40 class=xl105 style='border-right:.5pt dotted black;
  height:30.0pt'>File</td>
  <td class=xl75 style='border-left:none'>Type</td>
  <td class=xl75 style='border-left:none'>LID</td>
  <td class=xl75 style='border-left:none'>SFI</td>
  <td class=xl75 style='border-left:none'>Rec. Num.</td>
  <td class=xl75 style='border-left:none'>Rec. Size</td>
  <td class=xl76 width=87 style='border-left:none;width:65pt'>Read<br>
    Rehabilitate</td>
  <td class=xl76 width=87 style='border-left:none;width:65pt'>Update<br>
    Invalidate</td>
  <td class=xl76 width=87 style='border-left:none;width:65pt'>Write<br>
    Decrease</td>
  <td class=xl76 width=87 style='border-left:none;width:65pt'>Append<br>
    Increase</td>
  <td class=xl77 width=87 style='border-left:none;width:65pt'>Data Ref.</td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td colspan=2 height=21 class=xl104 style='border-right:.5pt dotted black;
  height:16.0pt'>DF</td>
  <td class=xl71 width=87 style='border-top:none;border-left:none;width:65pt'>DF</td>
  <td class=xl71 width=87 style='border-top:none;border-left:none;width:65pt'>2000h</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
  <td class=xl86 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
  <td class=xl86 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Session
  1</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Session
  3</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
  <td class=xl73 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td colspan=2 height=21 class=xl104 style='border-right:.5pt dotted black;
  height:16.0pt'>ICC</td>
  <td class=xl71 width=87 style='border-top:none;border-left:none;width:65pt'>Linear</td>
  <td class=xl89 width=87 style='border-top:none;border-left:none;width:65pt'>2002h</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>02h</td>
  <td class=xl86 width=87 style='border-top:none;border-left:none;width:65pt'>1</td>
  <td class=xl86 width=87 style='border-top:none;border-left:none;width:65pt'>29</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Always</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Never</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Session
  1</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
  <td class=xl73 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td colspan=2 height=21 class=xl104 style='border-right:.5pt dotted black;
  height:16.0pt'>ID</td>
  <td class=xl71 width=87 style='border-top:none;border-left:none;width:65pt'>Linear</td>
  <td class=xl89 width=87 style='border-top:none;border-left:none;width:65pt'>2003h</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>03h</td>
  <td class=xl86 width=87 style='border-top:none;border-left:none;width:65pt'>1</td>
  <td class=xl86 width=87 style='border-top:none;border-left:none;width:65pt'>29</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>PIN</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Session
  2</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Never</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
  <td class=xl73 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td height=21 class=xl74 style='height:16.0pt;border-top:none'>Environment</td>
  <td class=xl90 style='border-top:none'>&nbsp;</td>
  <td class=xl71 width=87 style='border-top:none;border-left:none;width:65pt'>Linear</td>
  <td class=xl71 width=87 style='border-top:none;border-left:none;width:65pt'>2001h</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>07h</td>
  <td class=xl86 width=87 style='border-top:none;border-left:none;width:65pt'>1</td>
  <td class=xl86 width=87 style='border-top:none;border-left:none;width:65pt'>29</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Always</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Session
  1</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Never</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
  <td class=xl73 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td colspan=2 height=21 class=xl104 style='border-right:.5pt dotted black;
  height:16.0pt'>Events Log</td>
  <td class=xl71 width=87 style='border-top:none;border-left:none;width:65pt'>Cyclic</td>
  <td class=xl71 width=87 style='border-top:none;border-left:none;width:65pt'>2010h</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>08h</td>
  <td class=xl86 width=87 style='border-top:none;border-left:none;width:65pt'>3</td>
  <td class=xl86 width=87 style='border-top:none;border-left:none;width:65pt'>29</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Always</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Session
  3</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Session
  3</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Session
  3</td>
  <td class=xl73 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td height=21 class=xl74 style='height:16.0pt;border-top:none'>Special Events</td>
  <td class=xl90 style='border-top:none'>&nbsp;</td>
  <td class=xl71 width=87 style='border-top:none;border-left:none;width:65pt'>Linear</td>
  <td class=xl71 width=87 style='border-top:none;border-left:none;width:65pt'>2040h</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>1Dh</td>
  <td class=xl86 width=87 style='border-top:none;border-left:none;width:65pt'>1</td>
  <td class=xl86 width=87 style='border-top:none;border-left:none;width:65pt'>29</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Always</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Session
  3</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Never</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
  <td class=xl73 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
 </tr>
 <tr height=43 style='mso-height-source:userset;height:32.0pt'>
  <td colspan=2 height=43 class=xl107 width=174 style='border-right:.5pt dotted black;
  height:32.0pt;width:130pt'>Contract List</td>
  <td class=xl71 width=87 style='border-top:none;border-left:none;width:65pt'>Linear</td>
  <td class=xl71 width=87 style='border-top:none;border-left:none;width:65pt'>2050h</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>1Eh</td>
  <td class=xl86 width=87 style='border-top:none;border-left:none;width:65pt'>1</td>
  <td class=xl86 width=87 style='border-top:none;border-left:none;width:65pt'>29</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Always</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Session
  3</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Never</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
  <td class=xl73 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td colspan=2 height=21 class=xl104 style='border-right:.5pt dotted black;
  height:16.0pt'>Contracts</td>
  <td class=xl71 width=87 style='border-top:none;border-left:none;width:65pt'>Linear</td>
  <td class=xl71 width=87 style='border-top:none;border-left:none;width:65pt'>2020h</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>09h</td>
  <td class=xl86 width=87 style='border-top:none;border-left:none;width:65pt'>4</td>
  <td class=xl86 width=87 style='border-top:none;border-left:none;width:65pt'>29</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Always</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Session
  2</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Session
  3</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
  <td class=xl73 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td colspan=2 height=21 class=xl104 style='border-right:.5pt dotted black;
  height:16.0pt'>Counters</td>
  <td class=xl71 width=87 style='border-top:none;border-left:none;width:65pt'>Counters</td>
  <td class=xl71 width=87 style='border-top:none;border-left:none;width:65pt'>2069h</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>19h</td>
  <td class=xl86 width=87 style='border-top:none;border-left:none;width:65pt'>1</td>
  <td class=xl86 width=87 style='border-top:none;border-left:none;width:65pt'>29</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Always</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Session
  2</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Session
  3</td>
  <td class=xl72 width=87 style='border-top:none;border-left:none;width:65pt'>Session
  2</td>
  <td class=xl73 width=87 style='border-top:none;border-left:none;width:65pt'>-</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=12 style='height:15.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl126 style='height:15.0pt'>Initial data:</td>
  <td class=xl68 width=87 style='width:65pt'></td>
  <td class=xl67 width=87 style='width:65pt'></td>
  <td class=xl66 width=87 style='width:65pt'></td>
  <td class=xl66 width=87 style='width:65pt'></td>
  <td class=xl67 width=87 style='width:65pt'></td>
  <td class=xl67 width=87 style='width:65pt'></td>
  <td class=xl67 width=87 style='width:65pt'></td>
  <td class=xl67 width=87 style='width:65pt'></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl69 style='height:15.0pt'></td>
  <td class=xl91></td>
  <td class=xl68 width=87 style='width:65pt'></td>
  <td class=xl67 width=87 style='width:65pt'></td>
  <td class=xl66 width=87 style='width:65pt'></td>
  <td class=xl66 width=87 style='width:65pt'></td>
  <td class=xl67 width=87 style='width:65pt'></td>
  <td class=xl67 width=87 style='width:65pt'></td>
  <td class=xl67 width=87 style='width:65pt'></td>
  <td class=xl67 width=87 style='width:65pt'></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td colspan=2 height=21 class=xl109 style='border-right:.5pt dotted black;
  height:16.0pt'>File</td>
  <td class=xl92 width=87 style='width:65pt'>Rec. Num</td>
  <td class=xl93 width=87 style='width:65pt'>Size</td>
  <td colspan=6 class=xl111 width=522 style='border-right:.5pt solid black;
  border-left:none;width:390pt'>Pre-personalized data</td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 rowspan=4 height=80 class=xl114 style='border-right:.5pt dotted black;
  border-bottom:.5pt solid black;height:60.0pt'>Contracts (2020h / 09h)</td>
  <td class=xl94>1</td>
  <td rowspan=4 class=xl97 width=87 style='border-bottom:.5pt solid black;
  border-top:none;width:65pt'>29</td>
  <td colspan=6 rowspan=4 class=xl99 width=522 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:390pt'>00000<font class="font9">FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF</font><font
  class="font7">h</font></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl95 width=87 style='height:15.0pt;width:65pt'>2</td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl95 width=87 style='height:15.0pt;width:65pt'>3</td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl96 width=87 style='height:15.0pt;width:65pt'>4</td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=87 style='width:65pt'></td>
 </tr>
 <![endif]>
</table>

### Application 3 - 'nominal configuration'
### Application 1 - 'Alternative configuration' (limited memory)
### Application 4
### Application 5
