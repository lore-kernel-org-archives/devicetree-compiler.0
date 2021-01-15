From: Sebastian Huber <sebastian.huber-L1vi/lXTdtsBbLBgBO8hYIQuADTiUCJX@public.gmane.org>
Subject: Re: fdtdump.c: Compile error with GCC 11
Date: Fri, 15 Jan 2021 06:22:19 +0100
Message-ID: <8822ec89-7782-7608-cae5-e62770e28771@embedded-brains.de>
References: <db5d86de-fa1b-9d44-1188-edb81578bc00@embedded-brains.de>
 <20210106035431.GB3209@yekko.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210106035431.GB3209-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
Content-Language: en-US
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 06/01/2021 04:54, David Gibson wrote:

> Ah, I think I see what's going wrong here.  I don't have easy access
> to gcc 11 to test with, so can you give this draft patch a test:
Sorry for the delay. This patch fixes the dtc build problem with GCC 11. 
There were no other issues.

-- 
embedded brains GmbH
Herr Sebastian HUBER
Dornierstr. 4
82178 Puchheim
Germany
email: sebastian.huber-L1vi/lXTdtsBbLBgBO8hYIQuADTiUCJX@public.gmane.org
phone: +49-89-18 94 741 - 16
fax:   +49-89-18 94 741 - 08

Registergericht: Amtsgericht München
Registernummer: HRB 157899
Vertretungsberechtigte Geschäftsführer: Peter Rasmussen, Thomas Dörfler
Unsere Datenschutzerklärung finden Sie hier:
https://embedded-brains.de/datenschutzerklaerung/

