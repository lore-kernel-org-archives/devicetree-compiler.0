From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 0/6] libfdt: Fix signed/unsigned comparison warnings
Date: Fri, 2 Oct 2020 15:43:11 +0100
Message-ID: <c4739c17-5160-3fe2-0ec5-b667811e0ac1@arm.com>
References: <20201001164630.4980-1-andre.przywara@arm.com>
 <20201002010324.GH1844@yekko.fritz.box>
 <316e6e0f-e15e-89ee-3008-d2ed038ffd79@arm.com>
 <20201002123209.GA442245@yekko.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20201002123209.GA442245-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
Content-Language: en-GB
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On 02/10/2020 13:32, David Gibson wrote:
> On Fri, Oct 02, 2020 at 10:25:09AM +0100, Andr=E9 Przywara wrote:
>> On 02/10/2020 02:03, David Gibson wrote:
>>
>> Hi David,
>>
>>> On Thu, Oct 01, 2020 at 05:46:24PM +0100, Andre Przywara wrote:
>>>> Those are the six remaining patches of the initial post to fix the
>>>> C comparison warnings.
>>>> I reworked the fixes according to David's comments, and took quite a
>>>> different approach for some of them.
>>>> Changelog below.
>>>>
>>>> The series is against https://github.com/dgibson/dtc/commits/main
>>>> ------------------------------------
>>>>
>>>> When libfdt is compiled with -Wsign-compare or -Wextra, GCC emits quite
>>>> some warnings about the signedness of the operands not matching:
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> libfdt/fdt.c:140:18: error: comparison between signed and unsigned int=
eger expressions [-Werror=3Dsign-compare]
>>>>    if ((absoffset < offset)
>>>> .....
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>
>>>> This does not occur under normal conditions in the dtc repo, but might
>>>> show up when libfdt is embedded in another project. There have been re=
ports
>>>> from U-Boot and Trusted-Firmware-A.
>>>>
>>>> The underlying issue is mostly due to C's promotion behaviour (ANSI C
>>>> section 6.1.3.8) when dealing with operands of different signedness
>>>> (but same size): Signed values get implictly casted to unsigned, which
>>>> is not typically what we want if they could have been negative.
>>>>
>>>> The Internet(TM) suggests that blindly applying casts is probably doing
>>>> more harm than it helps, so this series tries to fix the underlying
>>>> issues properly.
>>>> In libfdt, some types are somewhat suboptimal ("int bufsize" comes to =
mind);
>>>> some signed types are due to them being returned along wih error value=
s in
>>>> other functions (node offsets).
>>>> So these fixes here have been based on the following assumptions:
>>>> - We cannot change the prototype of exported functions.
>>>> - It's better to change types (for local variables) than to cast.
>>>> - If we have established that a signed value is not negative, we can s=
afely
>>>>   cast it to an unsigned type.
>>>>
>>>> I split up the fixes in small chunks, to make them easier to review.
>>>>
>>>> This is only covering libfdt for now (which is what those other projec=
ts
>>>> care about). There are more issues with dtc, but they can be addressed
>>>> later.
>>>>
>>>> Please have a look, happy to discuss the invididual cases.
>>>
>>> Thanks again for this work.  I've applied all the remaining patches,
>>> although I have some comments for some followups I think would be
>>> good.
>>
>> Thanks, that's much appreciated! Happy to discuss any further comments.
>>
>>> At this point can we turn on -Wsign-compare by default?  That sounds
>>> like a good idea to stop these problems creeping back in.
>>
>> Not quite yet: the patches were only covering "make libfdt". I see more
>> reports for dtc and the tests. I should probably address those as long
>> as this is still in my "L1 cache" ...
>> Unless you want to turn on -Wsign-compare just for libfdt.
>=20
> If you think you can get us there for the whole project reasonably
> soon, then wait for that.  If it looks like you might need to shelve
> this for a while, then it would be good to get it enabled for just
> libfdt.

So I have "make tests" covered now, that looks mostly reasonable.
The rest is more nasty, I needed to paper over a few of them to make
some progress. But "make all check" comes out clean now.

I will try to make reasonable patches out this mess next week.

Cheers,
Andre
