From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: phandle via absolute path?
Date: Wed, 15 Jun 2016 10:19:43 -0700
Message-ID: <57618E2F.8050900@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=JFskE9rg9LNCerKgjI4Vuai2YAJl6JyzfGTuCD6XNEw=;
        b=xeDJDnKJ7MijVzZXCTjS18Q2vMDv94P6T/1YrWdnexqnnMwhI8+bHYylbRDnQsPapR
         6jYHvp1peDY3svtJVaxW48CGBAc1nNginp2xfqCygJ4X9xy5TfgZdb6dhd54eTjg3LW9
         P5IfxNvDcYjBbA/eQD1W1hJCoSgZKXMwQ+Wm0m+52VPAYV3Amtt+YwU5cT08g9fJLJqz
         QQu6HvCUgnc6iV1wlj3VOPECmUq5NuDGchEQ3F46XUJtL20g5UnFg4QjV9lWxCzdrtp+
         lh+hpo4PVJWmqAqxDJdiyzeWAiprkV1qVseJG9XxqbDe3+FnjhUl9TrGDXnn0J4Eziy+
         Td4g==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org

Hi,

I can't really see anything that would prevent me to have a phandle
property taking a full-path to a node, but this produces a syntax error.
Let's say we have this:

/dts-v1/;

/ {
	soc@0 {
		somenode@deafbeef {
		};

		someothernode@cafebabe {
			handle = <&/soc@0/somenode@deafbeef>;
		};
	};
};

Does this sound like something that should work?
-- 
Florian
