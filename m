From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 2/5] Add tests for pylibfdt
Date: Tue, 21 Feb 2017 21:33:01 -0700
Message-ID: <CAPnjgZ2v=oQTnYFEwucuCsUN1tQGx3zQfpHBZ1gRzpyZW8_g-g@mail.gmail.com>
References: <20170215035200.29934-1-sjg@chromium.org> <20170215035200.29934-3-sjg@chromium.org>
 <20170215054423.GJ12369@umbus.fritz.box> <CAPnjgZ3wEUUEx6-XiKJ5kns-tA9HdKonXULdBYcXAkyEbHaztg@mail.gmail.com>
 <20170220034229.GA27524@umbus> <CAPnjgZ3CSwq7mG+fVdOjx2BSKZF1hK2UY4t6OCy_qYYAC-p42A@mail.gmail.com>
 <20170222021142.GF12577@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=qwHD/iVmWFNZII3C0gPt+AsVELG/1AIZDjl58iVYLIA=;
        b=caCoYQgp3hDhFDDDDT8ctWGjanJMcsovSqtWAkmUg5m2mepAMbb9bNZlMydu763UnF
         7+S3Cd0mjkGmF2THrbr6LqN5xlVqmVCq325Ud/NBTvbiVHnE2haAVNWcU5+c8oQd6i5F
         mbDZxWksYiHMR7PJDNfvz/j7vLmwUdZrX/Yb3CUL+r0w6zMZan7/7tpaC4qYGe9gxDuS
         87n0TTCzlXXubwvrvCctukpPsvtI0dspAbONGu5kQ6vAp3XDcv9JLWp1RQ9T30+M3aKr
         dH7ChehmAd6GZFzsk/3z+FCbps1aw/1BR+P/LNKN2/4pvPmZ/nbtI+jDjhG9qA2j1gw6
         Z+lA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=qwHD/iVmWFNZII3C0gPt+AsVELG/1AIZDjl58iVYLIA=;
        b=BvRMvdVpa7IZWdwusdxGFeSUx4b/Kv21WLrPwdmf+oFXCxuokNVm/lJulJqsSCd6bZ
         Fxuuw22CgAfSodjBPvblf9NKFrif/prhUlFqtcSu3Owj/YB0ZbO1moCKzVOdTEXkQ7h/
         2ixEte1qsPxagPhKKJowSnhW6v0xcZLJqNIME=
In-Reply-To: <20170222021142.GF12577-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>

Hi David,

