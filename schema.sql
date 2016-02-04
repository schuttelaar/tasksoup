CREATE TABLE `team` ( id INTEGER PRIMARY KEY AUTOINCREMENT , `name` TEXT, `description` TEXT);
CREATE TABLE `user` ( id INTEGER PRIMARY KEY AUTOINCREMENT , `fullname` TEXT, `nick` TEXT, `email` TEXT, `phone` TEXT, `photo` TEXT);
CREATE TABLE `team_user` ( `id` INTEGER PRIMARY KEY AUTOINCREMENT  ,`team_id` INTEGER,`user_id` INTEGER  , FOREIGN KEY(`user_id`)
						 REFERENCES `user`(`id`)
						 ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY(`team_id`)
						 REFERENCES `team`(`id`)
						 ON DELETE CASCADE ON UPDATE CASCADE );
CREATE INDEX index_foreignkey_team_user_team ON `team_user` (team_id);
CREATE INDEX index_foreignkey_team_user_user ON `team_user` (user_id);
CREATE UNIQUE INDEX UQ_team_userteam_id__user_id ON `team_user` (`team_id`,`user_id`);
CREATE TABLE `period` ( `id` INTEGER PRIMARY KEY AUTOINCREMENT  ,`start` NUMERIC,`end` NUMERIC,`closed` INTEGER,`efficiency` NUMERIC,`team_id` INTEGER  , FOREIGN KEY(`team_id`)
						 REFERENCES `team`(`id`)
						 ON DELETE SET NULL ON UPDATE SET NULL );
CREATE INDEX index_foreignkey_period_team ON `period` (team_id);
CREATE TABLE `attendance` ( `id` INTEGER PRIMARY KEY AUTOINCREMENT  ,`hours` INTEGER,`period_id` INTEGER,`user_id` INTEGER  , FOREIGN KEY(`period_id`)
						 REFERENCES `period`(`id`)
						 ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY(`user_id`)
						 REFERENCES `user`(`id`)
						 ON DELETE SET NULL ON UPDATE SET NULL );
CREATE INDEX index_foreignkey_attendance_user ON `attendance` (user_id);
CREATE INDEX index_foreignkey_attendance_period ON `attendance` (period_id);
CREATE TABLE `task` ( `id` INTEGER PRIMARY KEY AUTOINCREMENT  ,`name` TEXT,`client` TEXT,`contact` TEXT,`due` TEXT,`type` INTEGER,`prio` INTEGER,`done` INTEGER,`budget` TEXT,`project` TEXT,`description` TEXT,`notes` TEXT,`progress` INTEGER,`start` NUMERIC,`end` NUMERIC,`period_id` INTEGER  , FOREIGN KEY(`period_id`)
						 REFERENCES `period`(`id`)
						 ON DELETE SET NULL ON UPDATE SET NULL );
CREATE INDEX index_foreignkey_task_period ON `task` (period_id);
CREATE TABLE `work` ( `id` INTEGER PRIMARY KEY AUTOINCREMENT  ,`hours` INTEGER,`task_id` INTEGER,`user_id` INTEGER  , FOREIGN KEY(`task_id`)
						 REFERENCES `task`(`id`)
						 ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY(`user_id`)
						 REFERENCES `user`(`id`)
						 ON DELETE SET NULL ON UPDATE SET NULL );
CREATE INDEX index_foreignkey_work_user ON `work` (user_id);
CREATE INDEX index_foreignkey_work_task ON `work` (task_id);
