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
-- Tablestructure for Table `rs_karma`
--

CREATE TABLE IF NOT EXISTS `rs_karma` (
                                          `Id` int NOT NULL auto_increment,
                                          `ChallengeId` mediumint NOT NULL default 0,
                                          `PlayerId` mediumint NOT NULL default 0,
                                          `Score` tinyint NOT NULL default 0,
                                          PRIMARY KEY (`Id`),
                                          UNIQUE KEY `PlayerId` (`PlayerId`,`ChallengeId`),
                                          KEY `ChallengeId` (`ChallengeId`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- Tablestructure for Table `rs_rank`
--

CREATE TABLE IF NOT EXISTS `rs_rank` (
                                         `playerID` mediumint NOT NULL default 0,
                                         `avg` float NOT NULL default 0,
                                         KEY `playerID` (`playerID`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

--
-- Tablestructure for Table `rs_times`
--

CREATE TABLE IF NOT EXISTS `rs_times` (
                                          `ID` int NOT NULL auto_increment,
                                          `challengeID` mediumint NOT NULL default 0,
                                          `playerID` mediumint NOT NULL default 0,
                                          `score` int NOT NULL default 0,
                                          `date` int unsigned NOT NULL default 0,
                                          `checkpoints` text NOT NULL,
                                          PRIMARY KEY (`ID`),
                                          KEY `playerID` (`playerID`,`challengeID`),
                                          KEY `challengeID` (`challengeID`)
) ENGINE=MyISAM;
