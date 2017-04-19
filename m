From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Fix get_node_by_path string equality check
Date: Wed, 19 Apr 2017 11:30:47 +1000
Message-ID: <20170419013047.GE23273@umbus.fritz.box>
References: <f5424c7ce8334730a64873b9912132d3@exsvr1.ghs.com>
 <20170418020540.GA12235@umbus.fritz.box>
 <77edbc7797e144cd9a635e5b1d0b2dfe@exsvr1.ghs.com>
 <20170418034332.GH12235@umbus.fritz.box>
 <7417379a9afc4272b5b62b8ff4e50719@exsvr1.ghs.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GxcwvYAGnODwn7V8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1492566403;
        bh=N7E/HR3Gs/hhDol3nPomFKb5s+FBNAjcBC4vwUhRKIQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dv4lBQL64ZqYulCJjqd0dkW7TpVAp8s0dSiJHh6ACtGaOhCnD/GQYh9c0V6uGMYuX
         iYMQMoPkswwFwndqoXopGGzCjLXvzQcDAX1ocwdHR5d2N9JKJmZb7LPgCfrAWLpC3d
         fUKvAx0djl9i5Pz9A/eIs3nVEooE8bXm5yvaN8p4=
Content-Disposition: inline
In-Reply-To: <7417379a9afc4272b5b62b8ff4e50719-xbOadlNgr96L7B8feK0ILA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tim Montague <tmontague-5j0BnJlmnLM@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--GxcwvYAGnODwn7V8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2017 at 01:15:08AM +0000, Tim Montague wrote:
>  > Ah.. it looks like your mailer has mangled the patch, I'm afraid:
> >=20
> > $ git am -s ~/foobox/
> > Applying: Fix get_node_by_path string equality check
> > .git/rebase-apply/patch:16: trailing whitespace.
> > 		if (p && (strlen(child->name) =3D=3D p-path) &&
> > .git/rebase-apply/patch:17: trailing whitespace.
> > 				strneq(path, child->name, p-path))
> > .git/rebase-apply/patch:30: trailing whitespace.
> > 	int n1, n2, n3, n4;
> > .git/rebase-apply/patch:38: trailing whitespace.
> > 	/* Check reference to nested nodes with common prefix */
> > .git/rebase-apply/patch:39: trailing whitespace.
> > 	n3 =3D fdt_path_offset(fdt, "/foo/baz");
> > error: patch failed: livetree.c:478
> > error: livetree.c: patch does not apply
> > error: patch failed: tests/path-references.c:66
> > error: tests/path-references.c: patch does not apply
> > error: patch failed: tests/path-references.dts:12
> > error: tests/path-references.dts: patch does not apply
> > Patch failed at 0001 Fix get_node_by_path string equality check
> > The copy of the patch that failed is found in: .git/rebase-apply/patch
> > When you have resolved this problem, run "git am --continue".
> > If you prefer to skip this patch, run "git am --skip" instead.
> > To restore the original branch and stop patching, run "git am --abort".
> >=20
> > Can you check your mailer settings.  If it's not clear how to stop it
> > doing that, it's probably safe to attach the patch instead.
>=20
> Sorry about that, Outlook doesn't always behave. The patch is attached.

Thanks, applied to master.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GxcwvYAGnODwn7V8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY9r3FAAoJEGw4ysog2bOSg8IQAIa4NzE582HH5HQ2utEQ7bJF
AwvCyw+mPFhAcH0sYjCmoD9SvtERQZuid9R5a39feBmMSFcy4B13YdvGRuCbouMS
SP1Bb+oepeJ7UeCiGJEe9yvdBIoI2Nu2tGRbUzlKic6ryfOMAkR23L78KntjcqOa
2KO2BSzOvOfDWa2ZOaFS8Cwel6DpTH//B6fy02VlfEvvwx8YqA7A54fI9nEwPS2A
+akO27uFkbOGA5zJ+eMXWJ22lq40tNi867aBTZamyC4TOGFr1i8JR66aVjLgRbtN
rINYmRZ2FzrLkQdzC4Sug1ypogN2OLpMSjnvNCG6O74D55LBVbkJXZdTr6KhSzhe
49AigI16pVrVFZ46vy95yaeZbEffRU89fQX/y1wdAf9XC832j9JId1m7VysCiWDM
ddjbqZdl7HOWiLK3C/g1VgHZggPV24nFPR/RLqWPAG1oMknqY06J5vKR5STHgeKa
QdEIksDKwB+Ji+SAXRvSbc0iuSnaWS3exucbojbFFec0CBqFt0aJ4QF/Nq+lrxCp
WkQDRQmy1rwC+Oy78oZse4J1JFkpzmDr2bdeuVFWCNpZ1JtasypZ/fHDXFTvMFR2
Sj3esbRmp964oUl6F0Ts/JNf1FDYOtj6h2Cq19jnk7TRtsYgzi/UTQtsYH0OH+rs
kBtYh2XXGYuh6mw4eU8g
=IS66
-----END PGP SIGNATURE-----

--GxcwvYAGnODwn7V8--
