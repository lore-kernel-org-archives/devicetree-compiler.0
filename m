From: Andre Przywara <andre-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 3/3] allow a second parameter to be the output file name
Date: Wed, 1 Jul 2015 00:15:58 +0100
Message-ID: <20150701001558.5c448c72@slackpad.lan>
References: <1432595483-26153-1-git-send-email-osp@andrep.de>
	<1432595483-26153-4-git-send-email-osp@andrep.de>
	<20150630051119.GK26353@voom.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150630051119.GK26353-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, 30 Jun 2015 15:11:19 +1000
David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:

Hi David,

> On Tue, May 26, 2015 at 12:11:23AM +0100, Andre Przywara wrote:
> > If there is more than one file name specified on the command line,
> > assume it is the output file name.
> > This allows to use a more intuitive cp-style command line syntax,
> > which (together with the input type guessing) allows something like:
> > $ dtc input.dts output.dtb
> > (or the other way round) to cover the most common usage scenarios.
> > 
> > Signed-off-by: Andre Przywara <osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
> 
> Nack to this, sorry.
> 
> I'd prefer to model our command line on other compilers, and -o is a
> more common convention there.

Fair enough, I will drop this patch then.
Seems like: "dtc input.dts > output.dtb"  will do the trick, too and
it's just two characters more to type ;-)

> 
> I would however, accept a patch to guess an output name based on input
> name if -o is not specified, allowing the output name to be omitted
> entirely in common cases.

I'd rather keep the stdout behaviour in this case, I find writing to
unspecified filenames quite scary.

Cheers,
Andre.
