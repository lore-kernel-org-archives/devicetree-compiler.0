From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: DTC 1.4.3 released
Date: Wed, 1 Mar 2017 11:15:12 +1100
Message-ID: <20170301001512.GB12571@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1488332285;
        bh=d8nkV8nONlZm4draU+5ZxjR988A9f8b28xbMoutdoGo=;
        h=Date:From:To:Subject:From;
        b=Iyiopnr/jnobvfqBRCjVCVduTW36+XiH92EIGE/7a15mZJFESA/niNL6+D3tDlSfT
         rKY7cnG/RcBky026IeseEnXgctKk9/qyJPtwtDla9biTRHCAtOx+66l5yl4XIic+Fa
         KSD/oZeyCKvGAkUYS/+rKeyrAUFzX3buDrogCqL0=
Content-Disposition: inline
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I've just tagged and released version 1.4.3 of the device tree
compiler.  There's not a lot exciting in the new release; the biggest
thing is the support for applying dynamic overlays in libfdt.  Apart
=66rom that it's just a bunch of minor fixes and tweaks.

The source is available from the git tree at:
    git://git.kernel.org/pub/scm/utils/dtc/dtc.git

Or tarballs can be downloaded from:
    https://www.kernel.org/pub/software/utils/dtc/

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYthKQAAoJEGw4ysog2bOSs4oQAKRXGXMPovtubwZ9kfiSNHIQ
56NKhOK4j8Hfl9OG+KhzggZZ5RIYGWx+cXc8mcXxvX5TN2mNixzhcOqaKPp/ZJFR
IE8TWWpAYSiNQyUplKEeVp80xaVj3kcL1kfJ6r7oMwj5WKfOmh2S61oe9mkz+5nt
GVQZPxS2iN+ZCuENkUSoGJa4nmYZjF+kppIgN8/YgGHeRezQ64jed6wVGqJ8CGzr
ixfQqz4hZ93ukUL0cIL+GQHBQAg/o9c5VzWkOfCVfktjWslIN59WA+xRa646yC1U
bmlwIXRRoj1gmIS22SSNtzcNv+Jt/W23Fl9BdCD7wNR9Y3rmgJ4l1GeRVbScrC0y
tvx6pO5wFqJUDE/h4WpgTY+r/v/upPTjX9UFAGYSLeE6TQuep1Ep8mvyIHWBO4xz
BBW7ZoxNAFT5HZ1aI+AHNMUL1Ubgtdw4xpDVKZGkrdPtKF+7ibeWg7VcOJHBGMO8
z+zLjrwQjKoxRsRW7SlviFFg/nRcmxuXL7jqEDqozCz/xlFljomXhxJhpmUxGzG6
xxh+a8IrYNVbJNVPVOFzAU+0UASKeI7OjiJmzmPbSewm+dS2yMU1ZC8+eeLbymzb
ghXz11XpCnWZSG0F1fgJYBtvo3tsMCJQGuqRI1GzfTaLlz1lRpoVWCYACqkAozef
AgdS4OshL0rLnH3I4Zir
=EML9
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--
