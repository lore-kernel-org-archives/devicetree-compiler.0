From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
Subject: Re: [PATCH V4] Support 'r' format for printing raw bytes with fdtget
Date: Thu, 09 Dec 2021 08:09:30 +0100
Message-ID: <8a3a5177af508a40d93e1006e18b9a8b@milecki.pl>
References: <20211209053041.17984-1-zajec5@gmail.com>
 <20211209061420.29466-1-zajec5@gmail.com> <YbGnwFEo3icv7Rxl@yekko>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <YbGnwFEo3icv7Rxl@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 2021-12-09 07:52, David Gibson wrote:
> On Thu, Dec 09, 2021 at 07:14:20AM +0100, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>> 
>> FT is sometimes used for storing raw data. That is quite common for
>> U-Boot FIT images.
>> 
>> Extracting such data is not trivial currently. Using type 's' (string)
>> will replace every 0x00 (NUL) with 0x20 (space). Using type 'x' will
>> print bytes but in xxd incompatible format.
>> 
>> This commit adds support for 'r' (raw) format. Example usage:
>> fdtget -t r firmware.itb /images/foo data > image.raw
>> 
>> Support for encoding isn't added as there isn't any clean way of 
>> passing
>> binary data as command line argument.
>> 
>> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> 
> Applied, thanks.

Thank you!
