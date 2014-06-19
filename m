From: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>
Subject: Re: [PATCH 1/4] Microsoft Visual C patches
Date: Thu, 19 Jun 2014 18:06:48 +0300
Message-ID: <53A2FC88.7050504@errapartengineering.com>
References: <539DBFC8.4050204@errapartengineering.com> <20140616104628.GB29264@voom.redhat.com> <53A1C5FC.9040105@errapartengineering.com> <20140619111459.GM29264@voom.redhat.com> <53A2F104.90701@errapartengineering.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53A2F104.90701-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

19.06.2014 17:17, Andrei Errapart kirjutas:
>>>      * Initialize check->inprogress, too.
>>
>> Why..?

Another option: move the field "inprogress" to the end of the struct. 
Works, too.


best regards,
Andrei

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
