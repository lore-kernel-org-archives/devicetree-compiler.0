From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH v2 1/9] cmd: fdt: Narrow the check for fdt addr
Date: Fri, 10 Jun 2016 16:55:12 +0300
Message-ID: <55F4DBEE-FFA0-4B79-BEDF-38FB4C82DB66@konsulko.com>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464340402-2249-2-git-send-email-maxime.ripard@free-electrons.com>
 <CAPnjgZ10-O3FxaAg6YCbC4sJAhAsZ8RL8M1qz5Y0AXknmSpgiA@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=subject:mime-version:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Z33eV9K9ePyx/HPTyOySULmvDOKpAIw5X5aCl05Se5I=;
 b=eJvgQL1Ki1tvMwbuC4hFejswBOq2ctVxvhDxZ15mZF8ycUvUVpd89hY4ikwptnI7Bj
 tTPXRIkQktVzjm+1nwbh1RCsnUvBhSoHGSaQi7qoCiPOv65sC7ko8xaVzvLbtpy4AGL8
 tcdgpfeHxJfOGHZNUnjw8qKifzZ+hWc5aYjKU=
In-Reply-To: <CAPnjgZ10-O3FxaAg6YCbC4sJAhAsZ8RL8M1qz5Y0AXknmSpgiA@mail.gmail.com>
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
To: Simon Glass <sjg@chromium.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>, Alexander Kaplan <alex@nextthing.co>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>


> On Jun 10, 2016, at 03:34 , Simon Glass <sjg@chromium.org> wrote:
> 
> On 27 May 2016 at 03:13, Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>> The current code only checks if the fdt subcommand is fdt addr by checking
>> whether it starts with 'a'.
>> 
>> Since this is a pretty widely used letter, narrow down that check a bit.
>> 
>> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>> ---
>> cmd/fdt.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Acked-by: Simon Glass <sjg@chromium.org>

Acked-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
