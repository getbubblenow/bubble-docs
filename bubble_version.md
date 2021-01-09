# Bubble Version History

## Adventure 1.5.11 -- 2021 Jan 9
Adventure - First Official Release

## Adventure 1.5.6 -- 2020 Dec 11
Adventure - Release Candidate 8
Vagrant dev setup, docker compute, doc updates

## Adventure 1.5.2 -- 2020 Dec 6
Adventure - Release Candidate 7
Docker deploy, updates to web UI and API docs

## Adventure 1.5.0 -- 2020 Dec 6
Adventure - Release Candidate 6
Smaller and more stable

## Adventure 1.4.48 -- 2020 Dec 4
Adventure - Release Candidate 5
Adds OpenAPI support, automatic API reference documentation, a much smaller jar file and automatic updates

## Adventure 1.4.35 -- 2020 Nov 25
Adventure - Release Candidate 4

## Adventure 1.4.34 -- 2020 Nov 25
Adventure - Release Candidate 3

## Adventure 1.4.33 -- 2020 Nov 24
Adventure - Release Candidate 2

## Adventure 1.4.32 -- 2020 Nov 23
Adventure - Release Candidate 1

## Adventure 1.4.31 -- 2020 Nov 23
Fix web logout

## Adventure 1.4.30 -- 2020 Nov 22
Extend error column widths

## Adventure 1.4.29 -- 2020 Nov 22
Fix supervisor reload bug preventing node deployment

## Adventure 1.4.28 -- 2020 Nov 21
Rollback response header modification support to avoid hanging on some filtered requests

## Adventure 1.4.26 -- 2020 Nov 19
Sage upgrades now working

## Adventure 1.4.24 -- 2020 Nov 19
Fix account update button

## Adventure 1.4.23 -- 2020 Nov 18
Minor deployment fixes

## Adventure 1.4.22 -- 2020 Nov 17
Fix database filtering when deploying

## Adventure 1.4.19 -- 2020 Nov 17
Add monitoring tools for PackerService to show status of running and completed image builds

## Adventure 1.4.18 -- 2020 Nov 17
Allow setting admin email when launching new bubble; more docs, web fixes

## Adventure 1.4.16 -- 2020 Nov 16
Easier setup for open source launchers

## Adventure 1.4.15 -- 2020 Nov 16
Simplify docker launcher usage

## Adventure 1.4.12 -- 2020 Nov 14
Log server version at startup

## Adventure 1.4.10 -- 2020 Nov 14
Allow upgrading standalone bubbles

## Adventure 1.4.5 -- 2020 Nov 14
Better fallback behavior when geo services are unavailable

## Adventure 1.4.4 -- 2020 Nov 14
Simple scripts to run launcher via docker

## Adventure 1.4.0 -- 2020 Nov 12
Support launching from Mac OS X

## Adventure 1.3.3 -- 2020 Nov 3
Network filtering improvements

## Adventure 1.3.2 -- 2020 Oct 28
Add strict security level, network performance improvements

## Adventure 1.2.8 -- 2020 Oct 1
Improve email delegation and device status API, update web UI

## Adventure 1.2.7 -- 2020 Sep 25
Add RequestProtector app, new devices screen, update messages

## Adventure 1.2.6 -- 2020 Sep 23
Allow setting default security levels by device type

## Adventure 1.2.5 -- 2020 Sep 22
Remove beta messaging, new web layout

## Adventure 1.2.4 -- 2020 Sep 21
Proper handling of charset for non-UTF-8 sites

## Adventure 1.2.3 -- 2020 Sep 20
Simplify flex routing setup

## Adventure 1.2.2 -- 2020 Sep 18
Enable launching new Bubbles directly from local launcher

## Adventure 1.2.1 -- 2020 Sep 17
Bugfixes for new deployments

## Adventure 1.2.0 -- 2020 Sep 17
Add HTTP and SSH tarpits, add SSH fail2ban, harden SSH

## Adventure 1.1.4 -- 2020 Sep 16
ShadowBan support for LinkedIn

## Adventure 1.1.3 -- 2020 Sep 14
Update web UI

## Adventure 1.1.2 -- 2020 Sep 14
Bug fixes and improvements

