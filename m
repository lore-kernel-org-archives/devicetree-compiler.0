From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 07/29] libfdt: Bring in proposed pylibfdt
	changes
Date: Mon, 9 Jul 2018 13:52:15 -0600
Message-ID: <CAPnjgZ21L4ccyimqAEfpNuwvJZ=SNUUOba1+frKbTX6AwVNBjw@mail.gmail.com>
References: <20180706162742.186950-1-sjg@chromium.org>
 <20180706162742.186950-8-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Y7RSBfHjwTQtshYiTHnK95IHOrwKPUaF9I280PaVZNY=;
 b=dQ9isfEaC7427Lr56If9vSFJQYRBRgTbe+NdPPjGIl5GQbdILPCFhbJtN5Q9bbRQpb
 TzH6zW+Rwljt7/a8CmKPjplIpljvlAXp2iApsDc4ObN/+W4ctSFjlHHwBvRnKQAp/rOv
 oOgSdEG46Coz6mgsLbmFre7V9/TSoYrccW0j4bLIJwG2dYQCiedba1qdh90SbxGWFSxX
 k2fr0ftkMjdnssqoSotVYrzlnpgbVyhJdDCYR2dGutkjlNxgoDOmTFkzmhBRrEGsHumK
 7XMe1Wu//8ejCziIUJjmP5iQL8HO3LePQOkDxlEO3m4hgbw6a84lDhQvqaM0c94wBaM7
 l2Fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Y7RSBfHjwTQtshYiTHnK95IHOrwKPUaF9I280PaVZNY=;
 b=cAQHE/yaD8XO+kOq41wjgx41imOlm9ssu+j7Te7aluDyf/XBAJCJNn7HsSKdBvF529
 Ebo9c5C90ijFSATttUYWtEwjGz1ByrvI+v3+n/jwi5lwsgMAAgL1LUn3Yz29QpkmWDxY
 6Dhnug8G3w8Os9UMiMKNG7gl/99eJRRdjR9pI=
In-Reply-To: <20180706162742.186950-8-sjg@chromium.org>
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
Cc: Tom Rini <trini@konsulko.com>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>

T24gNiBKdWx5IDIwMTggYXQgMTA6MjcsIFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPiB3
cm90ZToKPiBUaGlzIHByb3ZpZGVzIHZhcmlvdXMgcGF0Y2hlcyBzZW50IHRvIHRoZSBkZXZpY2V0
cmVlLWNvbXBpbGVyIG1haWxpbmcgbGlzdAo+IHRvIGVuaGFuY2UgdGhlIFB5dGhvbiBiaW5kaW5n
cy4gQSBmaW5hbCB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2ggbWF5IGJlCj4gY3JlYXRlZCBvbmNlIHVw
c3RyZWFtaW5nIGlzIGNvbXBsZXRlLCBidXQgaWYgaXQgdGFrZXMgdG9vIGxvbmcsIHRoaXMgY2Fu
Cj4gYWN0IGFzIGEgcGxhY2Vob2xkZXIuCj4KPiBOZXcgcHlsaWJmZHQgZmVhdHVyZXM6Cj4gLSBT
dXBwb3J0IGZvciBtb3N0IHJlbWFpbmluZywgcmVsZXZhbnQgbGliZmR0IGZ1bmN0aW9ucwo+IC0g
U3VwcG9ydCBmb3Igc2VxdWVudGlhbC13cml0ZSBmdW5jdGlvbnMKPgo+IENoYW5nZXMgYXJlIGFw
cGxpZWQgdG8gZXhpc3RpbmcgVS1Cb290IHRvb2xzIGFzIG5lZWRlZC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgo+IC0tLQo+Cj4gQ2hhbmdlcyBpbiB2
MjogTm9uZQo+Cj4gIHNjcmlwdHMvZHRjL2xpYmZkdC9saWJmZHQuaCAgICAgICAgICAgfCAgIDMg
Kwo+ICBzY3JpcHRzL2R0Yy9weWxpYmZkdC9saWJmZHQuaV9zaGlwcGVkIHwgNzA1ICsrKysrKysr
KysrKysrKysrKysrKysrLS0tCj4gIHRvb2xzL2R0b2MvZHRvYy5weSAgICAgICAgICAgICAgICAg
ICAgfCAgMjAgKy0KPiAgdG9vbHMvZHRvYy9mZHQucHkgICAgICAgICAgICAgICAgICAgICB8ICAg
MyArLQo+ICB0b29scy9kdG9jL3Rlc3RfZHRvYy5weSAgICAgICAgICAgICAgIHwgICAzICstCj4g
IDUgZmlsZXMgY2hhbmdlZCwgNjYzIGluc2VydGlvbnMoKyksIDcxIGRlbGV0aW9ucygtKQoKCkFw
cGxpZWQgdG8gdS1ib290LWRtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClUtQm9vdCBtYWlsaW5nIGxpc3QKVS1Cb290QGxpc3RzLmRlbnguZGUKaHR0cHM6
Ly9saXN0cy5kZW54LmRlL2xpc3RpbmZvL3UtYm9vdAo=
