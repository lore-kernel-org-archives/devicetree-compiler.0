From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] checks: Handle #dma-address-cells and #dma-size-cells
Date: Mon, 14 Nov 2022 15:27:43 +0100
Message-ID: <Y3JQX/qkhiGe90S/@orome>
References: <20221111114728.462767-1-thierry.reding@gmail.com>
 <CAL_JsqLV2ZHLJ=14zf9zNfq+S+Rs09EYmZrNHsvdhbmvvehj6g@mail.gmail.com>
 <Y3IZnpL3Q3STEaLs@orome>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="acuzweiy110djy/4"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TX+BJXMJkHNl7sx1ZtAZFbmUtUc2+syy6Q52ea2v1U=;
        b=ffH2P0KZQg6qHWDohSYb5+vCH3VlAIvDMI+WfAHjEWc0BlddrGjUnghF/DKe+vkFjr
         W+x2IOoBwFE2uok5hc/svD40O9AoAR00kUrKvcAxP3p1nLQlntx95BgcehLC+UGRXSP7
         jyXTtt9h5Gv8gJf6GVD4ue1p/5cP3pN4GfEu+mKh9apLp+g/+ebx4c49o7yStmo2O/FC
         ZT3CVQMmfuClhoDfP2ikMlhHYSip9yghGi/afV57OTLwfyyBviakysPk1cFGDEUILzG/
         w2uBS+lpEVh+Cx942LlbMIs0c99X+aVVfjZG7YHSFUaAYh6yDWV6GtE3MSQOh8VFyt7F
         IlTA==
Content-Disposition: inline
In-Reply-To: <Y3IZnpL3Q3STEaLs@orome>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--acuzweiy110djy/4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2022 at 11:34:06AM +0100, Thierry Reding wrote:
> On Fri, Nov 11, 2022 at 11:01:58AM -0600, Rob Herring wrote:
> > On Fri, Nov 11, 2022 at 5:47 AM Thierry Reding <thierry.reding-Re5JQEeQqe8@public.gmane.org=
m> wrote:
> > >
> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >
> > > The #dma-address-cells and #dma-size-cells properties can be used to
> > > override their non-DMA counterparts (#address-cells and #size-cells)
> > > for cases where the control bus (defined by the "reg" and "ranges"
> > > properties) has different addressing requirements from the DMA bus.
> > >
> > > The "dma-ranges" property needs to be sized depending on these DMA
> > > bus properties rather than the control bus properties, so adjust the
> > > check accordingly.
> >=20
> > I assume I'll be seeing a spec and schema addition too.
>=20
> Yeah, I was looking around to see where else we may need changes. I had
> looked at dt-schema but couldn't find a good place to add them since
> #address-cells and #size-cells seem to be mostly handled in the library
> code rather than in the json-schema definitions. So if you could provide
> some pointers as to how you think this should be added, that'd be great.
>=20
> I can look at writing an update to the spec, but to be frank could use
> some guidance on that as well.

So, I was typing up the spec changes for this and now I'm having second
thoughts. The only reason why I can justify the existence of these
properties is because we don't want to touch #address-cells and
#size-cells. But there's really no good reason to not do that. Yes, it
will be slightly painful to do this, but it's not like we can't.

Given all the weird special cases that this is going to add, I'm no
longer sure this is a good idea.

Thierry

--acuzweiy110djy/4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNyUFwACgkQ3SOs138+
s6F5nw/8DCtd0ZDmINmRQqxUzehtqyiaokg1Z8qSEZGmALYOBzjt5NCTZI+gRtdl
oP18uBA5gjKBEktlu8srZCEL30bTswPOHkScPWuuhuQ8XkopVkn96nGa3R421yEJ
CbR0yVgDlBGjbbPPeAIYLHkWSSockKC29Oi9srWCOnVP88mUAvYN4z9zBa8WqkAs
4TyJnd1Ff+TEfrnGXqSXX6raZt9iKb2Sk7gm6voW6vN6c8vgSOyMC1p6kNsfoHRk
/GCRtd7V84cLVRyYD4hefBQBthGQcZ2JCbyXtEFtYUL/bjeafoOi1KEDhzW0oQwB
9yOKuj6P4zfTGj10QBnzDzqi1qE7wgnVkYgjbrQR7C7jqTv4Mx/mPwyqMncauzRw
QABEE2Op8vBaRrnV93IasyXhzgJjJ2aKfjrREmwMtxaxuESnAu7Wq1Z7KTS6/2uA
fApLnO6QUphiv8pwAkLWlF03VQ5CLJ5edq9C8VxJ5Wy7AEukEXVDf44qBn/jJP0G
o2Lp0HROGHP7CcdH8rMI3G5omyu7ud0B7vdpnNQNVLSDMTNgwwPpPRlr7zMEtwLl
YSOwzQtp5PmzfEsz4i+sBiYdStLnI6NE671UWcEFmWxVc9TRp9ZCdzCJVC9y+dWK
voZbEQY7oN6sFr3ir8TLFL259a72T8xa8JxYH9tgRt3TKzMfVas=
=BGI/
-----END PGP SIGNATURE-----

--acuzweiy110djy/4--
