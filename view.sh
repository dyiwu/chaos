#!/usr/bin/env bash

# hugo server --disableFastRender
# hugo --i18n-warnings server
# hugo server --bind=chaos.example.com --baseURL=http://chaos.example.com:1313
hugo server --bind=192.168.1.120 --baseURL=http://192.168.1.120.:1313 --disableFastRender
