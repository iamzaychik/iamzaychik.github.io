---
title: S2326TP-EI MVR
categories: Huawei
date: 2019-04-15
---

_Ворог в пилюці, скотиняка._
-----


Зразу кажу, ця конфігурація базується на user-vlans, ага.

1. Глобально дозволяємо igmp-snooping:
`[huawei] igmp-snooping enable`

2. Створюємо user vlans і дозволяємо igmp-snooping у них:
`[huawei] vlan 2101
[huawei-vlan2101] description user_2101
[huawei-vlan2101] igmp-snooping enable
[huawei-vlan2101] quit`

3. Створюємо multicast-groups, розбиваємо їх на multicast-lists, які прив'язуємо до multicast-profile:
`[huawei] btv`
[spoiler title="Багато тексту"]multicast-group Ch1 ip-address 239.255.250.1
multicast-group Ch2 ip-address 239.255.250.2
multicast-group Ch3 ip-address 239.255.250.3
multicast-group Ch4 ip-address 239.255.250.4
multicast-group Ch5 ip-address 239.255.250.5
multicast-group Ch6 ip-address 239.255.250.6
multicast-group Ch7 ip-address 239.255.250.7
multicast-group Ch8 ip-address 239.255.250.8
multicast-group Ch9 ip-address 239.255.250.9
multicast-group Ch10 ip-address 239.255.250.10
multicast-group Ch11 ip-address 239.255.250.11
multicast-group Ch12 ip-address 239.255.250.12
multicast-group Ch13 ip-address 239.255.250.13
multicast-group Ch14 ip-address 239.255.250.14
multicast-group Ch15 ip-address 239.255.250.15
multicast-group Ch16 ip-address 239.255.250.16
multicast-group Ch17 ip-address 239.255.250.17
multicast-group Ch18 ip-address 239.255.250.18
multicast-group Ch19 ip-address 239.255.250.19
multicast-group Ch20 ip-address 239.255.250.20
multicast-group Ch21 ip-address 239.255.250.21
multicast-group Ch22 ip-address 239.255.250.22
multicast-group Ch23 ip-address 239.255.250.23
multicast-group Ch24 ip-address 239.255.250.24
multicast-group Ch25 ip-address 239.255.250.25
multicast-group Ch26 ip-address 239.255.250.26
multicast-group Ch27 ip-address 239.255.250.27
multicast-group Ch28 ip-address 239.255.250.28
multicast-group Ch29 ip-address 239.255.250.29
multicast-group Ch30 ip-address 239.255.250.30
multicast-group Ch31 ip-address 239.255.250.31
multicast-group Ch32 ip-address 239.255.250.32
multicast-group Ch33 ip-address 239.255.250.33
multicast-group Ch34 ip-address 239.255.250.34
multicast-group Ch35 ip-address 239.255.250.35
multicast-group Ch36 ip-address 239.255.250.36
multicast-group Ch37 ip-address 239.255.250.37
multicast-group Ch38 ip-address 239.255.250.38
multicast-group Ch39 ip-address 239.255.250.39
multicast-group Ch40 ip-address 239.255.250.40
multicast-group Ch41 ip-address 239.255.250.41
multicast-group Ch42 ip-address 239.255.250.42
multicast-group Ch43 ip-address 239.255.250.43
multicast-group Ch44 ip-address 239.255.250.44
multicast-group Ch45 ip-address 239.255.250.45
multicast-group Ch46 ip-address 239.255.250.46
multicast-group Ch47 ip-address 239.255.250.47
multicast-group Ch48 ip-address 239.255.250.48
multicast-group Ch49 ip-address 239.255.250.49
multicast-group Ch50 ip-address 239.255.250.50
multicast-group Ch51 ip-address 239.255.250.51
multicast-group Ch52 ip-address 239.255.250.52
multicast-group Ch53 ip-address 239.255.250.53
multicast-group Ch54 ip-address 239.255.250.54
multicast-group Ch55 ip-address 239.255.250.55
multicast-group Ch56 ip-address 239.255.250.56
multicast-group Ch57 ip-address 239.255.250.57
multicast-group Ch58 ip-address 239.255.250.58
multicast-group Ch59 ip-address 239.255.250.59
multicast-group Ch60 ip-address 239.255.250.60
multicast-group Ch61 ip-address 239.255.250.61
multicast-group Ch62 ip-address 239.255.250.62
multicast-group Ch63 ip-address 239.255.250.63
multicast-group Ch64 ip-address 239.255.250.64
multicast-group Ch65 ip-address 239.255.250.65
multicast-group Ch66 ip-address 239.255.250.66
multicast-group Ch67 ip-address 239.255.250.67
multicast-group Ch68 ip-address 239.255.250.68
multicast-group Ch69 ip-address 239.255.250.69
multicast-group Ch70 ip-address 239.255.250.70
multicast-group Ch71 ip-address 239.255.250.71
multicast-group Ch72 ip-address 239.255.250.72
multicast-group Ch73 ip-address 239.255.250.73
multicast-group Ch74 ip-address 239.255.250.74
multicast-group Ch75 ip-address 239.255.250.75
multicast-group Ch76 ip-address 239.255.250.76
multicast-group Ch77 ip-address 239.255.250.77
multicast-group Ch78 ip-address 239.255.250.78
multicast-group Ch79 ip-address 239.255.250.79
multicast-group Ch80 ip-address 239.255.250.80
multicast-group Ch81 ip-address 239.255.250.81
multicast-group Ch82 ip-address 239.255.250.82
multicast-group Ch83 ip-address 239.255.250.83
multicast-group Ch84 ip-address 239.255.250.84
multicast-group Ch85 ip-address 239.255.250.85
multicast-group Ch86 ip-address 239.255.250.86
multicast-group Ch87 ip-address 239.255.250.87
multicast-group Ch88 ip-address 239.255.250.88
multicast-group Ch89 ip-address 239.255.250.89
multicast-group Ch90 ip-address 239.255.250.90
multicast-group Ch91 ip-address 239.255.250.91
multicast-group Ch92 ip-address 239.255.250.92
multicast-group Ch93 ip-address 239.255.250.93
multicast-group Ch94 ip-address 239.255.250.94
multicast-group Ch95 ip-address 239.255.250.95
multicast-group Ch96 ip-address 239.255.250.96
multicast-group Ch97 ip-address 239.255.250.97
multicast-group Ch98 ip-address 239.255.250.98
multicast-group Ch99 ip-address 239.255.250.99
multicast-group Ch100 ip-address 239.255.250.100
multicast-group Ch101 ip-address 239.255.250.101
multicast-group Ch102 ip-address 239.255.250.102
multicast-group Ch103 ip-address 239.255.250.103
multicast-group Ch104 ip-address 239.255.250.104
multicast-group Ch105 ip-address 239.255.250.105
multicast-group Ch106 ip-address 239.255.250.106
multicast-group Ch107 ip-address 239.255.250.107
multicast-group Ch108 ip-address 239.255.250.108
multicast-group Ch109 ip-address 239.255.250.109
multicast-group Ch110 ip-address 239.255.250.110
multicast-group Ch111 ip-address 239.255.250.111
multicast-group Ch112 ip-address 239.255.250.112
multicast-group Ch113 ip-address 239.255.250.113
multicast-group Ch114 ip-address 239.255.250.114
multicast-group Ch115 ip-address 239.255.250.115
multicast-group Ch116 ip-address 239.255.250.116
multicast-group Ch117 ip-address 239.255.250.117
multicast-group Ch118 ip-address 239.255.250.118
multicast-group Ch119 ip-address 239.255.250.119
multicast-group Ch120 ip-address 239.255.250.120
multicast-group Ch121 ip-address 239.255.250.121
multicast-group Ch122 ip-address 239.255.250.122
multicast-group Ch123 ip-address 239.255.250.123
multicast-group Ch124 ip-address 239.255.250.124
multicast-group Ch125 ip-address 239.255.250.125
multicast-group Ch126 ip-address 239.255.250.126
multicast-group Ch127 ip-address 239.255.250.127
multicast-group Ch128 ip-address 239.255.250.128
multicast-group Ch129 ip-address 239.255.250.129
multicast-group Ch130 ip-address 239.255.250.130
multicast-group Ch131 ip-address 239.255.250.131
multicast-group Ch132 ip-address 239.255.250.132
multicast-group Ch133 ip-address 239.255.250.133
multicast-group Ch134 ip-address 239.255.250.134
multicast-group Ch135 ip-address 239.255.250.135
multicast-group Ch136 ip-address 239.255.250.136
multicast-group Ch137 ip-address 239.255.250.137
multicast-group Ch138 ip-address 239.255.250.138
multicast-group Ch139 ip-address 239.255.250.139
multicast-group Ch140 ip-address 239.255.250.140
multicast-group Ch141 ip-address 239.255.250.141
multicast-group Ch142 ip-address 239.255.250.142
multicast-group Ch143 ip-address 239.255.250.143
multicast-group Ch144 ip-address 239.255.250.144
multicast-group Ch145 ip-address 239.255.250.145
multicast-group Ch146 ip-address 239.255.250.146
multicast-group Ch147 ip-address 239.255.250.147
multicast-group Ch148 ip-address 239.255.250.148
multicast-group Ch149 ip-address 239.255.250.149
multicast-group Ch150 ip-address 239.255.250.150
multicast-group Ch151 ip-address 239.255.250.151
multicast-group Ch152 ip-address 239.255.250.152
multicast-group Ch153 ip-address 239.255.250.153
multicast-group Ch154 ip-address 239.255.250.154
multicast-group Ch155 ip-address 239.255.250.155
multicast-group Ch156 ip-address 239.255.250.156
multicast-group Ch157 ip-address 239.255.250.157
multicast-group Ch158 ip-address 239.255.250.158
multicast-group Ch159 ip-address 239.255.250.159
multicast-group Ch160 ip-address 239.255.250.160
multicast-group Ch161 ip-address 239.255.250.161
multicast-group Ch162 ip-address 239.255.250.162
multicast-group Ch163 ip-address 239.255.250.163
multicast-group Ch164 ip-address 239.255.250.164
multicast-group Ch165 ip-address 239.255.250.165
multicast-group Ch166 ip-address 239.255.250.166
multicast-group Ch167 ip-address 239.255.250.167
multicast-group Ch168 ip-address 239.255.250.168
multicast-group Ch169 ip-address 239.255.250.169
multicast-group Ch170 ip-address 239.255.250.170
multicast-group Ch171 ip-address 239.255.250.171
multicast-group Ch172 ip-address 239.255.250.172
multicast-group Ch173 ip-address 239.255.250.173
multicast-group Ch174 ip-address 239.255.250.174
multicast-group Ch175 ip-address 239.255.250.175
multicast-group Ch176 ip-address 239.255.250.176
multicast-group Ch177 ip-address 239.255.250.177
multicast-group Ch178 ip-address 239.255.250.178
multicast-group Ch179 ip-address 239.255.250.179
multicast-group Ch180 ip-address 239.255.250.180
multicast-group Ch181 ip-address 239.255.250.181
multicast-group Ch182 ip-address 239.255.250.182
multicast-group Ch183 ip-address 239.255.250.183
multicast-group Ch184 ip-address 239.255.250.184
multicast-group Ch185 ip-address 239.255.250.185
multicast-group Ch186 ip-address 239.255.250.186
multicast-group Ch187 ip-address 239.255.250.187
multicast-group Ch188 ip-address 239.255.250.188
multicast-group Ch189 ip-address 239.255.250.189
multicast-group Ch190 ip-address 239.255.250.190
multicast-group Ch191 ip-address 239.255.250.191
multicast-group Ch192 ip-address 239.255.250.192
multicast-group Ch193 ip-address 239.255.250.193
multicast-group Ch194 ip-address 239.255.250.194
multicast-group Ch195 ip-address 239.255.250.195
multicast-group Ch196 ip-address 239.255.250.196
multicast-group Ch197 ip-address 239.255.250.197
multicast-group Ch198 ip-address 239.255.250.198
multicast-group Ch199 ip-address 239.255.250.199
multicast-group Ch200 ip-address 239.255.250.200
multicast-group Ch201 ip-address 239.255.250.201
multicast-group Ch202 ip-address 239.255.250.202
multicast-group Ch203 ip-address 239.255.250.203
multicast-group Ch204 ip-address 239.255.250.204
multicast-group Ch205 ip-address 239.255.250.205
multicast-group Ch206 ip-address 239.255.250.206
multicast-group Ch207 ip-address 239.255.250.207
multicast-group Ch208 ip-address 239.255.250.208
multicast-group Ch209 ip-address 239.255.250.209
multicast-group Ch210 ip-address 239.255.250.210
multicast-group Ch211 ip-address 239.255.250.211
multicast-group Ch212 ip-address 239.255.250.212
multicast-group Ch213 ip-address 239.255.250.213
multicast-group Ch214 ip-address 239.255.250.214
multicast-group Ch215 ip-address 239.255.250.215
multicast-group Ch216 ip-address 239.255.250.216
multicast-group Ch217 ip-address 239.255.250.217
multicast-group Ch218 ip-address 239.255.250.218
multicast-group Ch219 ip-address 239.255.250.219
multicast-group Ch220 ip-address 239.255.250.220
multicast-group Ch221 ip-address 239.255.250.221
multicast-group Ch222 ip-address 239.255.250.222
multicast-group Ch223 ip-address 239.255.250.223
multicast-group Ch224 ip-address 239.255.250.224
multicast-group Ch225 ip-address 239.255.250.225
multicast-group Ch226 ip-address 239.255.250.226
multicast-group Ch227 ip-address 239.255.250.227
multicast-group Ch228 ip-address 239.255.250.228
multicast-group Ch229 ip-address 239.255.250.229
multicast-group Ch230 ip-address 239.255.250.230
multicast-group Ch231 ip-address 239.255.250.231
multicast-group Ch232 ip-address 239.255.250.232
multicast-group Ch233 ip-address 239.255.250.233
multicast-group Ch234 ip-address 239.255.250.234
multicast-group Ch235 ip-address 239.255.250.235
multicast-group Ch236 ip-address 239.255.250.236
multicast-group Ch237 ip-address 239.255.250.237
multicast-group Ch238 ip-address 239.255.250.238
multicast-group Ch239 ip-address 239.255.250.239
multicast-group Ch240 ip-address 239.255.250.240
multicast-group Ch241 ip-address 239.255.250.241
multicast-group Ch242 ip-address 239.255.250.242
multicast-group Ch243 ip-address 239.255.250.243
multicast-group Ch244 ip-address 239.255.250.244
multicast-group Ch245 ip-address 239.255.250.245
multicast-group Ch246 ip-address 239.255.250.246
multicast-group Ch247 ip-address 239.255.250.247
multicast-group Ch248 ip-address 239.255.250.248
multicast-group Ch249 ip-address 239.255.250.249
multicast-group Ch250 ip-address 239.255.250.250
multicast-group Ch251 ip-address 239.255.250.251
multicast-group Ch252 ip-address 239.255.250.252
multicast-group Ch253 ip-address 239.255.250.253
multicast-group Ch254 ip-address 239.255.250.254

