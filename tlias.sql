create database if not exists tlias default charset utf8mb4;

use tlias;

CREATE TABLE `clazz` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID,主键',
  `name` varchar(30) NOT NULL COMMENT '班级名称',
  `room` varchar(20) DEFAULT NULL COMMENT '班级教室',
  `begin_date` date NOT NULL COMMENT '开课时间',
  `end_date` date NOT NULL COMMENT '结课时间',
  `master_id` int unsigned DEFAULT NULL COMMENT '班主任ID, 关联员工表ID',
  `subject` tinyint unsigned NOT NULL COMMENT '学科, 1:java, 2:前端, 3:大数据, 4:Python, 5:Go, 6: 嵌入式',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='班级表';

INSERT INTO `clazz` VALUES (1,'JavaEE就业163期','212','2023-04-30','2023-06-29',10,1,'2023-06-01 17:08:23','2023-06-01 17:39:58'),(4,'前端就业90期','210','2023-07-10','2024-01-20',3,2,'2023-06-01 17:45:12','2023-06-01 17:45:12'),(5,'JavaEE就业165期','108','2023-06-15','2023-12-25',6,1,'2023-06-01 17:45:40','2023-06-01 17:45:40'),(6,'JavaEE就业166期','105','2023-07-20','2024-02-20',20,1,'2023-06-01 17:46:10','2023-06-01 17:46:10'),(7,'大数据就业58期','209','2023-08-01','2024-02-15',7,3,'2023-06-01 17:51:21','2023-06-01 17:51:21'),(8,'JavaEE就业167期','325','2023-11-20','2024-05-10',36,1,'2023-11-15 11:35:46','2023-12-13 14:31:24'),(10,'java417期','207','2023-11-27','2025-12-11',6,1,'2023-12-13 16:38:52','2023-12-13 16:38:52');



CREATE TABLE `dept` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID, 主键',
  `name` varchar(10) NOT NULL COMMENT '部门名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

INSERT INTO `dept` VALUES (1,'学工部','2023-09-25 09:47:40','2023-12-09 10:13:02'),(2,'教研部','2023-09-25 09:47:40','2023-10-09 15:17:04'),(3,'咨询部','2023-09-25 09:47:40','2023-12-09 10:09:40'),(4,'就业部','2023-09-25 09:47:40','2023-09-25 09:47:40'),(5,'人事部','2023-09-25 09:47:40','2023-09-25 09:47:40'),(15,'行政部','2023-11-30 20:56:37','2023-11-30 20:56:37');



CREATE TABLE `emp` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID,主键',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '123456' COMMENT '密码',
  `name` varchar(10) NOT NULL COMMENT '姓名',
  `gender` tinyint unsigned NOT NULL COMMENT '性别, 1:男, 2:女',
  `phone` char(11) NOT NULL COMMENT '手机号',
  `job` tinyint unsigned DEFAULT NULL COMMENT '职位, 1:班主任,2:讲师,3:学工主管,4:教研主管,5:咨询师',
  `salary` int unsigned DEFAULT NULL COMMENT '薪资',
  `image` varchar(300) DEFAULT NULL COMMENT '头像',
  `entry_date` date DEFAULT NULL COMMENT '入职日期',
  `dept_id` int unsigned DEFAULT NULL COMMENT '关联的部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `emp_pk` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='员工表';

