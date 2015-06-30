From: Andre Przywara <osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/3] guess input file format based on file content or
 file name
Date: Wed, 1 Jul 2015 00:21:35 +0100
Message-ID: <20150701002135.53a3811a@slackpad.lan>
References: <1432595483-26153-1-git-send-email-osp@andrep.de>
	<1432595483-26153-2-git-send-email-osp@andrep.de>
	<20150630050749.GJ26353@voom.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150630050749.GJ26353-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, 30 Jun 2015 15:07:49 +1000
David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:

Hi David,

> On Tue, May 26, 2015 at 12:11:21AM +0100, Andre Przywara wrote:
> > Always being required to specify the input file format can be quite
> > annoying, especially since a dtb is easily detected by its magic.
> > Also a dts can be guessed mostly by starting with a '/' character.
> > Looking at the file name extension also sounds useful as a hint.
> > 
> > Add heuristic file type guessing of the input file format in case
> > none has been specified on the command line.
> > The heuristics are as follows (in that order):
> > - Any issues with opening as a regular file lead to file name based
> > guessing: if the filename ends with .dts or .DTS, device tree source
> > text is assumed, .dtb or .DTB hint at a device tree blob.
> > - A directory will be treated as the /proc/device-tree type.
> > - If the first 4 bytes are the DTB magic, assume "dtb".
> > - If the first character is a '/', assume "dts".
> > 
> > For the majority of practical use cases this gets rid of the tedious
> > -I specification on the command line and simplifies actual typing of
> > dtc command lines.
> > Any explicit specification of the input type by using -I still
> > avoids any guessing, which resembles the current behaviour.
> > 
> > Signed-off-by: Andre Przywara <osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
> 
> Sorry I've taken so long to reply to this.

No worries, and thanks for taking a look!

> Making decisions based on file extension makes be a little
> uncomfortable so it's taken me a while to convince myself about this.
> On balance, I think it's ok (since it can always be overridden).
> 
> However, there's a few details I'd like to see changed before
> applying.

Thanks, those sound reasonable. I used that extra leap second to address
all your comments ;-)
In case of any error we will now drop back to the current default
behaviour, also I omitted the admittedly dodgy .dts guess based on the
first character being a '/'.
Will send out a v2 shortly.

Cheers,
Andre.


> 
> 
> > ---
> >  dtc.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 53 insertions(+), 1 deletion(-)
> > 
> > diff --git a/dtc.c b/dtc.c
> > index 8c4add6..cda563d 100644
> > --- a/dtc.c
> > +++ b/dtc.c
> > @@ -18,6 +18,8 @@
> >   *
> > USA */
> >  
> > +#include <sys/stat.h>
> > +
> >  #include "dtc.h"
> >  #include "srcpos.h"
> >  
> > @@ -104,10 +106,58 @@ static const char * const usage_opts_help[] =
> > { NULL,
> >  };
> >  
> > +static const char *guess_type_by_name(const char *fname, const
> > char *fallback) +{
> > +	const char *s;
> > +
> > +	s = strrchr(fname, '.');
> > +	if (s == NULL)
> > +		return fallback;
> > +	if (!strcmp(s, ".dts") || !strcmp(s, ".DTS"))
> > +		return "dts";
> 
> Please use strcasecmp() instead of explicitly checking "dts" and
> "DTS".  On a case-insensitive system, it's not implausible that you
> could end up with ".Dts" or something.
> 
> > +	if (!strcmp(s, ".dtb") || !strcmp(s, ".DTB"))
> > +		return "dtb";
> > +	return fallback;
> > +}
> > +
> > +static const char *guess_input_format(const char *fname, const
> > char *fallback) +{
> > +	struct stat statbuf;
> > +	uint32_t magic;
> > +	FILE *f;
> > +
> > +	if (stat(fname, &statbuf))
> > +		return guess_type_by_name(fname, fallback);
> 
> First, please use an explicit != 0 here - it took me several reads
> before I realised this was checking for a stat() failure.
> 
> I'd prefer not to guess if stat() fails - something is weird is going
> on and I think it's better to force the user to specify explicitly in
> this case.  The most likely case is that the user has specified the
> wrong file name entirely here, so guessing by name isn't particularly
> helpful.
> 
> > +	if (S_ISDIR(statbuf.st_mode))
> > +		return "fs";
> > +	if (!S_ISREG(statbuf.st_mode))
> > +		return guess_type_by_name(fname, fallback);
> 
> Again, a non-regular file is a weird case, where I think we're better
> off not guessing at all.
> 
> > +	f = fopen(fname, "r");
> > +	if (f == NULL)
> > +		return guess_type_by_name(fname, fallback);
> > +	if (fread(&magic, 4, 1, f) != 1) {
> > +		fclose(f);
> > +		return guess_type_by_name(fname, fallback);
> > +	}
> > +	fclose(f);
> > +
> > +	magic = fdt32_to_cpu(magic);
> > +	if (magic == FDT_MAGIC)
> > +		return "dtb";
> > +
> > +	if (magic >> 24 == '/')
> > +		return "dts";
> 
> This test is right in practice (because FDT is big-endian) but
> misleading.  Since the relevant point is that the / is the very first
> character - it's not a numerical value - check that directly rather
> than looking at a possible byteswapped value.
> 
> Although.. this test is very weak anyway - a dts file could very
> likely have whitespace or comments before the /dts-v1/ tag anyway.  I
> don't think it's worth the bother.
> 
> > +
> > +	return guess_type_by_name(fname, fallback);
> > +}
> > +
> >  int main(int argc, char *argv[])
> >  {
> >  	struct boot_info *bi;
> > -	const char *inform = "dts";
> > +	const char *inform = NULL;
> >  	const char *outform = "dts";
> >  	const char *outname = "-";
> >  	const char *depname = NULL;
> > @@ -213,6 +263,8 @@ int main(int argc, char *argv[])
> >  		fprintf(depfile, "%s:", outname);
> >  	}
> >  
> > +	if (inform == NULL)
> > +		inform = guess_input_format(arg, "dts");
> >  	if (streq(inform, "dts"))
> >  		bi = dt_from_source(arg);
> >  	else if (streq(inform, "fs"))
> 