On 21 February 2017 at 19:11, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Feb 21, 2017 at 11:08:11AM -0700, Simon Glass wrote:
>> Hi David,
>>
>> On 19 February 2017 at 20:42, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > On Thu, Feb 16, 2017 at 09:48:28PM -0700, Simon Glass wrote:
>> >> Hi David,
>> >>
>> >> On 14 February 2017 at 22:44, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> >> > On Tue, Feb 14, 2017 at 08:51:57PM -0700, Simon Glass wrote:
>> >> >> Add a set of tests to cover the functionality in pylibfdt.
>> >> >>
>> >> >> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> >> >> ---
>> >> >>
>> >> >> Changes in v5:
>> >> >> - Adjust tests to match new swig bindings
>> >> >>
>> >> >> Changes in v4:
>> >> >> - Drop tests that are no-longer applicable
>> >> >> - Add a get for getprop()
>> >> >>
>> >> >> Changes in v3:
>> >> >> - Add some more tests
>> >> >>
>> >> >> Changes in v2:
>> >> >> - Update tests for new pylibfdt
>> >> >> - Add a few more tests to increase coverage
>> >> >>
>> >> >>  tests/pylibfdt_tests.py | 267 ++++++++++++++++++++++++++++++++++++++++++++++++
>> >> >>  tests/run_tests.sh      |  19 +++-
>> >> >>  2 files changed, 285 insertions(+), 1 deletion(-)
>> >> >>  create mode 100644 tests/pylibfdt_tests.py
>> >> >>
>> >>
>> >> [..]
>> >>
>> >> >> +    def testPathOffset(self):
>> >> >> +        """Check that we can find the offset of a node"""
>> >> >> +        self.assertEquals(self.fdt.path_offset('/'), 0)
>> >> >> +        self.assertEquals(self.fdt.path_offset('/subnode@1'), 124)
>> >> >
>> >> > This test is potentially fragile.  Eventually it would be nice to be
>> >> > able to run the Python tests expecting test_tree1 on any of the copies
>> >> > of test_tree1 we generate.  Those are required to be semantically
>> >> > identicaly (including node/property order) to test_tree1.dtb.
>> >> > However, some versions won't preserve exact offsets - for example
>> >> > there's a sequence of tests where we insert additional nops in the
>> >> > encoding to test handling of that.  That's why tests/path_offset.c,
>> >> > for example, checks the behaviour of path_offset() against
>> >> > subnode_offset() and knowing what property and node names are supposed
>> >> > to be present, rather than against explicit known offsets.I'm
>> >>
>> >> Yes it is fragile, will check it's >0 which should be safe.
>> >
>> > Ok.
>> >
>> >> Re the tests, I feel we should try to avoid testing all the same
>> >> things as the C code, when we could just test the interface. But it
>> >> might be easier just to duplicate the tests you as say.
>> >
>> > I think so.  The set of tree1 tests is a good model, because it's
>> > already a reasonably thorough test model of the basic libfdt
>> > interfaces.
>> >
>> >> >
>> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.NOTFOUND)):
>> >> >> +            self.fdt.path_offset('/wibble')
>> >> >> +        self.assertEquals(self.fdt.path_offset('/wibble', QUIET_NOTFOUND),
>> >> >> +                          -libfdt.NOTFOUND)
>> >> >> +
>> >> >> +    def testPropertyOffset(self):
>> >> >> +        """Walk through all the properties in the root node"""
>> >> >> +        self.assertEquals(self.fdt.first_property_offset(0), ROOT_PROPS[0])
>> >> >> +        for pos in range(len(ROOT_PROPS) - 1):
>> >> >> +            self.assertEquals(self.fdt.next_property_offset(ROOT_PROPS[pos]),
>> >> >> +                              ROOT_PROPS[pos + 1])
>> >> >> +        self.assertEquals(self.fdt.next_property_offset(ROOT_PROPS[-1],
>> >> >> +                                                        QUIET_NOTFOUND),
>> >> >> +                          -libfdt.NOTFOUND)
>> >> >> +
>> >> >> +    def testPropertyOffsetExceptions(self):
>> >> >> +        """Check that exceptions are raised as expected"""
>> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.NOTFOUND)):
>> >> >> +            self.fdt.next_property_offset(108)
>> >> >
>> >> > Same issue here.
>> >>
>> >> OK, I can just drop this one.
>> >>
>> >> >
>> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFFSET)):
>> >> >> +            self.fdt.next_property_offset(107)
>> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFFSET)):
>> >> >> +            self.fdt.first_property_offset(107, QUIET_NOTFOUND)
>> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFFSET)):
>> >> >> +            self.fdt.next_property_offset(107, QUIET_NOTFOUND)
>> >> >> +
>> >> >> +        node = self.fdt.path_offset('/subnode@1/ss1')
>> >> >> +        self.assertEquals(self.fdt.first_property_offset(node, QUIET_NOTFOUND),
>> >> >> +                          -libfdt.NOTFOUND)
>> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.NOTFOUND)):
>> >> >> +            self.fdt.first_property_offset(node)
>> >> >> +
>> >> >> +    def testGetName(self):
>> >> >> +        """Check that we can get the name of a node"""
>> >> >> +        self.assertEquals(self.fdt.get_name(0), '')
>> >> >> +        node = self.fdt.path_offset('/subnode@1/subsubnode')
>> >> >> +        self.assertEquals(self.fdt.get_name(node), 'subsubnode')
>> >> >> +
>> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFFSET)):
>> >> >> +            self.fdt.get_name(-2)
>> >> >> +
>> >> >> +    def testGetPropertyByOffset(self):
>> >> >> +        """Check that we can read the name and contents of a property"""
>> >> >> +        root = self.fdt.path_offset('/')
>> >> >
>> >> > No point to this - offset of / is always 0.  If you want to test that
>> >> > happens, make it a separate testcase.
>> >>
>> >> I already have it above so will drop this.
>> >>
>> >> >
>> >> >> +        poffset = self.fdt.first_property_offset(root)
>> >> >> +        prop = self.fdt.get_property_by_offset(poffset)
>> >> >> +        self.assertEquals(prop.name, 'compatible')
>> >> >> +        self.assertEquals(prop.value, 'test_tree1\0')
>> >> >> +
>> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFFSET)):
>> >> >> +            self.fdt.get_property_by_offset(-2)
>> >> >> +        self.assertEquals(
>> >> >> +                -libfdt.BADOFFSET,
>> >> >> +                self.fdt.get_property_by_offset(-2, [libfdt.BADOFFSET]))
>> >> >> +
>> >> >> +    def testGetProp(self):
>> >> >> +        """Check that we can read the contents of a property by name"""
>> >> >> +        root = self.fdt.path_offset('/')
>> >> >> +        value = self.fdt.getprop(root, "compatible")
>> >> >> +        self.assertEquals(value, 'test_tree1\0')
>> >> >> +        self.assertEquals(-libfdt.NOTFOUND, self.fdt.getprop(root, 'missing',
>> >> >> +                                                             QUIET_NOTFOUND))
>> >> >
>> >> > For testing, it might be useful to add a special value you can set the
>> >> > quiet parameter to to make all errors quiet.
>> >>
>> >> Isn't that what I did?
>> >
>> > Sorry, I wasn't very clear.  What I mean is that if you want to treat
>> > *all* errors as quiet, at the moment you have to do
>> >         self.whatever(..., quiet=[NOTFOUND, EXISTS, NOSPACE,...])
>> >
>> > I was suggesting an extension to check_err() so you can instead say
>> > 'quiet=SOMETHING' where SOMETHING is a special value, and it will
>> > interpret that as making all errors quiet.
>>
>> OK I see. Could SOMETHING be
>>
>> QUIET_ALL = [NOTFOUND, EXISTS, all other errors]
>>
>> or are you wanting to take the dynamic typing further and use an
>> integer or something?
>
> I was thinking of exploiting the dynamic typing (probably using a
> special value, not an int, maybe 'True').  But really, either would be
> fine.

Well I'll go with the tuple for consistency (i.e. to avoid a special
case). It's an internal detail so we can always change if it feels
wrong.

Regards,
Simon