quit

multicast-list IPTV-L1
add multicast-group name Ch1
add multicast-group name Ch2
add multicast-group name Ch3
add multicast-group name Ch4
add multicast-group name Ch5
add multicast-group name Ch6
add multicast-group name Ch7
add multicast-group name Ch8
add multicast-group name Ch9
add multicast-group name Ch10
add multicast-group name Ch11
add multicast-group name Ch12
add multicast-group name Ch13
add multicast-group name Ch14
add multicast-group name Ch15
add multicast-group name Ch16
add multicast-group name Ch17
add multicast-group name Ch18
add multicast-group name Ch19
add multicast-group name Ch20
add multicast-group name Ch21
add multicast-group name Ch22
add multicast-group name Ch23
add multicast-group name Ch24
add multicast-group name Ch25
add multicast-group name Ch26
add multicast-group name Ch27
add multicast-group name Ch28
add multicast-group name Ch29
add multicast-group name Ch30
add multicast-group name Ch31
add multicast-group name Ch32
add multicast-group name Ch33
add multicast-group name Ch34
add multicast-group name Ch35
add multicast-group name Ch36
add multicast-group name Ch37
add multicast-group name Ch38
add multicast-group name Ch39
add multicast-group name Ch40
add multicast-group name Ch41
add multicast-group name Ch42
add multicast-group name Ch43
add multicast-group name Ch44
add multicast-group name Ch45
add multicast-group name Ch46
add multicast-group name Ch47
add multicast-group name Ch48
add multicast-group name Ch49
add multicast-group name Ch50
add multicast-group name Ch51
add multicast-group name Ch52
add multicast-group name Ch53
add multicast-group name Ch54
add multicast-group name Ch55
add multicast-group name Ch56
add multicast-group name Ch57
add multicast-group name Ch58
add multicast-group name Ch59
add multicast-group name Ch60
add multicast-group name Ch61
add multicast-group name Ch62
add multicast-group name Ch63
add multicast-group name Ch64

