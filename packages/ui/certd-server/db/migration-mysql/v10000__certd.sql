--
-- 由SQLiteStudio v3.3.3 产生的文件 周六 7月 3 00:38:02 2021
--
-- 文本编码：UTF-8
--

-- 表：cd_access
CREATE TABLE `cd_access` (`id` bigint PRIMARY KEY AUTO_INCREMENT NOT NULL, `user_id` bigint NOT NULL, `name` varchar(100) NOT NULL, `type` varchar(100) NOT NULL, `setting` varchar(1024), `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP);

-- 表：cd_cert
CREATE TABLE `cd_cert` (`id` bigint PRIMARY KEY AUTO_INCREMENT NOT NULL, `user_id` bigint NOT NULL, `domains` varchar(2048) NOT NULL, `email` varchar(100) NOT NULL, `cert_issuer_id` bigint, `challenge_type` varchar(100),  `challenge_dns_type` varchar(100),`challenge_access_id` bigint, `country` varchar(100), `state` varchar(100), `locality` varchar(100), `organization` varchar(100), `organization_unit` varchar(100), `remark` varchar(100), `last_history_id` bigint, `last_success_id` bigint, `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP);

-- 表：cd_cert_apply_history
CREATE TABLE `cd_cert_apply_history` (`id` bigint PRIMARY KEY AUTO_INCREMENT NOT NULL, `user_id` bigint NOT NULL, `cert_id` bigint NOT NULL, `success` boolean, `result` varchar(1024), `cert_crt` varchar(1024), `cert_key` varchar(1024), `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP);

-- 表：cd_cert_issuer
CREATE TABLE `cd_cert_issuer` (`id` bigint PRIMARY KEY AUTO_INCREMENT NOT NULL, `user_id` bigint NOT NULL, `type` varchar(20) NOT NULL, `account` varchar(100) NOT NULL, `private_key` varchar(1024), `setting` varchar(1024), `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP);

-- 表：cd_task
CREATE TABLE `cd_task` (`id` bigint PRIMARY KEY AUTO_INCREMENT NOT NULL, `user_id` bigint NOT NULL, `name` varchar(100), `type` varchar(100), `setting` varchar(2048), `cert_id` bigint NOT NULL, `last_history_id` bigint, `last_success_id` bigint, `remark` varchar(100), `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP);

-- 表：cd_task_history
CREATE TABLE `cd_task_history` (`id` bigint PRIMARY KEY AUTO_INCREMENT NOT NULL, `user_id` bigint NOT NULL, `task_id` bigint NOT NULL, `cert_id` bigint NOT NULL, `cert_apply_history_id` bigint NOT NULL, `success` boolean, `result` varchar(2048), `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP);

