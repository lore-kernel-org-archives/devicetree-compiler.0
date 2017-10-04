From: "Huober, Reiner (Nokia - DE/Ulm)" <reiner.huober-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Subject: RE: Patch for device tree compiler, export stringlist functions
 (resend as text/plain hopefully)
Date: Wed, 4 Oct 2017 13:03:50 +0000
Message-ID: <DB6PR0701MB27128A7D682705FD1DD2F395F9730@DB6PR0701MB2712.eurprd07.prod.outlook.com>
References: <DB6PR0701MB271276D697034D3480A0F2A7F96F0@DB6PR0701MB2712.eurprd07.prod.outlook.com>
 <20170915063950.GH5250@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=N0LdLwk5YK37QWlKjgpewGR3KsT1aDN5CWUqaSoLCo4=;
 b=PBtqNWSBauLOU+S4cOOClinsuk3j17eWCIlfDJB6TXp6vkMo+fx7XI1d2sT8yfu0fy0t5lIRzPqzXlwykbF3pgJna62WWAkrg1R02JMU1QrnVD7t0eUZOoWcp8gjbt+p4AmYO1AJQa06RqDAPtRi6qzckUWyXTkZUZS4/jf3kYA=
In-Reply-To: <20170915063950.GH5250-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Schiele, Robert (Nokia - DE/Ulm)" <robert.schiele-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, "Huober, Reiner (Nokia - DE/Ulm)" <reiner.huober-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>

Hi

>Patch looks good, but I'll need a Signed-off-by line in order to apply it.

Hopefully it is now ok
Reiner

From 48d01c74fbdfd12ffa4aa65cc92fd452952efc00 Mon Sep 17 00:00:00 2001
From: Reiner Huober <reiner.huober-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Date: Thu, 14 Sep 2017 14:36:07 +0200
Subject: [PATCH] libfdt: add stringlist functions to linker script

The fdt_stringlist_count, fdt_stringslist_search, and fdt_stringlist_get
are added to the libfdt linker script as global symbols

Signed-off-by: Reiner Huober <reiner.huober-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
---
 libfdt/version.lds |    3 +++=20
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/libfdt/version.lds b/libfdt/version.lds
index cff0358..18fb69f 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -60,6 +60,9 @@ LIBFDT_1.2 {
        fdt_address_cells;
        fdt_size_cells;
        fdt_stringlist_contains;
+       fdt_stringlist_count;
+       fdt_stringlist_search;
+       fdt_stringlist_get;
        fdt_resize;
        fdt_overlay_apply;
=20
--=20
1.7.1

-----Original Message-----
From: David Gibson [mailto:david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org]=20
Sent: Friday, September 15, 2017 8:40 AM
To: Huober, Reiner (Nokia - DE/Ulm) <reiner.huober-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>; devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Subject: Re: Patch for device tree compiler, export stringlist functions (r=
esend as text/plain hopefully)

On Thu, Sep 14, 2017 at 01:23:13PM +0000, Huober, Reiner (Nokia - DE/Ulm) w=
rote:
> Hi
>=20
> (resend as plain text hopefully)

It came through as plain text ok, but for future reference, it's preferred =
to include patches inline, rather than as an attachment.
>=20
> I have a patch for libfdt inside the device tree compiler. It add=20
> missing exports to the linker script

Patch looks good, but I'll need a Signed-off-by line in order to apply it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
