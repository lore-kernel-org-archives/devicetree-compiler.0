From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dtdiff: change to POSIX shell
Date: Mon, 5 Feb 2018 13:31:11 -0500
Message-ID: <20180205183111.GE27582@vapier>
References: <20180110054756.23464-1-vapier@gentoo.org>
 <20180110055718.GG19773@umbus.fritz.box>
 <20180202041418.GD27582@vapier>
 <CACNAnaESOk5Wb+Y1Sy2X3AuCqXFMj1QZ6_CFORTE=AcFRckM4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="48TaNjbzBVislYPb"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACNAnaESOk5Wb+Y1Sy2X3AuCqXFMj1QZ6_CFORTE=AcFRckM4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--48TaNjbzBVislYPb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01 Feb 2018 22:35, Kyle Evans wrote:
> On Thu, Feb 1, 2018 at 10:14 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> > On 10 Jan 2018 16:57, David Gibson wrote:
> >> On Wed, Jan 10, 2018 at 12:47:56AM -0500, Mike Frysinger wrote:
> >> > This changes from the bash-specific process substitution feature to
> >> > reading with pipes.  It relies on /dev/fd or /proc/self/fd existing.
> >> >
> >> > URL: https://crbug.com/756559
> >> > Signed-off-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >>
> >> Yeah, sorry, replacing a dependency on a complex but widely available
> >> shell with a much more cryptic dependency on a Linux specific feature
> >> does not seem like a win to me.
> >
> > bash's <(...) only works when the host supports either /dev/fd or /proc=
/self/fd,
> > so i don't think this is less portable.  /dev/fd also isn't Linux-speci=
fic.
>=20
> For what it's worth, this isn't completely true. Bash can also use
> FIFOs for process substitution [1]. FreeBSD does not use fdescfs by
> default, but it can be mounted, and using fdescfs for process
> substitution is provided as an optional feature in shells/bash. It
> would be nice to not grow a dependency on fdescfs for dtc. =3D)
>=20
> [1] https://www.gnu.org/software/bash/manual/html_node/Process-Substituti=
on.html

sorry, you're right.  i didn't fully trace the bash source.  that man page
matches the current sources in that either named fifos or /dev/fd are neede=
d.

Simon suggested i just use tempfiles myself.  i had avoided them because the
current method makes it easy to avoid leaks (for whatever reason), but if it
isn't a big deal, that'd be an easy fix.
-mike

TMP1=3D TMP2=3D
trap 'rm -f "${TMP1}" "${TMP2}"' EXIT
TMP1=3D$(mktemp)
TMP2=3D$(mktemp)

source_and_sort "$1" "${TMP1}"
source_and_sort "$2" "${TMP2}"
diff -u "${TMP1}" "${TMP2}"

--48TaNjbzBVislYPb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEuQK1JxMl+JKsJRrUQWM7n+g39YEFAlp4ou8ACgkQQWM7n+g3
9YHgqQ//bTXmhpS2vl0QYmgWtAwgsqEnxVliRY70xlP0rDZL9MioaualfjuIo9iT
dcGTKEra5ZjziSKdn17PWPRiZa0eY3QrwViZ9gZuzGRIZGgtmH9EGKCISW+sxgGd
JaH+R+5POHP8eSZpVYXu7d2tcqVpOnH7qr/XhDxESvp/xQOPMn8sQkL32BZSP/Fv
S2GtvQxmY6CH4io+OWiKA+6cCj+wWxlFZ74ol9xQ6YtQgmjE/fJgT4x68fY+nJyl
Jy6CPZCaCFEf8xnENTGP2z2IJ7Pv5AwyMHM90d4sWVOqCKvELMmLD2AgLWnyBpMq
gqIp6ll8yrqJHWBTY5P7YQDzERLMMkLQllOQ75Rsd97p2TA8G1NNUXeNIlj/VC9a
zHumHTsY58FUxw4qSYV8FR2tFdEhn7PjnmHuJa9xDUf996AgrmHY+GS7ilDrcZSw
fSF8ZO6MahhTIYK2AWxuxPNoQMsPnfRRPubcLB5uFpdHa+V0+bdBiVwBGTa80OnV
EYQf3M483xmITUL3qxDpSN+UzDeRvt7cKHR3ffrFRMUbwTW4ZidlWs01nqKu+NYM
KSLkQMFIcPsbXLEvRt8E8oLbQWekOPsWC5VN7jQS+bnEFQbh63qKeuahW2n2Ez+D
v5pVYV1brocUsXAP4TqFLiqyFL6y69lGzituTY8aBhFFv1vpgnA=
=+0uQ
-----END PGP SIGNATURE-----

--48TaNjbzBVislYPb--