quit

multicast-list IPTV-L2
add multicast-group name Ch65
add multicast-group name Ch66
add multicast-group name Ch67
add multicast-group name Ch68
add multicast-group name Ch69
add multicast-group name Ch70
add multicast-group name Ch71
add multicast-group name Ch72
add multicast-group name Ch73
add multicast-group name Ch74
add multicast-group name Ch75
add multicast-group name Ch76
add multicast-group name Ch77
add multicast-group name Ch78
add multicast-group name Ch79
add multicast-group name Ch80
add multicast-group name Ch81
add multicast-group name Ch82
add multicast-group name Ch83
add multicast-group name Ch84
add multicast-group name Ch85
add multicast-group name Ch86
add multicast-group name Ch87
add multicast-group name Ch88
add multicast-group name Ch89
add multicast-group name Ch90
add multicast-group name Ch91
add multicast-group name Ch92
add multicast-group name Ch93
add multicast-group name Ch94
add multicast-group name Ch95
add multicast-group name Ch96
add multicast-group name Ch97
add multicast-group name Ch98
add multicast-group name Ch99
add multicast-group name Ch100
add multicast-group name Ch101
add multicast-group name Ch102
add multicast-group name Ch103
add multicast-group name Ch104
add multicast-group name Ch105
add multicast-group name Ch106
add multicast-group name Ch107
add multicast-group name Ch108
add multicast-group name Ch109
add multicast-group name Ch110
add multicast-group name Ch111
add multicast-group name Ch112
add multicast-group name Ch113
add multicast-group name Ch114
add multicast-group name Ch115
add multicast-group name Ch116
add multicast-group name Ch117
add multicast-group name Ch118
add multicast-group name Ch119
add multicast-group name Ch120
add multicast-group name Ch121
add multicast-group name Ch122
add multicast-group name Ch123
add multicast-group name Ch124
add multicast-group name Ch125
add multicast-group name Ch126
add multicast-group name Ch127
add multicast-group name Ch128

