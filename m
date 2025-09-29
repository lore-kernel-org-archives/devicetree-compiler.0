Received: from mta21.hihonor.com (mta21.honor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0BA1E51FB
	for <devicetree-compiler@vger.kernel.org>; Mon, 29 Sep 2025 02:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759113211; cv=none; b=jGoLGLcxAx5MJUoJbjNEGee0ZralOqzEo6OxZwz3qlc5UpheAJ7czZr1BZHAX6QZbaO13FpAmmDqA2ewGUNHSFvfo3TqWrWM4RHRdUArTz+yDG62fHX1NOOVWmnj7kULjt7rykqLt5uauR+UxoeX4c65gt8S69WR++hKzXAvyZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759113211; c=relaxed/simple;
	bh=GClL5EibI5igxxz3527/k4VES4rg20+dECu6OiXtmQ0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f9rBrbtEBtbScFKG9FkMOK1Z67FwbFQOuoLJKyTdEaCkR3cJ6JE0wAEykDMhEN2eGXQh/15P5N/wLxuzEgv/1QsguKd5kdRnC4a1CzKDiKcunVa2cOpfIPIpr21Br5KVDBSEd9RbqjcNLx2i/2UMC0GVCwR0NSQGY+g19ow+IEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w012.hihonor.com (unknown [10.68.27.189])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4cZlbD3LhtzYl0pZ;
	Mon, 29 Sep 2025 10:32:40 +0800 (CST)
Received: from w021.hihonor.com (10.68.19.97) by w012.hihonor.com
 (10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 29 Sep
 2025 10:33:20 +0800
Received: from w025.hihonor.com (10.68.28.69) by w021.hihonor.com
 (10.68.19.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 29 Sep
 2025 10:33:19 +0800
Received: from w025.hihonor.com ([fe80::eef3:4315:b492:9c1a]) by
 w025.hihonor.com ([fe80::eef3:4315:b492:9c1a%14]) with mapi id
 15.02.1544.011; Mon, 29 Sep 2025 10:33:19 +0800
From: yuanlinyu <yuanlinyu@honor.com>
To: David Gibson <david@gibson.dropbear.id.au>
CC: "devicetree-compiler@vger.kernel.org"
	<devicetree-compiler@vger.kernel.org>
Subject: RE: [PATCH] label: collect labels to __phandles__ node in interger
 format
Thread-Topic: [PATCH] label: collect labels to __phandles__ node in interger
 format
Thread-Index: AQHcGzszgJgYA0DHKUee4ObcZOXwPbSpnAlQ
Date: Mon, 29 Sep 2025 02:33:19 +0000
Message-ID: <f1dc6b4b445a4429aaf416b00926b162@honor.com>
References: <20250901122258.2557912-1-yuanlinyu@honor.com>
In-Reply-To: <20250901122258.2557912-1-yuanlinyu@honor.com>
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

SGkgRGF2aWQgYW5kIG90aGVyIGRldmljZXRyZWUgZGV2ZWxvcGVyLA0KDQpDb3VsZCB5b3UgaGVs
cCByZXZpZXcgdGhpcyBjaGFuZ2UgPw0KDQp0aGFua3MNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiB5dWFubGlueXUgPHl1YW5saW55dUBob25vci5jb20+IA0KU2VudDogTW9uZGF5
LCBTZXB0ZW1iZXIgMSwgMjAyNSA4OjIzIFBNDQpUbzogRGF2aWQgR2lic29uIDxkYXZpZEBnaWJz
b24uZHJvcGJlYXIuaWQuYXU+DQpDYzogZGV2aWNldHJlZS1jb21waWxlckB2Z2VyLmtlcm5lbC5v
cmc7IHl1YW5saW55dSA8eXVhbmxpbnl1QGhvbm9yLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gbGFi
ZWw6IGNvbGxlY3QgbGFiZWxzIHRvIF9fcGhhbmRsZXNfXyBub2RlIGluIGludGVyZ2VyIGZvcm1h
dA0KDQpDdXJyZW50bHkgbGFiZWxzIGFyZSBjb2xsZWN0IHRvIF9fc3ltYm9sc19fIG5vZGUgaW4g
cGF0aCBzdHJpbmcgZm9ybWF0LA0KdGhlIGxpYnVmZHQgaGF2ZSBubyBzdXBwb3J0IG9mIGl0IHdo
ZW4gZG8gb3ZlcmxheS4NCg0KQWRkIGEgbmV3IG1ldGhvZCB3aGljaCBjb2xsZWN0IGxhYmVscyBp
biBfX3BoYW5kbGVzX18gbm9kZSB3aGljaCBlYWNoDQplbnRyeSBpcyBhbiBpbnRlcmdlciBmb3Jt
YXQsIGl0IHdpbGwgYWxsb3cgbGlidWZkdCB0byBrZWVwIGxhYmVscyB3aGVuDQpkbyAoc3RhY2sp
IG92ZXJsYXkuDQoNClRoZSBuZXcgbWV0aG9kIGluY2x1ZGluZyBiZWxvdyBwb2ludHMsDQoxLiBh
ZGQgYW4gb3B0aW9uIC1QIGZvciBkdGMgdG9vbCwgaXQgd2lsbCBjcmVhdGUgX19waGFuZGxlc19f
IG5vZGUgYW5kDQpsYWJlbHMgaW4gaW50ZXJnZXIgZm9yYW10DQoyLiBhZGQgbmV3IGZ1bmN0aW9u
IGluIGZkdF9vdmVybGF5LmMgdG8gc3VwcG9ydCBtZXJnZSBfX3BoYW5kbGVzX18gbm9kZQ0KMy4g
YWRkIG92ZXJsYXkgdGVzdCB3aGljaCB0ZXN0IC1QIG9wdGlvbg0KLS0tDQogZHRjLmMgICAgICAg
ICAgICAgICAgfCAgMTggKysrLQ0KIGR0Yy5oICAgICAgICAgICAgICAgIHwgICA0ICstDQogbGli
ZmR0L2ZkdF9vdmVybGF5LmMgfCAyNTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLQ0KIGxpdmV0cmVlLmMgICAgICAgICAgIHwgIDc2ICsrKysrKysrKysrLS0NCiB0
ZXN0cy9ydW5fdGVzdHMuc2ggICB8ICA4NCArKysrKysrKysrKysrKysNCiA1IGZpbGVzIGNoYW5n
ZWQsIDM5MiBpbnNlcnRpb25zKCspLCA0MCBkZWxldGlvbnMoLSkNCg==
