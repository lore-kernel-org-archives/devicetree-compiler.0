From: "Marcus Comstedt" <marcus-S4ne242Fi5M@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove superfluous NUL character from overlay symbols
Date: Mon, 25 May 2020 08:53:30 +0200
Message-ID: <yf97dx0mro5.fsf@mc.pp.se>
References: <20200523151239.8849-1-marcus@mc.pp.se>
        <20200525051555.GE23110@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mc.pp.se; s=hedgehog;
        t=1590389611; bh=/bkK4bVNGn3xDFaYODRrC+/JiDS06SGLGolXmpsBHis=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
         MIME-Version:Content-Type; b=m80XtkU+zcfEsxh+mgt7vhmgnyA29aTrXfnBO
        wWxk2F2NABf9oyHWtAqGxa3qoyftbyihjNC2KIA/1cEOtKGGFp799t4CzKfYjsgLmAO
        ZVmgX8zbj4khffI3LHfKBFJrJfj+LkVh5gWu9P9brOqb15Eb8Qvj+EMRctz38ZqRdGE
        =
In-Reply-To: <20200525051555.GE23110-K0bRW+63XPQe6aEkudXLsA@public.gmane.org> (david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org's message of "Mon, 25 May 2020 15:15:55 +1000")
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


Hi David,

David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> writes:

> This patch causes "make check" failures.

Ah.  This patch was for U-Boot, and Simon asked me to upstream it, but
I see now that in your repo you already have another fix (d9c55f85)
for the same issue.  Then applying my fix makes no sense for you of
course.  Sorry about that.


  // Marcus


