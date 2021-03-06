CREATE TABLE `cache` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `despawn` int(11) DEFAULT NULL,
  `hatch` int(11) DEFAULT NULL,
  `raid_end` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `gym-info` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `park` tinyint(1) NOT NULL,
  `gym_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `url` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  KEY `geocoded_id` (`id`),
  KEY `geocoded_park` (`park`),
  KEY `geocoded_gym_name` (`gym_name`),
  KEY `geocoded_latitude_longitude` (`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `humans` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alerts_sent` int(11) NOT NULL DEFAULT 0,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `map_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `area` TEXT NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `humans_name` (`name`),
  KEY `humans_alerts_sent` (`alerts_sent`),
  KEY `humans_latitude_longitude` (`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `monsters` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `pokemon_id` smallint(6) NOT NULL,
  `distance` int(11) NOT NULL,
  `min_iv` smallint(3) NOT NULL,
  `max_iv` smallint(3) NOT NULL,
  `min_cp` smallint(6) NOT NULL,
  `max_cp` smallint(6) NOT NULL,
  `min_level` smallint(2) NOT NULL,
  `max_level` smallint(2) NOT NULL,
  `atk` smallint(2) NOT NULL,
  `def` smallint(2) NOT NULL,
  `sta` smallint(2) NOT NULL,
  `min_weight` double NOT NULL,
  `max_weight` double NOT NULL,
  PRIMARY KEY monsters_tracking (`id`, `pokemon_id`),
  KEY `monsters_pokemon_id` (`pokemon_id`),
  KEY `monsters_distance` (`distance`),
  KEY `monsters_min_iv` (`min_iv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `raid` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `pokemon_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `park` tinyint(1) NOT NULL,
  `distance` int(11) NOT NULL,
  `team` smallint(1) DEFAULT 4,
  PRIMARY KEY raid_tracking (`id`, `pokemon_id`),
  KEY `raid_pokemon_id` (`pokemon_id`),
  KEY `raid_distance` (`distance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `egg` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `raid_level` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `park` tinyint(1) NOT NULL,
  `distance` int(11) NOT NULL,
  `team` smallint(1) DEFAULT 4,
  PRIMARY KEY egg_tracking (`id`, `raid_level`),
  KEY `raid_level` (`raid_level`),
  KEY `raid_distance` (`distance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `schema_version` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `val` smallint(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `schema_version` WRITE;
/*!40000 ALTER TABLE `schema_version` DISABLE KEYS */;

INSERT INTO `schema_version` (`key`, `val`)
VALUES
  ('db_version',1);

/*!40000 ALTER TABLE `schema_version` ENABLE KEYS */;
UNLOCK TABLES;