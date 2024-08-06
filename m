Received: from mx0f-0072c001.gpphosted.com (mx0f-0072c001.gpphosted.com [67.231.155.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CF122071
	for <devicetree-compiler@vger.kernel.org>; Tue,  6 Aug 2024 16:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.155.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722961818; cv=fail; b=DRaMoGuUasTO23j/O3RmuTXhZsmVegCMtFFC1LiD/u1wLlY5svRuw3jrDwSBj5DKH/eHnObmeI95HE+5KV0RlorsbHC2V5mOWFnPRB/9cnKbUCWAQJWYdvKpR/brl+d095l/zrM1r0D9HPjEC/66W8Zs6GG1gEtZCHZfqK3hnp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722961818; c=relaxed/simple;
	bh=lNnNrZs3JpIJAtdjumYzCetyw0klNR16nFCIT2vKAnQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AtENx2EREckh6lVNme8fYEzVDNWn7FEuxLrA5XplibbS1HgNdnJa6F4SP66KHjprj8phEDcPpQPo61uuXmv0x8poQ7pHzNvGIAbjRuyBoTVtgOdJydBThipjU4Ckq64f5nX/C7hcTEso5wbnhP7ljfiXmD3jsl/C9Vvf0zPaV3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arcfield.com; spf=pass smtp.mailfrom=arcfield.com; dkim=pass (2048-bit key) header.d=arcfield.com header.i=@arcfield.com header.b=S7xQGIij; arc=fail smtp.client-ip=67.231.155.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arcfield.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arcfield.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arcfield.com header.i=@arcfield.com header.b="S7xQGIij"
Received: from pps.filterd (m0294116.ppops.net [127.0.0.1])
	by mx0e-0072c001.gpphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 476BPW72023816;
	Tue, 6 Aug 2024 16:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcfield.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=2-22;
 bh=Bka4OrKtrhQel3Fmr2azKOkGF3+0CmDJNj8QFGdp0d8=;
 b=S7xQGIijqvZsD1JmCLUT4IL8x3tOVsxdJZgC3tBVUlrG8QC8nA5x112rW4xVSHpXvMcE
 SvIQg6Z58rsqO6UIbK7Qy4oitqYk+4Ddno5SXBYcag4AyhNhRrWfNPmFtsKsFEQ4xrmN
 6w5ZkycxhnZ6BWO9/EYPIMre7FXOiyHQNxH0C2pVKrm+lW4RuBzvBzNfuCx7iwTW+o8C
 fghuBrIiCoooZrMRebNrhrAhQ1M1TC3ONjCtv/M0ARYShpLO/d+NPLNAmb0yuoY1UaKT
 8EFQCN5SSoaml9pfH6UdrEsTWTkMWtaxwCzvdpJflK8eklYfdxdMMG2KMKm3zJHrF/JB 6Q== 
Received: from usg02-cy1-obe.outbound.protection.office365.us (mail-cy1usg02lp0176.outbound.protection.office365.us [23.103.199.176])
	by mx0e-0072c001.gpphosted.com (PPS) with ESMTPS id 40sc6bhh0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 16:29:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=veIYjGA+e8IDaqYJAd8WegUCxfQ5up/ynAPIaEQKje8JWxlPSrOQQ1cR5xBYVAzOt9cq8UYlob3hRjhYibgT9jdLQso0/0Ob4wGbJX2GmOlyLm/gol7AZAn+9ngf1XMAnvLnj0sRaLZX7mUlBCN6Ezx1gWJmL4Mb7IfLWDdPjXbujSV13ulOZS5AgUI3JbCzRwDF7gLdSHXbknvBLQbpvGb86p7ITNjHAj7wTRz5QziGQC74nZRgXwUNdCoRQSfQYEyVCGPZnK+3josL4A/UFLEo0rjszlDwN9NGdhO+3dT5CdyBjSLGE1q6MqL1kJpCMzMmjzgJQ6kkxQzAUSxibQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bka4OrKtrhQel3Fmr2azKOkGF3+0CmDJNj8QFGdp0d8=;
 b=E5zTI8a0SYIYfOvEnkgAFHVSjdmsHhc7xNt/tIdR/hT0ydo8wB7G0v4fH3vDz64hfPe2AUsjv32JLv8EEFb6zL+j+ldfWRyogw6Z3L8VlRo7vizSeiNQf2/X9SSC3Q4Q43VMBj+VT0Lh9PMpBfvNfcSwwuCmds5bf+u6NOrlCwyJ4gxItST14mn40LKiyAkPgzVZdsmBnb71n9jbN54M6VfcMyboVQcRqOYWySSEZnWk87GAZ1yJoWM/EFfawnyHAMuwzBHp2U4eqUO5Xg9tkTGOgnxp+ZVYkowI5wQ9/F0qoxwM4gJZ71FPIPmq6BQu/bifLW+ZXjCTebzdktFz4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arcfield.com; dmarc=pass action=none header.from=arcfield.com;
 dkim=pass header.d=arcfield.com; arc=none
Received: from BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16a::14)
 by BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.37; Tue, 6 Aug
 2024 16:29:46 +0000
Received: from BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5565:4d3:9a6c:eb85]) by BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5565:4d3:9a6c:eb85%6]) with mapi id 15.20.7784.035; Tue, 6 Aug 2024
 16:29:45 +0000
