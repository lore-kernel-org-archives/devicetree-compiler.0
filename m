From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH] checks: Use source position information for check
 failures
Date: Mon, 15 Jan 2018 13:53:15 +1100
Message-ID: <20180115025315.GC2027@umbus.fritz.box>
References: <20180108224927.1016-1-robh@kernel.org>
 <20180110053020.GD19773@umbus.fritz.box>
 <CAL_Jsq+Brr4e1ZvPapnpRLb5hJPsyBjxoZAdDeaqsD2y0Ma6Jw@mail.gmail.com>
 <20180110234340.GD24770@umbus.fritz.box>
 <CAL_JsqJeh5GFsqjfVuQ-StiPGNzej6Su9k+DS+joPYRPqTB1Ww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515985294;
        bh=V5N06Zb8SIqndQhbhNPq8O2tnf6/PE9fahGTUwuyJY0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wa/gyEtXOeD+ueBDZS5VaxzjnP8coI8Jc7GJD02A1RNVygilHNXJfBl+qe26I5fwG
         evucufS8AryHLtFg7JI7SXCmMviFO+mK9i9PlLRw8xDxt/Lg33ktXcJ+st4YwQlETb
         iYvLqGT5dQG4Ww5oroi/nZBuROvSRIq0oRFlHeUU=
Content-Disposition: inline
In-Reply-To: <CAL_JsqJeh5GFsqjfVuQ-StiPGNzej6Su9k+DS+joPYRPqTB1Ww-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


--w7PDEPdKQumQfZlR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2018 at 10:19:06AM -0600, Rob Herring wrote:
> On Wed, Jan 10, 2018 at 5:43 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Wed, Jan 10, 2018 at 10:41:54AM -0600, Rob Herring wrote:
> >> On Tue, Jan 9, 2018 at 11:30 PM, David Gibson
> >> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >> > On Mon, Jan 08, 2018 at 04:49:27PM -0600, Rob Herring wrote:
> >> >> Now that we retain source position information of nodes and propert=
ies,
> >> >> make that the preferred file name (and position) to print out in ch=
eck
> >> >> failures. This will greatly simplify finding and fixing check errors
> >> >> because most errors are in included source .dtsi files and they get
> >> >> duplicated every time the source file is included.
> >> >>
> >> >> For now, only converting a few locations and using a new macro name=
=2E I
> >> >> will convert all FAIL occurences once we agree on the new syntax. A=
lso,
> >> >> after this, some checks may need some rework to have more specific
> >> >> line numbers of properties rather than nodes.
>=20
> [...]
>=20
> >> >> @@ -1049,7 +1065,7 @@ static void check_avoid_unnecessary_addr_size=
(struct check *c, struct dt_info *d
> >> >>       }
> >> >>
> >> >>       if (!has_reg)
> >> >> -             FAIL(c, dti, "unnecessary #address-cells/#size-cells =
without \"ranges\" or child \"reg\" property in %s",
> >> >> +             FAIL_POS(c, dti, node->srcpos, "unnecessary #address-=
cells/#size-cells without \"ranges\" or child \"reg\" property in %s",
> >> >>                    node->fullpath);
> >> >
> >> > Checks are already associated with a node, would it make more sense =
to
> >> > print the position information from the general code?
> >>
> >> Not sure I follow the question. You mean pass in the struct node and
> >> get the srcpos and fullpath inside check_msg?
> >
> > Basically, yes.
>=20
> That would help getting the messages to be a more consistent form
> like: 'source/file.dts:123: (ERROR|WARNING): /full/path/of/node: bad
> news'
>=20
> That had been something I wanted to do. The downside is it makes for
> really long lines, but many messages already have the full path in
> them. I guess we could go to 2 line messages where the 1st line is the
> error and the 2nd line is the node path. The downside to that is I
> typically do 'sort -u' (stripping the the dtb name) to de-duplicate
> the errors as 10 boards including 1 SoC dtsi file gives me 10 of the
> same error. Of course, printing the dts filename instead fixes that
> problem.

I suspect it might also make a bunch of existing testcases a bit of a
pain in the arse, too.

> It probably makes sense to do that in one step rather than reword
> error messages twice.
>=20
> >> While checks are associated with nodes, specific error messages may be
> >> associated with properties. This is one example where we could make
> >> the error message be the exact line (of the #address-cells or
> >> #size-cells), but that would require re-working the check a bit to get
> >> the property structs (and srcpos).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpcF5sACgkQbDjKyiDZ
s5Jxuw/9HkUZZb3u+meKbq/JaAmNFS6gKIdfmF3A6APihm84c4gkCg+VSyZOpFQ5
NL4oNXFyVG2r7yWVkR6ts3dCut1/vPHnyjEsdIUs3mJUlVsbFIpVx1ACCeyfBBQz
bJbLNpJgJLtiN0zj/x3RcOk1ma4x7416vxmSZErzWxR+0l+Ldhy5HzVQYZBrV0LR
bomhFp+um3wtjtB8O3iWhu+bPLvtOuCcKI3IIMTjq3jEw4kIGvu39qiN1K6Pv6hU
+Kg0MRwUAmV7g+lvpdTwqVSWZA4unWoDVG+rJBak+JQpHtBLXl9YYnpSF2Qbbxxy
9FPp3fr8ATxgm3/mklDmbYjm5xrYdOngfycox4XQm/nCS7ab8ryIk0hlEuYdIayf
472eEDEqi2If5zKcCkNpNB8LBJF4v1o6X8jo0gp5AbQcBgCdmNHVKjPMvOyc+iIL
mfxJ8lkqeQDpurD08GXCBPb1kNL5O1eyF0jvcJelYSlriQCbz7chRH1IJih+96jn
WCKMyYSSuzVwsQTF1WNp5r8Odfrzaq6Xr7udmiO4K+XD0jglYutZlGSU2Z/eHt+4
O8BlhT/XH+PQsOiyAZtLesq3Z12vi7uXvwzMd1d8KG+aClvby3GQmoOXnbhcrLFD
7ioH5tZtSsqbYvuPk3Pif6QJOi6oK4EVTbmnklB6954JioPK5uU=
=9Jhn
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--