INSERT INTO `emp` VALUES (1,'shinaian','123456','施耐庵',1,'13309090001',4,15000,'https://web2024.oss-cn-beijing.aliyuncs.com/b21a6a3a-008f-43ee-8424-642c2b909475.png','2000-01-01',2,'2023-10-20 16:35:33','2023-11-16 16:11:26'),(2,'songjiang','123456','宋江',1,'13309090002',2,8600,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2015-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:35:37'),(3,'lujunyi','123456','卢俊义',1,'13309090003',2,8900,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2008-05-01',2,'2023-10-20 16:35:33','2023-10-20 16:35:39'),(4,'wuyong','123456','吴用',1,'13309090004',2,9200,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2007-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:35:41'),(5,'gongsunsheng','123456','公孙胜',1,'13309090005',2,9500,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2012-12-05',2,'2023-10-20 16:35:33','2023-10-20 16:35:43'),(6,'huosanniang','123456','扈三娘',2,'13309090006',3,6500,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2013-09-05',1,'2023-10-20 16:35:33','2023-10-20 16:35:45'),(7,'chaijin','123456','柴进',1,'13309090007',1,4700,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2005-08-01',1,'2023-10-20 16:35:33','2023-10-20 16:35:47'),(8,'likui','123456','李逵',1,'13309090008',1,4800,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2014-11-09',1,'2023-10-20 16:35:33','2023-10-20 16:35:49'),(9,'wusong','123456','武松',1,'13309090009',1,4900,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2011-03-11',1,'2023-10-20 16:35:33','2023-10-20 16:35:51'),(10,'linchong','123456','林冲',1,'13309090010',1,5000,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2013-09-05',1,'2023-10-20 16:35:33','2023-10-20 16:35:53'),(11,'huyanzhuo','123456','呼延灼',1,'13309090011',2,9700,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2007-02-01',2,'2023-10-20 16:35:33','2023-10-20 16:35:55'),(12,'xiaoliguang','123456','小李广',1,'13309090012',2,10000,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2008-08-18',2,'2023-10-20 16:35:33','2023-10-20 16:35:57'),(13,'yangzhi','123456','杨志',1,'13309090013',1,5300,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2012-11-01',1,'2023-10-20 16:35:33','2023-10-20 16:35:59'),(14,'shijin','123456','史进',1,'13309090014',2,10600,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2002-08-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:01'),(15,'sunerniang','123456','孙二娘',2,'13309090015',2,10900,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2011-05-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:03'),(16,'luzhishen','123456','鲁智深',1,'13309090016',2,9600,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2010-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:05'),(17,'liying','12345678','李应',1,'13309090017',1,5800,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2015-03-21',1,'2023-10-20 16:35:33','2023-10-20 16:36:07'),(18,'shiqian','123456','时迁',1,'13309090018',2,10200,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2015-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:09'),(19,'gudasao','123456','顾大嫂',2,'13309090019',2,10500,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2008-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:11'),(20,'ruanxiaoer','123456','阮小二',1,'13309090020',2,10800,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2018-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:13'),(21,'ruanxiaowu','123456','阮小五',1,'13309090021',5,5200,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2015-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:15'),(22,'ruanxiaoqi','123456','阮小七',1,'13309090022',5,5500,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2016-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:17'),(23,'ruanji','123456','阮籍',1,'13309090023',5,5800,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2012-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:19'),(24,'tongwei','123456','童威',1,'13309090024',5,5000,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2006-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:21'),(25,'tongmeng','123456','童猛',1,'13309090025',5,4800,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2002-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:23'),(26,'yanshun','123456','燕顺',1,'13309090026',5,5400,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2011-01-01',3,'2023-10-20 16:35:33','2023-11-08 22:12:46'),(27,'lijun','123456','李俊',1,'13309090027',2,6600,'https://web2024.oss-cn-beijing.aliyuncs.com/a0a3b5cd-33a5-4d1c-9985-9f211b0a3c98.png','2004-01-01',2,'2023-10-20 16:35:33','2023-11-16 17:56:59'),(28,'lizhong','123456','李忠',1,'13309090028',5,5000,'https://web2024.oss-cn-beijing.aliyuncs.com/4b85bab7-b306-4e98-a5a5-7ca2e3b740a6.png','2007-01-01',3,'2023-10-20 16:35:33','2023-11-17 16:34:22'),(30,'liyun','123456','李云',1,'13309090030',NULL,NULL,'https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png','2020-03-01',NULL,'2023-10-20 16:35:33','2023-10-20 16:36:31'),(36,'linghuchong','123456','令狐冲',1,'18809091212',2,6800,'https://web2024.oss-cn-beijing.aliyuncs.com/2deb4904-5361-4a85-a46f-53fd9bbc1aa1.png','2023-10-19',2,'2023-10-20 20:44:54','2023-11-09 09:41:04');



CREATE TABLE `emp_expr` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID, 主键',
  `emp_id` int unsigned DEFAULT NULL COMMENT '员工ID',
  `begin` date DEFAULT NULL COMMENT '开始时间',
  `end` date DEFAULT NULL COMMENT '结束时间',
  `company` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `job` varchar(50) DEFAULT NULL COMMENT '职位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工作经历';

INSERT INTO `emp_expr` VALUES (29,36,'2021-10-01','2022-11-01','阿里巴巴有限公司','架构师'),(30,36,'2022-11-01','2023-11-01','字节跳动科技有限公司','架构师');




CREATE TABLE `emp_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID, 主键',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `info` varchar(2000) DEFAULT NULL COMMENT '日志信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='员工日志表';

INSERT INTO `emp_log` VALUES (2,'2023-10-26 09:56:37','Emp(id=41, username=Tom2, password=null, name=汤姆2, gender=1, phone=18809091235, job=1, salary=12000, image=https://web-framework.oss-cn-hangzhou.aliyuncs.com/2022-09-03-07-37-38222.jpg, entryDate=2012-09-10, deptId=1, createTime=2023-10-26T09:56:37.194149900, updateTime=2023-10-26T09:56:37.194149900, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=null, end=null, company=百度科技股份有限公司, job=java开发), EmpExpr(id=null, empId=null, begin=null, end=null, company=阿里巴巴科技股份有限公司, job=架构师), EmpExpr(id=null, empId=null, begin=null, end=null, company=字节跳动科技股份有限公司, job=CTO)])'),(3,'2023-10-26 10:05:03','Emp(id=42, username=Tom2, password=null, name=汤姆2, gender=1, phone=18809091235, job=1, salary=12000, image=https://web-framework.oss-cn-hangzhou.aliyuncs.com/2022-09-03-07-37-38222.jpg, entryDate=2012-09-10, deptId=1, createTime=2023-10-26T10:05:03.060784800, updateTime=2023-10-26T10:05:03.060784800, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=null, end=null, company=百度科技股份有限公司, job=java开发), EmpExpr(id=null, empId=null, begin=null, end=null, company=阿里巴巴科技股份有限公司, job=架构师), EmpExpr(id=null, empId=null, begin=null, end=null, company=字节跳动科技股份有限公司, job=CTO)])');




CREATE TABLE `operate_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `operate_emp_id` int unsigned DEFAULT NULL COMMENT '操作人ID',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `class_name` varchar(100) DEFAULT NULL COMMENT '操作的类名',
  `method_name` varchar(100) DEFAULT NULL COMMENT '操作的方法名',
  `method_params` varchar(1000) DEFAULT NULL COMMENT '方法参数',
  `return_value` varchar(2000) DEFAULT NULL COMMENT '返回值',
  `cost_time` bigint DEFAULT NULL COMMENT '方法执行耗时, 单位:ms',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志表';

INSERT INTO `operate_log` VALUES (1,10,'2023-11-08 20:52:07','com.itheima.controller.DeptController','update','[Dept(id=7, name=综合服务部2, createTime=2023-10-09T14:34:57, updateTime=2023-10-12T15:44:03)]','{\"code\":1,\"msg\":\"success\"}',8),(2,10,'2023-11-08 20:52:13','com.itheima.controller.DeptController','update','[Dept(id=7, name=综合服务部, createTime=2023-10-09T14:34:57, updateTime=2023-11-08T20:52:07)]','{\"code\":1,\"msg\":\"success\"}',9),(3,10,'2023-11-08 20:52:50','com.itheima.controller.DeptController','delete','[7]','{\"code\":1,\"msg\":\"success\"}',7),(4,10,'2023-11-08 20:52:56','com.itheima.controller.DeptController','add','[Dept(id=null, name=后勤部, createTime=null, updateTime=null)]','{\"code\":1,\"msg\":\"success\"}',9),(5,10,'2023-11-08 22:11:01','com.itheima.controller.DeptController','update','[Dept(id=11, name=后勤部, createTime=2023-11-08T20:52:56, updateTime=2023-11-08T20:52:56)]','{\"code\":1,\"msg\":\"success\"}',14),(6,10,'2023-11-08 22:11:03','com.itheima.controller.DeptController','delete','[11]','{\"code\":1,\"msg\":\"success\"}',11),(7,10,'2023-11-08 22:11:07','com.itheima.controller.EmpController','update','[Emp(id=36, username=linghuchong, password=123456, name=令狐冲, gender=1, phone=18809091212, job=2, salary=6800, image=https://web2024.oss-cn-beijing.aliyuncs.com/2deb4904-5361-4a85-a46f-53fd9bbc1aa1.png, entryDate=2023-10-19, deptId=2, createTime=2023-10-20T20:44:54, updateTime=2023-10-20T20:44:54, deptName=null, exprList=[EmpExpr(id=21, empId=36, begin=2021-10-01, end=2022-11-01, company=阿里巴巴有限公司, job=架构师), EmpExpr(id=22, empId=36, begin=2022-11-01, end=2023-11-01, company=字节跳动科技有限公司, job=架构师)])]','{\"code\":1,\"msg\":\"success\"}',21),(8,10,'2023-11-08 22:11:09','com.itheima.controller.EmpController','update','[Emp(id=29, username=songqing, password=123456, name=宋清, gender=1, phone=13309090029, job=null, salary=5100, image=https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png, entryDate=2020-01-01, deptId=null, createTime=2023-10-20T16:35:33, updateTime=2023-10-20T16:36:31, deptName=null, exprList=[EmpExpr(id=18, empId=29, begin=2020-01-01, end=2023-09-01, company=阿里巴巴有限公司, job=Java开发)])]','{\"code\":1,\"msg\":\"success\"}',7),(9,10,'2023-11-08 22:11:18','com.itheima.controller.EmpController','update','[Emp(id=29, username=songqing, password=123456, name=宋清, gender=1, phone=13309090029, job=1, salary=5100, image=https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png, entryDate=2020-01-01, deptId=1, createTime=2023-10-20T16:35:33, updateTime=2023-11-08T22:11:09, deptName=null, exprList=[EmpExpr(id=25, empId=29, begin=2020-01-01, end=2023-09-01, company=阿里巴巴有限公司, job=Java开发)])]','{\"code\":1,\"msg\":\"success\"}',7),(10,10,'2023-11-08 22:11:22','com.itheima.controller.EmpController','delete','[[29]]','{\"code\":1,\"msg\":\"success\"}',14),(11,10,'2023-11-08 22:12:38','com.itheima.controller.EmpController','update','[Emp(id=26, username=yanshun, password=123456, name=燕顺, gender=1, phone=13309090026, job=5, salary=5400, image=https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png, entryDate=2011-01-01, deptId=3, createTime=2023-10-20T16:35:33, updateTime=2023-10-20T16:36:25, deptName=null, exprList=[])]','{\"code\":1,\"msg\":\"success\"}',13),(12,10,'2023-11-08 22:12:40','com.itheima.controller.EmpController','update','[Emp(id=28, username=lizhong, password=123456, name=李忠, gender=1, phone=13309090028, job=5, salary=5000, image=https://web2024.oss-cn-beijing.aliyuncs.com/0a729f03-99d3-4428-a8db-76bd7425fa09.jpg, entryDate=2007-01-01, deptId=3, createTime=2023-10-20T16:35:33, updateTime=2023-10-20T16:36:29, deptName=null, exprList=[])]','{\"code\":1,\"msg\":\"success\"}',11),(13,10,'2023-11-08 22:12:42','com.itheima.controller.EmpController','update','[Emp(id=26, username=yanshun, password=123456, name=燕顺, gender=1, phone=13309090026, job=5, salary=5400, image=https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png, entryDate=2011-01-01, deptId=3, createTime=2023-10-20T16:35:33, updateTime=2023-11-08T22:12:38, deptName=null, exprList=[])]','{\"code\":1,\"msg\":\"success\"}',11),(14,10,'2023-11-08 22:12:46','com.itheima.controller.EmpController','update','[Emp(id=26, username=yanshun, password=123456, name=燕顺, gender=1, phone=13309090026, job=5, salary=5400, image=https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png, entryDate=2011-01-01, deptId=3, createTime=2023-10-20T16:35:33, updateTime=2023-11-08T22:12:42, deptName=null, exprList=[])]','{\"code\":1,\"msg\":\"success\"}',7),(15,10,'2023-11-08 22:12:48','com.itheima.controller.EmpController','update','[Emp(id=27, username=lijun, password=123456, name=李俊, gender=1, phone=13309090027, job=5, salary=6600, image=https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png, entryDate=2004-01-01, deptId=3, createTime=2023-10-20T16:35:33, updateTime=2023-10-20T16:36:27, deptName=null, exprList=[])]','{\"code\":1,\"msg\":\"success\"}',11),(16,10,'2023-11-08 22:12:53','com.itheima.controller.EmpController','update','[Emp(id=1, username=shinaian, password=123456, name=施耐庵, gender=1, phone=13309090001, job=4, salary=15000, image=https://dawn-itcast.oss-cn-hangzhou.aliyuncs.com/01.png, entryDate=2000-01-01, deptId=2, createTime=2023-10-20T16:35:33, updateTime=2023-10-20T16:35:35, deptName=null, exprList=[])]','{\"code\":1,\"msg\":\"success\"}',11),(17,10,'2023-11-08 22:13:11','com.itheima.controller.EmpController','update','[Emp(id=36, username=linghuchong, password=123456, name=令狐冲, gender=1, phone=18809091212, job=2, salary=6800, image=https://web2024.oss-cn-beijing.aliyuncs.com/2deb4904-5361-4a85-a46f-53fd9bbc1aa1.png, entryDate=2023-10-19, deptId=2, createTime=2023-10-20T20:44:54, updateTime=2023-11-08T22:11:07, deptName=null, exprList=[EmpExpr(id=23, empId=36, begin=2021-10-01, end=2022-11-01, company=阿里巴巴有限公司, job=架构师), EmpExpr(id=24, empId=36, begin=2022-11-01, end=2023-11-01, company=字节跳动科技有限公司, job=架构师)])]','{\"code\":1,\"msg\":\"success\"}',11),(18,10,'2023-11-09 09:40:54','com.itheima.controller.DeptController','update','[Dept(id=6, name=行政部, createTime=2023-09-27T14:00, updateTime=2023-09-27T14:00)]','{\"code\":1,\"msg\":\"success\"}',28),(19,10,'2023-11-09 09:41:04','com.itheima.controller.EmpController','update','[Emp(id=36, username=linghuchong, password=123456, name=令狐冲, gender=1, phone=18809091212, job=2, salary=6800, image=https://web2024.oss-cn-beijing.aliyuncs.com/2deb4904-5361-4a85-a46f-53fd9bbc1aa1.png, entryDate=2023-10-19, deptId=2, createTime=2023-10-20T20:44:54, updateTime=2023-11-08T22:13:11, deptName=null, exprList=[EmpExpr(id=27, empId=36, begin=2021-10-01, end=2022-11-01, company=阿里巴巴有限公司, job=架构师), EmpExpr(id=28, empId=36, begin=2022-11-01, end=2023-11-01, company=字节跳动科技有限公司, job=架构师)])]','{\"code\":1,\"msg\":\"success\"}',20),(20,2,'2023-11-09 09:41:31','com.itheima.controller.DeptController','update','[Dept(id=6, name=行政部, createTime=2023-09-27T14:00, updateTime=2023-11-09T09:40:54)]','{\"code\":1,\"msg\":\"success\"}',6),(21,10,'2023-11-16 15:54:14','com.itheima.controller.DeptController','add','[Dept(id=null, name=后勤部, createTime=null, updateTime=null)]','{\"code\":1,\"msg\":\"success\"}',6),(22,10,'2023-11-16 15:54:21','com.itheima.controller.DeptController','update','[Dept(id=12, name=后勤部2, createTime=2023-11-16T15:54:14, updateTime=2023-11-16T15:54:14)]','{\"code\":1,\"msg\":\"success\"}',5),(23,10,'2023-11-16 15:54:26','com.itheima.controller.DeptController','update','[Dept(id=12, name=后勤部, createTime=2023-11-16T15:54:14, updateTime=2023-11-16T15:54:21)]','{\"code\":1,\"msg\":\"success\"}',4),(24,10,'2023-11-16 15:54:29','com.itheima.controller.DeptController','add','[Dept(id=null, name=22, createTime=null, updateTime=null)]','{\"code\":1,\"msg\":\"success\"}',3),(25,10,'2023-11-16 15:54:32','com.itheima.controller.DeptController','delete','[13]','{\"code\":1,\"msg\":\"success\"}',9),(26,10,'2023-11-16 16:11:26','com.itheima.controller.EmpController','update','[Emp(id=1, username=shinaian, password=123456, name=施耐庵, gender=1, phone=13309090001, job=4, salary=15000, image=https://web2024.oss-cn-beijing.aliyuncs.com/b21a6a3a-008f-43ee-8424-642c2b909475.png, entryDate=2000-01-01, deptId=2, createTime=2023-10-20T16:35:33, updateTime=2023-11-08T22:12:53, deptName=null, exprList=[])]','{\"code\":1,\"msg\":\"success\"}',34),(27,10,'2023-11-16 17:56:46','com.itheima.controller.EmpController','update','[Emp(id=27, username=lijun, password=123456, name=李俊, gender=1, phone=13309090027, job=5, salary=6600, image=https://web2024.oss-cn-beijing.aliyuncs.com/a0a3b5cd-33a5-4d1c-9985-9f211b0a3c98.png, entryDate=2004-01-01, deptId=3, createTime=2023-10-20T16:35:33, updateTime=2023-11-08T22:12:48, deptName=null, exprList=[])]','{\"code\":1,\"msg\":\"success\"}',7),(28,10,'2023-11-16 17:56:59','com.itheima.controller.EmpController','update','[Emp(id=27, username=lijun, password=123456, name=李俊, gender=1, phone=13309090027, job=2, salary=6600, image=https://web2024.oss-cn-beijing.aliyuncs.com/a0a3b5cd-33a5-4d1c-9985-9f211b0a3c98.png, entryDate=2004-01-01, deptId=2, createTime=2023-10-20T16:35:33, updateTime=2023-11-16T17:56:46, deptName=null, exprList=[])]','{\"code\":1,\"msg\":\"success\"}',16),(29,10,'2023-11-17 16:34:00','com.itheima.controller.DeptController','add','[Dept(id=null, name=开发一部, createTime=null, updateTime=null)]','{\"code\":1,\"msg\":\"success\"}',4),(30,10,'2023-11-17 16:34:06','com.itheima.controller.DeptController','update','[Dept(id=14, name=开发部, createTime=2023-11-17T16:34, updateTime=2023-11-17T16:34)]','{\"code\":1,\"msg\":\"success\"}',7),(31,10,'2023-11-17 16:34:11','com.itheima.controller.DeptController','delete','[14]','{\"code\":1,\"msg\":\"success\"}',4),(32,10,'2023-11-17 16:34:22','com.itheima.controller.EmpController','update','[Emp(id=28, username=lizhong, password=123456, name=李忠, gender=1, phone=13309090028, job=5, salary=5000, image=https://web2024.oss-cn-beijing.aliyuncs.com/4b85bab7-b306-4e98-a5a5-7ca2e3b740a6.png, entryDate=2007-01-01, deptId=3, createTime=2023-10-20T16:35:33, updateTime=2023-11-08T22:12:40, deptName=null, exprList=[])]','{\"code\":1,\"msg\":\"success\"}',24),(33,2,'2023-11-30 20:33:08','com.itheima.controller.DeptController','delete','[12]','{\"code\":1,\"msg\":\"success\"}',11),(34,2,'2023-11-30 20:36:37','com.itheima.controller.DeptController','delete','[6]','{\"code\":1,\"msg\":\"success\"}',346),(35,2,'2023-11-30 20:56:37','com.itheima.controller.DeptController','add','[Dept(id=null, name=行政部, createTime=null, updateTime=null)]','{\"code\":1,\"msg\":\"success\"}',282),(36,2,'2023-11-30 21:26:24','com.itheima.controller.DeptController','update','[Dept(id=3, name=咨询部2, createTime=2023-09-25T09:47:40, updateTime=2023-09-25T09:47:40)]','{\"code\":1,\"msg\":\"success\"}',17);




CREATE TABLE `student` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID,主键',
  `name` varchar(10) NOT NULL COMMENT '姓名',
  `no` char(10) NOT NULL COMMENT '学号',
  `gender` tinyint unsigned NOT NULL COMMENT '性别, 1: 男, 2: 女',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `id_card` char(18) NOT NULL COMMENT '身份证号',
  `is_college` tinyint unsigned NOT NULL COMMENT '是否来自于院校, 1:是, 0:否',
  `address` varchar(100) DEFAULT NULL COMMENT '联系地址',
  `degree` tinyint unsigned DEFAULT NULL COMMENT '最高学历, 1:初中, 2:高中, 3:大专, 4:本科, 5:硕士, 6:博士',
  `graduation_date` date DEFAULT NULL COMMENT '毕业时间',
  `clazz_id` int unsigned NOT NULL COMMENT '班级ID, 关联班级表ID',
  `violation_count` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '违纪次数',
  `violation_score` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '违纪扣分',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `no` (`no`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `id_card` (`id_card`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学员表';

INSERT INTO `student` VALUES (1,'段誉','2022000001',1,'18800000001','110120000300200001',1,'北京市昌平区建材城西路1号',1,'2021-07-01',2,0,0,'2023-11-14 21:22:19','2023-11-15 16:20:59'),(2,'萧峰','2022000002',1,'18800210003','110120000300200002',1,'北京市昌平区建材城西路2号',2,'2022-07-01',1,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(3,'虚竹','2022000003',1,'18800013001','110120000300200003',1,'北京市昌平区建材城西路3号',2,'2023-07-01',1,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(4,'萧远山','2022000004',1,'18800003211','110120000300200004',1,'北京市昌平区建材城西路4号',3,'2024-07-01',1,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(5,'阿朱','2022000005',2,'18800160002','110120000300200005',1,'北京市昌平区建材城西路5号',4,'2020-07-01',1,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(6,'阿紫','2022000006',2,'18800000034','110120000300200006',1,'北京市昌平区建材城西路6号',4,'2021-07-01',2,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(7,'游坦之','2022000007',1,'18800000067','110120000300200007',1,'北京市昌平区建材城西路7号',4,'2022-07-01',2,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(8,'康敏','2022000008',2,'18800000077','110120000300200008',1,'北京市昌平区建材城西路8号',5,'2023-07-01',2,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(9,'徐长老','2022000009',1,'18800000341','110120000300200009',1,'北京市昌平区建材城西路9号',3,'2024-07-01',2,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(10,'云中鹤','2022000010',1,'18800006571','110120000300200010',1,'北京市昌平区建材城西路10号',2,'2020-07-01',2,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(11,'钟万仇','2022000011',1,'18800000391','110120000300200011',1,'北京市昌平区建材城西路11号',4,'2021-07-01',1,0,0,'2023-11-14 21:22:19','2023-11-15 16:21:24'),(12,'崔百泉','2022000012',1,'18800000781','110120000300200018',1,'北京市昌平区建材城西路12号',4,'2022-07-05',8,6,17,'2023-11-14 21:22:19','2023-12-13 14:33:58'),(13,'耶律洪基','2022000013',1,'18800008901','110120000300200013',1,'北京市昌平区建材城西路13号',4,'2023-07-01',2,0,0,'2023-11-14 21:22:19','2023-11-15 16:21:21'),(14,'天山童姥','2022000014',2,'18800009201','110120000300200014',1,'北京市昌平区建材城西路14号',4,'2024-07-01',1,0,0,'2023-11-14 21:22:19','2023-11-15 16:21:17'),(15,'刘竹庄','2022000015',1,'18800009401','110120000300200015',1,'北京市昌平区建材城西路15号',3,'2020-07-01',4,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(16,'李春来','2022000016',1,'18800008501','110120000300200016',1,'北京市昌平区建材城西路16号',4,'2021-07-01',4,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(17,'王语嫣','2022000017',2,'18800007601','110120000300200017',1,'北京市昌平区建材城西路17号',2,'2022-07-01',4,0,0,'2023-11-14 21:22:19','2023-11-14 21:22:19'),(18,'郑成功','2023001101',1,'13309092345','110110110110110110',0,'北京市昌平区回龙观街道88号',5,'2021-07-01',8,2,7,'2023-11-15 16:26:18','2023-11-15 16:40:10');



create table emp_login_log(
    id int unsigned primary key auto_increment comment 'ID',
    username varchar(20) comment '用户名',
    password varchar(32) comment '密码',
    login_time datetime comment '登录时间',
    is_success tinyint unsigned comment '是否成功, 1:成功, 0:失败',
    jwt varchar(1000) comment 'JWT令牌',
    cost_time bigint unsigned comment '耗时, 单位:ms'
) comment '登录日志表';


create table file_upload_log(
    id int unsigned primary key auto_increment comment 'ID',
    filename varchar(100) comment '原始文件名',
    size bigint comment '文件大小, 单位:字节',
    extname varchar(10) comment '文件后缀名,如:.jpg',
    url varchar(300) comment '阿里云OSS访问url',
    upload_time datetime comment '上传时间'
) comment '文件上传日志表';



