From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/5] annotations: Add position information to various
 calls
Date: Wed, 10 Jan 2018 16:32:55 +1100
Message-ID: <20180110053255.GE19773@umbus.fritz.box>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr>
 <1515418607-26764-3-git-send-email-Julia.Lawall@lip6.fr>
 <20180109111614.GL2131@umbus.fritz.box>
 <alpine.DEB.2.20.1801091321030.3301@hadrien>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VUDLurXRWRKrGuMn"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515563069;
        bh=54Xm2mwoLnrTcBetd4FVXYWcHls67p7qrt0niEHuHdo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P4x8nLab4kbA046xxpxZrwsBUunIyvAC2Pn9rariGtT8peLPctJkE1Fqq0XpwKYjU
         K9nURNFhh8ER7so7ePgulmvz8CjSaHtDddpxNsiFbUjzSYQ58aaz6Iv62t9s3fU/HZ
         3BKboUQDQMZM0d1/TowWddnnCXM83Gdl+V/y+OUs=
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1801091321030.3301@hadrien>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--VUDLurXRWRKrGuMn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 09, 2018 at 01:27:48PM +0100, Julia Lawall wrote:
> > > +struct srcpos *
> > > +srcpos_copy_all(struct srcpos *pos)
> > > +{
> > > +	struct srcpos *pos_new;
> > > +	struct srcfile_state *srcfile_state;
> > > +
> > > +	if (!pos)
> > > +		return NULL;
> > > +
> > > +	pos_new =3D srcpos_copy(pos);
> > > +
> > > +	if (pos_new) {
> > > +		/* allocate without free */
> > > +		srcfile_state =3D xmalloc(sizeof(struct srcfile_state));
> > > +		memcpy(srcfile_state, pos->file, sizeof(struct srcfile_state));
> > > +
> > > +		pos_new->file =3D srcfile_state;
> > > +	}
> > > +
> > > +	return pos_new;
> > > +}
> >
> > I don't really see a reason we'd need both a deep and a shallow copy.
> > If you need a deep copy, I'd suggest just changing srcpos_copy() to do
> > that.
>=20
> The deep copy is needed due to the treatment of #includes.  The following
> function overwrites the file name information:
>=20
> void srcpos_set_line(char *f, int l)
> {
>         current_srcfile->name =3D f;
>         current_srcfile->lineno =3D l;
> }
>=20
> srcpos_combine doesn't need to use the deep copy, because the result gets
> copied again.  Maybe this is not a big issue or there is a better way to
> solve this.

Well, dtbs are generally so small that performance really isn't an
issue for dtc.  So I think simplifying the code to only have one
(deep) copy routine is worth more than the minor speedup from avoiding
deep copies in some places they're not necessary.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VUDLurXRWRKrGuMn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpVpYcACgkQbDjKyiDZ
s5JQORAAtCMqmQ8qDCoSrBuOv9ykRbh1CS3LGRkojNNbhT37eU/FWI9YDvP/KtbY
3SjLzoLQTZVgY2igfVk4I76TvIT3mncN+rSbR56YngcrqctwRSMlVt2k5V/nUD7k
HB4eAUQsNn4mTikBcvvQpMv4HivzTL17Sj1ccjgMqj+EThkc9uFAgQ9+QXeYN1YG
gtZM0JIqBKWntPHQivnNRMcYE5cWpXFoJVYxvl8QafVMGKIIOYVvHQM73zHitV/S
mmOwBroVWScmwwLpIG8O51iQBFZ8hpKknkPhjU8YAkWGkR/P2cFsdNETIBy4d/H9
1OGFCxCTYrvySAVLeZE5HI4ukmTQi92nkj7yYRSXIiKFAHnYC5v8Us2/qRYS52PI
4mEvFq3PNxWgqgbxglyB71/oVIPLPBFCWGDg0lbB49k5MoOqllrv/q06cTS0ITZ+
+6Joib3MqzbcBiCsGbluD+6aLorGcH5pM22nkY0OEZhf62RHEQJV4+MyYpFKBsIs
rD4dP+Dapd2nI0lMS2z/69/B1dMqRyLlHF0YP45OXV0SLCAHFa4BqI2FPv6rwL+P
f2xBa5bwFZb5a09PaK9v0yPSRZgnh16HLdMIP3xv25prynbE31+2/8Yrh/1uC7Rt
ribWnfrgd7jpS8dcOnrx8nTDu1HjxLnHnm+LS0/a3mr+9g6KFzQ=
=ijsW
-----END PGP SIGNATURE-----

--VUDLurXRWRKrGuMn--
