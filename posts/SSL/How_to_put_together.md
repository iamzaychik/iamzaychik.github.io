Title: SSL. How to put together
Pub date: 01.02.2018
Category: SSL, 

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
