From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] checks: Change node-name check to match devicetree spec
Date: Tue, 9 Feb 2021 12:31:22 -0600
Message-ID: <CAL_JsqL_oDSeXWYpA3OeLJk9QThxOk3Wo6vJ_GObW0xPkDjA4Q@mail.gmail.com>
References: <20210209172451.56967-1-kumar.gala@linaro.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612895496;
        bh=B/+NWPNo4RHTs7vR1IN3IRe76Qk/Hihb2EYY9gHYpI4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kmR+YQTw1Cn0Hi7St3BqL1uFEczR6eP4EgmtJ5VGExb83VS/xb6vWnBx99q0oYoSu
         w9ex1Pqii6Q7stXxc1GpukveMXvzg3OjWzvaQ6snWBNzHzEjp6nGe0H8kg0LhkGNRB
         kAfkXc3A4WO/AmUXBsSJN817HxSaUAJPGTUXDFJXn5dGiZxxBpbRO1vtbE9m3THu35
         t7Q3al0asvyZCrED/Rpqz75HeoexbKPXaqeilGKAOJ9NNp9AkeCLQ67FcPW8QxSTw+
         6rva4apHkNrcENiZKQjdUxNn9xT8/kJfcPuqlccFoxqyhNNwclu+JNKe13q28rFlKT
         EABrHKKKy72kw==
In-Reply-To: <20210209172451.56967-1-kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Tue, Feb 9, 2021 at 11:26 AM Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> The devicetree spec limits the valid character set to:
>   A-Z
>   a-z
>   0-9
>   ,._+-
>
> while property can additionally have '?#'.  Change the check to match
> the spec.
>
> Signed-off-by: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  checks.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/checks.c b/checks.c
> index 17cb689..24e6816 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -297,7 +297,8 @@ ERROR(duplicate_property_names, check_duplicate_property_names, NULL);
>  #define LOWERCASE      "abcdefghijklmnopqrstuvwxyz"
>  #define UPPERCASE      "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
>  #define DIGITS         "0123456789"
> -#define PROPNODECHARS  LOWERCASE UPPERCASE DIGITS ",._+*#?-"
> +#define NODECHARS      LOWERCASE UPPERCASE DIGITS ",._+-"
> +#define PROPCHARS      LOWERCASE UPPERCASE DIGITS ",._+*#?-"
>  #define PROPNODECHARSSTRICT    LOWERCASE UPPERCASE DIGITS ",-"
>
>  static void check_node_name_chars(struct check *c, struct dt_info *dti,
> @@ -309,7 +310,7 @@ static void check_node_name_chars(struct check *c, struct dt_info *dti,
>                 FAIL(c, dti, node, "Bad character '%c' in node name",
>                      node->name[n]);
>  }
> -ERROR(node_name_chars, check_node_name_chars, PROPNODECHARS "@");
> +ERROR(node_name_chars, check_node_name_chars, NODECHARS "@");

Since we split the character sets, you should just add '@' to NODECHARS.

>
>  static void check_node_name_chars_strict(struct check *c, struct dt_info *dti,
>                                          struct node *node)
> @@ -370,7 +371,7 @@ static void check_property_name_chars(struct check *c, struct dt_info *dti,
>                                   prop->name[n]);
>         }
>  }
> -ERROR(property_name_chars, check_property_name_chars, PROPNODECHARS);
> +ERROR(property_name_chars, check_property_name_chars, PROPCHARS);
>
>  static void check_property_name_chars_strict(struct check *c,
>                                              struct dt_info *dti,
> --
> 2.29.2
>
