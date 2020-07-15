# Bubble Version History

## Before 0.1.4
Groundwork: overall framework, cloud services, secure inter-node communications

## 0.1.5
Initial activation working properly

## 0.1.6
Bubble launch working with progress bar. Stop Bubble working.

## 0.1.7 -- 2020 Jan 13
TOTP Authenticator configuration and enforcement

## 0.1.8 -- 2020 Jan 18
Send errors to errbit. Simplify deployments, fix UI bugs with login and registration 

## 0.2.0 -- 2020 Jan 23
MITM integration working properly, including support for compressed HTTP streams

## 0.3.0 -- 2020 Jan 26
read/write AppData from MITM sites working. JsUserBlocker working.

## 0.4.0 -- 2020 Jan 29
Data views for UserBlocker and TrafficAnalytics apps

## 0.4.1 -- 2020 Jan 29
Fix bugs in message loading and device listing

## 0.4.2 -- 2020 Jan 29
Add support for detailed view of recent traffic

## 0.4.3 -- 2020 Jan 29
Fix tests

## 0.4.4 -- 2020 Jan 29
Add Referer tracking to TrafficAnalysis

## 0.5.0 -- 2020 Feb 04
Manage accounts, change password. Alpha MVP.

## 0.5.3 -- 2020 Feb 05
Apps to install can be set differently for each plan.

## 0.6.0 -- 2020 Feb 06
Fix brotli-compressed transfers, simplify filter API

## 0.7.0 -- 2020 Feb 08
Proper handling of non-chunked responses that must be filtered. Tons of filtering improvements.

## 0.7.1 -- 2020 Feb 11
User-Agent blocking, app icons.

## 0.7.2 -- 2020 Feb 15
Promotional credits

## 0.8.0 -- 2020 Feb 20
Track TOS/legal versions, add per-plan account limits, error/metric reporting

## 0.9.0 -- 2020 Feb 26
Add sub-user support, replace UI sidebar with dashboard/icons, add standard file headers

## 0.9.1 -- 2020 Feb 26
Fill in missing standard file headers

## 0.9.2 -- 2020 Feb 26
Add legal info pages, software license info

## 0.9.3 -- 2020 Feb 27
Update license link

## 0.9.4 -- 2020 Feb 28
Render messages before delivery via delegate

## 0.9.5 -- 2020 Feb 28
Forgot password now works with TOTP auth

## 0.9.6 -- 2020 Feb 28
Proper app object creation for new accounts

## 0.9.7 -- 2020 Feb 28
Multifactor auth improvements

## 0.9.8 -- 2020 Mar 5
Add TLS passthrough app to accommodate certificate-pinned apps

## 0.9.9 -- 2020 Mar 10
Passthru app now working properly, dnscrypt-proxy caches lookups in redis

## 0.9.10 -- 2020 Mar 10
Auto-detect TLS handshake failures, enable passthru. Add passthru check based on IP

## 0.9.11 -- 2020 Mar 11
Add deviceType, fix PostgreSQL restart error

## 0.9.12 -- 2020 Mar 12
Only copy app objects for enabled plan apps. Add TlsPassthru app to all plans. Add confirm password error messages.

## 0.9.13 -- 2020 Mar 17
Re-fetch sage key if it has expired. Fix referer-based URL blocks. Install dnscrypt-proxy config file

## 0.9.14 -- 2020 Mar 20
Simplified checkout and onboarding workflows

## 0.9.15 -- 2020 Mar 20
Add device setup instructions

## 0.9.16 -- 2020 Mar 20
Enforce case insensitivity on accounts, plans, networks and nodes

## 0.9.17 -- 2020 Mar 22
Improve onboarding help

## 0.9.18 -- 2020 Mar 31
Add bubble-nodemanager service

## 0.9.19 -- 2020 Apr 3
Improve device setup UI and documentation

## 0.10.0 -- 2020 Jun 7
Introduce packer support for faster deployments

## 0.10.5 -- 2020 Jun 16
Packer support fully supported on DigitalOcean and Vultr. Add appLogin and improve auth flow.

## 0.11.0 -- 2020 Jun 17
Simplify MITM management. Add sync password feature.

## 0.11.2 -- 2020 Jun 18
Use email address as login identifier. Auto-assign network name.

## 0.11.3 -- 2020 Jun 19
Add app links. Add support info. Simplify email/sms messages. Update progress meter.

## 0.12.2 -- 2020 Jun 24
Add support for device security levels. Improve device management.

## 0.12.4 -- 2020 Jun 24
Keep more spare devices, better CA certificate information, improve UI/UX.

## 0.12.5 -- 2020 Jun 29
Detect fqdn using SNI, better blocking and more reliable TLS passthru.

## 0.12.6 -- 2020 Jun 30
Better device management, progress meter improvements

## 0.12.7 -- 2020 Jul 2
Improve CA cert validation, updated messages

## 0.12.8 -- 2020 Jul 4
Improve launch reliability, finer-grained progress meter

## 0.12.8 -- 2020 Jul 6
More reliable stop/delete bubble

## 0.13.0 -- 2020 Jul 7
Initial restore bubble support in web UI

## 0.13.1 -- 2020 Jul 8
Improve mitm passthru performance, bugfixes in gzip stream handling and restore bubble function.

## Adventure 0.14.0 -- 2020 Jul 11
Add support for upgrading bubble through web UI

## Adventure 0.14.1 -- 2020 Jul 12
Launch in alternate location if first location is unavailable

## Adventure 0.14.2 -- 2020 Jul 15
Introducing new web UI, various bugfixes
