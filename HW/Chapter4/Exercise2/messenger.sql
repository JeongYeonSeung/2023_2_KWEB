CREATE TABLE `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userid` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `username` VARCHAR(20) NOT NULL,
  `profile_image` VARCHAR(128) NOT NULL,
  `profile_message` VARCHAR(128) NOT NULL,
  `deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `date_joined` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `created_by` INT NOT NULL,
  `channel_link` VARCHAR(128) NOT NULL,
  `capacity` INT NOT NULL,
  `deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `date_created` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`created-by`)
  REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `message` TEXT NOT NULL,
  `created_by` INT NOT NULL,
  `channel` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`created-by`) REFERENCES `users`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`channel`) REFERENCES `channels`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `follower` INT NOT NULL,
  `followee` INT NOT NULL,
  `date_follow` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`follower`) REFERENCES `users`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`followee`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `blocked_by` INT NOT NULL,
  `blocked_user` INT NOT NULL,
  `date_block` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`blocked_by`) REFERENCES `users`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`blocked_user`) REFERENCES `users`(`id`) ON DELETE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8;