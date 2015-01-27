From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC/PATCH] libfdt: Use quotes to include header files
Date: Tue, 27 Jan 2015 17:01:22 +1100
Message-ID: <20150127060122.GG28888@voom.redhat.com>
References: <1420233023-12710-1-git-send-email-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7lMq7vMTJT4tNk0a"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1420233023-12710-1-git-send-email-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--7lMq7vMTJT4tNk0a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 03, 2015 at 10:10:23AM +1300, Chris Packham wrote:
> The linux kernel which carries the source of the device-tree-compiler
> and libfdt verbatim makes use of the include guards in libfdt_env.h and
> fdt.h to substitute kernel specific versions of the files. Unfortunately
> because these hare included in libfdt.h using angle brackets they are
> looked for in the "system" header location instead of the same directory
> as libfdt.h. This means that any file that includes libfdt.h needs to
> have special CFLAGS to add the path containing libfdt_env.h and fdt.h
> just so that their contents can be discarded by the include guards.
>=20
> By using quotes in libfdt/libfdt.h it picks up fdt.h and libfdt_env.h
> from the source directory without needing to add CFLAGS for the sources
> that happen to include linux/libfdt.h.
>=20
> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
> ---
> Hi,
>=20
> This patch has bounced around a couple of other mailing lists[1] and I've
> been directed here. This is a fairly linux-kernel centric problem so I'm
> open to other suggestions. The desire has been expressed to avoid having
> to have custom CFLAGS[2] just because a file needs to operate on the
> flattened device tree.
>=20
> Jon had previously mentioned a recollection that the angle brackets were
> intentional[3] can anyone confirm or deny this?

Sorry it's been so long before I replied.

There are a couple of cases I'm concerned about in considering this
change:

Case 1: libfdt installed as a userspace library

Here, libfdt.h, fdt.h and (the userspace version of) libfdt_env.h will
be in /usr/include.

I can never remember the exact details of how "" include works
compared to <> include.  If a program the user is writing includes
<libfdt.h>, will the "" includes within it correctly find the system
installed versions of the other headers?

Case 2: Building against a custom libfdt_env.h

As you know, libfdt is designed so it can be built with a custom
libfdt_env.h to embed it in bootloaders or other unusual environments.
The idea is that libfdt_env.h should be the *only* file that needs
adjustment in order to embed libfdt, the remaining files should be
exactly as included in the libfdt tree.

Wouldn't using "" mean that the local environment's libfdt_env.h must
be in the same directory as the libfdt.h you're building with, which
might be inconvenient if the embedding project wants to include the
whole libfdt directory without modification, but store the
libfdt_env.h file elsewhere in its tree.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7lMq7vMTJT4tNk0a
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUxymyAAoJEGw4ysog2bOSL84P/Ag77JhzKZxQ3/UgJo5FNB1+
tp2jHKQteLvKCHzo6IGePYOhh4ep+7WcYntakas99DhubbWpbScxrb6zvkeHeHiK
r9nK/EGr6yXrAMMTCJTIVAuZsNEcjx0XooUon1hViwZoyZ2+OujiNDMXbDXevZGV
3aNqr51VzlE4D3XDE9++dWenn6SEht1LPTXLXgIGL+bAiBbrtFl8b+KbbvtStik5
Irn+0PB93cVV9VkHZ0TtDbraMKYw/BNxVFbSAhyh00x6eMuKpRuW19eP3bgRRVrL
bilik3oIcZGNg3TPHwAhNJTUOJPZBSyvKM5/DCowGUP0BO6eud/fjxuucQy4xDXd
OxmGmQwJ9JLmQ1mExGEEk4OEj8KC3fyGry/I6u1nlIet/muXDgK408AUdcFB+hXI
YmMPfXJLKhfIZEIbseUNSRrNmPZ4giEH+PxirpjLj/dR6ou65AVqb7vDuk4HP9t2
SQjKi2viCUfwgXwmYLSHm9cDB/ELtRQP7DBQdr2zoRHDMPDjPbWxIJdocAC24A5N
A/DHJXnbKghCbhrqbYHjZ0XEi+lLwDG3sbr9eh9FGHVYN6F/milqGABiDfkt/hVq
SvcmdVjLRfFXIar1igQ+6jYzSPcSfkIxbBxXw6tw1ZVtNVmcUdjqJ+YItZ622sfd
FPakhp4eH0XsZCLKRjcL
=rQsm
-----END PGP SIGNATURE-----

--7lMq7vMTJT4tNk0a--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
