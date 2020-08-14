From: Frank Mehnert <frank.mehnert-2ptZNfhJYoRaodhZ+FW2PA@public.gmane.org>
Subject: Re: [PATCH] libfdt: fix fdt_check_node_offset_ w/ VALID_INPUT
Date: Fri, 14 Aug 2020 08:47:32 +0200
Message-ID: <3674837.sAI6gyPZ35@noys4>
References: <76064614.bJBAheWMra@noys4> <1913141.TlUzK5foHS@noys4> <20200814031748.GA12805@yekko.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200814031748.GA12805-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Freitag, 14. August 2020 05:17:48 CEST David Gibson wrote:
> On Thu, Aug 13, 2020 at 05:26:26PM +0200, Frank Mehnert wrote:
> > fdt_check_node_offset_() checks for a valid offset but also changes the
> > offset by calling fdt_next_tag(). Hence, do not skip this function if
> > ASSUME_VALID_INPUT is set but only omit the initial offset check in that
> > case.
> >=20
> > As this function works very similar to fdt_check_prop_offset_(), do the
> > offset check there as well depending on ASSUME_VALID_INPUT.
>=20
> So, it looks like your mailer has mangled the patch (replacing tabs
> with spaces).  Since it's simple, I fixed it up this time, though.
>=20
> Applied.

Thanks!

Frank
--=20
Dr.-Ing. Frank Mehnert, frank.mehnert-2ptZNfhJYoRaodhZ+FW2PA@public.gmane.o=
rg, +49-351-41 883 224

Kernkonzept GmbH.  Sitz: Dresden.  Amtsgericht Dresden, HRB 31129.
Gesch=E4ftsf=FChrer: Dr.-Ing. Michael Hohmuth


