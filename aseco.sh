#!/bin/sh
#
# Projectname: XASECO (formerly ASECO/RASP)
# XASECO, the popular server controllers for TrackMania (abbreviated TM).
#
# Copyright (C) 2021  Andreas 'Crytix' Schlaupitz <me@crytix.ws>
#
# Releases: https://github.com/Crytix/XASECO/releases
# Bug Tracker: https://github.com/Crytix/XASECO/issues
# Documentation: https://github.com/Crytix/XASECO/wiki
# Repository: https://github.com/Crytix/XASECO
#
# XASECO is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (GPL-3.0-only or GPL-3.0-or-later) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# Authored & copyright 2006 by Florian Schnell <floschnell@gmail.com>
# Re-authored & copyright May 2007 - Jul 2013 by Frans P. de Vries <tm@gamers.org>
#
# Visit the official site at http://www.xaseco.org/
#

# Game must be TMN or TMF
GAME="TMF"

cd /home/tmn/xaseco
php aseco.php $GAME </dev/null >aseco.log 2>&1 &
echo $!