From: "Hoover, Erich (Orion)" <erich.hoover@arcfield.com>
To: David Gibson <david@gibson.dropbear.id.au>
CC: "devicetree-compiler@vger.kernel.org"
	<devicetree-compiler@vger.kernel.org>
Subject: Re: [EXTERNAL] Re: Array manipulation revisit
Thread-Topic: [EXTERNAL] Re: Array manipulation revisit
Thread-Index: AQHa51Vypyte3j8OpkK2fEH+YSSWULIZf4EAgADhyqE=
Date: Tue, 6 Aug 2024 16:29:45 +0000
Message-ID:
 <BN2P110MB10581ACB77C1C26CC331650DF5BFA@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
References:
 <BN2P110MB1058FB69969C91282858C8ECF5B3A@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
 <Zq3QIVrmUTTc4gjC@zatzit>
 <BN2P110MB105818EC9B379BD63B261E20F5BEA@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
 <ZrGIOi9eTBKsf_I1@zatzit.fritz.box>
In-Reply-To: <ZrGIOi9eTBKsf_I1@zatzit.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN2P110MB1058:EE_|BN2P110MB1160:EE_
x-ms-office365-filtering-correlation-id: 229434bd-fd13-4f17-913c-08dcb634fbba
arcfieldproofpoint-x-header: T25seUlmSmlubnlBbGxvd3M=
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?9mtzgv515Zjm4Mzd2TNjhCDpYjyPSTp86oxuINEWiVy/tCkvW50NC3XqaO?=
 =?iso-8859-1?Q?QZZoy9B4srzcdYviMfGknOYkPQKmd58g5i0dWcrisNtAm7s+nXjXK0xfH8?=
 =?iso-8859-1?Q?RoK1/cFHcbZeoBZbX9F4HR5CfCmloKQXzNjsijN2qpMr4Z5KPP8yEC6jzp?=
 =?iso-8859-1?Q?8MGiID/V/keLl+j15hk3fbjOHK2ffAjex4krOKPeNFeLAsjYrEx7lyeKha?=
 =?iso-8859-1?Q?3IS3NOQRT99uLzi5pxST8mmqAOZKMciCehlsRhZzdIi8N6UQ0WeRx+wqY7?=
 =?iso-8859-1?Q?wBOJt31DWZwy114nA+CHLTGoZVluMUXQlTq3fZhdywHXMDi22IoB+tWZdH?=
 =?iso-8859-1?Q?IUdlNFAbqYgKS721zZdHvDP/js7yuVgnPsaq3IUabxvuav36hnhUjcydaN?=
 =?iso-8859-1?Q?BtIMy+u5h0iQuqUHjAIOzG/eEoXPc1tKZgyj1dBHCI7sDMkxPcah9Km+Ot?=
 =?iso-8859-1?Q?HrOapMJPLFZv6y3OAw/d+i35r3VmRtjHj0eg3UgDc9hHFirdyBt6ARdfqY?=
 =?iso-8859-1?Q?shJrTEDRBlr5lahfBldjWX2qKcRYtztqLI+KrxpinjK16zmZHYpMUcVDok?=
 =?iso-8859-1?Q?UB8mZxwHHEOQyko662Lp1QsBrf6dXJR7+9sO4wo5uERkAquZWV7kAg3xu2?=
 =?iso-8859-1?Q?P/joHk4f+9yHMi6fFweNlz+7TNgU/PWNsAfRBXSj4o1tgIy3moFtBmEyk3?=
 =?iso-8859-1?Q?VGBcD0njX1YO4hktW3naMX05aNtH83tmRFo2DuPIHDqWeEL5fqkRiI/Y5+?=
 =?iso-8859-1?Q?5cICQNfQb/dHEGsTecty74U1T27Gqk0BmYdkojK8j/pC4ANl46taTm2F9f?=
 =?iso-8859-1?Q?UjPZOe6eh1/2Sjiwoxx0CvCQSdw0KJi8/MRnCl03pkHbCZ8JgofigAWcmB?=
 =?iso-8859-1?Q?ksWxDO+1ZvhJlYxvdjs/rgZGQV7T1UWImoAHebE8KudcTieJdBDrBbAWmP?=
 =?iso-8859-1?Q?UF7oKM4pHieAk2AWuYUD+tfq0stSl8ku+s7UqhTzCXH7PtLuUMz/BSFSQr?=
 =?iso-8859-1?Q?ICgU5Gb+rzAXtDaCL6mNux3Y5YQsf4j/hM7oeZDBFSaB6PGHtJtZmt2C9A?=
 =?iso-8859-1?Q?PR/JHK/wq9vsj44APc1YCWp4BJJr+Am7aSTOmgqju3yDCAR+iXFyJvWzQa?=
 =?iso-8859-1?Q?A1vQZYatwkFEzVNltcFzEeA+HJeM7cceuz3W8aBzccS8O0COjCqovlx+Bp?=
 =?iso-8859-1?Q?Bflua+omJGmzwtT8WuMNYu1bxmRt7h6H4QCc02IqL6pcx0/4kyckHwsPmb?=
 =?iso-8859-1?Q?cvzPDqClt3ZPaqoSFKGOz12dKTpGZpyhWUhDv23xE2+j6yW52qmVO7eJTt?=
 =?iso-8859-1?Q?ya3SlNFWanYdSH83jjO2TEy51mCpe2t3LxTvtJl6/z3WhFP9cbXsEbPsto?=
 =?iso-8859-1?Q?khgCb6xKDZi9/q6lt8MDOYUfKFvfUQIjf4gD7jrs3Je129+hWP44uL++8L?=
 =?iso-8859-1?Q?BkSCy+1VsI8RFlnJYngKju7moxzSVeXr4OQ1tA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JVqMxUmP0OZhC9pGs7ofwXAj0uRz//eESNVlprjMSnk3RoBQu3APiR6BM0?=
 =?iso-8859-1?Q?IWWhVIW7HFyY4aq9z6zE+zN8EoiXK3T8TzdEPObNu6+DTyZEMPbuZNNVHH?=
 =?iso-8859-1?Q?95Gn4oVAINVoAtg/pphzuEogknotSuLLBhUoHxG2CuNiyt14Bpopy6Sj/D?=
 =?iso-8859-1?Q?PGqAUyi8b/JPtXVs35QY81n9ff9zMnJgdhg0NXGnedSK+X0vl3dkW85weK?=
 =?iso-8859-1?Q?7Eu7zlXY1Gv6SgqT0eqzLUhdaKE1S47bBUlv4MHm61pB4IwVcSIXfznjDx?=
 =?iso-8859-1?Q?vKpXpb98I+aDkundlidqWJOR9cj3j1cCHd9fzUzrH+/YCE/Sl+uGugiL0c?=
 =?iso-8859-1?Q?eERix2UdVAvWAY3atC2ewCyjBx4CxY+A9JqGp3mZme65HB4mxkI4+j/U5v?=
 =?iso-8859-1?Q?Z4xuNedtNYBmMzTbPtMVAWE26FtE2w/sRfiHXqDKi1njVyeSyXf4/l2NWG?=
 =?iso-8859-1?Q?5EDVH6Tb50dukiTGgO+5n45eIxwOnHYrQIxltneljNnjSf+kZP5rUwNpka?=
 =?iso-8859-1?Q?5CIDUUsrQjhnJ0Rxx6ooLt08MOzjI6iLdKSvE6UuOGhUpP9hQ4OPoBQkJM?=
 =?iso-8859-1?Q?Gn5rYG3wLEiSw8gvQ866vhfdVW3vXNPgPwsSzpZgG41XmrWCDSN5Os6R3k?=
 =?iso-8859-1?Q?6fZVQ3jmcpEbrAUNU9hTdv63+AthFTx9oSLuQENbvAg7kiui+xVgirLkFm?=
 =?iso-8859-1?Q?YlTEJwtkgLJO4U93kXCyBqzNQzDBEod8vs/sT6xp2hFe8lHwObSzHBoPGF?=
 =?iso-8859-1?Q?kytkxLr8gMN+R0QL2iYEOIKAyKTSkSGNzjJGviDVMR1TwDjbXnDTtS8u+f?=
 =?iso-8859-1?Q?2Cpql85LMaVjCwFTOWnpBuM04tX2Ec+btUj4cfHTKGlljB7yBDn5zBAzy1?=
 =?iso-8859-1?Q?m0MGn/8SgfgoCuul9u+TZkNQp1dyyVR2LC8yT9M3lywq7jL+ZxH5D0/yiX?=
 =?iso-8859-1?Q?cU7yADdm9iKWpBcihLOITnNbphuR+nyYZlppAt2+Yzs0vHqF/iL5Wdaj5r?=
 =?iso-8859-1?Q?5VlX1qcLYgZrqI4SYZACncuaLy0k37UH3ZtpIU9D8zTZpgiScvz60uHJEn?=
 =?iso-8859-1?Q?7dBZcNjcjywmb29nYDDbLO3vK+BXHiPJv47pDq/YBX2xGPZmQuPrVYKaH0?=
 =?iso-8859-1?Q?LyFbJtjWQiJ7X4mxlI7P0q+aWsLFqPfCdzkJZyrdc5+Ky8B7kqDf6lXzKK?=
 =?iso-8859-1?Q?cFtrB79zY4O6SRwLtw6V0q4vHDHaUDLRFyQ3kgT6hWrk1UUHgtaaJjr6S6?=
 =?iso-8859-1?Q?Ueh+aAdlWT8FJ97MIAqxVE9SIEoHOVj+RHIjoBTMgm1pUs41ZymsJ7c+2s?=
 =?iso-8859-1?Q?hK5fQTxFMWrOx0FD931fWFtDLbjQ+cPO7uPJeK0OaYoMxF9DApN3SgCHJZ?=
 =?iso-8859-1?Q?JUd0gPcVZD33fDY3ffp2KSF8YpggnO2qXoyjuIpNdDM0oTT60spc5CJ96Q?=
 =?iso-8859-1?Q?OOlxnf6qCAaz55DQmhwHdDnljvHprH70BdeDB0zN3b+vbLg8JQUp8Pohx5?=
 =?iso-8859-1?Q?hiUix+iRSju7YNWMJo0nkSiGFLbIWtuNdYEUisPgu4L0kaoXlT/DptfEYe?=
 =?iso-8859-1?Q?yc1VWPQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: arcfield.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 229434bd-fd13-4f17-913c-08dcb634fbba
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 16:29:45.7398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff94c0a7-07cc-47df-8981-11dfddd57863
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1160
X-Proofpoint-GUID: q_6A4P_7ApHvXgq70XvkDa3EzwahQ_y-
X-Proofpoint-ORIG-GUID: q_6A4P_7ApHvXgq70XvkDa3EzwahQ_y-
X-Proofpoint-Virus-Version: vendor=nai engine=6700 definitions=11156 signatures=596817
X-Proofpoint-Spam-Reason: orgsafe

