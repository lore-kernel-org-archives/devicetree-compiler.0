From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdtput: add delete node and property function
Date: Thu, 15 Jan 2015 14:08:16 +1100
Message-ID: <20150115030816.GE5297@voom.fritz.box>
References: <1421207637-32690-1-git-send-email-long.wanglong@huawei.com>
 <CAPnjgZ32hrN9t3FUDtZzrbjTrq9UdC4wgK6J_Z2XUNWb47cyBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6Vw0j8UKbyX0bfpA"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ32hrN9t3FUDtZzrbjTrq9UdC4wgK6J_Z2XUNWb47cyBA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "jdl-CYoMK+44s/E@public.gmane.org" <jdl-CYoMK+44s/E@public.gmane.org>, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--6Vw0j8UKbyX0bfpA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2015 at 08:07:59PM -0800, Simon Glass wrote:
> Hi Wang,
>=20
> On 13 January 2015 at 19:53, Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
> > add the delete node and property function for fdtput.
> >
> > usage:
> > 1) delete a node
> >  # fdtput test.dtb -d node /chosen/son
> > 2) delete a property
> >  # fdtput test.dtb -d prop /chosen/ prop_name
>=20
> This is a great addition!
>=20
> I know David is keen on single character flags. But would it be better
> to have a separate delete option, e.g.

Well.. it's not that I'm actually keen on them.  Just that I haven't
thought the bother of another dependency adding a long options library
was worth it so far.

> -r to remove a node
> -d to delete a property

I like that suggestion better than "-d node" and "-d prop".

But I wonder if it might be even simpler to just base it on the number
of arguments so:

$ fdtput foo.dtb -d /node@1234 some-property

will delete a single property, but

$ fdtput foo.dtb -d /node@1234

will delete the whole node.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6Vw0j8UKbyX0bfpA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUty8gAAoJEGw4ysog2bOSiDkP/0F4yIsx43PKU+LExN3QMilw
vSsOehW7XzTpHgmyuPKWaeJF+atAZ5vTpoUGDGwrkTYnRveG8btiEOJPlIFPHnn2
LMPxJFswprYSJZllFGExfMAZbn9zjiAmAJTZG8/Y2q6MWoV1fjhsAPqMwtyAtiIL
T4ESV71Rpq4SAjq5y8AqhieUZIXox5C+1d4c+hXXxsuyvVn/D/Nmr/x43BErxyHA
S6JRnDq60TaiZrDPvglrM1LMCD+ebGKQHW5pPM8sj/me/3AAC8Azw1DDvdBjA2L/
GJT4c3Qw+V9bG5QB5JUyosSdJIqUxtA6eXutsvG/MNRA3cTbbLMC0DEwp+eBOyIc
/LzTysWBbLjiMjzBrXGypu00ItJTbBuUQznbbbxvimQ2lvpcjwbLhmlXm8hl8ldS
JyS2hJ30Qud+YCD0QJ2VA9J+2bxRg203GdobqAfDM7mWQMfFyesJlLv90s+C0Fco
0qtsBCVVrXM5utO5X+lnP318Mo7fVX9WwwEiUzpJkAdC62B+yGqNTmSW7aeesIJR
7pNA3NIEPJCCMty2RVdICtKFCP2NfVdqXEgN8aUW+DEg78VlIcD1VN0o/OJf9gtz
xUXxDczjOWZlWWRp7pK3CpNmgdXFhRdT+8FQVRzyhZgEeXwatFYfn1HCn1CR1f33
HVYIsQhwN9135NnuXFVK
=EDNZ
-----END PGP SIGNATURE-----

--6Vw0j8UKbyX0bfpA--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
