From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdtput: add delete node and property function
Date: Thu, 15 Jan 2015 16:20:30 +1100
Message-ID: <20150115052030.GG5297@voom.fritz.box>
References: <1421207637-32690-1-git-send-email-long.wanglong@huawei.com>
 <CAPnjgZ32hrN9t3FUDtZzrbjTrq9UdC4wgK6J_Z2XUNWb47cyBA@mail.gmail.com>
 <20150115030816.GE5297@voom.fritz.box>
 <54B73DE6.5030108@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gTtJ75FAzB1T2CN6"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54B73DE6.5030108-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: "long.wanglong" <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "jdl-CYoMK+44s/E@public.gmane.org" <jdl-CYoMK+44s/E@public.gmane.org>, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--gTtJ75FAzB1T2CN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2015 at 12:11:18PM +0800, long.wanglong wrote:
> On 2015/1/15 11:08, David Gibson wrote:
> > On Tue, Jan 13, 2015 at 08:07:59PM -0800, Simon Glass wrote:
> >> Hi Wang,
> >>
> >> On 13 January 2015 at 19:53, Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrot=
e:
> >>> add the delete node and property function for fdtput.
> >>>
> >>> usage:
> >>> 1) delete a node
> >>>  # fdtput test.dtb -d node /chosen/son
> >>> 2) delete a property
> >>>  # fdtput test.dtb -d prop /chosen/ prop_name
> >>
> >> This is a great addition!
> >>
> >> I know David is keen on single character flags. But would it be better
> >> to have a separate delete option, e.g.
> >=20
> > Well.. it's not that I'm actually keen on them.  Just that I haven't
> > thought the bother of another dependency adding a long options library
> > was worth it so far.
> >=20
> >> -r to remove a node
> >> -d to delete a property
> >=20
> > I like that suggestion better than "-d node" and "-d prop".
> >=20
>=20
> ok.
>=20
> > But I wonder if it might be even simpler to just base it on the number
> > of arguments so:
> >=20
> > $ fdtput foo.dtb -d /node@1234 some-property
> >=20
> > will delete a single property, but
> >=20
> > $ fdtput foo.dtb -d /node@1234
> >=20
> > will delete the whole node.
> >=20
>=20
> Hi David Gibson,
>=20
> if we decide to delete node or property based on the number of the argume=
nts.
> we just delete a node or a property at once.
>=20
> how about the following suggestion:
>=20
> $ fdtput -r <options> <dt file> [<node>...]
>=20
> will delete several nodes,
>=20
> $ fdtput -d <options> <dt file> <node> [<property>...]
>=20
> will delete several properties in a node.
>=20
> the `fdtput` can create several nodes at once. so i think that it should =
to delete
> several nodes at once.

Good point, I forgot that the other options can do multiple operations
in a single command.

Your suggestion sounds good to me.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gTtJ75FAzB1T2CN6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUt04eAAoJEGw4ysog2bOSQlwQALdbR1tPOucSEy3XYKJcwcFo
C9GQKoYhvMh8TolNjKGSB3ZCaWWr03UeyLAM+4hOwmM86WIdBUcQDs/5OBR4ExR+
U5OX1BFBKsGmtfJFVM7rb03l9OtRRb4pi2EHQ1dxN4wALo/IU31sFW8ESLNKmxoj
gayuAC8cFe0z9ZJ5UCZMbQqb9Hl/34i9hRslBM7MS8icevnoT2Fn0SEEnZoVgdDJ
XuLDLHTyFGZ8+mbYgfD8zMfmWX1ktyrsF/5cvkJHe8eEyu4s3rChCsUa4+71jOXc
upwHoeOvaKz3IUIrSA8igAzhCBQ0BqDX39XDnvREQdvv5j09CysZGxY1woL9PICW
YPk+TYYYHanTYCDDSUmlLU3fVIYTUqS968nAsuiWHZuF45hPfnVtwVzdrnB/4no9
2sITPiQTv+reVIszKWp51DG8Gp+SdAJME5Im35e2+35fO33YbkU4J09ENfh2B0ba
RnIcXCuLIqDZ/g2t3y7z9bIgFVfqBqvcutVnEjaRjFYosRLoDeLDJocfyt90BXm5
fQ0TFWrodSTCxT0SXLbfN62erN+/2pJKOLQA7cI++P8YT2xGtgv72Vz6pyciR4ro
ZxubYWSWm9I+qdH58O+aSNhb1dC574E9JE1n36toegPZ6lH7yHYcejakjQBVqvCt
Ha+9OiGfEDjFFCq1G7cA
=B7KM
-----END PGP SIGNATURE-----

--gTtJ75FAzB1T2CN6--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