## Adventure 1.1.1 -- 2020 Sep 12
Various fixes and performance improvements to MITM async io and flex routing

## Adventure 1.1.0 -- 2020 Sep 11
Introduce flex routing, improve MITM performance using async io for network requests

## Adventure 1.0.7 -- 2020 Sep 2
ShadowBan support for Facebook comment threads, improve in-page app CSS 

## Adventure 1.0.6 -- 2020 Sep 1
MITM improvements: better monitoring, faster startup 

## Adventure 1.0.5 -- 2020 Aug 31
ShadowBan support for Instagram and Reddit

## Adventure 1.0.4 -- 2020 Aug 30
Allow BlockParty in-page stats to be disabled on a per-site basis

## Adventure 1.0.3 -- 2020 Aug 29
Fix ApplePay, fix BlockParty on Twitter, various ShadowBan improvements

## Adventure 1.0.2 -- 2020 Aug 28
Add ShadowBan signal/noise ratio

## Adventure 1.0.1 -- 2020 Aug 28
Add support for ShadowBan keyword lists

## Adventure 1.0.0 -- 2020 Aug 27
ShadowBan keyword blocking, improve functionality and styling for on-page apps

## Adventure 0.17.2 -- 2020 Aug 26
ShadowBan support for Facebook mobile, limit block stats to Bubbles with enough memory

## Adventure 0.17.1 -- 2020 Aug 25
Fix launch errors, improve performance

## Adventure 0.17.0 -- 2020 Aug 24
ShadowBan support for Facebook, performance improvements, diagnostic tools

## Adventure 0.16.1 -- 2020 Aug 22
Network performance boosts and security improvements

## Adventure 0.16.0 -- 2020 Aug 17
Display block stats in-page

## Adventure 0.15.7 -- 2020 Aug 10
Send notification before first bill, web UI improvements

## Adventure 0.15.6 -- 2020 Aug 6
Add flag to enable/disable logs, fix dnscrypt-proxy IP misalignment bug

## Adventure 0.15.5 -- 2020 Aug 3
Associate device with trusted client, allow setting preferred plan when adding payment method, web UI updates

## Adventure 0.15.4 -- 2020 Jul 24
Add support for trusted clients, web UI improvements

## Adventure 0.15.3 -- 2020 Jul 21
Bubble upgrade also updates MITM components

## Adventure 0.15.2 -- 2020 Jul 21
App upgrades preserve user configs

## Adventure 0.15.1 -- 2020 Jul 21
Apps are upgradable, ShadowBan support for Twitter web

## Adventure 0.14.4 -- 2020 Jul 17
Improvements to backup/restore functionality

## Adventure 0.14.3 -- 2020 Jul 16
Memory usage improvements for long-running bubbles

## Adventure 0.14.2 -- 2020 Jul 15
Introducing new web UI, various bugfixes

## Adventure 0.14.1 -- 2020 Jul 12
Launch in alternate location if first location is unavailable

## Adventure 0.14.0 -- 2020 Jul 11
Add support for upgrading bubble through web UI

## 0.13.1 -- 2020 Jul 8
Improve mitm passthru performance, bugfixes in gzip stream handling and restore bubble function

## 0.13.0 -- 2020 Jul 7
Initial restore bubble support in web UI

## 0.12.8 -- 2020 Jul 6
More reliable stop/delete bubble

## 0.12.8 -- 2020 Jul 4
Improve launch reliability, finer-grained progress meter

## 0.12.7 -- 2020 Jul 2
Improve CA cert validation, updated messages

## 0.12.6 -- 2020 Jun 30
Better device management, progress meter improvements

## 0.12.5 -- 2020 Jun 29
Detect fqdn using SNI, better blocking and more reliable TLS passthru.

## 0.12.4 -- 2020 Jun 24
Keep more spare devices, better CA certificate information, improve UI/UX.

## 0.12.2 -- 2020 Jun 24
Add support for device security levels. Improve device management.

## 0.11.3 -- 2020 Jun 19
Add app links. Add support info. Simplify email/sms messages. Update progress meter.

## 0.11.2 -- 2020 Jun 18
Use email address as login identifier. Auto-assign network name.