quit

multicast-list IPTV-L3
add multicast-group name Ch129
add multicast-group name Ch130
add multicast-group name Ch131
add multicast-group name Ch132
add multicast-group name Ch133
add multicast-group name Ch134
add multicast-group name Ch135
add multicast-group name Ch136
add multicast-group name Ch137
add multicast-group name Ch138
add multicast-group name Ch139
add multicast-group name Ch140
add multicast-group name Ch141
add multicast-group name Ch142
add multicast-group name Ch143
add multicast-group name Ch144
add multicast-group name Ch145
add multicast-group name Ch146
add multicast-group name Ch147
add multicast-group name Ch148
add multicast-group name Ch149
add multicast-group name Ch150
add multicast-group name Ch151
add multicast-group name Ch152
add multicast-group name Ch153
add multicast-group name Ch154
add multicast-group name Ch155
add multicast-group name Ch156
add multicast-group name Ch157
add multicast-group name Ch158
add multicast-group name Ch159
add multicast-group name Ch160
add multicast-group name Ch161
add multicast-group name Ch162
add multicast-group name Ch163
add multicast-group name Ch164
add multicast-group name Ch165
add multicast-group name Ch166
add multicast-group name Ch167
add multicast-group name Ch168
add multicast-group name Ch169
add multicast-group name Ch170
add multicast-group name Ch171
add multicast-group name Ch172
add multicast-group name Ch173
add multicast-group name Ch174
add multicast-group name Ch175
add multicast-group name Ch176
add multicast-group name Ch177
add multicast-group name Ch178
add multicast-group name Ch179
add multicast-group name Ch180
add multicast-group name Ch181
add multicast-group name Ch182
add multicast-group name Ch183
add multicast-group name Ch184
add multicast-group name Ch185
add multicast-group name Ch186
add multicast-group name Ch187
add multicast-group name Ch188
add multicast-group name Ch189
add multicast-group name Ch190
add multicast-group name Ch191
add multicast-group name Ch192

