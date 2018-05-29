---
layout: default
title: OTYAX package manager
---
# OTYAX Package manager
Name TBD

* teabag nanasi
* teapack tosuke
* teabucket nanasi
* Qse citringo

Assuming the command is called "pm" for now

```
pm install packagename
=Installation
pm uninstall packagename
=Uninstalling
pm uninstall -f packagename
=Delete the files in configuration
remove(nanasi proposal)
pm upgrade
=Updating
pm create -description hogehoge -depend OTW * -file DAT:XXXX.GRP -program TXT:HOGE
=Generate package
```

# File Structure
When separating the program and package information
`pkgname.PKGS`

|Name|Value|
|---|---|
|description|description|
|depends|dependencies|
|files|configured files|
|programs|constituent programs|

``` json
{
 "description":"hogehoge",
 "depends":
 [
  {
   "name":"OTW",
   "version":"*"
  }
 ],
 "files":"DAT:XXXX.GRP",
 "programs":"TXT:HOGE"
}
```
