From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc 1.6.0 overlay full-path reference in array produces broken
 property names
Date: Wed, 29 Sep 2021 11:40:49 +1000
Message-ID: <YVPEIdIYGhxl9SrJ@yekko>
References: <20210927140456.4e45f05b@gmail.com>
 <20210928112859.79b55d5a@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i4irL34vzQMoBSfS"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1632886080;
        bh=oMvBqa2HMSQdep/YCXFmvVHtu2LzE5VyYl52LIt/urI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nOBnFK+dh6q9BpoLCi7F9lpFZ1YZRiJ1vwd8Z/pHM0L98CXjru6olJgPihgUzyOtp
         bbMZlLfNyOl4MPKkD3tu1tOYIpzzqhIVvRzOSMW99oxFEmFSuwWJBThXR01qw7cZ3W
         nlOKpNFKrgf4qNzM0MtGuJJfTvWOQ1ame/a4/Zb8=
Content-Disposition: inline
In-Reply-To: <20210928112859.79b55d5a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Vincent Pelletier <plr.vincent-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--i4irL34vzQMoBSfS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 28, 2021 at 11:28:59AM +0000, Vincent Pelletier wrote:
> On Mon, 27 Sep 2021 14:04:56 +0000, Vincent Pelletier <plr.vincent@gmail.=
com> wrote:
> > (please keep me cc'ed in replies)
> [...]
> > This code builds fine:
> >   $ dtc -I dts -O dtb -o test.dtbo test.dts
> >   $
> > But then when disassembling the output, I get:
> >   $ dtc -I dtb -O dts test.dtbo
> >   <stdout>: ERROR (property_name_chars): /__fixups__:/soc/gpio@7e200000=
: Bad character '/' in property name
> >   ERROR: Input tree has errors, aborting (use -f to force output)
>=20
> I just noticed 1.6.1 was released (but not packaged yet by my
> distribution, it seems), so I reproduced from git master as of
>=20
>   commit e33ce1d6a8c7e54e3ad12cff33690b6da0aee1dc (HEAD -> master, origin=
/master, origin/main, origin/HEAD)
>   Author: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
>   Date:   Fri Sep 24 23:39:56 2021 +1000
>=20
>       flattree: Use '\n', not ';' to separate asm pseudo-ops
>=20
> and I confirm the error is still present.

Thanks for checking, and yes, this definitely looks like a dtc bug.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--i4irL34vzQMoBSfS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFTxB8ACgkQbDjKyiDZ
s5KPLA/+LKDl7IkeEnbdAYL0LsprNupLwJIuwN8vQSNaMR77Tmi0fgoopqXGOA/+
HQcrp3Ka011Ts7x/Qt58Ww9WV+xNug3RLLDaqjyqp6c/mmv8FG+vggs5uiEyORay
0iLRXO6qNubzgKGnSGquYiEHbPv8nCm7fnY94ac4cVhLRUdLz/2vgrxWvrDe9own
wjGRfGzdS5C4GPvMIqqrebvU4YoxuUSIhLuq0oGIB4DNMussExA/V8dcbWBQb61G
NOYlypy6pxiyuO+D05okIsIJVmdVRCKJtNC6h1u8g9aup2WfOSvuqh0bmBkkNRwU
09KzvrLLlLK54jDVX0WkAzQ1paPaV25wxeHDbzo0XJcPdgRWl+g0xWExKUidkF8P
B7m74gC8uL+ZIJkTd0mExtsnhB6MrddfUYH/m+pFM0XIocx9882iiTItVWAZo807
feopdiCc91hSio6mtd6QeJXzDKnVQpkoX8UX96+YuCljGQJyb7U3wxFawgy+6Tgk
+DLI/he5UqEy3/cfVDB9p81Vl+RklBAiy8Uc8QYHdIfTvBoE06QdDk9xu8g7GvPK
FCgVYy1y5lLdCFhMdpmC+p43oRYN8n/NKJVUtEHIT6xoWEI4L0C9HZ9/Twwk3JIB
TsfL94DMhO3hjpmKdiQvM/gfDzebotOK6hAbK50A42sh9vvVmko=
=Kguf
-----END PGP SIGNATURE-----

--i4irL34vzQMoBSfS--
