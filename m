From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 0/6] libfdt: Fix signed/unsigned comparison warnings
Date: Fri, 2 Oct 2020 22:32:09 +1000
Message-ID: <20201002123209.GA442245@yekko.fritz.box>
References: <20201001164630.4980-1-andre.przywara@arm.com>
 <20201002010324.GH1844@yekko.fritz.box>
 <316e6e0f-e15e-89ee-3008-d2ed038ffd79@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601645803;
        bh=HHg/zaP5KVMTvU7AIENEr94TupS4blhclKBxAMyEhp0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZkITxW6M6cExxTvwi2T/xgCsBT8iXPeErTzEYghJqF7YfAt8/vLlu0mZoaRzZzIwB
         embPz2Ckkf1mA/0kJWYyFtWVubb+C/DMGbfeDyF8zd8TuiNVUWaj0njr3x+H9eanvO
         QcNkRxbqAUzcmMwaaQSkemcyY5CxyhD1blOCLSRw=
Content-Disposition: inline
In-Reply-To: <316e6e0f-e15e-89ee-3008-d2ed038ffd79-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2020 at 10:25:09AM +0100, Andr=E9 Przywara wrote:
> On 02/10/2020 02:03, David Gibson wrote:
>=20
> Hi David,
>=20
> > On Thu, Oct 01, 2020 at 05:46:24PM +0100, Andre Przywara wrote:
> >> Those are the six remaining patches of the initial post to fix the
> >> C comparison warnings.
> >> I reworked the fixes according to David's comments, and took quite a
> >> different approach for some of them.
> >> Changelog below.
> >>
> >> The series is against https://github.com/dgibson/dtc/commits/main
> >> ------------------------------------
> >>
> >> When libfdt is compiled with -Wsign-compare or -Wextra, GCC emits quite
> >> some warnings about the signedness of the operands not matching:
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> libfdt/fdt.c:140:18: error: comparison between signed and unsigned int=
eger expressions [-Werror=3Dsign-compare]
> >>    if ((absoffset < offset)
> >> .....
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> This does not occur under normal conditions in the dtc repo, but might
> >> show up when libfdt is embedded in another project. There have been re=
ports
> >> from U-Boot and Trusted-Firmware-A.
> >>
> >> The underlying issue is mostly due to C's promotion behaviour (ANSI C
> >> section 6.1.3.8) when dealing with operands of different signedness
> >> (but same size): Signed values get implictly casted to unsigned, which
> >> is not typically what we want if they could have been negative.
> >>
> >> The Internet(TM) suggests that blindly applying casts is probably doing
> >> more harm than it helps, so this series tries to fix the underlying
> >> issues properly.
> >> In libfdt, some types are somewhat suboptimal ("int bufsize" comes to =
mind);
> >> some signed types are due to them being returned along wih error value=
s in
> >> other functions (node offsets).
> >> So these fixes here have been based on the following assumptions:
> >> - We cannot change the prototype of exported functions.
> >> - It's better to change types (for local variables) than to cast.
> >> - If we have established that a signed value is not negative, we can s=
afely
> >>   cast it to an unsigned type.
> >>
> >> I split up the fixes in small chunks, to make them easier to review.
> >>
> >> This is only covering libfdt for now (which is what those other projec=
ts
> >> care about). There are more issues with dtc, but they can be addressed
> >> later.
> >>
> >> Please have a look, happy to discuss the invididual cases.
> >=20
> > Thanks again for this work.  I've applied all the remaining patches,
> > although I have some comments for some followups I think would be
> > good.
>=20
> Thanks, that's much appreciated! Happy to discuss any further comments.
>=20
> > At this point can we turn on -Wsign-compare by default?  That sounds
> > like a good idea to stop these problems creeping back in.
>=20
> Not quite yet: the patches were only covering "make libfdt". I see more
> reports for dtc and the tests. I should probably address those as long
> as this is still in my "L1 cache" ...
> Unless you want to turn on -Wsign-compare just for libfdt.

If you think you can get us there for the whole project reasonably
soon, then wait for that.  If it looks like you might need to shelve
this for a while, then it would be good to get it enabled for just
libfdt.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl93HckACgkQbDjKyiDZ
s5Iu/BAA5pZSpaiH3H1l8Vcx37puB0OK0cCKLxuPfL0HIAKGNUvMlaUySq/etiT7
fOA8x+CXXQBuyVGJ8sCaAmOw0NHC/doWoCXtnTzu8pSOV/TpCvj7I45iM+qg3n2a
gaQaKazoHVQGjZE7vR04pk++XUqdern3LHAqZOJ3KpArxYpITgRY0lllQS1A3sOB
ckvHhYEWzJ+nofqy8GghnoxI8ir0fxmZPb+nYpO4gSjUb8gExV1fvX1B4maDOZsF
Qiv4stF9hUaIiiCErJ1+RnXIYTYiHxRKKh8fewfZ4l+vmNJhbBdCTEc0U6jpb+QE
k3FApLHVUmbRE8k5aJ9kN6Fx6E/vtHJk9Gc7I0Oj+2ZRiOla8q52n3JTSdwQLFeM
UILVQGegG9gyPatI+cKkXqkjv/0ZROWLJ+AP8uCkP46qHj97Hn7QhJRIJo89D3us
Yabn3eDhbW37vkzBD+Duv4ZM6dWGFQkGSgNN2vbc9YTJypChKkwDCtgCSsJeSEbV
DbDjVydIamJeSWksx437M5O1x4infsePdVhEbtJjqL6NNWWfXEYgTAGv5PO2KkHe
KKXD8MB8sGhZjOFwosnV52r7UpQ0k9dh61QM0PWkbrAtHNsdIdv9WMCwY9Mfr42X
xzEnOapE/eZ4prltCXMY+CWOeBMyConImuyO5prv7PeIowNV/DA=
=XDuC
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