quit

multicast-list IPTV-L4
add multicast-group name Ch193
add multicast-group name Ch194
add multicast-group name Ch195
add multicast-group name Ch196
add multicast-group name Ch197
add multicast-group name Ch198
add multicast-group name Ch199
add multicast-group name Ch200
add multicast-group name Ch201
add multicast-group name Ch202
add multicast-group name Ch203
add multicast-group name Ch204
add multicast-group name Ch205
add multicast-group name Ch206
add multicast-group name Ch207
add multicast-group name Ch208
add multicast-group name Ch209
add multicast-group name Ch210
add multicast-group name Ch211
add multicast-group name Ch212
add multicast-group name Ch213
add multicast-group name Ch214
add multicast-group name Ch215
add multicast-group name Ch216
add multicast-group name Ch217
add multicast-group name Ch218
add multicast-group name Ch219
add multicast-group name Ch220
add multicast-group name Ch221
add multicast-group name Ch222
add multicast-group name Ch223
add multicast-group name Ch224
add multicast-group name Ch225
add multicast-group name Ch226
add multicast-group name Ch227
add multicast-group name Ch228
add multicast-group name Ch229
add multicast-group name Ch230
add multicast-group name Ch231
add multicast-group name Ch232
add multicast-group name Ch233
add multicast-group name Ch234
add multicast-group name Ch235
add multicast-group name Ch236
add multicast-group name Ch237
add multicast-group name Ch238
add multicast-group name Ch239
add multicast-group name Ch240
add multicast-group name Ch241
add multicast-group name Ch242
add multicast-group name Ch243
add multicast-group name Ch244
add multicast-group name Ch245
add multicast-group name Ch246
add multicast-group name Ch247
add multicast-group name Ch248
add multicast-group name Ch249
add multicast-group name Ch250
add multicast-group name Ch251
add multicast-group name Ch252
add multicast-group name Ch253
add multicast-group name Ch254

