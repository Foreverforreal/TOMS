DROP TABLE IF EXISTS user_role;
DROP TABLE IF EXISTS role_permissions;
DROP TABLE IF EXISTS permissions;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS school;
DROP TABLE IF EXISTS region;

DROP TABLE IF EXISTS major;
DROP TABLE IF EXISTS level;


# 角色表
CREATE TABLE IF NOT EXISTS role (
id   INT(11) PRIMARY KEY AUTO_INCREMENT,
type VARCHAR(5)
);

# 权限表
CREATE TABLE permissions
(
id        INT(5) PRIMARY KEY,
name      VARCHAR(10) NOT NULL,
url       VARCHAR(255),
parent_id INT(5)
);

# 角色_权限表
CREATE TABLE role_permissions
(
id           INT(5) PRIMARY KEY AUTO_INCREMENT,
role_id      INT(11) NOT NULL,
permission_id INT(5),
CONSTRAINT rp_role_id_fk FOREIGN KEY (role_id) REFERENCES role (id),
CONSTRAINT rp_permissin_id_fk FOREIGN KEY (permission_id) REFERENCES permissions (id)
);

# 用户表
CREATE TABLE user
(
id          INT PRIMARY KEY AUTO_INCREMENT,
name        VARCHAR(12)        NOT NULL,
password    VARCHAR(50)        NOT NULL,
email       VARCHAR(50) UNIQUE NOT NULL,
phone       VARCHAR(11),
locked      BOOLEAN         DEFAULT FALSE,
role_id     INT(5)        NOT NULL,
create_time TIMESTAMP       DEFAULT current_timestamp,
CONSTRAINT user_role_id_fk FOREIGN KEY (role_id) REFERENCES role (id)
);
CREATE UNIQUE INDEX user_name_index ON user (name);

# 用户_角色表
CREATE TABLE user_role
(
user_id INT NOT NULL,
role_id INT NOT NULL,
CONSTRAINT user_role_user_id_fk FOREIGN KEY (user_id) REFERENCES user (id),
CONSTRAINT user_role_role_id_fk FOREIGN KEY (role_id) REFERENCES role (id)
);
# 区域表
CREATE TABLE region
(
  id        INT PRIMARY KEY AUTO_INCREMENT,
  name      VARCHAR(12) NOT NULL,
  parent_id INT
);

# 学校表
CREATE TABLE school
(
  id          INT PRIMARY KEY AUTO_INCREMENT,
  name        VARCHAR(25) NOT NULL,
  region_id   INT,
  address     VARCHAR(50),
  create_time TIMESTAMP       DEFAULT current_timestamp,
  CONSTRAINT school_region_id_fk FOREIGN KEY (region_id) REFERENCES region (id)
);

# 专业等级表
CREATE TABLE level
(
  id   INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(12) NOT NULL
);

# 专业
CREATE TABLE major
(
  id    INT PRIMARY KEY AUTO_INCREMENT,
  name  VARCHAR(12) NOT NULL,
  level INT(3),
  CONSTRAINT major_level_id_fk FOREIGN KEY (level) REFERENCES level (id)
)
