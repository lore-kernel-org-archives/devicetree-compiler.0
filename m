From: sjg@google.com
Subject: Re: [PATCH 37/53] libfdt: Copy the struct region in
	fdt_resize()
Date: Mon, 29 Jul 2019 14:22:11 -0700
Message-ID: <CAPnjgZ219US0xsV1RUqEcc1nk_dV+aZQ=pf995R+oL+hhiCDOA@mail.gmail.com>
References: <20190720182416.183626-38-sjg@chromium.org>
 <20190720182416.183626-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=KrS91aesQWiPx0wJvR3NL0lRZM+Md5KwQqxlze+6big=;
 b=LL/IN3vNO49K4vr9LtHZwPzMjJN1kSrahh2ZnwROXr8B2AN0eqdQqA47Ai6DknS+y5
 ckQ1O0DmVMJx3iDiZe9VKShZnBJm4xaLK5Fy74jfKjvEfeT3LLQSUnqXY4sBPSCfcZD7
 UJCvGxMyFiLxgjgk0+rv2PnOmhPxZDbAF8hvSPfUKKaSbPEBOqNQungthU8X5QdI5QRE
 M7MGNuUBYYKws3exrWiViSvbXEYqQVu+EhUa+zoVNPJbqECfkQYpgRv4cGlKPg6cFrI1
 Lgcqlg7IUZ/SwN3XaD50S1WGV4pcGsC0HIXD5UhDpttrZyCPtxd7ddg4czlLOi0mXtfc
 gA5w==
In-Reply-To: <20190720182416.183626-38-sjg@chromium.org>
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
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>

QXQgcHJlc2VudCB0aGlzIGZ1bmN0aW9uIGFwcGVhcnMgdG8gY29weSBvbmx5IHRoZSBkYXRhIGJl
Zm9yZSB0aGUgc3RydWN0CnJlZ2lvbiBhbmQgdGhlIGRhdGEgaW4gdGhlIHN0cmluZyByZWdpb24u
IEl0IGRvZXMgbm90IHNlZW0gdG8gY29weSB0aGUKc3RydWN0IHJlZ2lvbiBpdHNlbGYuCgpGcm9t
IHRoZSBhcmd1bWVudHMgb2YgdGhpcyBmdW5jdGlvbiBpdCBzZWVtcyB0aGF0IGl0IHNob3VsZCBz
dXBwb3J0IGZkdAphbmQgYnVmIGJlaW5nIGRpZmZlcmVudC4gVGhpcyBwYXRjaCBhdHRlbXB0cyB0
byBmaXggdGhpcyBwcm9ibGVtLgoKVXBzdHJlYW0gY29tbWl0OiBjNzJmYTc3IGxpYmZkdDogQ29w
eSB0aGUgc3RydWN0IHJlZ2lvbiBpbiBmZHRfcmVzaXplKCkKClNpZ25lZC1vZmYtYnk6IFNpbW9u
IEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgotLS0KCiBzY3JpcHRzL2R0Yy9saWJmZHQvZmR0X3N3
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CkFwcGxpZWQgdG8gdS1ib290LWRtLCB0aGFua3MhCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClUtQm9vdCBtYWlsaW5nIGxpc3QKVS1Cb290QGxpc3RzLmRl
bnguZGUKaHR0cHM6Ly9saXN0cy5kZW54LmRlL2xpc3RpbmZvL3UtYm9vdAo=
