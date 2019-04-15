---
title: BDCOM OLT
category: BDCOM
date: 2019-04-15
---

**Починаючи з версії прошивки 10.1.0E_36039, всі mac-адреси, що відповідають маскам, які вказані нижче, будуть відкинуті PON інтерфейсом.**
`X2:XX:XX:XX:XX:XX	Local Administered`
`X6:XX:XX:XX:XX:XX	Local Administered`
`XA:XX:XX:XX:XX:XX	Local Administered`
`XE:XX:XX:XX:XX:XX	Local Administered`

**Щоб використовувати обладнання з такими адресами, потрібно дозволити їх обробку на OLT:**
`Switch_config#epon local-mac forward`
-----