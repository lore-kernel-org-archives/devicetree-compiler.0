From: Simon Glass <sjg@chromium.org>
Subject: [PATCH 37/53] libfdt: Copy the struct region in
	fdt_resize()
Date: Sat, 20 Jul 2019 12:23:59 -0600
Message-ID: <20190720182416.183626-38-sjg@chromium.org>
References: <20190720182416.183626-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cP+TB7OtA3RpjJJVXhhWY/ic4wF8wRW+wyAstbp5ApY=;
 b=ltBG6zHq1A3irhkqf6Dl4yRWIxPnvKC80IqpG1fKe5ZgD52vQt6FBzQJcqhG5btgI3
 AvHDt1udU7CRAwl9UDQlAmm2EJLgKfcs+ZJy3cPKzgjjcJuUQm5//OoMYq+AkVP8pron
 jK/LfPArp4EeTlh82wl1aceN++JGRzpyZo/OM=
In-Reply-To: <20190720182416.183626-1-sjg@chromium.org>
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
Content-Type: text/plain; charset="us-ascii"
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>

QXQgcHJlc2VudCB0aGlzIGZ1bmN0aW9uIGFwcGVhcnMgdG8gY29weSBvbmx5IHRoZSBkYXRhIGJl
Zm9yZSB0aGUgc3RydWN0CnJlZ2lvbiBhbmQgdGhlIGRhdGEgaW4gdGhlIHN0cmluZyByZWdpb24u
IEl0IGRvZXMgbm90IHNlZW0gdG8gY29weSB0aGUKc3RydWN0IHJlZ2lvbiBpdHNlbGYuCgpGcm9t
IHRoZSBhcmd1bWVudHMgb2YgdGhpcyBmdW5jdGlvbiBpdCBzZWVtcyB0aGF0IGl0IHNob3VsZCBz
dXBwb3J0IGZkdAphbmQgYnVmIGJlaW5nIGRpZmZlcmVudC4gVGhpcyBwYXRjaCBhdHRlbXB0cyB0
byBmaXggdGhpcyBwcm9ibGVtLgoKVXBzdHJlYW0gY29tbWl0OiBjNzJmYTc3IGxpYmZkdDogQ29w
eSB0aGUgc3RydWN0IHJlZ2lvbiBpbiBmZHRfcmVzaXplKCkKClNpZ25lZC1vZmYtYnk6IFNpbW9u
IEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgotLS0KCiBzY3JpcHRzL2R0Yy9saWJmZHQvZmR0X3N3
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9zY3JpcHRzL2R0Yy9saWJmZHQvZmR0X3N3LmMgYi9zY3JpcHRzL2R0Yy9s
aWJmZHQvZmR0X3N3LmMKaW5kZXggNmQzM2NjMjlkMDIuLmQ4ZWY3NDhhNzIxIDEwMDY0NAotLS0g
YS9zY3JpcHRzL2R0Yy9saWJmZHQvZmR0X3N3LmMKKysrIGIvc2NyaXB0cy9kdGMvbGliZmR0L2Zk
dF9zdy5jCkBAIC0xMTQsNyArMTE0LDcgQEAgaW50IGZkdF9yZXNpemUodm9pZCAqZmR0LCB2b2lk
ICpidWYsIGludCBidWZzaXplKQogCiAJRkRUX1NXX0NIRUNLX0hFQURFUihmZHQpOwogCi0JaGVh
ZHNpemUgPSBmZHRfb2ZmX2R0X3N0cnVjdChmZHQpOworCWhlYWRzaXplID0gZmR0X29mZl9kdF9z
dHJ1Y3QoZmR0KSArIGZkdF9zaXplX2R0X3N0cnVjdChmZHQpOwogCXRhaWxzaXplID0gZmR0X3Np
emVfZHRfc3RyaW5ncyhmZHQpOwogCiAJaWYgKChoZWFkc2l6ZSArIHRhaWxzaXplKSA+IGJ1ZnNp
emUpCi0tIAoyLjIyLjAuNjU3Lmc5NjBlOTJkMjRmLWdvb2cKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClUtQm9vdCBtYWlsaW5nIGxpc3QKVS1Cb290QGxp
c3RzLmRlbnguZGUKaHR0cHM6Ly9saXN0cy5kZW54LmRlL2xpc3RpbmZvL3UtYm9vdAo=
