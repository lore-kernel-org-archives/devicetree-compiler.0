From: "Huober, Reiner (Nokia - DE/Ulm)" <reiner.huober-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Subject: Patch for device tree compiler, export stringlist functions (resend
 as text/plain hopefully)
Date: Thu, 14 Sep 2017 13:23:13 +0000
Message-ID: <DB6PR0701MB271276D697034D3480A0F2A7F96F0@DB6PR0701MB2712.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
        boundary="_002_DB6PR0701MB271276D697034D3480A0F2A7F96F0DB6PR0701MB2712_"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=CM3aTvgbtbXy9xaly93XcLl6f3anjHWJ0HeqRNE5hC4=;
 b=GBtqlu7Y7epU/RtgwUMSDbOhNMs37GDeJmZ140p97F6n0BQxGI/tFduIwxez/qrT1+IeV1Dv8x84LjyJDv0iAg+12aNzGfCpQwmmv/JznWs0O4mNS8uyUGe8RJrQJuPqAk9Q8CnKu0UUcpvQklvCGN9Yk0WOLcizDrsNXm7u1YQ=
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Huober, Reiner (Nokia - DE/Ulm)" <reiner.huober-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>

--_002_DB6PR0701MB271276D697034D3480A0F2A7F96F0DB6PR0701MB2712_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

(resend as plain text hopefully)

I have a patch for libfdt inside the device tree compiler. It add missing e=
xports to the linker script=20

Br,
Reiner Huober

--_002_DB6PR0701MB271276D697034D3480A0F2A7F96F0DB6PR0701MB2712_
Content-Type: application/octet-stream;
	name="0001-libfdt-add-stringlist-functions-to-linker-script.patch"
Content-Description: 0001-libfdt-add-stringlist-functions-to-linker-script.patch
Content-Disposition: attachment;
	filename="0001-libfdt-add-stringlist-functions-to-linker-script.patch";
	size=795; creation-date="Thu, 14 Sep 2017 13:21:19 GMT";
	modification-date="Thu, 14 Sep 2017 13:21:19 GMT"
Content-Transfer-Encoding: base64

RnJvbSA0OGQwMWM3NGZiZGZkMTJmZmE0YWE2NWNjOTJmZDQ1Mjk1MmVmYzAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSZWluZXIgSHVvYmVyIDxyZWluZXIuaHVvYmVyQG5va2lhLmNv
bT4KRGF0ZTogVGh1LCAxNCBTZXAgMjAxNyAxNDozNjowNyArMDIwMApTdWJqZWN0OiBbUEFUQ0hd
IGxpYmZkdDogYWRkIHN0cmluZ2xpc3QgZnVuY3Rpb25zIHRvIGxpbmtlciBzY3JpcHQKClRoZSBm
ZHRfc3RyaW5nbGlzdF9jb3VudCwgZmR0X3N0cmluZ3NsaXN0X3NlYXJjaCwgYW5kIGZkdF9zdHJp
bmdsaXN0X2dldAphcmUgYWRkZWQgdG8gdGhlIGxpYmZkdCBsaW5rZXIgc2NyaXB0IGFzIGdsb2Jh
bCBzeW1ib2xzCi0tLQogbGliZmR0L3ZlcnNpb24ubGRzIHwgICAgMyArKysKIDEgZmlsZXMgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYmZk
dC92ZXJzaW9uLmxkcyBiL2xpYmZkdC92ZXJzaW9uLmxkcwppbmRleCBjZmYwMzU4Li4xOGZiNjlm
IDEwMDY0NAotLS0gYS9saWJmZHQvdmVyc2lvbi5sZHMKKysrIGIvbGliZmR0L3ZlcnNpb24ubGRz
CkBAIC02MCw2ICs2MCw5IEBAIExJQkZEVF8xLjIgewogCQlmZHRfYWRkcmVzc19jZWxsczsKIAkJ
ZmR0X3NpemVfY2VsbHM7CiAJCWZkdF9zdHJpbmdsaXN0X2NvbnRhaW5zOworCQlmZHRfc3RyaW5n
bGlzdF9jb3VudDsKKwkJZmR0X3N0cmluZ2xpc3Rfc2VhcmNoOworCQlmZHRfc3RyaW5nbGlzdF9n
ZXQ7CiAJCWZkdF9yZXNpemU7CiAJCWZkdF9vdmVybGF5X2FwcGx5OwogCi0tIAoxLjcuMQoK

--_002_DB6PR0701MB271276D697034D3480A0F2A7F96F0DB6PR0701MB2712_--
