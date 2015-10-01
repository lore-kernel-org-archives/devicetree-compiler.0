From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v5 1/2] dtc: dts source location annotation
Date: Wed, 30 Sep 2015 20:36:54 -0700
Message-ID: <560CAA56.3050402@gmail.com>
References: <560CA87E.1010103@gmail.com> <560CA9FB.6050700@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=v4z6vXuifM0a3bOeNhVX6R1D2G8KZuTJAee77UO4ojs=;
        b=fFcJpWOIJjxQv0tIqrEEVFfZP1Rs53Me+vZCRKXIXptqJlF1ZORQMUc/rIWxWxFe/S
         9uF9OTupZfNistMbXboq94BKWkX5tgCiwrOU52p8IvVZb77F1fhmdH20xeSGpNHKqavQ
         8pZuk8mU8AUO2PGv5dz9Kf0F6GEJ3TSoW2riVrAYhhJZc6rR1fGfk89iTzj0zLv6LCbY
         eCiFN2ZqTm43vKVPZVwCj8Bj4cM0L4EOSOwyc7f43Ea/Acw7n3dl6U61lMcUQje2r1mg
         2GY4uTKTHO3wDsbesrm2OnU1GacjbmTwW7uoZzk70exN+mUWU60uKvj/buX5ZFu42D0C
         GN2g==
In-Reply-To: <560CA9FB.6050700-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 9/30/2015 8:35 PM, Frank Rowand wrote:
> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> 
> Proof of concept patch.
> 
> Annotates input source file and line number of nodes and properties
> as comments in output .dts file when --annotate flag is supplied.

< snip >

Sorry, bad subject.  Patch 2/2, not 1/2.

-Frank
