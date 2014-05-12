From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: add address translation support
Date: Mon, 12 May 2014 16:00:00 +1000
Message-ID: <20140512060000.GA28789@voom>
References: <1396371463-7516-1-git-send-email-robherring2@gmail.com>
 <CACxGe6uPerPT_cT+p1zvL20ERwuguDJWDHasxz5gAUe5kPQHNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6uPerPT_cT+p1zvL20ERwuguDJWDHasxz5gAUe5kPQHNg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2014 at 10:57:16PM +0100, Grant Likely wrote:
> On Tue, Apr 1, 2014 at 5:57 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >
> > Add FDT based address translation. Currently, only simple bus
> > translations are supported, but the framework allows adding other
> > buses like PCI. Adding this to libfdt allows the address
> > translation code to be shared amongst u-boot, Linux kernel and other
> > projects.
> >
> > This code is based on GPL only licensed code. It must first be
> > re-licensed for dual GPL/BSD to add to libfdt which requires approval
> > from the copyright holders.
> >
> > This code is copied from u-boot common/fdt_support.c. The portion used
> > here was originally added to u-boot by Kumar Gala in 2010 and Freescale
> > is the copyright holder. Later changes have also only been done by
> > Freescale authors. The u-boot code appears to have been copied from the
> > Linux kernel's address translation code in drivers/of/address.c which
> > has no copyright. This code was moved by Grant Likely in 2010 and
> > originated from arch/powerpc/kernel/prom_parse.c which was written by
> > Ben Herrenschmidt.
>=20
> Okay, so this makes things a bit more complicated. You need to compose
> a list of every commit that has touched this file in *both* the u-boot
> and kernel trees, and identify all of the copyright holders based on
> who submitted the patches. Once you have that list, then you need to
> get an Ack from every single one of them. If anyone does not respond,
> or does not give agreement, then we need to look at their change and
> determine whether or not we consider it to be a significant enough
> change that it would warrant copyright protection.

Actually, don't bother.

I'm not all that impressed by this translation code - in particular
the per-bus-type hooks don't make sense to me.  AFAIK the
interpretation of ranges is not bus specific. I think it will also
fail in some cases with #address-cells > 2, which is unfortunate.

I'm about to post my own implementation of address translation.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTcGNgAAoJEGw4ysog2bOSNCwP/0SUrFn7qR/T9qgNUUzTEgK6
kYGg5b2R829cQwi2kSBfJvZDV/q4SFX9IZs7YVBTW8sMWHdM/oz+Fx80eB0ykn9F
swo9FzOXVRqE6kcG5dA2pVFdhsCvFYolkAMiwtTT+nSTBaOH4xjCFx8gdXH7Fbbe
SgPwOBmbZcfb3Uv9+B3lv28Z2BepkRDP9aTuxiYkpGoJOWLIpGMrbHDxfXN/Sm+i
NOnh0tMMqbZW+XYilryjTq0A097UXTTHFH1gqh9BkA7NxgyUEq8IGEuf4fOKZmV9
ko4BGx5bRzIl8pfOah4KrChTAep1Pn848zuM3wnfgfBnURy0WdiQWo00q8CpJf8b
63FIIksI3LRNI8AOxNU7rZqvehNZ5fnropcyCtWK6L2lc8xMQ0QFqQ1gD8Panlgw
45zfDMIy35F2ji+WwGWPR5cg9k4l4Eju6PdC1g8GIJ0xxgBZgTqZZ/NCUywegghK
qktdKZGcJc+o5fbkpC1KizEGBslTBIlTwJ7rdFsJ74Yfa68AIQxxGnJ7ypNjEkUz
SN/RWER9CrmtFzBDdA4hIervbxty31UKNTG9xNFJNh51X6CdsnuE+V5t5YY94Vyl
4obgpp+8/GgXzgrYdUndBND4ytPvq8a8D/kmaiPNeCEo4qsSEES51Epe6Ylz50VJ
i+VZAJEX/xPJD9H2/v8I
=s9wf
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