## 0.11.0 -- 2020 Jun 17
Simplify MITM management. Add sync password feature.

## 0.10.5 -- 2020 Jun 16
Packer support fully supported on DigitalOcean and Vultr. Add appLogin and improve auth flow.

## 0.10.0 -- 2020 Jun 7
Introduce packer support for faster deployments

## 0.9.19 -- 2020 Apr 3
Improve device setup UI and documentation

## 0.9.18 -- 2020 Mar 31
Add bubble-nodemanager service

## 0.9.17 -- 2020 Mar 22
Improve onboarding help

## 0.9.16 -- 2020 Mar 20
Enforce case insensitivity on accounts, plans, networks and nodes

## 0.9.15 -- 2020 Mar 20
Add device setup instructions

## 0.9.14 -- 2020 Mar 20
Simplified checkout and onboarding workflows

## 0.9.13 -- 2020 Mar 17
Re-fetch sage key if it has expired. Fix referer-based URL blocks. Install dnscrypt-proxy config file

## 0.9.12 -- 2020 Mar 12
Only copy app objects for enabled plan apps. Add TlsPassthru app to all plans. Add confirm password error messages.

## 0.9.11 -- 2020 Mar 11
Add deviceType, fix PostgreSQL restart error

## 0.9.10 -- 2020 Mar 10
Auto-detect TLS handshake failures, enable passthru. Add passthru check based on IP

## 0.9.9 -- 2020 Mar 10
Passthru app now working properly, dnscrypt-proxy caches lookups in redis

## 0.9.8 -- 2020 Mar 5
Add TLS passthrough app to accommodate certificate-pinned apps

## 0.9.7 -- 2020 Feb 28
Multifactor auth improvements

## 0.9.6 -- 2020 Feb 28
Proper app object creation for new accounts

## 0.9.5 -- 2020 Feb 28
Forgot password now works with TOTP auth

## 0.9.4 -- 2020 Feb 28
Render messages before delivery via delegate

## 0.9.3 -- 2020 Feb 27
Update license link

## 0.9.2 -- 2020 Feb 26
Add legal info pages, software license info

## 0.9.1 -- 2020 Feb 26
Fill in missing standard file headers

## 0.9.0 -- 2020 Feb 26
Add sub-user support, replace UI sidebar with dashboard/icons, add standard file headers

## 0.8.0 -- 2020 Feb 20
Track TOS/legal versions, add per-plan account limits, error/metric reporting

## 0.7.2 -- 2020 Feb 15
Promotional credits

## 0.7.1 -- 2020 Feb 11
User-Agent blocking, app icons.

## 0.7.0 -- 2020 Feb 08
Proper handling of non-chunked responses that must be filtered. Tons of filtering improvements.

## 0.6.0 -- 2020 Feb 06
Fix brotli-compressed transfers, simplify filter API

## 0.5.3 -- 2020 Feb 05
Apps to install can be set differently for each plan.

## 0.5.0 -- 2020 Feb 04
Manage accounts, change password. Alpha MVP.

## 0.4.4 -- 2020 Jan 29
Add Referer tracking to TrafficAnalysis

## 0.4.3 -- 2020 Jan 29
Fix tests

## 0.4.2 -- 2020 Jan 29
Add support for detailed view of recent traffic

## 0.4.1 -- 2020 Jan 29
Fix bugs in message loading and device listing

## 0.4.0 -- 2020 Jan 29
Data views for UserBlocker and TrafficAnalytics apps

## 0.3.0 -- 2020 Jan 26
read/write AppData from MITM sites working. JsUserBlocker working.

## 0.2.0 -- 2020 Jan 23
MITM integration working properly, including support for compressed HTTP streams

## 0.1.8 -- 2020 Jan 18
Send errors to errbit. Simplify deployments, fix UI bugs with login and registration 

## 0.1.7 -- 2020 Jan 13
TOTP Authenticator configuration and enforcement

## 0.1.6
Bubble launch working with progress bar. Stop Bubble working.

## 0.1.5
Initial activation working properly

## Before 0.1.4
Groundwork: overall framework, cloud services, secure inter-node communications
