From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Fix ambiguous grammar for devicetree rule
Date: Tue, 21 Nov 2017 15:07:32 +1100
Message-ID: <20171121040732.GR19214@umbus.fritz.box>
References: <20171120171218.3320-1-grant@tiffany.secretlab.ca>
 <CAL_JsqLYeXPtqDq_xetp5wB1ufjNAv5brvf840uD_=OLZ7uJsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wnBGVoaGQwxWUIo6"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1511242947;
        bh=z/AdEs6Psk2yvLmo9MNS46WyE/yDNmh6pgLifFxY9bw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IshKvYtqJ11396VYxfw3DMwOM0Uv1XbLQnyfk21Vd19fu2rhO7rPbYJ6zwF1wYEek
         Z/StEiuTQ7kkwTVKe4giJc4ytsuaJui8d+zdoMdUw/ODZqwDORf28k/32w8injVHLg
         sqAP5c5ngG64FPJJTlwm/rPC8LNuypykajLl7JKM=
Content-Disposition: inline
In-Reply-To: <CAL_JsqLYeXPtqDq_xetp5wB1ufjNAv5brvf840uD_=OLZ7uJsw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant-72MMKEujIeWYvcOBcYx38pOp/cRyR9/c930Pai70D+E@public.gmane.org>, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>


--wnBGVoaGQwxWUIo6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2017 at 11:20:31AM -0600, Rob Herring wrote:
> On Mon, Nov 20, 2017 at 11:12 AM, Grant Likely
> <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> > From: Grant Likely <grant-72MMKEujIeWYvcOBcYx38pOp/cRyR9/c930Pai70D+E@public.gmane.org>
>=20
> Ummm?
>=20
> > Commit 737b2df3, "overlay: Add syntactic sugar version of overlays"
> > introduced an empty rule for "devicetree" that created ambiguities in
> > the grammar and causes the following warning:
> >
> >          BISON dtc-parser.tab.c
> >   dtc-parser.y: warning: 3 shift/reduce conflicts [-Wconflicts-sr]
> >
> > Fix the grammar by explicitly testing for the condition the
> > new overlay grammar wants to use. This means duplicating a very small
> > amount of grammar processing code, but the alternative seems to be a
> > more invasive reorganization of the devicetree rule. Better to fix it
> > this way now and save the reorg for a separate patch
>=20
> Missing period.

I fixed up both of these in my tree.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wnBGVoaGQwxWUIo6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAloTpoQACgkQbDjKyiDZ
s5LNshAAxyNESS/LwYSmZ04//Mi21Ms1vL1DVvs88zDF5y8vrK78Da2C/3jb+BhF
AEcc9cJDtv9QOh9V8c98bnZbAS7tpdgcWjZes5rB1dqQqNaoe5TO9kAZrgBDUwZY
e7AX3NmoUy2xIuifXanwyHv6zajLLPWhyH4btCe3xrVZxNPYDT8YnvWJpqM4tqur
MZ+MxnQ4/ojrJ4x+zcwNDwt6kSnRpOqLzcwxpFBFaSnEmup0fqeqiEUhyMYF5srM
I7XAUqsqDsLFq18NP6iEh6MjrsydEhwrK6TAKDfbXkITdLuWzMrwttvjUt7NlcN2
HKIXyh0K27BCSXj7jkrAfF/+oQfweIfdrzhpQqZIct64EeFPXqTnhVJpf7xkpYO6
R4cmlB6O0hJ2E67TCYQ/aIJEmdnVQ3yXej7R+jqFIZcEejDbHmdzS0VtxE/ePNrx
3bMP/s8eqQYvN1iXnYaNUsByoSJzs4ohSQoIkaEi5NRcVq5vEwBCASaHnF7gaNHq
8K7Tl9SiVLbGC5NrDpb+/eb42JBU160gv7hgItuwjzfRgQASvTgeNsC4aRkI0xNm
sQNkUJIaJUP2FMtV7yK0KZMLUjoHCt2I5yzZNjnYinU8TYPOS0wqdII7ncFg3MYN
0qI/W+VoJT+SmvEQtUeMSV9oVuLLaXcxU3wLKmaqyj/X5OowQWI=
=tYYt
-----END PGP SIGNATURE-----

--wnBGVoaGQwxWUIo6--
