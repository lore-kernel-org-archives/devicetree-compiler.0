From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH v2 2/3] dtc: make check test for dtc --annotate
Date: Wed, 23 Sep 2015 10:18:09 +1000
Message-ID: <20150923001809.GS20331@voom.fritz.box>
References: <5600E191.9020903@gmail.com>
 <5600E953.40308@gmail.com>
 <20150922103907.GP20331@voom.fritz.box>
 <56018E33.5090708@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LwgCY5hL6Igino+O"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56018E33.5090708-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--LwgCY5hL6Igino+O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2015 at 10:21:55AM -0700, Frank Rowand wrote:
> On 9/22/2015 3:39 AM, David Gibson wrote:
> > On Mon, Sep 21, 2015 at 10:38:27PM -0700, Frank Rowand wrote:
> >> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> >>
> >> Add dtc tests.
> >>
> >>   - dtc --annotate to create a .dts with annotations
> >>   - compile the annotated .dts
> >>   - compare the .dts created from include0.dts to the .dts created
> >>     by first compiling include0.dts with annotations, then compiling
> >>     the resulting .dts without --annotations to strip the annotation
> >=20
> > My brain hurts trying to follow that.
> >=20
> >> Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> >> ---
> >>  tests/run_tests.sh |   10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> Index: b/tests/run_tests.sh
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> --- a/tests/run_tests.sh
> >> +++ b/tests/run_tests.sh
> >> @@ -276,6 +276,16 @@ libfdt_tests () {
> >>      run_dtc_test -I dts -O dtb -o sourceoutput.test.dts.test.dtb sour=
ceoutput.test.dts
> >>      run_test dtbs_equal_ordered sourceoutput.test.dtb sourceoutput.te=
st.dts.test.dtb
> >> =20
> >> +    # verify annotated .dts can be compiled
> >> +    run_dtc_test --annotate -o sourceoutput.test.annotate.dts sourceo=
utput.dts
> >=20
> > 1) Looks like you forgot to git add sourceoutput.dts
>=20
> sourceoutput.dts is an existing .dts that I used again.  But it looks lik=
e a bad
> choice - I think I should just use include0.dts, as you suggested.

Ok.

> > 2) All your generated files should be named *.test.dts, so that make
> > clean will get rid of them.
>=20
> Will fix.

Ok.

> >> +    run_dtc_test -o sourceoutput.test.annotate.dts.test.dts sourceout=
put.test.annotate.dts
> >> +
> >> +    # verify annotated .dts can be stripped to match non-annotated
> >> +    run_dtc_test -o includes.dts include0.dts
> >> +    run_dtc_test --annotate -o includes.annotate.dts include0.dts
> >> +    run_dtc_test -o includes.annotate_undo.dts includes.annotate.dts
> >> +    run_wrap_test cmp includes.dts includes.annotate_undo.dts
> >=20
> > So, this checks that annotate doesn't break the semantic parts of the
> > tree, which is a good test.
> >=20
> > But I was suggesting a canned example, including the annotations to
> > check for regressions in the annotation generation itself.
>=20
> OK, I think I understand now.  Add a test to make sure that the annotatio=
n is
> correct.  This will be interesting because the source path in the annotat=
ion
> is an absolute path, including the location of the dtc git repository.  T=
he
> way that I strip off the location of the dtc git repository in my personal
> world is a bit ugly.  I'll think about how to do this.

Hm, yeah.  I thought we only stored relative paths internally, unless
absolute ones were supplied - but looking at srcpos.c I'm not so
sure.  The file path stuff is actually pretty hard to follow.

If we are using relative paths everywhere, we should maybe stop that -
although it might make the relative open stuff harder :/

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LwgCY5hL6Igino+O
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWAe/BAAoJEGw4ysog2bOSXwwQALoEjO69PlN6TRMqU7z+aJ0w
e/WBZDlt8K2ShIzCr4x7wa/QoTBF3LyGq8+DJQowTNW8P4xF6TxkHKsdzCD9Gb3G
YLdVX6Lc9YkTj83VXs0z9uEPMDnuacVZEe0kKtv4cUWoBowZrS2BNevRR30m2mqz
58c9hfqqYDiLxGgAAevajZNwpKmcPNjmlgdlenLzgL05uMjwLD599hXadryMK/rv
mQE2x3WJ61hQbL+QkZynK6za93eITFkdWCcX0H595tP/xnQ4+OEALEu1oM6yx4el
X+xy6mHM2WY34hBZXbxktGs+43klh5w1bVdN50yNLKaDGYBNNtau6CycTZcN/JiR
VS5G6j5K+Iw9s/bgg1fAF58hVlrIMTAtedUPTBaDrIv9unjJ1Jz3kAzbzssJ7kMC
7WcXQSVJpoMRaLUj0BFvmCZSe0KJsgzjQdttJ1pLD0nuNuHGAcF547JCn19jxMqw
i33HqU5rMfibf0xbzvRK1q5FthyfEpXhywwthJMExalkHlzyp8GLKSAlcY8x81iY
tAgtTnvL1BZ3odUa3Puzl5eGLaDBNYKecBl30Qw2adnNPdnAc1OE+8rT1yOcpNvb
4mGtW+8sTX/dhU9s7mpZoalCgkNO3P1KCLOY9MMRKq2ak5J+ubV1GQW+ZkpYgF9H
jdiTQvRqbVtKc9YH8QvD
=VG4V
-----END PGP SIGNATURE-----

--LwgCY5hL6Igino+O--
