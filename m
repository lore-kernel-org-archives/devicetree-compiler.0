Received: from mta21.hihonor.com (mta21.hihonor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C25F34FF59
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Mar 2026 02:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772765780; cv=none; b=tSPfaQ/gxE+HCIv61O2YqPgBa6gxLNRIVAXRHGvD2vDEMuHv2K63i/vNux+nNrpqhkBNscK8aTZHcRaHSIMuIZ7fVmp6hr7p8e4FLzELThpHS8TBE4ZaeOek8O1MWGCvsZHXYNl3VYbHmS1qDSb7eRRyvKtRO1uR9NyIc5hjzV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772765780; c=relaxed/simple;
	bh=Du1iS5qu1bvhjQqaCz4eoCVLgPuqiXzMrsBM751SrCQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n3wfo5gPmTP9yTK7RqDYoSGnfDGkIvbN35SRlqT55BNcKMrYDXvPJwOmpGpGQu9toQ3vNKSoF4cuOes9VBLdOfT/1Lq0hdEqK4qhriZxQVkfCAcJlVKbzF3ZYbLMJznpnwlp49m74NRjdZmGeShe3hO6EZdVuP1wXBy5A2y6z1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w002.hihonor.com (unknown [10.68.28.120])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4fRr9R3DYQzYm4vS;
	Fri,  6 Mar 2026 10:35:23 +0800 (CST)
Received: from w019.hihonor.com (10.68.20.133) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Fri, 6 Mar
 2026 10:38:57 +0800
Received: from w025.hihonor.com (10.68.28.69) by w019.hihonor.com
 (10.68.20.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Fri, 6 Mar
 2026 10:38:56 +0800
Received: from w025.hihonor.com ([fe80::5a3b:9b85:bbde:73b9]) by
 w025.hihonor.com ([fe80::5a3b:9b85:bbde:73b9%14]) with mapi id
 15.02.2562.027; Fri, 6 Mar 2026 10:38:56 +0800
From: yuanlinyu <yuanlinyu@honor.com>
To: David Gibson <david@gibson.dropbear.id.au>
CC: "devicetree-compiler@vger.kernel.org"
	<devicetree-compiler@vger.kernel.org>
Subject: RE: [PATCH] label: collect labels to __phandles__ node in interger
 format
Thread-Topic: [PATCH] label: collect labels to __phandles__ node in interger
 format
Thread-Index: AQHcGzszgJgYA0DHKUee4ObcZOXwPbSpnAlQgAYFcYCA8kv0oA==
Date: Fri, 6 Mar 2026 02:38:56 +0000
Message-ID: <93baad58256248278d57831a568414eb@honor.com>
References: <20250901122258.2557912-1-yuanlinyu@honor.com>
 <f1dc6b4b445a4429aaf416b00926b162@honor.com> <aN9tNVi25NOxyJoW@zatzit>
In-Reply-To: <aN9tNVi25NOxyJoW@zatzit>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

PiBGcm9tOiBEYXZpZCBHaWJzb24gPGRhdmlkQGdpYnNvbi5kcm9wYmVhci5pZC5hdT4NCj4gU2Vu
dDogRnJpZGF5LCBPY3RvYmVyIDMsIDIwMjUgMjoyOSBQTQ0KPiBUbzogeXVhbmxpbnl1IDx5dWFu
bGlueXVAaG9ub3IuY29tPg0KPiBDYzogZGV2aWNldHJlZS1jb21waWxlckB2Z2VyLmtlcm5lbC5v
cmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gbGFiZWw6IGNvbGxlY3QgbGFiZWxzIHRvIF9fcGhh
bmRsZXNfXyBub2RlIGluIGludGVyZ2VyDQo+IGZvcm1hdA0KPiANCj4gT24gTW9uLCBTZXAgMjks
IDIwMjUgYXQgMDI6MzM6MTlBTSArMDAwMCwgeXVhbmxpbnl1IHdyb3RlOg0KPiA+IEhpIERhdmlk
IGFuZCBvdGhlciBkZXZpY2V0cmVlIGRldmVsb3BlciwNCj4gPg0KPiA+IENvdWxkIHlvdSBoZWxw
IHJldmlldyB0aGlzIGNoYW5nZSA/DQo+IA0KPiBTb3JyeSBmb3IgdGhlIGxhY2sgb2YgcmVwbHku
ICBJJ20gbm90IGdvaW5nIHRvIGFwcGx5IHRoaXMuICBUaGVyZSdzIGN1cnJlbnRseSBhIGJpZw0K
PiBkaXNjdXNzaW9uIHVuZGVyd2F5IG9uIHRoaXMgbGlzdCAoYW1vbmdzdCBvdGhlcnMpIGFib3V0
IGJldHRlciB3YXlzIG9mIGRvaW5nDQo+IHJ1bnRpbWUgZGV2aWNlIHRyZWUgbW9kaWZpY2F0aW9u
cy4gICgiUmU6DQo+IERldmljZSB0cmVlIHJlcHJlc2VudGF0aW9uIG9mIChob3RwbHVnKSBjb25u
ZWN0b3JzOiBkaXNjdXNzaW9uIGF0IEVMQ0UiKS4NCj4gDQo+IE15IG1haW4gcG9pbnQgaW4gdGhh
dCB0aHJlYWQgaXMgdGhhdCB3ZSBuZWVkIHRvIHJlY29uc2lkZXIgdGhlIGRlc2lnbiBvZiB0aGlz
DQo+IGVuZC10by1lbmQsIGFuZCBub3QgYWRkIG1vcmUgaGFja3Mgb24gdG9wIG9mIHRoZSBvdmVy
bGF5IG1lY2hhbmlzbSB3aGljaCB3YXMNCj4gbmV2ZXIgcmVhbGx5IGRlc2lnbmVkIGZvciB0aGlz
Lg0KDQpIaSBtYWludGFpbmVyLA0KSXMgaXQgcG9zc2libGUgdG8gcmVjb25zaWRlciB0byB0YWtl
IHRoaXMgY2hhbmdlID8NCg0KT3IgY291bGQgeW91IHNoYXJlIHRoZSBpZGVhIHRvIGltcHJvdmUg
aXQgPw0KDQo+IA0KPiA+DQo+ID4gdGhhbmtzDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPiBGcm9tOiB5dWFubGlueXUgPHl1YW5saW55dUBob25vci5jb20+DQo+ID4gU2VudDog
TW9uZGF5LCBTZXB0ZW1iZXIgMSwgMjAyNSA4OjIzIFBNDQo+ID4gVG86IERhdmlkIEdpYnNvbiA8
ZGF2aWRAZ2lic29uLmRyb3BiZWFyLmlkLmF1Pg0KPiA+IENjOiBkZXZpY2V0cmVlLWNvbXBpbGVy
QHZnZXIua2VybmVsLm9yZzsgeXVhbmxpbnl1DQo+ID4gPHl1YW5saW55dUBob25vci5jb20+DQo+
ID4gU3ViamVjdDogW1BBVENIXSBsYWJlbDogY29sbGVjdCBsYWJlbHMgdG8gX19waGFuZGxlc19f
IG5vZGUgaW4NCj4gPiBpbnRlcmdlciBmb3JtYXQNCj4gPg0KPiA+IEN1cnJlbnRseSBsYWJlbHMg
YXJlIGNvbGxlY3QgdG8gX19zeW1ib2xzX18gbm9kZSBpbiBwYXRoIHN0cmluZw0KPiA+IGZvcm1h
dCwgdGhlIGxpYnVmZHQgaGF2ZSBubyBzdXBwb3J0IG9mIGl0IHdoZW4gZG8gb3ZlcmxheS4NCj4g
Pg0KPiA+IEFkZCBhIG5ldyBtZXRob2Qgd2hpY2ggY29sbGVjdCBsYWJlbHMgaW4gX19waGFuZGxl
c19fIG5vZGUgd2hpY2ggZWFjaA0KPiA+IGVudHJ5IGlzIGFuIGludGVyZ2VyIGZvcm1hdCwgaXQg
d2lsbCBhbGxvdyBsaWJ1ZmR0IHRvIGtlZXAgbGFiZWxzIHdoZW4NCj4gPiBkbyAoc3RhY2spIG92
ZXJsYXkuDQo+ID4NCj4gPiBUaGUgbmV3IG1ldGhvZCBpbmNsdWRpbmcgYmVsb3cgcG9pbnRzLCAx
LiBhZGQgYW4gb3B0aW9uIC1QIGZvciBkdGMNCj4gPiB0b29sLCBpdCB3aWxsIGNyZWF0ZSBfX3Bo
YW5kbGVzX18gbm9kZSBhbmQgbGFiZWxzIGluIGludGVyZ2VyIGZvcmFtdA0KPiA+IDIuIGFkZCBu
ZXcgZnVuY3Rpb24gaW4gZmR0X292ZXJsYXkuYyB0byBzdXBwb3J0IG1lcmdlIF9fcGhhbmRsZXNf
Xw0KPiA+IG5vZGUgMy4gYWRkIG92ZXJsYXkgdGVzdCB3aGljaCB0ZXN0IC1QIG9wdGlvbg0KPiA+
IC0tLQ0KPiA+ICBkdGMuYyAgICAgICAgICAgICAgICB8ICAxOCArKystDQo+ID4gIGR0Yy5oICAg
ICAgICAgICAgICAgIHwgICA0ICstDQo+ID4gIGxpYmZkdC9mZHRfb3ZlcmxheS5jIHwgMjUwICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0NCj4gPiAgbGl2ZXRyZWUu
YyAgICAgICAgICAgfCAgNzYgKysrKysrKysrKystLQ0KPiA+ICB0ZXN0cy9ydW5fdGVzdHMuc2gg
ICB8ICA4NCArKysrKysrKysrKysrKysNCj4gPiAgNSBmaWxlcyBjaGFuZ2VkLCAzOTIgaW5zZXJ0
aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pDQo+IA0KPiAtLQ0KPiBEYXZpZCBHaWJzb24gKGhlIG9y
IHRoZXkpCXwgSSdsbCBoYXZlIG15IG11c2ljIGJhcm9xdWUsIGFuZCBteSBjb2RlDQo+IGRhdmlk
IEFUIGdpYnNvbi5kcm9wYmVhci5pZC5hdQl8IG1pbmltYWxpc3QsIHRoYW5rIHlvdSwgbm90IHRo
ZSBvdGhlciB3YXkNCj4gCQkJCXwgYXJvdW5kLg0KPiBodHRwOi8vd3d3Lm96bGFicy5vcmcvfmRn
aWJzb24NCg==