quit

multicast-profile IPTV-P1
add multicast-list name IPTV-L1 watch
add multicast-list name IPTV-L2 watch
add multicast-list name IPTV-L3 watch
add multicast-list name IPTV-L4 watch
[/spoiler]

4. Створюємо multicast vlan і дозволяємо igmp-snooping у ньому, після чого додаємо user vlans:
`[huawei] vlan 35
[huawei-vlan35] description IPTV_vlan
[huawei-vlan35] igmp-snooping enable
[huawei-vlan35] multicast-vlan enable
[huawei-vlan35] multicast-vlan user-vlan 2101 to 2124
[huawei-vlan35] attach multicast-profile IPTV-P1
[huawei-vlan35] quit`

5. Конфігуруємо інтерфейси в hybrid-режимі:
`[huawei] interface ethernet0/0/1
[huawei-Ethernet0/0/1] port hybrid pvid vlan 2101
[huawei-Ethernet0/0/1] port hybrid untagged vlan 35 2101
[huawei-Ethernet0/0/1] quit`

**(!) Якщо інтерфейси уже в access-режимі, то спочатку потрібно зробити слідуюче:**
`[huawei-Ethernet0/0/1] port default vlan 1
[huawei-Ethernet0/0/1] port link-type hybrid`

6. Не забуваємо прийняти всі влани на гігабітних портах!

7. Перевіряємо роботу:
`[huawei] display l2-multicast forwarding-table vlan 35`

-----