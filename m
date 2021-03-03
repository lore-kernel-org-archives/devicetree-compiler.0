From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Unchecked return value error in fdt_rw.c
Date: Wed, 3 Mar 2021 19:33:52 +1100
Message-ID: <YD9J8OVvACNd4ppy@yekko.fritz.box>
References: <1614637450-4972-1-git-send-email-ryan.long@oarcorp.com>
 <CAL_JsqK68HjwdT5+-kjo3Yr7XokC=6ioa7dkMzeUsve8iEzVxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cNLHve7st/X156VO"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1614762856;
        bh=PfdCis4wnpR9YWRVwG/+Jg+1/oX1c2TFImm4CQQciZM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hwzwCuNGACuuw/sn94wFRiCLL01JRfZZMt0HDLW3beTx3dDHxFNs1zsRTvY1ZW1s6
         S5AFpMDF1ixznZiqn+bI/kTF326XPt2jvmXdjGI01G8xNTm69u0zX4LtAqrbTPyM7l
         gRTqKN+zWY3pdpGGpXGeUXgHyW7QuOT78YT9/38o=
Content-Disposition: inline
In-Reply-To: <CAL_JsqK68HjwdT5+-kjo3Yr7XokC=6ioa7dkMzeUsve8iEzVxA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ryan Long <thisisryanlong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ryan Long <ryan.long-lGxtRh3/QYtBDgjK7y7TUQ@public.gmane.org>


--cNLHve7st/X156VO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 01, 2021 at 08:29:49PM -0600, Rob Herring wrote:
> On Mon, Mar 1, 2021 at 4:27 PM Ryan Long <thisisryanlong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > Hi,
> >
> > I filed an issue on github, but I was told it'd be good to send this to
> > the mailing list as well.
> >
> > RTEMS (RTEMS.org) is a free single process, multi-threaded real-time op=
erating
> > system with a long history. Your dtc toolchain has been incorporated in=
to
> > RTEMS. The RTEMS Project is a member of the Coverity Scan program and it
> > flagged an issue with /dtc/libfdt/fdt_rw.c. In trying to be good citize=
ns of
> > the wider open source community, the project wants these issues to be r=
eported
> > to the upstream owner along with a fix or suggestions. This is one of t=
hose
> > reports.
> >
> > When Coverity Scan was ran on some of your code, a "Unchecked return va=
lue"
> > error was found at line 352 in fdt_rw.c. For similar errors that we rec=
eived
> > for RTEMS, we created a macro that will assert the value returned and "=
use" the
> > return value like so.
>=20
> Humm, I think Coverity scans run on the Linux kernel too, but I've
> never seen any reports on the kernel's copy. Just wondering why...

It runs on dtc upstream as well.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cNLHve7st/X156VO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA/Se0ACgkQbDjKyiDZ
s5JE/A/+J/09fymuwmerrCRkw29X/fG9WxxvjgRV7dyv59M1e/vaf+dpTX7C6jBo
grlux7nyVLAtesUVpkh0AXd//9IRir289R+yYK6YnUguoNG5WerhAgOnp/6vASca
OcEXDPTSVrorsdltditfnX4h4OuKrYl3IfvtXJoaJf+BE4/WHZKrnqUFwcuaA/EA
jm6B38PvwaTnwdI41iD7wdarQrYuGigoGJehJ/NfWUYHmt8pqtrgwubgyIlJSbB7
/zDzd8kK5ctoarjODz4L5KO/5klh5Sw29Ax84To5Tcs05KFZeUxwqjweVSvrU45S
7qKPXap1Bdi/mV/n85uclFSOnLp9Nv1F3BCJvK9/CBlUl6/mhwckUDnbN24q/Rt3
cPQLCiIg8akqfspbuHsj2TjsDMyb+7Ri9yLAE3JIfL44MColQ4U28ouu/+BtR+B4
h+yZTJUuwAvDYG7YNXR2WQ0H984ObGhjeeNtbKvcJHZoRwFzjTZf8ybKtvccO6tg
np5ZHuJDgUihuXP3hg3U8clSWFz/UtUc8XqXwPgZWnCiNmECZcVGLypY5KSmXsG0
LLpPLYb8c9JAEKXNdn7uBpplAiFOOAcFGymt6FhiIO3e4E2QCa8FMA+vFcGCeGGH
hn1uCzylO+PrIc13CciFd87YW7s7nmP65MT2+wChIowAvspH894=
=twmX
-----END PGP SIGNATURE-----

--cNLHve7st/X156VO--
