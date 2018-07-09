From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 09/29] libfdt: Add get_property() and
	del_node()
Date: Mon, 9 Jul 2018 13:52:26 -0600
Message-ID: <CAPnjgZ27FBEH=hcWNSRLMtGP2nZMEpk1h_oHrgZ5Bm+pTbVbCA@mail.gmail.com>
References: <20180706162742.186950-1-sjg@chromium.org>
 <20180706162742.186950-10-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=p8zIlTxTg73iU2mdhqKahIZNX85T1eGxEQPYlraUqMU=;
 b=ne4+8Gu5B/hfpoShHnnkd+K4Xai6EIeUoH2RYKdOY07VH7RrXwAv2Ly1bDqBxmBiJd
 xKq8lvOHFjmNW2L1CiFaWj1R03Wv4ZpEs73jxzIw4sF8MveWQ1ZTcRPTTMNqZX+8O6eV
 ZLjxY4e6Jo2DBJxhWSyBVFGFJKT0h2ij89k2SlTj+D1ziG40VCz3jsFUrujYo8A2ICIP
 czsPXYJuYw4du+igBzoY/i+7+3gD1n9Ctgghx9nAg4piuCmUQINUFhgFCkBfTExQR4Ik
 aLIabipQuGRQ0BFk4hh5HBVnD+GWAZve8f64KyIWyMsTR1fExnAwQ/kM5q8e1mGnmN1Y
 YxDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=p8zIlTxTg73iU2mdhqKahIZNX85T1eGxEQPYlraUqMU=;
 b=OjL6hehtTAPf38j0hLPo+ZdMsyLjbEu9P04joq62kLLKDzZ33f8IVadJMADGHbGr0G
 wOgmicQogwBvk3KZYvM2PF3I0kQStzX12myD+00JFUYhzPxx672kHbZVR28P2W7OajON
 95gSLX5R4H7gNp+XAYzcsceNAP1IQ40imFKZE=
In-Reply-To: <20180706162742.186950-10-sjg@chromium.org>
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
cm90ZToKPiBBZGQgc3VwcG9ydCBmb3IgdGhlc2UgZnVuY3Rpb25zIGluIHRoZSBQeXRob24gYmlu
ZGluZy4gVGhpcyBwYXRjaCBzdGFuZHMKPiBpbiBmb3IgYSBwZW5kaW5nIHVwc3RyZWFtIGNoYW5n
ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgo+IC0t
LQo+Cj4gQ2hhbmdlcyBpbiB2MjogTm9uZQo+Cj4gIHNjcmlwdHMvZHRjL3B5bGliZmR0L2xpYmZk
dC5pX3NoaXBwZWQgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDMyIGluc2VydGlvbnMoKykKCkFwcGxpZWQgdG8gdS1ib290LWRtCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClUtQm9vdCBtYWlsaW5nIGxpc3QK
VS1Cb290QGxpc3RzLmRlbnguZGUKaHR0cHM6Ly9saXN0cy5kZW54LmRlL2xpc3RpbmZvL3UtYm9v
dAo=
