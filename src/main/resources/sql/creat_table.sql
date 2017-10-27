
# ������ɫ��
CREATE TABLE IF NOT EXISTS role(
  id SMALLINT(11) PRIMARY KEY AUTO_INCREMENT,
  type varchar(5)
);
INSERT role(type) values("����Ա");
INSERT role(type) values("��ʦ");

# ��������Ȩ�ޱ�
CREATE TABLE operation
(
  id INT(5) PRIMARY KEY ,
  name VARCHAR(10) NOT NULL,
  parent_id INT(5)
);

INSERT operation (id,name,parent_id) values(1,'�û�����',0);

# ������ɫȨ�ޱ�
CREATE TABLE permissions
(
  id SMALLINT(5) PRIMARY KEY AUTO_INCREMENT,
  role_id SMALLINT(11) NOT NULL,
  operation_id VARCHAR(10),
  CONSTRAINT permissions_op_id_fk FOREIGN KEY (operation_id) REFERENCES operation(id)
);


# �����û���
CREATE TABLE user
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(12) NOT NULL,
    password VARCHAR(12) NOT NULL,
    role_id SMALLINT(5) NOT NULL,
    phone VARCHAR(11),
    create_time TIMESTAMP DEFAULT current_timestamp,
    CONSTRAINT user_role_id_fk FOREIGN KEY (role_id) REFERENCES role (id)
);
CREATE UNIQUE INDEX user_name_index ON user (name);

# ����ʡ�б�
CREATE TABLE region
(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(12) NOT NULL,
  parent_id INT
);

# ����ѧУ��
CREATE TABLE school
(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(25) NOT NULL,
  region_id INT,
  address VARCHAR(50),
  create_time TIMESTAMP DEFAULT current_timestamp,
  CONSTRAINT school_region_id_fk FOREIGN KEY (region_id) REFERENCES region (id)
);

# ����רҵ�ȼ���
CREATE TABLE level
(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(12) NOT NULL
);

# ����רҵ��
CREATE TABLE major
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(12) NOT NULL,
    level SMALLINT(3),
    CONSTRAINT major_level_id_fk FOREIGN KEY (level) REFERENCES level (id)
)
