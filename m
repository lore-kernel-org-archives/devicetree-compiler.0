From: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Subject: Re: [PATCH v2] pylibfdt: add FdtRo.get_path()
Date: Tue, 25 Jan 2022 19:36:17 +0100
Message-ID: <2266584.iZASKD2KPV@g550jk>
References: <20220122105653.31219-1-luca@z3ntu.xyz> <Ye+BIkvoQF7/qy9N@yekko>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1643135778; bh=4FLKv3exwuIchV0gkEkhr6mvTSZtJAbkhKIr+jSi+bM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=iGKXKy5fmTehGmCAKLIbKow8nv7J38optnSFSzWXj9kFV9z7lcB4UZx5t2mBHP4GD
         gtbmDW5Qp5eI2LghmRQuBiuu3M4ziO0BlnrXf/mFaWdH7LifKD/tRF5UnB8RBANotf
         UGAzytpVetipyocvFnoPjuZibABwXK0X91oihLwk=
In-Reply-To: <Ye+BIkvoQF7/qy9N@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi David,

On Dienstag, 25. J=E4nner 2022 05:48:34 CET David Gibson wrote:
> On Sat, Jan 22, 2022 at 11:56:54AM +0100, Luca Weiss wrote:
> > Add a new Python method wrapping fdt_get_path() from the C API.
> >=20
> > Also add a test for the new method.
> >=20
> > Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> > ---
> > Changes in v2:
> > - dynamically increase size of string buffer until it fits.
> >=20
> >   The values are chosen relatively arbitrary, and terminates at lengths
> >   over than 4096 as I don't expect paths to be longer and there should
> >   be an exit condition to not eat up RAM in case of some bug.
> > =20
> >  pylibfdt/libfdt.i       | 27 +++++++++++++++++++++++++++
> >  tests/pylibfdt_tests.py |  7 +++++++
> >  2 files changed, 34 insertions(+)
> >=20
> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > index ac70762..d103bb6 100644
> > --- a/pylibfdt/libfdt.i
> > +++ b/pylibfdt/libfdt.i
> >=20
> > @@ -443,6 +443,28 @@ class FdtRo(object):
> >          """
> >          return fdt_get_alias(self._fdt, name)
> >=20
> > +    def get_path(self, nodeoffset):
> > +        """Get the full path of a node
> > +
> > +        Args:
> > +            nodeoffset: Node offset to check
> > +
> > +        Returns:
> > +            Full path to the node
> > +
> > +        Raises:
> > +            FdtException if the path is longer than 'size' or other er=
ror
> > occurs +        """
> > +        size =3D 64
> > +        while size < 4096:
> > +            ret, path =3D fdt_get_path(self._fdt, nodeoffset, size)
> > +            if ret =3D=3D -NOSPACE:
> > +                size +=3D 64
> > +                continue
> > +            check_err(ret)
> > +            return path
> > +        raise ValueError('Node path is unexpectedly long')
>=20
> Ah... sorry, this isn't quite what I had in mind.  The idea of
> resizing the buffer is to avoid having an arbitrary limit, but you
> still have the 4096 byte arbitrary limit here.  As Simon suggests, 4k
> would probably be a good *starting* point, rather than an ending
> point.  Not only are repeated calls expensive in Python, but
> fdt_get_path() itself is also quite expensive, since it needs to scan
> the dtb from the start.  I'd also suggest doubling the buffer size on
> each attempt, rather than increasing linearly.

I do think that there should be a limit *somewhere* instead of hitting OOM =
if=20
there would be some bug in the underlying implementation or the file provid=
ed?=20
I'm fine with limiting it at 100MB or whatever but I would rather have a li=
mit=20
there than not have it.

Once this is clarified I'll make a v3 of this patch.

Regards
Luca

>=20
> >      def parent_offset(self, nodeoffset, quiet=3D()):
> >          """Get the offset of a node's parent
> >=20
> > @@ -1115,6 +1137,11 @@ typedef uint32_t fdt32_t;
> >=20
> >          }
> > =20
> >  }
> >=20
> > +%include "cstring.i"
> > +
> > +%cstring_output_maxsize(char *buf, int buflen);
> > +int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int bufle=
n);
> > +
> >=20
> >  /* We have both struct fdt_property and a function fdt_property() */
> >  %warnfilter(302) fdt_property;
> >=20
> > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > index 5479363..2335a73 100644
> > --- a/tests/pylibfdt_tests.py
> > +++ b/tests/pylibfdt_tests.py
> >=20
> > @@ -348,6 +348,13 @@ class PyLibfdtBasicTests(unittest.TestCase):
> >          self.assertEqual("/subnode@1/subsubnode",
> >          self.fdt3.get_alias('ss1'))
> >          self.assertEqual("/subnode@1/subsubnode/subsubsubnode",
> >          self.fdt3.get_alias('sss1'))>=20
> > +    def testGetPath(self):
> > +        """Test for the get_path() method"""
> > +        node =3D self.fdt.path_offset('/subnode@1')
> > +        node2 =3D self.fdt.path_offset('/subnode@1/subsubnode')
> > +        self.assertEqual("/subnode@1", self.fdt.get_path(node))
> > +        self.assertEqual("/subnode@1/subsubnode",
> > self.fdt.get_path(node2)) +
> >=20
> >      def testParentOffset(self):
> >          """Test for the parent_offset() method"""
> >          self.assertEqual(-libfdt.NOTFOUND,