> From:=A0David Gibson=0A=
> Sent:=A0Monday, August 5, 2024 8:19 PM=0A=
> ...=0A=
> > It seems like string arrays are the only complicated case,=0A=
> =0A=
> Not really.=A0 Mixed properties that have both integers and strings in=0A=
> them get even worse.=0A=
=0A=
I was not thinking of this case, but if you want to handle this case in an =
initial implementation I would suggest:=0A=
   PROPERTY[1*5+s*1+4*0] =3D /bits/ 32 0x0;=0A=
(skip five bytes, skip a string, replace first 32-bit array element)=0A=
=0A=
> Those aren't common, but they exist.=A0 Or=0A=
> properties that have a mixture of integer sizes - that's much more=0A=
> common, since it can include 'reg', 'ranges' and 'interrupts'.=0A=
=0A=
You could do something similar to the above or, for simplicity, just count =
bytes:=0A=
   PROPERTY[1*5] =3D /bits/ 32 0x0;=0A=
(replace 32-bit value starting at fifth byte)=0A=
=0A=
> ...=0A=
> Ah, so you're suggesting putting those annotations in the property=0A=
> name itself inside the dtbo.=A0 That's not a bad idea as encodings go.=0A=
=0A=
Yes, in this case I'm thinking that the dtbo needs to be handled by libfdt=
=0A=
(or a similar tool) before being passed to the kernel.  Though the kernel=
=0A=
could conceivably support something like this directly.=0A=
=0A=
> > For older utilities, or ones without the=0A=
> > handling for this extra information, the utility generates an error=0A=
> > or just adds a strangely named property that gets ignored (when I=0A=
> > gave this a quick try by hex editing a DTBO, the kernel happily gave=0A=
> > me a "gpio-line-names[s*148]").=0A=
> =0A=
> Right, but then you silently get output that wasn't what you expected=0A=
> which can be nasty to debug.=0A=
=0A=
Well, libfdt does the right thing and generates an error.  I would imagine=
=0A=
that the version flag (or something similar) could be used to anger the=0A=
kernel rather than creating strangely named properties.=0A=
=0A=
> ...=0A=
> > Yeah, I understand why they did it the way they did - but it=0A=
> > definitely makes this particular task harder.=A0 Some of our systems=0A=
> > are incredibly storage-constrained,=0A=
>=0A=
> Well, that raises another issue: this would add a substantial amount=0A=
> of code to libfdt, which is supposed to be runnable in very=0A=
> constrained environments.=0A=
> ...=0A=
=0A=
I did a quick prototype of the string case in dtmerge, for convenience, and=
 it doesn't seem too bad to me:=0A=
