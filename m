From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Updated ePAPR specification?
Date: Thu, 26 Jun 2014 11:24:16 -0700
Message-ID: <CAGVrzcZcLooRwP3yH=HxgaGNfVp6AbGdk9cqx7vvhsPgwv0BMA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=/1x4+ECc65Fu7M6gQHlVY+Or+vJpipjL+zb+0wiLk9U=;
        b=vBXhICfrJB+0AXSyaBdS6v3x4Tg/5WUikDncLkpX/zX7IkBTg0No6ga6lcai7SGuja
         VWBY5hQZZyYgA92cgxv8tNvkeMfx/9psaDuK3bTbRu0aBAAb+bypr/u1ewI4eMwjZMjI
         EDCiJrWoZitbio/Xum9KXBSSLZD3Q/zRfWUXH4B1MN8WnavaTdmDwuCj/qRxnNdl0jDh
         JIVoBEM8vUVd/oES2ZBJWMaK9SqUWcP3OYJU0fq3xb0YFaI4pVelkwjEewasQwsd3aJ5
         8DYfvsIC34+LJMd40x3SmXNxogHUXOze+kIvkDZRL2qnxv7DDZ3BYuarRziZTmbFfw+/
         f5TA==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Hi all,

During ELC 2014 in San Jose, we quickly talked about whether there is
a need for an updated ePAPR specification that would cover the new
bindings that Linux has been adopting.

I think Olof had some concerns about how a committee-driven approach
might make things more complex than they need to be.

Still, I feel like there is some room for standardizing some of the
new bindings Linux has been coming up with, in particular:

- clocks bindings
- DMA bindings
- (S)IOMMU bindings

and a bunch of updates to existing specification (e.g: new Ethernet
PHY types such as "xgmii").

If we were serious about doing this, how would you recommend we move
forward, should we aim at doing something similar to the virtio
specification and publish an update Device Tree binding specification
as part of an OASIS working group?
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
