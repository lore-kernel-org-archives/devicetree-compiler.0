From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RESEND PATCH v3 1/3] libfdt: Add function to find regions in an FDT
Date: Wed, 6 May 2015 19:08:09 -0600
Message-ID: <CAPnjgZ08FnFd2xXCYdmYtMo38Hqfyc4jfuwHvT=zDkXxMwCpVw@mail.gmail.com>
References: <1395500836-12735-1-git-send-email-sjg@chromium.org>
	<1395500836-12735-2-git-send-email-sjg@chromium.org>
	<CAPnjgZ0ehgSd1WprpMd1ZY=LaZaKkBG3MaNPV5ja27Q2p12WvA@mail.gmail.com>
	<20140502054014.GF6035@voom.redhat.com>
	<CAPnjgZ2OHco3GjH_rPC+7Fu36QqBK2_sWvcaF1WOWFpBNkZTcQ@mail.gmail.com>
	<20140605141236.GA25412@voom.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=AnDoDfoBkkIA1JCw8FVISkRJUfSdc6O6hnf4mqRpzxM=;
        b=LyLnnNtJ3Ap8d+ePLHQkhHEwqYSw8uN2Pdfry/QXGTcAEWlTvqqPyxAwj/LOb8Sugw
         uQ4CjcRXJdSRnlLotqCC9IhXwhPelxG8INHNYZwHoHCrANVdW5T5/TsIGJNI+RSa4q1j
         Q1FoaktqK57+rMWYzqxg6Vgl1JMmny6ZpRP3Q8mU26V+ep5X/RXg7xB1U5sihHfHeIrq
         xEkBHzScm/eM3tG2d+c7eQaVwKt61b+NmI+u8A8rjnij46oCHI+ay+upKJMOC0MCYmrn
         SWL0mMueq/7hi/K6Gw7xZ2J3SR944RDfuWcb0eZ6n6XAR9MbRYGaxcbJya5gO5Clq5BD
         1/DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=AnDoDfoBkkIA1JCw8FVISkRJUfSdc6O6hnf4mqRpzxM=;
        b=dwkOLQTlPcHcgjxmtov6tkaInPLb7tK7eS3sIQyYUU/Fe20wlGKB6ymFZsgdMq7TmK
         /2R8fTy981a64ZKt9oHWoi5QaVh43f1eHUByX4RGqRMwCLdqE8oW/ceE216feBFLcr69
         uYJvd7ctB03AK8oGbv/ukaZnCFbH7J6MtBTIQ=
In-Reply-To: <20140605141236.GA25412-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>

Hi David,

On 5 June 2014 at 08:12, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Mon, Jun 02, 2014 at 09:12:55PM -0600, Simon Glass wrote:
> > Hi David,
> >
> > On 1 May 2014 23:40, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > On Thu, May 01, 2014 at 09:13:51AM -0700, Simon Glass wrote:
> > >> Hi,
> > >>
> > >> On 22 March 2014 08:07, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > >> > Given a set of nodes and properties, find the regions of the device tree
> > >> > which describe those parts.
> > >> >
> > >> > A test is provided which builds a tree while tracking where the regions
> > >> > should be, then calls fdt_first/next_region() to make sure that it agrees.
> > >> >
> > >> > Further tests will come as part of fdtgrep.
> > >> >
> > >> > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > >>
> > >> Have I sent this to the right place? Any comments?
> > >
> > > Sorry.  I know you've resent this several times, and I've been
> > > procrastinating about it since forever.
> > >
> > > Basically, I'm just not convinced.  For all your efforts to explain
> > > the rationale, it just seems like a really ad-hoc set of flags and
> > > conditions that doesn't seem to form a coherent whole.
> >
> > Are you referring to fdtgrep or the new library function? I'd be happy
> > enough getting the library function to start with in if there isn't
> > much need for the grep utility.
>
> The library function primarily.
>
> > > From the lack of other responses, I'm assuming there's not really
> > > anyone else who sees it as a compelling feature either.
> >
> > Is there normally a lot of mailing list traffic for new libfdt
> > features? This is used for verified boot in U-Boot for example.
>
> Hm, that's true I guess.

I'd like to dredge this up again.

I'm currently working on adding device tree support in U-Boot SPL (the
tiny loader that loads U-Boot). U-Boot currently uses device tree for
normal operation, but since SPL can run in very small RAM sizes there
is often not enough space for a full (~40KB) device tree. In fact
often all that is needed is the UART and perhaps SPI/I2C. This is
<1KB.

There seem to be a several options here:

1. Create a separate device tree file for each board, just for SPL,
with just what is needed to boot SPL
2. Use #ifdef and the preprocessor to remove what is not needed, and
run dtc twice with different #defines
3. Use fdtgrep to chop down the device tree file by removing unwanted nodes

I think that option 3 is the best. It avoids copying source code, or
littering it with #ifdef.

If necessary I suppose this tool could just live in U-Boot but that
seems a shame. I understand that fdtgrep perhaps has too many options
for your liking. Is there some subset that you think would be worthy
of including as a new device-tree-compiler tool?

If so, then I would rather create fdtgrep (or fdtprune or whatever)
there than add a special tool to U-Boot.

Please let me know what you think.

Regards,
Simon
