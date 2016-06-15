From: Warner Losh <wlosh-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 7/9] libfdt: Add overlay application function
Date: Wed, 15 Jun 2016 08:49:10 -0600
Message-ID: <C69D5C8F-68EC-40F8-86A6-1DB44A5817EB@bsdimp.com>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com> <1464340402-2249-8-git-send-email-maxime.ripard@free-electrons.com> <34997AD3-B621-4823-920E-22E4A6F0E0D1@konsulko.com> <20160614002550.GA4882@voom.fritz.box> <F0B62E6A-D5CE-4505-BC19-5EAB72A33ADE@konsulko.com> <20160615031402.GF4882@voom.fritz.box> <7E8A7CBD-D682-45E5-AD2C-19F137E5ED38@konsulko.com> <20160615101935.GA16563@voom.fritz.box> <F67FB562-88F6-4B3A-8952-ACA38AAC9256@konsulko.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=c+9/g+ubxwLHGU6OEh3SYQCxSvOl1MWHn8icmUZ3Pq0=;
        b=YtOwdcsZDxI97BM0JZIdPqalyRf3h1y2HELZpZNhO+mEyXy45R2/wliPiKrg7LlrsA
         OuoOJvzXwlD7QJqHUP1YLDzBkj9lZhi6sKTtinc23jNgBEiBGwOSPl7nUydRnYx01hmu
         DNJknmjfZugs6fr+9dIi3N2Mz83l0J7djVFYp6L+Ave017qflsF9HaJwaboveOImcr2Z
         n+f1tVLwNSqeBePU0V5dBQe3QU+Fq6RXOpQc4qKEfGhg72PpSEGhMMbpcMzsNlkknNyV
         6bHjcJkHKsLRWLjBJwZ1e+zxrfHzGklGTxYTP7/djywjZk7kBYHHOjbhQB8tjJ+LESF9
         PrYg==
In-Reply-To: <F67FB562-88F6-4B3A-8952-ACA38AAC9256-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?utf-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


> On Jun 15, 2016, at 4:23 AM, Pantelis Antoniou <pantelis.antoniou@kon=
sulko.com> wrote:

> The correct way is to get cracking on the machine readable yaml based=
 bindings
> and enforce it through there.

Machine readable bindings with enforcement would be enabling technology=
 to solve
a lot of different problems (both technical and non-technical). Coupled=
 with overlays
(whatever philosophy wins and I hope one wins soon), these things will =
greatly improve
the flexibility of the currently somewhat rigid DTB=E2=80=A6

Warner--
To unsubscribe from this list: send the line "unsubscribe devicetree-co=
mpiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
