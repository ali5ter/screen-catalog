> **⚠️ Archived 2025-08-25. No longer maintained.**

# Screen catalog
A script to generate a catalog of web application screens at different breakpoints.

This script was originally written to help visualize the web application service experience at different magnifications.

According to [the WCAG Guidelines on Reflow](https://www.w3.org/WAI/WCAG21/Understanding/reflow.html), the Reflow Success Criterion is to enable users to zoom in without having to scroll in two directions.

Each screen is captured at 3 breakpoints:
* 1280px where elements on the view will not reflow in any way
* 640px: Zooming in to 200% means the viewport is 640px (2x640 = 1280)
* 320px: Zooming in to 400% means the viewport is 320px (4x320 = 1280)

## Dependencies

### [shot-scraper](https://github.com/simonw/shot-scraper)
This utility takes the load of capturing screenshots from a virtual browser. It is written in Python so will require that you have python and pip installed.
To install `shot-scraper`, run the following

`pip install shot-scraper && shot-scraper install`

### [img2pdf](https://gitlab.mister-muffin.de/josch/img2pdf#usage)
This utility creates a pdf of a set of images. It is also written in Python.
To install `img2pdf`, run the following

`pip install img2pdf`

Note: You only need this dependency if you generate a pdf of the screenshots using `./generate pdf`

## Initializing
Web applications, or SaaS platforms, typically use [JSON Web Token (JWT) authentication using AccessToken and RefreshToken](https://afteracademy.com/blog/implement-json-web-token-jwt-authentication-using-access-token-and-refresh-token). So that `shot-scraper` can access our platform to generate screenshots, an authentication context file must be generated. This file is created from the authentication and state information in the browser storage after you manually log into the TMC service.

Generate an auth context by using the following command, logging into the web application service in the browser when prompted, and pressing enter back on the command line once you're authenticated into the application.

`./generate auth`

The auth context is stored in a json file defined in [`config.sh`](config.sh).

Since the RefreshTokens expire, you may find you need to run this command if you find the screen shots display an authentication error.

## Generating a new catalog

Create a new catalog of screen shots using the following command.

`./generate`

A new catalog of screenshots will appear under a directory named using a timestamp, e.g. `screens_2022050416`. In this directory there will be a `catalog.html` file.

The timestamp used to name the directory reflects the current hour. This way you have up to the next hour to capture the screens you want before another directory is created.

Screenshots will be not be taken if they already appear in this directory. If you reconfigure the screens to be captured, you can re-run the generate script and only those that are not already in the directory will be captured.

## Configuring

### Defining screens to be captured
A list of screens that should appear in the catalog is configured in the [`screens.txt`](screens.txt) file.

This file lists the URL Path of the screens only and not the full URL. The full web application service URL is hardcoded as a global variable in [`config.sh`](config.sh).

### Script configuration
Settings that the [`generate`](generate) script uses can be found in [`config.sh`](config.sh).

This file allows you to configure things like web application service you want to target, where the authentication context file is saved, height of the captured screens, time to wait for a screen to load, etc.

### Changing the resulting html
The resulting `catalog.html` file uses a couple of templates; one for each group of breakpoint images, [`section.tmpl.html`](assets/section.tmpl.html) and one for the surrounding page, [`catalog.tmpl.html`](assets/catalog.tmpl.html). 