#!/bin/sh
csplit OTW0-2F.PATCH '/^diff/' '{*}' -f OTW -b %X.PATCH
