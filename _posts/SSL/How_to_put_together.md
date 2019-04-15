---
title: How to put together
category: SSL
date: 2019-04-15
---

**SSL сертифікати мають таку структуру:**
1. **BUNDLE** складається з:
<ul>
 	*intermediate-1
 	*intermediate-N
 	*root
</ul>
2. **CHAIN** складається з:
<ul>
 	*cert
 	*bundle
</ul>
3. **FULLCHAIN** складається з:
<ul>
 	*chain
 	*key
</ul>

-----
