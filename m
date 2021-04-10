From: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] checks: tigthen up nr-gpios prop exception
Date: Sat, 10 Apr 2021 11:20:54 -0700
Message-ID: <CALCv0x0ra=UYRQi9XPabs=aCCC==Cdt2-NoPMqY6YkbHX+8yCA@mail.gmail.com>
References: <20210405052617.2471954-1-ilya.lipnitskiy@gmail.com>
 <20210405232855.51816-1-ilya.lipnitskiy@gmail.com> <YG5vgwadkwHBoTsQ@yekko.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YjSlkzaK8uDnaoUyYm6U/OkdJCZW1cmeeeKKsZ/c2Oo=;
        b=jq9lsnGZDIX20r7cwXKheXZmP2dvwg77l14m6cX1NPA+D9GoK7ySVi3J4cAMBUKWWR
         RJnhrCnshG4+RtHnC63uGHDk2UYPqOL6v+rf+kg4F0Xpx5vqCUmCIGJ81kVFa+H3yseP
         U5qbXHpW7GVlbooh2PR7QmN0HyFoexPS9N8k0QcW3ql90NN/CFly31y8zs96fN24LdOv
         UORhth5YnTnpx4Kd5HcfN9UTaiDPqcBuA1VrW++fcQIkZwZM5bGaSu70kc5ESh4u8KLo
         nbVhu+VZzVetgT5vxVfWutjxVJQ3w2QRJfZ4qsXHtw9CRmgPCip6jnAbdaOZXHFHfFBn
         BZdw==
In-Reply-To: <YG5vgwadkwHBoTsQ-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

On Wed, Apr 7, 2021 at 7:59 PM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Mon, Apr 05, 2021 at 04:28:55PM -0700, Ilya Lipnitskiy wrote:
> > There are no instances of nr-gpio in the Linux kernel tree, only
> > "[<vendor>,]nr-gpios", so make the check stricter.
> >
> > nr-gpios without a "vendor," prefix is also invalid, according to the DT
> > spec[0], and there are no DT files in the Linux kernel tree with
> > non-vendor nr-gpios. There are some drivers, but they are not DT spec
> > compliant, so don't suppress the check for them.
> >
> > [0]:
> > Link: https://github.com/devicetree-org/dt-schema/blob/cb53a16a1eb3e2169ce170c071e47940845ec26e/schemas/gpio/gpio-consumer.yaml#L20
> >
> > Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Applied, since it looks like it definitely improves the current
> situation.
>
> The use of strstr() at all seems kind of bogus to me.  Shouldn't we
> explicitly be checking that ",nr-gpios" forms the *end* of the
> property name?
Yeah, I noticed that too. We could replace strstr with something
similar to strcmp_suffix in drivers/of/property.c:

static int strcmp_suffix(const char *str, const char *suffix)
{
        unsigned int len, suffix_len;

        len = strlen(str);
        suffix_len = strlen(suffix);
        if (len <= suffix_len)
                return -1;
        return strcmp(str + len - suffix_len, suffix);
}

Ilya
