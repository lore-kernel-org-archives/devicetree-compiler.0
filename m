From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v9 0/5] Introduce Python bindings for libfdt
Date: Fri, 17 Mar 2017 15:07:58 +1100
Message-ID: <20170317040758.GN12402@umbus.fritz.box>
References: <20170304235229.5343-1-sjg@chromium.org>
 <CAPnjgZ1pdbNMCdGbSZQ9aE=rGR0XZyJ-e9Fqsj2v0ThEuk6SiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ztcJpsdPpsnnlAp8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1489724227;
        bh=+uJyJgTHglV8vabmqLAwJ04O5844xaWu6eGHQ3wyIFM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CdhtLA3YXYsM2HYjVrWknImKT7H9C+wSpumX56vBykMe6Q57XT1uOOq4cDq5DTg1X
         xivRT8csJzFbKcohi9K5UUBxh+erRev9Ojea9fL3KarInV0CUjgAG2iKGnoFZgMZq/
         SiM2zVjP8r2pYzNBhJzz8Ue/lC8lf2DZsFVZnstg=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ1pdbNMCdGbSZQ9aE=rGR0XZyJ-e9Fqsj2v0ThEuk6SiQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--ztcJpsdPpsnnlAp8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2017 at 08:20:53AM -0600, Simon Glass wrote:
> Hi David,
>=20
> On 4 March 2017 at 16:52, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> >
> > At present libfdt consists of only a C implementation. Many scripts are
> > written using Python so it useful to have Python bindings for libfdt.
> > Apparently this has never been attempted before, or if so I cannot find=
 a
> > reference.
> >
> > This series starts the process of adding this support, with just a
> > bare-bones set of methods.
> >
> > The v8 series provides binding that can be used like this:
> >
> >     fdt =3D libfdt.Fdt(open(fname).read())
> >     node =3D fdt.path_offset('/subnode@1')
> >     print fdt.get_prop(node, 'compatible')
> >     subnode =3D fdt.first_subnode(node, quiet=3D[libfdt.NOTFOUND])
> >     while subnode > 0:
> >         print fdt.get_name(subnode)
> >         subnode =3D fdt.next_subnode(subnode, quiet=3D[libfdt.NOTFOUND])
>=20
> Just checking in to see how this looks now? I sent one v10 patch but
> the rest is as is. Let me know if you'd like me to send the whole
> thing again.

Sorry, my day job has been kind of hectic lately.

So, for one thing, yes, I'd like a repost of the whole set - I didn't
keep the last spin ready to hand.

But I'm also still not thrilled with the behaviour in the v10 patch
you posted. It prints information _only_ if there are failures, which
makes it a drag to check, and confusing since the tests show up in the
final numbers but have no other visibility.

I think this can go one of two ways:
   - Give the Python tests close to the existing testcases.  I realize
     that's awkward since they use python unittest not the existing
     home-rolled framework, but do what you can.

or
   - Don't integrate the python tests at all.  Have make check run the
     existing testsuite, then the python test suite (if python is
     available).  This should produce *some* output for both parts in
     all cases (so you know it has run), even if it's just a minimal
     summary for the unittest part.  Don't include the python tests in
     the totals for the other part.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ztcJpsdPpsnnlAp8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYy2EeAAoJEGw4ysog2bOS1/YQALaRu9oHVhMK9KRFP83D+vPT
pFNtsJ2KP6Ux78fUgbNEtBDASfDYEZqJAX6V1PsIRugkUD02RrKtMLUUBzJgTaMX
h+ekcRFiZ76ZFQ7O3B05E413LxfT4G3DwbRRA/UDhoJJzEVeiopmTvgWoiO5y8vT
WEnbUBWds0DGMg7DP9XOd6XP+uw6MKwZJ4i2VLQzNy6eoO8nVRkMnoSSMxA5A6Q1
3rZ6R2Dw51AoRtJMqFckDzx8SBwM+8l6VBR/omurfv098MyN8e18hKWyR0Qvl/t6
e2Bx0Suql/lcjgwCiuW1r7r49vXiV9Jsj2X7zqLKT9kvuCQniQvhO6PRq0/S6MxH
zKQDNyPUxniZj7FFritle98e1PMFLtjC4gJoY2H0OenkojW8hYoRuGibJGvFGq0m
Ayn5NYLI+U9YrEZrMXde84eiLhfR2B+Q8oMMUWt/jUcaTLbEgSUGI4JOpY4TMTpp
TFztcpsw9Lv5C0r62iYJKjaYL/wGaBlLXLD/1WP8MEAcxUiO4hB4b0wjKgwGz8WS
W5sIiXek99BNSOSnqJgk+slg23Lw0G2bxJAdUVQ/NXWLjncR9xgFoes6dEkVJktO
x7WyoFdrXXCr2IwQOyt3e7nu27Jjw+U2++k+FD1XThCuZ6MWWMc9E7YbOh8w+ITZ
b8dVgrAO80SSrvDSSF5B
=Tq5q
-----END PGP SIGNATURE-----

--ztcJpsdPpsnnlAp8--
