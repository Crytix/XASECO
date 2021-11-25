/*
 * Projectname: XASECO (formerly ASECO/RASP)
 * XASECO, the popular server controllers for TrackMania (abbreviated TM).
 *
 * Copyright (C) 2021  Andreas 'Crytix' Schlaupitz <me@crytix.ws>
 *
 * Releases: https://github.com/Crytix/XASECO/releases
 * Bug Tracker: https://github.com/Crytix/XASECO/issues
 * Documentation: https://github.com/Crytix/XASECO/wiki
 * Repository: https://github.com/Crytix/XASECO
 *
 * XASECO is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (GPL-3.0-only or GPL-3.0-or-later) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 * Authored & copyright 2006 by Florian Schnell <floschnell@gmail.com>
 * Re-authored & copyright May 2007 - Jul 2013 by Frans P. de Vries <tm@gamers.org>
 *
 * Visit the official site at http://www.xaseco.org/
 */

-- Database: `aseco`
--
-- --------------------------------------------------------

--
-- Tablestructure for Table `players_extra`
--

CREATE TABLE IF NOT EXISTS `players_extra` (
                                               `playerID` mediumint NOT NULL default 0,
                                               `cps` smallint NOT NULL default -1,
                                               `dedicps` smallint NOT NULL default -1,
                                               `donations` mediumint NOT NULL default 0,
                                               `style` varchar(20) NOT NULL default '',
                                               `panels` varchar(255) NOT NULL default '',
                                               PRIMARY KEY (`playerID`),
                                               KEY `donations` (`donations`)
) ENGINE=MyISAM;