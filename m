From: Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Subject: fuzzing dtc with AFL
Date: Sun, 3 Jan 2016 02:32:47 +1100
Message-ID: <20160103023247.2d04c28a@kryten>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/nMIwrK1ZxOvthpMnP+rTlr4"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; s=42627210;
	h=Message-ID:Cc:To:From:Date; bh=D70tQPnGTH3PhUH5S4eykIV+TVVd4vZvLCDcKicZWK0=;
	b=Hx2CSbpVwmDvfNNeWNcADfzA7ETFTS1AOl0o6BP8qpA/LmN8ZcSe2ZeIBEWfszynBL976S66y26j/Z7cWH4D+603HAwLSfbk2uZPCgXqozTVxGaDJJCAp9kAJXEIKT+S9QJk2se8jZaxhrIfdkfSZHARnuGKs3GwY0VxYGoBZ9I=;
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

--MP_/nMIwrK1ZxOvthpMnP+rTlr4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi David,

I wanted something to test AFL with, and since dtc is simple, self
contained and checked out on my laptop, I attacked it. It found a
number of interesting testcases:

A divide by zero issue:

# ./dtc test1.dts 
Floating point exception

An issue parsing octals:

# ./dtc test2.dts 
dtc: dtc-lexer.l:156: yylex: Assertion `!(*e) || !e[strspn(e, "UL")]'
failed.
Aborted

An issue with null escape characters:

# ./dtc test3.dts 
dtc: util.c:155: get_escape_char: Assertion `c' failed.
Aborted

and a SEGV:

# ./dtc test4.dts 
Segmentation fault

Anton
--MP_/nMIwrK1ZxOvthpMnP+rTlr4
Content-Type: audio/vnd.dts
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=test1.dts

L2R0cy12MS87CgovIHsKCXggPSA8KDAvMCk+Owp9Cg==

--MP_/nMIwrK1ZxOvthpMnP+rTlr4
Content-Type: audio/vnd.dts
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=test2.dts

L2R0cy12MS87CgovIHsKCXggPSA8MDk+Owp9Owo=

--MP_/nMIwrK1ZxOvthpMnP+rTlr4
Content-Type: audio/vnd.dts
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=test3.dts

L2R0cy12MS87CgovIHsKICAgICAgICB4ID0gIlwAIjsKfTsK

--MP_/nMIwrK1ZxOvthpMnP+rTlr4
Content-Type: audio/vnd.dts
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=test4.dts

IyAwICIAIgo=

--MP_/nMIwrK1ZxOvthpMnP+rTlr4--
