---
title: Igmp snooping vlan ports filter
categories: Summit
date: 2019-04-15
---

_Юз зе форс, Люк!
І буде тобі фільтрація мультикасту на портах._
-----

The policy file used by this command is a text file that contains the class-D addresses of the multicast groups that you wish to block.
To remove IGMP snooping filtering from a port, use the **none** keyword version of the command.
Use the following template to create a snooping filter policy file:

`# Add your group addresses between "Start" and "end"
# Do not touch the rest of the file!!!!
entry igmpFilter
{ if match any
{
#------------------ Start of group addresses ------------------
nlri 239.11.0.0/16; nlri 239.10.10.4/32;
#------------------- end of group addresses -------------------
} then { deny;
}
}
entry catch_all
{ if
{
} then
{ permit;
}
}`
-----
**Example:**
The following example configures the policy file ap_multicast to filter multicast packets forwarded to VLAN marketing on ports 2:1-2:4:
`configure igmp snooping marketing ports 2:1-2:4 filter ap_multicast`
-----