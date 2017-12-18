From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] Preserve datatype information when parsing dts
Date: Mon, 18 Dec 2017 15:34:52 +1100
Message-ID: <20171218043452.GU7753@umbus.fritz.box>
References: <20171128115710.9267-1-grant.likely@arm.com>
 <20171128115710.9267-2-grant.likely@arm.com>
 <20171212061409.GO2226@umbus.fritz.box>
 <CACxGe6tyHMTH_jOkacqLwcu+GeiNhAu54Q2WqN=PC8P0P2qJ8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kSOhxpxUsM1s2qz/"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1513571696;
        bh=cPGohRASELdqX5L2PWjoXVRm/dqia1zBfL5Trz5SAEQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OFWomotukDQbUoeWwX8qenmEoLz4qAVVFa5x4AsRqZ+IyyuQkVMMwDwPjqFpIYtNR
         qyWSpl9Nac5+AWPOy0Sd7eoE4IOHeX+3Be4Rc+4Z+gK84JhviKkEGHUrIKWESXoKda
         wkBUBpq596B35uqxXsr0SAhGI6T3KMY3WMJo3MNo=
Content-Disposition: inline
In-Reply-To: <CACxGe6tyHMTH_jOkacqLwcu+GeiNhAu54Q2WqN=PC8P0P2qJ8Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>


--kSOhxpxUsM1s2qz/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2017 at 12:48:10PM +0000, Grant Likely wrote:
> On Tue, Dec 12, 2017 at 6:14 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Tue, Nov 28, 2017 at 11:57:09AM +0000, Grant Likely wrote:
> >> The current code throws away all the data type and grouping information
> >> when parsing the DTS source file, which makes it difficult to
> >> reconstruct the data format when emitting a format that can express da=
ta
> >> types (ie. dts and yaml). Use the marker list to mark the beginning and
> >> end of each integer array block (<> and []), the datatype contained in
> >> each (8, 16, 32 & 64 bit widths), and the start of each string.
> >>
> >> At the same time, factor out the heuristic code used to guess a proper=
ty
> >> type at emit time. It is a pretty well defined standalone block that
> >> could be used elsewhere, for instance, when emitting YAML source. Fact=
or
> >> it out into a separate function so that it can be reused, and also to
> >> simplify the write_propval() function.
> >>
> >> When emitting, group integer output back into the same groups as the
> >> original source and use the REF_PATH and REF_PHANDLE markers to emit t=
he
> >> the node reference instead of a raw path or phandle.
> >>
> >> Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
> >
> > I'm a bit dubious how well forcing the marker mechanism to do all this
> > stuff it was never intended for can work in the long term.  Still,
> > it's an interesting experiment.
>=20
> As long as the actual data is stored as flat buffer, the markers
> mechanism works quite well for this. I tried doing something entirely
> separate, and it turned out to be awful. Another alternative is to
> break up the flat buffer into a chain of data blocks with attached
> type information, but that is a very invasive change.
>=20
> This approach has the advantage of being robust on accepting both
> typed and anonymous data. If the markers are not there then the
> existing behaviour can be maintained, but otherwise it can emit a
> higher fidelity of source language.

Hm, true.  The approach is growing on me.  I guess what I'm still
dubious about is how much this type annotation can get us to approach
the YAML model.  For example, YAML can distinguish between [ [1, 2],
[3, 4] ] and [1, 2, 3, 4] which isn't really feasible in dtc.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kSOhxpxUsM1s2qz/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlo3RWcACgkQbDjKyiDZ
s5JZYA//bauKxpNUpH5OVhUOwlIzJhEWTQS5Pqn5TQPwt6OpZ9lve/rDnov6o/rX
LxQZvJWzmpFtE1l5YOVizaYH05dw7Z8gevDsJdFy5JmF7qcERJcDVzyahRE0dWvB
aktBxhiDPvtWW+uOjHeOKQ240RbLCrcm4dt1bzKursBQDJACXwpfmT0K/MKsU9CQ
z7SXcO2/YhFks0XechYBMWMBizgZJTDtH0MZnniKwmzo7VwJegmW3pOnswgBKL0V
QWNOGqd9+iKp0MSR8kkJr490ODFNRKdl6D6D+/PlM502xwqOfHjMW3bEswphCX8T
RGsMxqOnyqDHPJOIVPSwUxBoTILde2qdqrBIqki/xkWWArCLK49GdpGOf8DyVU0K
mzQx/fzQAmKTOcqa3I90KcMBUv7WqY2xmXojYo07pxbzpasU5ZdBczyeen4elNqt
WB2A4f0ZXA9fgBylN6/DeIQX0fk3eAn5vtsbyePD+qV/ZyiJWcXisrmrAqdWmSQp
3Sil5HHKo9bR0mVW2wP8LXihlIQ3q2Ry17ydm1MzYpyRfDWEwf7YPTaOGRyUsuwW
ANeuvL/i+zg/Qmvf1Xp0ipO8PWj+ZJNpjpoGwjkxe4VT8qW7C2QdvGMwJKVOiPET
MTAmYTiZ3PefkYwThAL6hNPYD+OXLihP15sfBaBtJfpaO7osN94=
=cYoq
-----END PGP SIGNATURE-----

--kSOhxpxUsM1s2qz/--
