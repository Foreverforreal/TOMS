/*DELETE FROM `user_role`;
DELETE FROM `user`;
DELETE FROM role;
DELETE FROM permissions;*/


# 角色数据
INSERT role (type) VALUES ('超级管理员');
INSERT role (type) VALUES ('管理员');
INSERT role (type) VALUES ('老师');

# 权限数据
INSERT permissions (id,name,url,parent_id) values(1,'学校管理','school',0);
INSERT permissions (id,name,url,parent_id) values(2,'教务管理','teaching ',0);
INSERT permissions (id,name,url,parent_id) values(3,'资源管理','resources ',0);
INSERT permissions (id,name,url,parent_id) values(4,'运营分析','analysis',0);

INSERT permissions (id,name,url,parent_id) values(5,'学校设置','school/setting',1);
INSERT permissions (id,name,url,parent_id) values(6,'用户信息','school/setting',1);
INSERT permissions (id,name,url,parent_id) values(7,'新建学校','school/setup',1);

INSERT permissions (id,name,url,parent_id) values(8,'老师管理','teaching/teacher',2);
INSERT permissions (id,name,url,parent_id) values(9,'学生管理','teaching/student',2);
INSERT permissions (id,name,url,parent_id) values(10,'教学计划','teaching/teachingplan',2);

INSERT permissions (id,name,url,parent_id) values(11,'专业管理','resources/major',3);
INSERT permissions (id,name,url,parent_id) values(12,'课程管理','resources/course',3);

# 角色权限数据

# 用户表
INSERT user(name,password,email,phone,locked,role_id) VALUES ('admin','123456','499485575@qq.com','15538119425',false,1);