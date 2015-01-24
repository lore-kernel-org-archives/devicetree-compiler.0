From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: DTC: appending / concatenating to a path reference
Date: Fri, 23 Jan 2015 16:28:43 -0800
Message-ID: <20150124002843.GV9759@ld-irv-0074>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:mime-version:content-type
         :content-disposition:user-agent;
        bh=wu0RdgFXN5gr/P9/1fmCLJml+seNFVMI227MYEPMLWk=;
        b=lC4IeqA2W1OgPleKzPwDl2WA9y/7M9NeVP4YLHA7H43RA+IWCQo2qqm4v49BJoarA6
         soc3EXQj7jMTQlronP6qOQhxx2iLWigUUe55sDvZ46mzaUgg8vzzBXiHUJvSzzDowS+8
         hgeehFAGuKD7ky1OvE5D5qdF9Ad4uO0h1n4aP65m28H1Btygr3KXFEgXDmfGyCxplgWp
         FMx3fkTSRQC5jv9OFCMdE0P+gZKXHVq3UjR/ysEbZS7dH6rAJV6Ru7vor0g8wZQnaeif
         rLtCXP8FZ+CiDWZ3BmmXIqr/YOEFeaDPA7095Ti1gSKMGchLUiuvTFRYRI4z0+O5oyeA
         Cj0Q==
Content-Disposition: inline
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Hi DT folks,

In taking a look at the /chosen/stdout-path (and
/chosen/linux,stdout-path) properties described in ePAPR and in
Documentation/devicetree/bindings/chosen.txt, I see that one can use a
path name reference, followed by a colon (':') and an options string to
add options to a particular console. e.g.:

/ {
	serial@f000 {
		...
	};

	chosen {
		stdout-path = "/serial@f000:115200";
	};
}

When there are no options to append, DTS syntax can easily handle this
for you with the '&' operator, to automatically generate a path name:

/ {
	uart: serial@f000 {
		...
	};

	chosen {
		stdout-path = &uart;
	};
};

However, it appears the device tree compiler provides no syntax for
concatenating anything to a path. I see there was an RFC patch set for
more general expression support [1], though it doesn't handle everything
I'd like. For instance, with the proposed syntax, I could imagine doing
this:

/ {
	uart: serial@f000 {
		...
	};

	chosen {
		stdout-path = &uart + ":115200";
	};
};

though that patch set doesn't handle this.

Thoughts? What's the status with DTS language extensions like [1]?

Regards,
Brian

[1] http://thread.gmane.org/gmane.comp.devicetree.compiler/3/
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
