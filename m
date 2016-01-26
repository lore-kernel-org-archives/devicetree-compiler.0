From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: Fwd: [robh:dt/next 2/2] fdt_ro.c:undefined reference to `strnlen'
Date: Tue, 26 Jan 2016 16:52:18 -0500 (EST)
Message-ID: <alpine.LFD.2.20.1601261636510.19789@knanqh.ubzr>
References: <201601270337.wm7hjDwR%fengguang.wu@intel.com>
 <CAL_JsqJ2C=OQa5ntYH3MLQ87+=ELHAtgFpg5QNQpQ0-RgzQeiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <CAL_JsqJ2C=OQa5ntYH3MLQ87+=ELHAtgFpg5QNQpQ0-RgzQeiw@mail.gmail.com>
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>, devicetree-compiler@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, David Gibson <david@gibson.dropbear.id.au>

On Tue, 26 Jan 2016, Rob Herring wrote:

> With the latest dtc I've imported to the kernel, there is a new
> dependency on strnlen. This is giving the ARM decompressor an error. I
> have a couple of ideas on how to fix it:
> 
> - Move string related functions in dtc to separate file
> - Add lib/string.c to the decompressor build
> - Build the decompressor with function-sections to discard the string
> related functions and avoid the linker error. Also, there's probably a
> bit of other unused code that would get dropped. function-sections
> doesn't work for the kernel in general, but may for the decompressor.
> Nico may know.

Use of function-sections turns out to be more involved than I wish. And 
we've put many special restrictions on the decompressor already. And 
linking dtc (only part of it actually) into the decompressor is only for 
legacy stuff and I'd prefer we don't spend too much time on legacy 
stuff.  Yadda yadda.

So instead I'd simply paste a simple implementation of strnlen into 
arch/arm/boot/compressed/string.c and be done with it.  The one in 
lib/string.c looks dead simple for what it's worth.

> - Don't update dtc and take the rest of the day off.

That is always an option.  Does it really need to be updated?  ;-)


Nicolas
