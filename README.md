# Duckling Proxy 🦆
Duckling proxy is a Gemini proxy to access the Small Web. Connecting to it with your Gemini client means you can access many web pages directly with your favourite client.

Cross platform, written in Go.

## What is the Small Web?

The Small Web are those pages on the WWW that are typically characterised:

* simple and document/content centric, using simple headings, bullets, links and tables only
* accessible to different web clients, but do not need a monster browser such as Chrome to view them
* do not require client side javascript
* do not require tracking, cookies, forms or authentication to be viewed
* can be accessed using standard HTTP GET requests
* could be rendered as text/gemini without significant loss of information
* apart from the huge commercial mega sites, a significant portion of the web

With Duckling, you can now browse the Small Web using your favourite Gemini client, and just open a standard web browser only when you need to!

## What is the Duckling proxy?

The Duckling proxy 🦆 is a scheme-specific filtering proxy for Gemini clients to access the web. It behaves as a normal Gemini server, except it retrieves its content from the web. You can tailor its behaviour when it starts, to tailor how web pages are transformed to gemtext.

It is scheme-specific, i.e. it is designed to handle HTTP requests only. [Agena](https://tildegit.org/solderpunk/agena) is another example of a scheme specific proxy, supporting <code>gopher://</code>

Web pages are translated to text/gemini. Other web resources are returned directly.

The primary intended use case for this proxy is as a personal proxy to make the web accessible to your favourite Gemini client. 

## Why is it called "Duckling"?

Small Web Daemon -> Small WebD -> Small webbed -> Duckling.

## Usage

```
Usage:

duckling-proxy [flags]

  -a, --address string          Bind to address
                                 (default "127.0.0.1")
  -m, --citationMarkers         Use footnote style citation markers
  -s, --citationStart int       Start citations from this index (default 1)
  -e, --emitImagesAsLinks       Emit links to included images
  -l, --linkEmitFrequency int   Emit gathered links through the document after this number of paragraphs (default 2)
  -T, --maxConnectTime int      Max connect time (s)
                                 (default 5)
  -t, --maxDownloadTime int     Max download time (s)
                                 (default 10)
  -n, --numberedLinks           Number the links
  -p, --port int                Server port (default 1965)
  -r, --prettyTables            Pretty tables - works with most simple tables
  -c, --serverCert string       serverCert path.
  -k, --serverKey string        serverKey path.
      --unfiltered              Do not filter text/html to text/gemini
  -u, --userAgent string        User agent for HTTP requests
  -v, --version                 Find out what version of Duckling Proxy you're running
  
```

## Remarks

* serverCert - required - path to Gemini server TLS certificate
* serverKey - required - path to Gemini server TLS private key
* All other flags are optional and you can experiment with them

You will need to configure your Gemini client to point to the server when there is a need to access any <code>http://</code> or <code>https://</code> requests.

## Supported clients

The following clients support per-scheme proxies and can be configured to use Duckling proxy.

* [Amfora](https://github.com/makeworld-the-better-one/amfora) - supports per scheme proxies since v1.5.0
* [AV-98](https://tildegit.org/solderpunk/AV-98)  - Merge [pull request #24](https://tildegit.org/solderpunk/AV-98/pulls/24) then use `set http_proxy machine:port` to access. 
* [diohsc](https://repo.or.cz/diohsc.git) - edit diohscrc config file
* [gemget](https://github.com/makeworld-the-better-one/gemget) - use -p option
* [GemiNaut](https://github.com/LukeEmmet/GemiNaut) - since 0.8.8, which also has its own native html to gemini conversion - update in settings
* [Lagrange](https://git.skyjake.fi/skyjake/lagrange) - set proxy in preferences (use 127.0.0.1:port, not localhost:port for localhost)

Let me know if your client supports per scheme proxies and I'll add it to the list.

## Installation

If you have Go installed, you can also install the latest commit it with:

```
go env -w GO111MODULE=on
go get github.com/LukeEmmet/duckling-proxy@master
```

## Feedback

Send me your thoughts and feedback to

```
luke [at] marmaladefoo [dot] com
```

## History

### 0.2.1

First publicly versioned build.

* fix bug whereby Duckling would crash on download timeout.
* removed patch for AV-98 and updated readme now that AV-98 is officially supports http proxies
* add -v version flag
* print version in footer


### 0.1

First release (unversioned), 30-Aug-2020
