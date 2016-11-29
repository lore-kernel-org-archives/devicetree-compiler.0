From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: Overlays and boolean properties
Date: Tue, 29 Nov 2016 13:06:16 +0000
Message-ID: <a02487bb-6f79-fe4d-8180-86375b9413b9@raspberrypi.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=raspberrypi.org; h=to : from :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp;
 bh=5bYUDqmBafZsbSFesJ0tf18lV5X981yeTIq6l0ODomY=;
 b=UIMuPU0AXn/7bUNcowvAyeV2u2IyZQP+pALjC76xqKF+ALB/Z2H0YYOe9uYOPitCLXMx
 wl84LC79szRYRsHixgnHIMKVnH1f0KjHkqRUP6sgYIG7PyRpUg1l46FelYU9UEjd3H6w
 H6y8cm7YZLJM1iRbFLsdfC9BUClp37THwFnpoXHsweLAa+Sdp9PdJYKDMtO2YL9NzthX
 bTVzY3XSjIW6dH1rP0+EqFXAjKa8zlgg+f+6LpLJeyiGWPw20yV5tDkjTNBl5VX/l2x/
 697nYplcVjgDOBgTUsFR9Lhf0xPla0XLLPsf27Ce3kIqjH4RLCE50RDMvoS4/aECE9+z Ag== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi-org.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=5bYUDqmBafZsbSFesJ0tf18lV5X981yeTIq6l0ODomY=;
        b=yMJolmYD7z7rJ6pWd1llm8j9B3jxLdmA6zI5z9kJo8qIXeDapn10N2+5zfruEdTlXD
         1hzajiKKIgUrZ5sfjYPrkc//UcQmxpDeMxck3NjV2qVjQVJF1xKMNGw31mYT0YdBmCJR
         uzrFYNCnek/9ldOvjgvBgyhO5w1F69q/++Cc96f9/koQcr+cqvTpQC2FEWm+o90sM1vn
         Tdgju4/nvnW0YfUXCOjNJzcnsXpyJsrJkYXiMtp3uEzdeio/CU+T7E1/KkPmQL3F4G0X
         R4BKaIymYDSAruW8SXfr0QiGQWl5vRFVf5StGFp2NhqZFnDXc6D8qoZhufMLMe6zJUv8
         0fCg==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Boolean properties are defined as being properties with no content, that
are true if present and false if absent. They pose a problem for DT
overlays, since the proposed (and widely used) overlay mechanism does
not allow for properties (or nodes) to be deleted; overlays can only
make a false property true, so boolean properties are effectively
monostable - once true they become immutable.

The standard DT syntax includes /delete-property/ and /delete-node/
directives that do what you would expect from their names, but that
facility is not available to overlays. There is no FDT node that
represents the deletion - the directives are acted on immediately - so
we would need some extra markup - say __delete_property__ and
__delete_node__ - to hold the names of items to be deleted.

Before I take this further, does anybody have any thoughts on the idea?

Phil
