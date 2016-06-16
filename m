From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 4/9] libfdt: Add new headers and defines
Date: Wed, 15 Jun 2016 18:39:40 -0600
Message-ID: <CAPnjgZ3yvfj0UQskY1AN_C_m1UVC+fCnSypyDRFgVM=5rUg_+g@mail.gmail.com>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464340402-2249-5-git-send-email-maxime.ripard@free-electrons.com>
 <D44ABB0F-69B9-4DA6-8F8B-6F74A5B4BFE1@konsulko.com>
 <20160611103035.GW9226@voom.fritz.box>
 <20160613092828.GE4481@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=J+hNK6JjqOWy9LXkxbihuWAQn5YpvhegNK6QSMtEBfo=;
 b=KyiVgQ3V5yY3EAvmAm5mJWLqjKNvS5pBh0MUgv46Jkp83fWz91oov5mP6aGhSaF4B3
 j3PcOpeqsh86SKMi5+sZFyVa/kiJyt3N0ql2AGVtdDkxkpN7T6HFex0ypZj79cAvbSF3
 91VG34uxsAV0Ocqk4HvhRFtzWuMmIQQwvFQYjEhcgeAbrxL9p9Ng2jrqcRtwoO83QCrJ
 1jHABTlUby7bDqs4Mpb8ySdPpKBNyeBPLoLDY2/P0OiK1UN90q9EZCaZ1LF02SFSaKQ2
 i6STlVKzPKCX5+L4NhET3pV/bBGl7UQ/69UvvM25UxKFHbiWNp1rbYIF4sfvPM4Hh2YM
 L6Gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=J+hNK6JjqOWy9LXkxbihuWAQn5YpvhegNK6QSMtEBfo=;
 b=jKhPxkxeCXNxvY6hYn29+NfGIdwkzB8N19cNedtW53crNHtmRgvVTmBTsxzGmtW3Lz
 NE8gzM2I0vtwJ/cx3NhOhJ+EWAGXSnYVS1/2lF4Qcsnczb+Dn085nKzd0aDc1CegBJfr
 iB3G6LeFaErKlFzp0JtO7/xQDQCqkJsnrqH1o=
In-Reply-To: <20160613092828.GE4481@lukather>
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alexander Kaplan <alex@nextthing.co>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson <david@gibson.dropbear.id.au>

