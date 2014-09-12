From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Iterator break-free ?
Date: Fri, 12 Sep 2014 15:56:50 +1000
Message-ID: <20140912055650.GB13855@voom.redhat.com>
References: <CAB8QsTBF5V8JJeEkkUXN30fnUoDxVWR_ufGkXaEHRGeZCc6ozw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAB8QsTBF5V8JJeEkkUXN30fnUoDxVWR_ufGkXaEHRGeZCc6ozw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jay Bhukhanwala <jaybhukhanwala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2014 at 10:21:11PM -0700, Jay Bhukhanwala wrote:
> When traversing the entire tree using fdt_next_node, will the iterator
> break if I change the blob structure, due to, say, addition/deletion
> of a node/property or changing a property ?

In general yes, it will break.

however there's one very common special case where the iteration will
keep working:
   if between one call to fdt_next_node() and the next, the *only*
   insertions or deletions are of nodes or properties within the node
   returned by the first call to fdt_next_node(), then you're ok.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUEosiAAoJEGw4ysog2bOSzBgQANi6CdAEXCQiPAUfBhrSwK1e
DwsW6HFVzsqfbKHdBlar5az6pPbHPNS50ZyqLv+giuGmZ9t7j4+thbh+4ZTsThYL
ZCNLVNYRVMKDBgz5UYenPmcjhUZ883haOrWQZSJ+DD0zqGCQJR5RnMXkB6iGiOMY
oFt5AvB/dh5yDdcE8U9T2Fs09tYsKGCn04gC956v8hooTxgea1dfDq2g50TUgjEH
9vlr9HAwz/wGzzmxV8nks1E0wk8pEBTcCrfubYcGMZMOHEiJ099xuslyt4E5Fa8r
1uXj/YUtwfKb2evnvyQ59A076qiojDSzssCk3dli3DPBwG1tNJ77yUCGlikpV7Zp
Gn+2PDurhLsCnXAUvQ2lxJX5Gdt+bWghE+csN3vEkNf8k+lDDsI0V8+W5+mOgHYS
EwzEaI6T1vUH0f3bh6iYAUvJbSPOAPxOZfbX593XEgUytHkwnNZDY26MEtAd8goY
aQxOeVj62pBLyLEdNIYx04B4DQAkVUVBKJyILGLq8CAj4xD8vY+/aOI753wBTp7s
tndEkeAdLjOyDV3TIZf6b2VWl7LB3AYTlX7z22qFpP4duTYkt0DY0EHMUTmV7jBG
AYYNECtUAgRzSyxe73RncOoS1iN0aTfYpJtisqOutE1JAsf1M76kYzYYkhfGEuC0
nBPVEqLLzl6XZ1FxMUO9
=Ixc0
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
