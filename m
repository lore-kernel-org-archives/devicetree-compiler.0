From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] overlay: Documentation for the overlay sugar syntax
Date: Thu, 22 Jun 2017 14:30:33 -0700
Message-ID: <594C36F9.1070405@gmail.com>
References: <1497451986-15515-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497451986-15515-2-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=uCbNLPatq5F4nGNOfn5uEpiQy3EHbaIgHxwBGolgYnc=;
        b=s6urWKRAitXReyiOmVaue37SMgLvukSNAro0vOdJe4Fm2qJ12hQs1qZ2Tq8Vll/tDw
         rUSzP2wm387bLyAAYXcaCMFmIqhwAuixZLevdR7ZK35etpvZ143LUdzU7xZ6HMBzZ4tf
         QNzGN4RuUVAzoxo827tJwJp6zLjIQE3guuIW9uXe4mXcfgq+aogIwfjb6EEiyX5bnLaW
         Uv3QnvtVIgV8oT0+xs+C86aL2t6cqChYPVpfwc/saHyDribvRdZiPbA3G1ALczJ3EakD
         mXR+uopisZc01sN3FRwbx78h0L3mVYjy4YEw8F55ws3x+IxL/AKnHWItMkjYjHv2bRzM
         UrIA==
In-Reply-To: <1497451986-15515-2-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi David, Pantelis,

On 06/14/17 07:53, Pantelis Antoniou wrote:
> There exists a syntactic sugar version of overlays which
> make them simpler to write for the trivial case of a single target.
> 
> Document it in the device tree object internals.
> 
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/dt-object-internal.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt-object-internal.txt
> index 51d68ab..624aa43 100644
> --- a/Documentation/dt-object-internal.txt
> +++ b/Documentation/dt-object-internal.txt
> @@ -308,3 +308,20 @@ the run time loader must apply an offset to each phandle in every dynamic
>  DT object loaded. The __local_fixups__ node records the offset relative to the
>  start of every local reference within that property so that the loader can apply
>  the offset.
> +
> +There is an alternative syntax to the expanded form for overlays with phandle
> +targets which makes the format similar to the one using in .dtsi include files.
> +
> +So for the &ocp target example above one can simply write:
> +
> +/dts-v1/;
> +/plugin/;
> +&ocp {
> +	/* bar peripheral */
> +	bar {
> +		compatible = "corp,bar";
> +		... /* various properties and child nodes */
> +	}
> +};
> +
> +The resulting dtb object is identical.


Ignoring the fact that this file describes the device tree internals
instead of the device tree source format -- did we decide that we can
deprecate specifying nodes __symbols__,  __overlay__, __fixups__, and
__local_fixups__ (any node name beginning with an underscore) in
device tree source.  Then at a future date make node names beginning
with an underscore an error (maybe with a command line flag to override
the error?)?

-Frank