SGkgTWF4aW1lLAoKT24gMTMgSnVuZSAyMDE2IGF0IDAzOjI4LCBNYXhpbWUgUmlwYXJkCjxtYXhp
bWUucmlwYXJkQGZyZWUtZWxlY3Ryb25zLmNvbT4gd3JvdGU6Cj4gSGkgRGF2aWQsCj4KPiBPbiBT
YXQsIEp1biAxMSwgMjAxNiBhdCAwODozMDozNVBNICsxMDAwLCBEYXZpZCBHaWJzb24gd3JvdGU6
Cj4+IE9uIEZyaSwgSnVuIDEwLCAyMDE2IGF0IDA1OjAzOjM2UE0gKzAzMDAsIFBhbnRlbGlzIEFu
dG9uaW91IHdyb3RlOgo+PiA+IEhpIE1heGltZSwKPj4gPgo+PiA+ID4gT24gTWF5IDI3LCAyMDE2
LCBhdCAxMjoxMyAsIE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMu
Y29tPiB3cm90ZToKPj4gPiA+Cj4+ID4gPiBUaGUgbGliZmR0IG92ZXJsYXkgc3VwcG9ydCBpbnRy
b2R1Y2VzIGEgYnVuY2ggb2YgbmV3IGluY2x1ZGVzIGFuZAo+PiA+ID4gZnVuY3Rpb25zLgo+PiA+
ID4KPj4gPiA+IE1ha2Ugc3VyZSB3ZSBhcmUgYWJsZSB0byBidWlsZCBpdCBieSBhZGRpbmcgdGhl
IG5lZWRlZCBnbHVlLgo+PiA+ID4KPj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQg
PG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPgo+PiA+ID4gLS0tCj4+ID4gPiBpbmNs
dWRlL2xpYmZkdF9lbnYuaCB8IDcgKysrKysrKwo+PiA+ID4gMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQo+PiA+ID4KPj4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpYmZkdF9lbnYu
aCBiL2luY2x1ZGUvbGliZmR0X2Vudi5oCj4+ID4gPiBpbmRleCAyNzNiNWQzMGY4NjcuLjJkMjE5
NjAzMTMzMiAxMDA2NDQKPj4gPiA+IC0tLSBhL2luY2x1ZGUvbGliZmR0X2Vudi5oCj4+ID4gPiAr
KysgYi9pbmNsdWRlL2xpYmZkdF9lbnYuaAo+PiA+ID4gQEAgLTIzLDYgKzIzLDEzIEBAIHR5cGVk
ZWYgX19iZTY0IGZkdDY0X3Q7Cj4+ID4gPiAjZGVmaW5lIGZkdDY0X3RvX2NwdSh4KSAgICAgICAg
ICAgYmU2NF90b19jcHUoeCkKPj4gPiA+ICNkZWZpbmUgY3B1X3RvX2ZkdDY0KHgpICAgICAgICAg
ICBjcHVfdG9fYmU2NCh4KQo+PiA+ID4KPj4gPiA+ICsjaWZkZWYgX19VQk9PVF9fCj4+ID4gPiAr
I2luY2x1ZGUgIm1hbGxvYy5oIgo+PiA+ID4gKyNpbmNsdWRlICJ2c3ByaW50Zi5oIgo+PiA+ID4g
Kwo+PiA+ID4gKyNkZWZpbmUgc3RydG9sKGNwLCBlbmRwLCBiYXNlKSAgIHNpbXBsZV9zdHJ0b2wo
Y3AsIGVuZHAsIGJhc2UpCj4+ID4gPiArI2VuZGlmCj4+ID4gPiArCj4+ID4gPiAvKiBhZGRpbmcg
YSByYW1kaXNrIG5lZWRzIDB4NDQgYnl0ZXMgaW4gdmVyc2lvbiAyMDA4LjEwICovCj4+ID4gPiAj
ZGVmaW5lIEZEVF9SQU1ESVNLX09WRVJIRUFEICAgICAgMHg4MAo+PiA+ID4KPj4gPgo+PiA+IFdl
IG5lZWQgdG8gZmlndXJlIG91dCB3aGF0IHRoZSB1cHN0cmVhbSBsaWJmZHQvZHRjIG1haW50YWlu
ZXLigJlzIHRha2UgaXMgb24gdGhpcyBpcy4KPj4gPiBGb3IgdS1ib290IHdl4oCZcmUgZmluZSBh
bmQgZm9yIG5vdyBpdOKAmXMgT0suCj4+Cj4+IFRoZXNlIHdlcmUgc2VudCB0byB0aGUgdXBzdHJl
YW0gZHRjIGxpc3QgYXMgd2VsbC4KPj4KPj4gVGhlIGNvbmNlcHQgaXMgZmluZSwgYnV0IHRoZXJl
IGFyZSBhIG51bWJlciBvZiBwcm9ibGVtcyBpbiB0aGUKPj4gaW1wbGVtZW50YXRpb24uICBJIHNl
bnQgZGV0YWlsZWQgcmV2aWV3IGNvbW1lbnRzIG9uIHRoZSB1cHN0cmVhbQo+PiB2ZXJzaW9ucywg
aGF2ZW4ndCBzZWVuIGEgcmVzcGluIHlldC4KPgo+IFllcywgdGhhbmtzIGEgbG90IGZvciB5b3Vy
IGNvbW1lbnRzLCBJJ2xsIGFkZHJlc3MgdGhlbSBhbmQgcmVzZW5kIGEKPiBuZXcgc2VyaWUuCj4K
PiAoaXQgbWlnaHQgbm90IGJlIGJlZm9yZSBhIGNvdXBsZSBvZiB3ZWVrcyB0aG91Z2gpLgoKRm9y
IFUtQm9vdCwgc2hhbGwgd2UgdGFyZ2V0IHRoZSBuZXh0IG1lcmdlIHdpbmRvdz8gT3IgaWYgeW91
IHdvdWxkCnByZWZlciB0byBnZXQgdGhpcyBpbiBzb29uZXIsIHlvdSBjb3VsZCBzZW5kIGFuIGlu
dGVyaW0gdmVyc2lvbiB3aXRoCnRoZSBudGlzIGFkZHJlc3MsIGFuZCB3ZSBjYW4gZG8gYSBmaXgt
dXAgcGF0Y2ggZm9yIFUtQm9vdCBvbmNlIGl0IGlzCmFwcGxpZWQgdXBzdHJlYW0uCgo+Cj4gVGhh
bmtzIQo+IE1heGltZQo+Cj4gLS0KPiBNYXhpbWUgUmlwYXJkLCBGcmVlIEVsZWN0cm9ucwo+IEVt
YmVkZGVkIExpbnV4LCBLZXJuZWwgYW5kIEFuZHJvaWQgZW5naW5lZXJpbmcKPiBodHRwOi8vZnJl
ZS1lbGVjdHJvbnMuY29tCgpSZWdhcmRzLApTaW1vbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpVLUJvb3QgbWFpbGluZyBsaXN0ClUtQm9vdEBsaXN0cy5k
ZW54LmRlCmh0dHA6Ly9saXN0cy5kZW54LmRlL21haWxtYW4vbGlzdGluZm8vdS1ib290Cg==
