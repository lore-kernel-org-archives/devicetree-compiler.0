From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 3/6] pylibfdt_tests: Don't depend on built dtbs
Date: Fri, 12 Nov 2021 15:57:05 +1100
Message-ID: <YY30Ibyru+HjNaPV@yekko>
References: <20211112041633.741598-1-robh@kernel.org>
 <20211112041633.741598-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MbPRPZlWTr/e3efZ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1636693457;
        bh=cGPh0NAn4hFO7FaExsTxGY6gR033Me8GnedTThyRhTw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VmGjcdKp1PJ8r3HUvp3d7NqDrEIeU0t+7vmsjHU1SeCB2n9AxZEedKpZP/ETrGYJO
         /9B6w+u2Ln82wkklO5SdOYYjqX8ruCArDtSgb0pAajvjkgPqVKc61FMkAF38f2MObF
         Wqlpj/mQFQQV/GouhZlGVd4EridZrKIWPRIqM6hY=
Content-Disposition: inline
In-Reply-To: <20211112041633.741598-4-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--MbPRPZlWTr/e3efZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 11, 2021 at 10:16:30PM -0600, Rob Herring wrote:
> The pylibfdt tests depend on the rest of the tests to build dtbs, but
> are otherwise independent. Modify the test to build dtbs itself so the
> python tests can run standalone.
>=20
> This also fixes an intermittent problem with the DT strings section size
> varying depending on how the dtb was built. The test assumed the dtb was
> built with '-H both' option which is pretty much impossible to tell from
> run_tests.sh.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

This breaks "make check" for me.  I think it's relying on there being
an already built dtc in the path, rather than specifically running the
dtc built from the source tree.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: testAccess (__main__.PyLibfdtRoTests)
Basic sanity check for the FdtRo class
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/dwg/src/dtc/tests/./pylibfdt_tests.py", line 583, in setUp
    dtb =3D subprocess.run(['dtc', '-O', 'dtb', os.path.join(testsrc, 'test=
_tree1.dts')],
  File "/usr/lib64/python3.10/subprocess.py", line 501, in run
    with Popen(*popenargs, **kwargs) as process:
  File "/usr/lib64/python3.10/subprocess.py", line 966, in __init__
    self._execute_child(args, executable, preexec_fn, close_fds,
  File "/usr/lib64/python3.10/subprocess.py", line 1842, in _execute_child
    raise child_exception_type(errno_num, err_msg, err_filename)
FileNotFoundError: [Errno 2] No such file or directory: 'dtc'

----------------------------------------------------------------------

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MbPRPZlWTr/e3efZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGN9BsACgkQbDjKyiDZ
s5LeaA//TaHEO1rKGwC3bIst74LDyLsBNX0+K46W+jacp2Qkx8akpthvr+w8NgtC
6uUgqSV4sccwayeCxsUNanpRt6SpDwM5UPK8A4AzLnoE+Upan+NKg/COnPXjnrms
MGxoAUUxhZzSphKdfIxnrsvf/1NKWbW7GUcup0edWnj5lgBFTwcZjZlM0sBZESLR
QjGzqdSevTvmERF6GGciP3l1bAbmshYst8rtQdMGnroR2L5ZJ6dIHLYKK8hWIuSN
/M04rQ5c5H3Q599v4YjBdMPFEgs/4GcwceQqlFQkZkhQwvQ97Veu4b6VAiclvjkn
M93AkjuOr3+XqPCxRLyXOx4TfT/DsmN9OIDBTarOrF2oxEFKIytK8QWgCI7ImwR5
Ye4Fy2y1Lrw0YW5GOhv9WbGKGmjLZHCiY93ZXD65y8FFDeL1yc2TCqTKkMMMRanK
khKnwJSy6WPHcwNovlQo+hDjV00Th3evmrw4EZ5TA5MrVMP8Cygq0j0xfqbpYwf/
GDcKDh5ITVgH14W1Q/sEP4rwowLHAPIfgpSYcieX8EYWjj1dSGrqQMnFwLWepb6T
K0o6MgBa+ZGM8mCqlLjfd4otVtoKMSndVhHMzVLXah6CyBPHKGqHWbmRyfh7SVMq
c+YAD/sFOV680+EIIDLaUgg2ZtKsCbrHM4rD+tJ4tMPeHiHQhtA=
=AIvf
-----END PGP SIGNATURE-----

--MbPRPZlWTr/e3efZ--
