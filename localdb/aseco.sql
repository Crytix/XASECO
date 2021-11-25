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
-- Tablestructure for Table `challenges`
--

CREATE TABLE IF NOT EXISTS `challenges` (
                                            `Id` mediumint NOT NULL auto_increment,
                                            `Uid` varchar(27) NOT NULL default '',
                                            `Name` varchar(100) NOT NULL default '',
                                            `Author` varchar(30) NOT NULL default '',
                                            `Environment` varchar(10) NOT NULL default '',
                                            PRIMARY KEY (`Id`),
                                            UNIQUE KEY `Uid` (`Uid`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- Tablestructure for Table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
                                         `Id` mediumint NOT NULL auto_increment,
                                         `Login` varchar(50) NOT NULL default '',
                                         `Game` varchar(3) NOT NULL default '',
                                         `NickName` varchar(100) NOT NULL default '',
                                         `Nation` varchar(3) NOT NULL default '',
                                         `UpdatedAt` datetime NOT NULL default CURRENT_TIMESTAMP,
                                         `Wins` mediumint NOT NULL default 0,
                                         `TimePlayed` int unsigned NOT NULL default 0,
                                         `TeamName` char(60) NOT NULL default '',
                                         PRIMARY KEY (`Id`),
                                         UNIQUE KEY `Login` (`Login`),
                                         KEY `Game` (`Game`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- Tablestructure for Table `records`
--

CREATE TABLE IF NOT EXISTS `records` (
                                         `Id` int NOT NULL auto_increment,
                                         `ChallengeId` mediumint NOT NULL default 0,
                                         `PlayerId` mediumint NOT NULL default 0,
                                         `Score` int NOT NULL default 0,
                                         `Date` datetime NOT NULL default CURRENT_TIMESTAMP,
                                         `Checkpoints` text NOT NULL,
                                         PRIMARY KEY (`Id`),
                                         UNIQUE KEY `PlayerId` (`PlayerId`,`ChallengeId`),
                                         KEY `ChallengeId` (`ChallengeId`)
) ENGINE=MyISAM;