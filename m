From: Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Subject: Re: fuzzing dtc with AFL
Date: Mon, 4 Jan 2016 23:04:56 +1100
Message-ID: <20160104230456.491201d2@kryten>
References: <20160103023247.2d04c28a@kryten>
	<20160103092848.GE9329@voom.BigPond>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; s=42627210;
	h=Message-ID:Cc:To:From:Date; bh=bVFZXkEmZSGMiSCHdvbcfbo6Jrtl4fMrucc9elztWic=;
	b=CnOdhQIg5JJ/dQov93B9zJ8PkQTTyylzxMZgLgXmlIkrJuZ6RH1y6oOaiHQLgOrmynJCNW15VMZQSw/lTfifz7MUHQKz1ouMXkJrAqW7RsqmXjhc5tjrKUNiWWUOFbjxtl/UUhipU6mKaTuE3gMTxfprC6wkwO0MUM3l8Qbv/p8=;
In-Reply-To: <20160103092848.GE9329-JFWYtBTiNpwvqAi9XkHEEA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi David,

> What's AFL?

http://lcamtuf.coredump.cx/afl/

> Nice catches all.  I'll try to debug these in detail soon.

Thanks!

Anton
