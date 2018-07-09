From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 08/29] libfdt: Fix the Python pack() function
Date: Mon, 9 Jul 2018 13:52:17 -0600
Message-ID: <CAPnjgZ0uBx5myOnhRhaDRRv0MVVW_xz+ObJgrjHNsb8MFVZXtw@mail.gmail.com>
References: <20180706162742.186950-1-sjg@chromium.org>
 <20180706162742.186950-9-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=0vGuFN9nAUCIEq12Id1+LjpfPa3QoQIbOJ5wohWJ9Cg=;
 b=iHLg8K73L0c2c1LXBdQVEmoKvryts/emqRiPHso7AlOY0V+GD8IUM0aoEFJo5ZZ/A9
 1H2klNMltUpyZmzMVlDkTnSU+PLv2Ytv8CYPyBvB8SlCnUYuIqmjg3pecg6OIss+TEw4
 7YA8uCJa8aMLsSSwUA/tqHE/oOeJghBslcegyLWDibyItyQr06R7nIJKN6bs0kGJerdv
 3SdnilyHhEYbWY8uhVvfsNRHfTEP6dReTHVmUTQZr1447uWBIOKm9j/rzR5iCd4fuPJX
 hn79PsFDqrroeqEr0pRS/zWhz58hsEtdWvcwccyqjduRRiefph1Dd6xu0yxJ6r19IfXA
 YoFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=0vGuFN9nAUCIEq12Id1+LjpfPa3QoQIbOJ5wohWJ9Cg=;
 b=Y3iA+yZjJjrSwoxuwubB/PN1CAlVfb5tfxaw8y/Oa5zDanAc8Z9NR945C28q+BJ+uT
 DZAFZHny62HxG2V6xJfPPNLq+eCuQ7UcsaTXb97QnBEyX0wpTatOkpS2e9ePNY2mJmiQ
 ZGstTvhb0dFkZcxgaf3I202LmO2hDG1pV5gBw=
In-Reply-To: <20180706162742.186950-9-sjg@chromium.org>
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
cm90ZToKPiBUaGlzIGN1cnJlbnRseSBmYWlscyB0byByZWR1Y2UgdGhlIGRldmljZS10cmVlIGJ5
dGVhcnJheSBzaXplLiBGaXggdGhpcy4KPgo+IFRoaXMgc3RhbmRzIGluIGZvciBhIHBlbmRpbmcg
dXBzdHJlYW0gY2hhbmdlLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2ltb24gR2xhc3MgPHNqZ0BjaHJv
bWl1bS5vcmc+Cj4gLS0tCj4KPiBDaGFuZ2VzIGluIHYyOiBOb25lCj4KPiAgc2NyaXB0cy9kdGMv
cHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBlZCB8IDYgKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCkFwcGxpZWQgdG8gdS1ib290LWRtCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClUtQm9vdCBtYWlsaW5n
IGxpc3QKVS1Cb290QGxpc3RzLmRlbnguZGUKaHR0cHM6Ly9saXN0cy5kZW54LmRlL2xpc3RpbmZv
L3UtYm9vdAo=
