Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB4C11CBA
	for <devicetree-compiler@vger.kernel.org>; Thu, 15 Jan 2026 12:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768478432; cv=none; b=DMYYkc0QBQjPkMp+lvFpe4gchIRhESLcIWHjXDV3fuCWVKU78c+oDE8a2jSJg+6zfwzG9pFYU708m7A/wevat2MR34zzl47E4OsNQPVLCWHed6wdu8nCVOtczaMFOsCTF3D8QZvU7A+qSEnkClEwrD5WRYK45sZb/KQ4SmryvhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768478432; c=relaxed/simple;
	bh=E2EMiGLQLeovF6arCgzJybgPSknNg8D918+mMX08VlU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=FtAAnDZR5PmwRir+kDJc6Yln9uN4wrgp3PBuf2fGrbkv6+ARK/mjoEjzsSTAV0ZShOAkxMkhE/MDL8n54nESk1c1O/1Tqx3JVDL5GdlQ+XctDOoESd0bswor3Gxo2d6eoet35HjxIQBEQJqTpy1l5Jd3wBlgFjOz6V5CY+5EsaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRA/B2fy; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRA/B2fy"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-382fa0dc9f4so8203061fa.3
        for <devicetree-compiler@vger.kernel.org>; Thu, 15 Jan 2026 04:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768478429; x=1769083229; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hPWEFm4Els2eziztSTl615NyABa0fDjvk8KwEsIDn5I=;
        b=SRA/B2fyb2UyaMCW6IolHmFjZCKyEmC5zNsSpdFqcawOIPsRJwAeZA2w3UQptJWKf3
         LHUH5IrufzOC5Q56MCGtxChBeXgbJaj2+9lPzjVKJVPZE/4c7Zf4OfdJUZGPEhqjlWR0
         Rby+3YhCEcH+HZgafz1SkKr6t2m0RedpXV41o7qlomsL8YjiO/KeKGtBg49LOQf7Xe2C
         GVRqKNYqzwm5tRC+8JUXalSf1GlZd1BBMwXwFrZGNt4rO+XmqcPWHENYAhjC3LSniPeL
         YNH4GZCyUJdPRqnDBbsidSvo0QcBxU/kX91BTmXP7Yfj9TbW2b1a62wDQion4v9pknz4
         +UCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768478429; x=1769083229;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPWEFm4Els2eziztSTl615NyABa0fDjvk8KwEsIDn5I=;
        b=GkQSvPro01w81B0mfg7TywrYJnQQWADox3+4SYLeJpEKAVGr/ptUqjwLL02BjwhnqZ
         LmYy6UMzX4ZaszcfetTcTErjTeMYxfXNQFsm5zjvq7qQYFshV1G3f1+v5vQTtgYzheRa
         K5jtOAlzE0m5/LBh0GzqpIGOP2wT6LZhLXe+8/2YkvejDuF6SXDyWp1qUr4/tmDle+6+
         98CgfqwBvtdjBoOzwEt9yew75ncl5XPz9Y5gz36fPHZ2u2ReMNO39Qh7ogGrB62GIzrT
         S6tcYTzTOItbGLDDdAA8WOcgkUJYN7kg6jhpj1xNz/SxzlfAnMR15aJ9oaK0vIwryJQb
         57jQ==
X-Gm-Message-State: AOJu0Ywp7fXRNYnGd47b40HeszSz1l9pNvXYM0a6LeM3tJXPy0plv/hb
	7KAzKW/pn/zUuTEftVA9hQ82TvUUkUhnSMYlDGEa5QlxBxAbNtial8r9qdKrF1WewKq51yD7J05
	1kAPZAOI91adScpR5vZLowNdmCuTAeqzGp1YB
X-Gm-Gg: AY/fxX7QtJNbf75pkViUDcljEh8lHD3drifJeU5AxJsKugWvjgP3skR5DdgrhzGb6rM
	vQMsr6YiPH988OhKu4Qkiye6aAoQ5JaJTVMKSSy4p+87rnto11yKpTK22rDBcxmh6y9FTX3BeAR
	sEzThCsZICvYxCK9F5+jJy/6x3YgHPVwR3vEK2jGfQtfLcwNnM2N0TMi/zz0f2o0m9BsUN694ly
	89o5F+xChYxzkluOAmjNN7r3TiSkJIpIJEq0h8C11qRQAyuUmEt9cyr7UPiMNR7hG/+YV3nn1oD
	mfo0mQ==
X-Received: by 2002:a05:651c:1476:b0:37b:bcbc:58dd with SMTP id
 38308e7fff4ca-38360655342mr17288511fa.1.1768478428792; Thu, 15 Jan 2026
 04:00:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Phil Dawson <phil.d.dawson@gmail.com>
Date: Thu, 15 Jan 2026 12:00:13 +0000
X-Gm-Features: AZwV_QjDuigkDlqKnQ28pWFuhOO-CsJ4sRv1RRrB_dEvMD55ah4u6iXc6heSxm0
Message-ID: <CALx+s3Qaw15b2KbLfS4SO9tmUw7PkDTNAP1dqk7273DQMCwVwQ@mail.gmail.com>
Subject: delete-node without label or address from overlay dts
To: "devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Apologies if this is covered in documentation that I've missed.
Is there a way to use /delete-node/ to remove a node with no label or
address from a plugin/overlay dts file?

I have a device tree overlay file pl.dtsi that is auto generated by
vendor tools. Unfortunately many nodes in this file are generated
wrong and the overlay fails to apply.
I've been removing the broken nodes with /delete-node/ &label; syntax
in a second dtsi file and then compiling the two together with a
wrapper dts file and the commands:
gcc -E -nostdinc -undef -D__DTS__ -x assembler-with-cpp -o pl.dts.pp
<path redacted>/pl.dts
dtc -R 8 -b 0 -p 0 -@ -H epapr -o pl.dtbo -I dts -O dtb pl.dts.pp
(These are run as part of a larger yocto build so there may be some
other work around this I'm missing!)

The auto generated pl.dtsi also has a few broken nodes without labels
or addresses like this:

/dts-v1/;
/plugin/;
&amba {
    vcap_hdmi_input_1_v_proc_ss_1 {
=E2=80=82=E2=80=82=E2=80=82=E2=80=82<contents removed for brevity>
    };
};

I am unable to figure out the syntax to remove these nodes with
/delete-node/, should this be possible?

I've tried using the below syntax:
&amba {
    /delete-node/ vcap_hdmi_input_1_v_proc_ss_1;
};

But while dtc doesn't complain, the nodes are not removed from the
resulting dtbo.

I also can't remove using the full path as there is no root node/full
path in the generated dtsi file.

According to this discussion on an unrelated project
(https://github.com/zephyrproject-rtos/zephyr/discussions/67228)
trying to delete a node with a name and address without using the
address won't work. But in my case the node has no address.

I can work around my issue by hacking the auto generated files (while
I try to persuade the vendor to fix them!) to add a label for these
nodes and then removing them using the label. But is there a correct
way of doing this just using my separate dtsi file and dtc?

Best Regards,
Phil Dawson