=3D=3D=3D=0A=
        dtoverlay_debug("  +prop(%s)", prop_name);=0A=
        prop_name_len =3D strlen(prop_name);=0A=
        array =3D memchr(prop_name, '[', prop_name_len);=0A=
        array_end =3D memchr(prop_name, ']', prop_name_len);=0A=
        if (array && array_end && array_end - array >=3D 4 && array[2] =3D=
=3D '*')=0A=
        {=0A=
            if (array[1] !=3D 's')=0A=
            {=0A=
                dtoverlay_error("  unhandled overlay array type: %s", prop_=
name);=0A=
                err =3D -FDT_ERR_BADSTRUCTURE;=0A=
                break;=0A=
            }=0A=
            prop_name_local =3D malloc(prop_name_len);=0A=
            strncpy(prop_name_local, prop_name, (array - prop_name));=0A=
            prop_name =3D prop_name_local;=0A=
        }=0A=
        else if (array && array_end)=0A=
        {=0A=
            dtoverlay_error("  invalid overlay array: %s", prop_name);=0A=
            err =3D -FDT_ERR_BADSTRUCTURE;=0A=
            break;=0A=
        }=0A=
=0A=
        if (array && array_end &&=0A=
            ((target_prop =3D fdt_get_property_w(base_dtb->fdt, target_off,=
 prop_name, &target_len)) !=3D NULL) &&=0A=
            (target_len > 0))=0A=
        {=0A=
            int before_len, after_len;=0A=
            char *old_val, *new_val;=0A=
            int array_element;=0A=
            const char *p;=0A=
=0A=
            array_element =3D strtoul(&array[3], NULL, 10);=0A=
            old_val =3D target_prop->data;=0A=
            new_val =3D malloc(prop_len + target_len);=0A=
            p =3D fdt_stringlist_get(base_dtb->fdt, target_off, prop_name, =
array_element, NULL);=0A=
            if (!p)=0A=
            {=0A=
                err =3D -FDT_ERR_NOTFOUND;=0A=
                break;=0A=
            }=0A=
            before_len =3D p - old_val;=0A=
            p =3D fdt_stringlist_get(base_dtb->fdt, target_off, prop_name, =
array_element + 1, NULL);=0A=
            after_len =3D (p ? target_len - (p - old_val) : 0);=0A=
            memcpy(&new_val[0], old_val, before_len);=0A=
            memcpy(&new_val[before_len], prop_val, prop_len);=0A=
            memcpy(&new_val[before_len+prop_len], p, after_len);=0A=
            err =3D fdt_setprop(base_dtb->fdt, target_off, prop_name, new_v=
al, before_len + after_len + prop_len);=0A=
            free(new_val);=0A=
        }=0A=
        else if ...=0A=
=0A=
        free(prop_name_local);=0A=
=3D=3D=3D=0A=
=0A=
Do you consider something like this to be too much?  I feel like adding sup=
port for the integer array cases is pretty trivial, but if you're wanting t=
o support mixed property types then the error checking on that would get pr=
etty complicated.=0A=
=0A=
Best,=0A=
Erich E. Hoover, Ph.D.=0A=
erich.hoover@arcfield.com=
