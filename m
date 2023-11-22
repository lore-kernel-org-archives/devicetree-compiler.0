Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="B1Qe452g"
X-Greylist: delayed 372 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 22 Nov 2023 02:09:53 PST
Received: from mail.manjaro.org (mail.manjaro.org [IPv6:2a01:4f8:c0c:51f3::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8882195
	for <devicetree-compiler@vger.kernel.org>; Wed, 22 Nov 2023 02:09:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1700647420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	b=B1Qe452ghgACirVmhNNQ/QmlHHHXvlZt6PiS3+7hg2Mfcz+PIwdsioNoIQqQ71My4Xxd4t
	+7eXRAezwZ91FD1F6i/TJKuFaqj1ajRktg3GcWOAj13TTL05mJWb5FEuXBIc4vUsdZaGaS
	YD6IlwhK04iBTJTbVxLraFwn6ZTouJvZgYcFPerEljnzBjq8JLdBXcTVj4ym/qelXPfCKs
	vAQsAX9vY0bp5csRjlq3OKPjGWomff84ceyz7z/wHu5Sr5xY2Rx0F8uOxtSSY3WyH39JLO
	7+BxPJl5QQ2U1WqomKyE1uoW+1Z6FwRB72meuT0tD6l6/bAfK5xZN0XBJqsAzA==
Date: Wed, 22 Nov 2023 11:03:39 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: devicetree-compiler@vger.kernel.org
Subject: subscribe
Message-ID: <80db12f29bcc4520b75e015d3a7284fd@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-Spam-Level: *

subscribe
