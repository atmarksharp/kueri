#!/bin/sh

gem build kueri.gemspec
gem push kueri*.gem
rm -rf kueri*.gem
