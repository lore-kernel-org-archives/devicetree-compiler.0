From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Sort unit addresses by number
Date: Thu, 20 Aug 2015 14:09:46 -0700
Message-ID: <20150820210946.GC13973@voom.event.rightround.com>
References: <20150812120004.5117c6b1@kryten>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150812120004.5117c6b1@kryten>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2015 at 12:00:04PM +1000, Anton Blanchard wrote:
> The sort option in dtc treats unit addresses as strings. This causes
> cpu nodes to end up out of order:
>=20
> # dtc -s -I fs -O dts /proc/proc/device-tree | grep PowerPC,POWER7
>=20
> 		PowerPC,POWER7@30 {
> 		PowerPC,POWER7@68 {
> 		PowerPC,POWER7@70 {
> 		PowerPC,POWER7@828 {
> 		PowerPC,POWER7@860 {
> 		PowerPC,POWER7@868 {
> 		PowerPC,POWER7@8a0 {
> 		PowerPC,POWER7@8b0 {
> 		PowerPC,POWER7@8f0 {
> 		PowerPC,POWER7@a0 {
> 		PowerPC,POWER7@a8 {
> 		PowerPC,POWER7@e0 {
>=20
> If we use this device tree for a kexec boot we end up with a confusing
> layout of logical CPUs:
>=20
> node 0 cpus: 0-23 72-95
> node 0 size: 32633 MB
>=20
> node 1 cpus: 24-71
> node 1 size: 32631 MB
>=20
> The reason for this is that we allocate logical CPU ids as we walk
> through the device tree.
>=20
> In cmp_subnode, if both nodes have a hex unit address and the
> basenames match, then compare by number.
>=20
> This fixes the issue:
>=20
> # dtc -s -I fs -O dts /proc/proc/device-tree | grep PowerPC,POWER7
> 		PowerPC,POWER7@30 {
> 		PowerPC,POWER7@68 {
> 		PowerPC,POWER7@70 {
> 		PowerPC,POWER7@a0 {
> 		PowerPC,POWER7@a8 {
> 		PowerPC,POWER7@e0 {
> 		PowerPC,POWER7@828 {
> 		PowerPC,POWER7@860 {
> 		PowerPC,POWER7@868 {
> 		PowerPC,POWER7@8a0 {
> 		PowerPC,POWER7@8b0 {
> 		PowerPC,POWER7@8f0 {
>=20
> And the CPU layout is as expected:
>=20
> node 0 cpus: 0-47
> node 0 size: 32633 MB
>=20
> node 1 cpus: 48-95
> node 1 size: 32631 MB
>=20
> Signed-off-by: Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>

So.. I agree the current ordering is rather nasty, but changing it
like this is problematic.

The idea of dtc -s is that it will produce the output in a "canonical"
form so that tools like dtdiff can examine without having to care
about order changes.  So, first problem is that changing the -s
behaviour means that the "canonical" form from an old dtc won't be the
same as from a new dtc which kind of defeats the purpose.

Again, in principle, ordering by unit address makes more sense than
ordering by the whole unit name, but it adds further complications.
We could just strcmp() the unit address, but that would lead to the
same ordering oddities you've seen.  We can order assuming it's hex,
but then we'll get strange behaviour on pci or other buses that can
have funny characters in their unit addresses.

So, yeah..

At the very least I'd like to see a change like this activated by a
new option.  Longer term I'm not sure how to proceed sensibly with
improving the ordering.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV1kIaAAoJEGw4ysog2bOS510P/3bG1cmm49xGeiN5RPm3hmw8
SzWt1g9h6Q0mwVJ6QgBurbDw50kicGrzQyMt+g98hBFhpGttvm+wXpFxJlKqoY7b
DXMn0BEitOoWKHHqYKZ+2wfNKBmQE52bQ1PJH9wa/QY4SwiWiZo8/EQsZPEUfKfD
VWeNMFnz/Uymv4MEoKOKzxqaD8qmEdGyb4SNaX+apxyeHypka0UAp5sqAJpLqKb/
QnvbzJP0Booz66TWbZyR0dTZ4UnHEkQCqOs4io8xMHuXPoY8rGyQpZgTm1Xsfv3T
/Izf8OfBfinKFVoysxYMpKKbrzg1NAkKBrDfWlMYq9RwGYObbyByUQBVQ+FMsodr
jz5PJzjk4brSJhIIu7UW4KjBssz0Ev0FxE+sC6n6gzYT8PaoLfZlNInK2nQ/0zaD
kf/BSSexi8QKmDo21z56LEDyr4UF5gTgavBJD8XxVi/a6cMU/UBDEu6AGP8bOWo+
Lu8+WVubQ2KcHj2+XepqBwrVAxxXs2edX+TRNiYLpOB39cvi+otln4X+rPvPMo84
+1aIBwXrVqTxznF9IJqNtBUVABLXAAAzzxYkGXe6kEg6+Xfld0MxvajvSG+6YSmy
MIxWWEuuwyaU8uOWEVitzis8aRXngNMXH+C+yYadfVGUpRs+/kar0XzVNhB1ZHok
8szoq6ENQtDBULILzcqq
=lFQD
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--
