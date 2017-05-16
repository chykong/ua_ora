-----------------------------------------------
-- Export file for user UA_ORA@ORCL          --
-- Created by chykong on 2017/5/16, 23:46:33 --
-----------------------------------------------

set define off
spool ua_ora_db1.0.log

prompt
prompt Creating table T_SYS_FUNCTION
prompt =============================
prompt
create table T_SYS_FUNCTION
(
  id            NUMBER not null,
  module_id     NUMBER,
  name          VARCHAR2(30),
  code          VARCHAR2(30),
  url           VARCHAR2(100),
  type          NUMBER,
  description   VARCHAR2(100),
  display_order NUMBER
)
;
alter table T_SYS_FUNCTION
  add constraint PK_T_SYS_FUNCTION primary key (ID);

prompt
prompt Creating table T_SYS_LOG
prompt ========================
prompt
create table T_SYS_LOG
(
  id           NUMBER not null,
  user_id      NUMBER,
  opera_date   DATE,
  opera_ip     VARCHAR2(20),
  module_name  VARCHAR2(30),
  opera_name   VARCHAR2(20),
  opera_type   NUMBER,
  opera_url    VARCHAR2(100),
  opera_params VARCHAR2(1000)
)
;
alter table T_SYS_LOG
  add constraint PK_T_SYS_LOG primary key (ID);

prompt
prompt Creating table T_SYS_MODULE
prompt ===========================
prompt
create table T_SYS_MODULE
(
  id            NUMBER not null,
  name          VARCHAR2(40),
  code          VARCHAR2(20),
  parent_id     NUMBER,
  url           VARCHAR2(100),
  target        VARCHAR2(20),
  iconimg       VARCHAR2(20),
  display_order NUMBER
)
;
alter table T_SYS_MODULE
  add constraint PK_T_SYS_MODULE primary key (ID);

prompt
prompt Creating table T_SYS_ROLE
prompt =========================
prompt
create table T_SYS_ROLE
(
  id            NUMBER not null,
  name          VARCHAR2(40),
  description   VARCHAR2(100),
  display_order NUMBER,
  create_date   DATE,
  is_delete     NUMBER default 0,
  create_person VARCHAR2(20)
)
;
alter table T_SYS_ROLE
  add constraint SEQ_T_SYS_ROLE primary key (ID);

prompt
prompt Creating table T_SYS_ROLEFUNCTION
prompt =================================
prompt
create table T_SYS_ROLEFUNCTION
(
  id          NUMBER not null,
  role_id     NUMBER,
  function_id NUMBER
)
;
create index IND_T_SYS_ROLEFUNCTION on T_SYS_ROLEFUNCTION (ROLE_ID);
alter table T_SYS_ROLEFUNCTION
  add constraint PK_T_SYS_ROLEFUNCTION primary key (ID);

prompt
prompt Creating table T_SYS_ROLEMODULE
prompt ===============================
prompt
create table T_SYS_ROLEMODULE
(
  id        NUMBER not null,
  role_id   NUMBER,
  module_id NUMBER
)
;
create index IND_T_SYS_ROLEMODULE on T_SYS_ROLEMODULE (ROLE_ID);

prompt
prompt Creating table T_SYS_USER
prompt =========================
prompt
create table T_SYS_USER
(
  id            NUMBER not null,
  username      VARCHAR2(30),
  password      VARCHAR2(40),
  randomcode    VARCHAR2(6),
  status        NUMBER,
  realname      VARCHAR2(20),
  create_date   DATE,
  create_person VARCHAR2(20),
  role_id       NUMBER,
  create_id     NUMBER
)
;
create index IND_T_SYS_USER on T_SYS_USER (USERNAME);
alter table T_SYS_USER
  add constraint PK_T_SYS_USER primary key (ID);

prompt
prompt Creating table T_SYS_USERLOGIN
prompt ==============================
prompt
create table T_SYS_USERLOGIN
(
  id              NUMBER not null,
  user_id         NUMBER,
  login_date      DATE,
  login_ip        VARCHAR2(20),
  terminal        VARCHAR2(20),
  explorertype    VARCHAR2(40),
  explorerversion VARCHAR2(40)
)
;
create index IND_T_SYS_USERLOGIN on T_SYS_USERLOGIN (USER_ID);
alter table T_SYS_USERLOGIN
  add constraint PK_T_SYS_USERLOGIN primary key (ID);

prompt
prompt Creating sequence SEQ_T_SYS_FUNCTION
prompt ====================================
prompt
create sequence SEQ_T_SYS_FUNCTION
minvalue 1
maxvalue 9999999999999999999999999999
start with 880
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_LOG
prompt ===============================
prompt
create sequence SEQ_T_SYS_LOG
minvalue 1
maxvalue 9999999999999999999999999999
start with 11759
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_MODULE
prompt ==================================
prompt
create sequence SEQ_T_SYS_MODULE
minvalue 1
maxvalue 9999999999999999999999999999
start with 947
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_ROLE
prompt ================================
prompt
create sequence SEQ_T_SYS_ROLE
minvalue 1
maxvalue 9999999999999999999999999999
start with 430
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_ROLEFUNCTION
prompt ========================================
prompt
create sequence SEQ_T_SYS_ROLEFUNCTION
minvalue 1
maxvalue 9999999999999999999999999999
start with 84106
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_ROLEMODULE
prompt ======================================
prompt
create sequence SEQ_T_SYS_ROLEMODULE
minvalue 1
maxvalue 9999999999999999999999999999
start with 42993
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_USER
prompt ================================
prompt
create sequence SEQ_T_SYS_USER
minvalue 1
maxvalue 9999999999999999999999999999
start with 8734
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_SYS_USERLOGIN
prompt =====================================
prompt
create sequence SEQ_T_SYS_USERLOGIN
minvalue 1
maxvalue 9999999999999999999999999999
start with 221710
increment by 1
cache 20;

insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (133, 4, '新增', 'SysRoleAdd', 'sys/role/add.htm', 1, null, 1);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (134, 4, '修改', 'SysRoleUpdate', 'sys/role/update.htm', 1, null, 2);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (135, 4, '删除', 'SysRoleDelete', 'sys/role/delete.htm', 1, null, 3);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (138, 4, '设置权限', 'SysRoleUpdateRoleModule', 'sys/role/updateRoleModule.htm', 1, null, 6);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (144, 51, '导出', 'SysLogDownload', 'sys/log/downloadLog.htm', 1, null, 3);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (145, 3, '新增模块', 'SysModuleAdd', 'sys/module/add.htm', 1, null, 3);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (148, 3, '修改模块', 'SysModuleUpdate', 'sys/module/update.htm', 1, null, 4);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (149, 3, '删除模块', 'SysModuleDelete', 'sys/module/delete.htm', 1, null, 5);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (151, 3, '新增功能', 'SysFunctionAdd', 'sys/function/add.htm', 1, null, 7);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (152, 3, '修改功能', 'SysFunctionUpdate', 'sys/function/update.htm', 1, null, 8);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (153, 3, '删除功能', 'SysFunctionDelete', 'sys/function/delete.htm', 1, null, 9);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (154, 3, '清空缓存', 'SysModuleClearCache', 'sys/module/clearCache.htm', 1, null, 10);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (162, 7, '新增', 'SysUserAdd', 'sys/user/add.htm', 1, null, 3);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (165, 7, '修改', 'SysUserUpdate', 'sys/user/update.htm', 1, null, 4);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (167, 7, '密码重置', 'SysUserResetPass', 'sys/user/saveResetPass.htm', 1, null, 6);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (168, 7, '锁定', 'SysUserLock', 'sys/user/saveLock.htm', 1, null, 7);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (169, 7, '解锁', 'SysUserUnlock', 'sys/user/saveUnlock.htm', 1, null, 8);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (177, 55, '新增', 'BaseProductAdd', 'base/product/add.htm', 1, null, 2);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (178, 55, '修改', 'BaseProductUpdate', 'base/product/update.htm', 1, null, 3);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (179, 55, '删除', 'BaseProductDelete', 'base/product/delete.htm', 1, null, 4);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (340, 7, '删除', 'SysUserDelete', 'sys/user/delete.htm', 1, null, 9);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (458, 7, '设置省份权限', 'SysUserSaveUserdata', '/sys/user/saveUserdata.htm', 1, null, 7);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (487, 58, '新增', 'BaseCategoryAdd', 'base/category/add.htm', 1, null, 1);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (488, 58, '修改', 'BaseCategoryUpdate', 'base/category/update.htm', 1, null, 2);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (489, 58, '删除', 'BaseCategoryDelete', 'base/category/delete.htm', 1, null, 3);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (532, 55, '新增规格', 'BaseProductSpecAdd', 'base/product/addSpec.htm', 1, null, 4);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (533, 55, '修改规格', 'BaseProductSpecUpdate', 'base/product/updateSpec.htm', 1, null, 5);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (534, 55, '设置价格', 'BaseProductPriceSet', 'base/productprice/setPrice.htm', 1, null, 6);
insert into T_SYS_FUNCTION (id, module_id, name, code, url, type, description, display_order)
values (535, 55, '删除价格', 'BaseProductPriceDelete', 'base/productprice/deletePrice.htm', 1, null, 7);
commit;
prompt 29 records loaded
prompt Loading T_SYS_LOG...
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11720, 1, to_date('16-05-2017 23:28:23', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '模块管理', '新增模块', 1, 'sys/module/add.htm', 'backUrl=%2Fsys%2Fmodule%2Findex.htm%3F&name=123&parent_id=&parent_name=&code=3213&url=321&target=main&iconImg=321&display_order=3&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11721, 1, to_date('16-05-2017 23:28:30', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '模块管理', '修改模块', 1, 'sys/module/update.htm', 'id=927&backUrl=%2Fsys%2Fmodule%2Findex.htm%3F&name=123&parent_id=1&parent_name=系统模块列表&code=3213&url=321&target=main&iconImg=321&display_order=3&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11722, 1, to_date('16-05-2017 23:28:40', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '模块管理', '新增功能', 1, 'sys/function/add.htm', 'backUrl=%2Fsys%2Ffunction%2Findex.htm%3Fmodule_id%3D927&module_id=927&name=31&code=31&url=321&type=1&description=312&display_order=10&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11723, 1, to_date('16-05-2017 23:28:44', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '模块管理', '修改功能', 1, 'sys/function/update.htm', 'id=861&backUrl=%2Fsys%2Ffunction%2Findex.htm%3Fmodule_id%3D927&module_id=927&name=31&code=31&url=321&type=0&description=312&display_order=10&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11724, 1, to_date('16-05-2017 23:28:47', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '模块管理', '删除功能', 1, 'sys/function/delete.htm', 'id=861&backUrl=/sys/function/index.htm?module_id=927&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11725, 1, to_date('16-05-2017 23:28:52', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '模块管理', '删除模块', 1, 'sys/module/delete.htm', 'id=927&backUrl=/sys/module/index.htm?&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11726, 1, to_date('16-05-2017 23:29:27', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '角色管理', '新增', 1, 'sys/role/add.htm', 'backUrl=%2Fsys%2Frole%2Findex.htm%3F&moduleArr=&functionArr=&name=11&description=11&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11727, 1, to_date('16-05-2017 23:29:57', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '角色管理', '新增', 1, 'sys/role/add.htm', 'backUrl=%2Fsys%2Frole%2Findex.htm%3F&moduleArr=&functionArr=&name=11&description=11&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11728, 1, to_date('16-05-2017 23:31:58', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '角色管理', '新增', 1, 'sys/role/add.htm', 'backUrl=%2Fsys%2Frole%2Findex.htm%3F&moduleArr=&functionArr=&name=11&description=11&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11729, 1, to_date('16-05-2017 23:32:05', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '角色管理', '修改', 1, 'sys/role/update.htm', 'backUrl=%2Fsys%2Frole%2Findex.htm%3F&id=411&moduleArr=&functionArr=&name=11&description=11&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11730, 1, to_date('16-05-2017 23:34:10', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '角色管理', '修改', 1, 'sys/role/update.htm', 'backUrl=%2Fsys%2Frole%2Findex.htm%3F&id=411&moduleArr=2@@3@@4@@7@@51@@147@@&functionArr=145@@148@@149@@151@@152@@153@@154@@133@@134@@135@@138@@162@@165@@167@@168@@169@@340@@458@@144@@&name=11&description=11&module=2&function=145&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11731, 1, to_date('16-05-2017 23:34:16', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '角色管理', '修改', 1, 'sys/role/update.htm', 'backUrl=%2Fsys%2Frole%2Findex.htm%3F&id=411&moduleArr=2@@3@@4@@7@@51@@147@@&functionArr=145@@148@@149@@151@@152@@153@@154@@133@@134@@135@@138@@162@@165@@167@@168@@169@@340@@458@@144@@&name=11&description=11&module=2&function=145&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11732, 1, to_date('16-05-2017 23:38:44', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '用户管理', '新增', 1, 'sys/user/add.htm', 'backUrl=%2Fsys%2Fuser%2Findex.htm%3F%26role_id%3D1&username=test&realname=测试&role_id=41&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11733, 1, to_date('16-05-2017 23:39:00', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '用户管理', '新增', 1, 'sys/user/add.htm', 'backUrl=%2Fsys%2Fuser%2Findex.htm%3F%26role_id%3D1&username=test&realname=测试&role_id=41&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11734, 1, to_date('16-05-2017 23:39:17', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '用户管理', '新增', 1, 'sys/user/add.htm', 'backUrl=%2Fsys%2Fuser%2Findex.htm%3F%26role_id%3D1&username=test&realname=测试&role_id=41&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11735, 1, to_date('16-05-2017 23:39:21', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '用户管理', '新增', 1, 'sys/user/add.htm', 'backUrl=%2Fsys%2Fuser%2Findex.htm%3F%26role_id%3D1&username=test&realname=测试&role_id=41&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11736, 1, to_date('16-05-2017 23:39:49', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '用户管理', '新增', 1, 'sys/user/add.htm', 'backUrl=%2Fsys%2Fuser%2Findex.htm%3F%26role_id%3D1&username=test&realname=测试&role_id=41&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11737, 1, to_date('16-05-2017 23:39:52', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '用户管理', '新增', 1, 'sys/user/add.htm', 'backUrl=%2Fsys%2Fuser%2Findex.htm%3F%26role_id%3D1&username=test&realname=测试&role_id=41&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11738, 1, to_date('16-05-2017 23:40:16', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '角色管理', '删除', 1, 'sys/role/delete.htm', 'id=411&backUrl=/sys/role/index.htm?&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11739, 1, to_date('16-05-2017 23:41:17', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '用户管理', '修改', 1, 'sys/user/update.htm', 'backUrl=%2Fsys%2Fuser%2Findex.htm%3F&id=1&username=admin&realname=管理员&role_id=1&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11740, 1, to_date('16-05-2017 23:41:21', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '用户管理', '锁定', 1, 'sys/user/saveLock.htm', 'id=8716&backUrl=/sys/user/index.htm?&');
insert into T_SYS_LOG (id, user_id, opera_date, opera_ip, module_name, opera_name, opera_type, opera_url, opera_params)
values (11741, 1, to_date('16-05-2017 23:41:25', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', '用户管理', '密码重置', 1, 'sys/user/saveResetPass.htm', 'id=8716&backUrl=/sys/user/index.htm?&');
commit;
prompt 22 records loaded
prompt Loading T_SYS_MODULE...
insert into T_SYS_MODULE (id, name, code, parent_id, url, target, iconimg, display_order)
values (1, '系统模块列表', 'root', 0, '#', 'main', '0xf022', 1);
insert into T_SYS_MODULE (id, name, code, parent_id, url, target, iconimg, display_order)
values (2, '系统管理', 'sys', 1, '#', 'main', 'fa-cogs', 8);
insert into T_SYS_MODULE (id, name, code, parent_id, url, target, iconimg, display_order)
values (3, '模块管理', 'SysModule', 2, 'sys/module/index.htm', 'main', '61548', 1);
insert into T_SYS_MODULE (id, name, code, parent_id, url, target, iconimg, display_order)
values (4, '角色管理', 'SysRole', 2, 'sys/role/index.htm', 'main', '61632', 2);
insert into T_SYS_MODULE (id, name, code, parent_id, url, target, iconimg, display_order)
values (7, '用户管理', 'SysUser', 2, 'sys/user/index.htm', 'main', 'fa-user', 3);
insert into T_SYS_MODULE (id, name, code, parent_id, url, target, iconimg, display_order)
values (40, '统计查询', 'SP', 1, '#', 'main', 'fa-bar-chart', 6);
insert into T_SYS_MODULE (id, name, code, parent_id, url, target, iconimg, display_order)
values (51, '操作日志', 'SysLog', 2, 'sys/log/index.htm', 'main', '61555', 5);
insert into T_SYS_MODULE (id, name, code, parent_id, url, target, iconimg, display_order)
values (55, '商品信息', 'BaseProduct', 138, 'base/product/index.htm', 'main', '61558', 1);
insert into T_SYS_MODULE (id, name, code, parent_id, url, target, iconimg, display_order)
values (58, '商品分类', 'BaseCategory', 138, 'base/category/index.htm', 'main', '61746', 2);
insert into T_SYS_MODULE (id, name, code, parent_id, url, target, iconimg, display_order)
values (138, '商品管理', 'BaseProduct', 1, '#', 'main', 'fa-product-hunt', 1);
insert into T_SYS_MODULE (id, name, code, parent_id, url, target, iconimg, display_order)
values (143, '商品统计', 'StatProduct', 40, 'stat/product/index.htm', 'main', null, 2);
insert into T_SYS_MODULE (id, name, code, parent_id, url, target, iconimg, display_order)
values (147, '系统监控', 'SysMonitor', 2, 'druid', 'blank', null, 6);
commit;
prompt 12 records loaded
prompt Loading T_SYS_ROLE...
insert into T_SYS_ROLE (id, name, description, display_order, create_date, is_delete, create_person)
values (1, '系统管理员', '系统管理员', 99, to_date('16-05-2017', 'dd-mm-yyyy'), 0, '初始化');
insert into T_SYS_ROLE (id, name, description, display_order, create_date, is_delete, create_person)
values (41, '测试角色', '测试', null, to_date('18-05-2017', 'dd-mm-yyyy'), 1, '管理员');
commit;
prompt 2 records loaded
prompt Loading T_SYS_ROLEFUNCTION...
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (84085, 411, 145);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (84086, 411, 148);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (84087, 411, 149);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (84088, 411, 151);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (84089, 411, 152);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (84090, 411, 153);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (84091, 411, 154);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (84092, 411, 133);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (84093, 411, 134);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (84094, 411, 135);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (84095, 411, 138);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (84096, 411, 162);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (84097, 411, 165);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (84098, 411, 167);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (84099, 411, 168);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (84100, 411, 169);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (84101, 411, 340);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (84102, 411, 458);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (84103, 411, 144);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31860, 1, 177);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31861, 1, 178);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31862, 1, 179);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31863, 1, 532);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31864, 1, 533);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31865, 1, 534);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31866, 1, 535);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31867, 1, 487);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31868, 1, 488);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31869, 1, 489);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31870, 1, 145);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31871, 1, 148);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31872, 1, 149);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31873, 1, 151);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31874, 1, 152);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31875, 1, 153);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31876, 1, 154);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31877, 1, 133);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31878, 1, 134);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31879, 1, 135);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31880, 1, 138);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31881, 1, 162);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31882, 1, 165);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31883, 1, 167);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31884, 1, 168);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31885, 1, 169);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31886, 1, 340);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31887, 1, 458);
insert into T_SYS_ROLEFUNCTION (id, role_id, function_id)
values (31888, 1, 144);
commit;
prompt 48 records loaded
prompt Loading T_SYS_ROLEMODULE...
insert into T_SYS_ROLEMODULE (id, role_id, module_id)
values (16343, 1, 138);
insert into T_SYS_ROLEMODULE (id, role_id, module_id)
values (16344, 1, 55);
insert into T_SYS_ROLEMODULE (id, role_id, module_id)
values (16345, 1, 58);
insert into T_SYS_ROLEMODULE (id, role_id, module_id)
values (16346, 1, 2);
insert into T_SYS_ROLEMODULE (id, role_id, module_id)
values (16347, 1, 3);
insert into T_SYS_ROLEMODULE (id, role_id, module_id)
values (16348, 1, 4);
insert into T_SYS_ROLEMODULE (id, role_id, module_id)
values (16349, 1, 7);
insert into T_SYS_ROLEMODULE (id, role_id, module_id)
values (16350, 1, 51);
insert into T_SYS_ROLEMODULE (id, role_id, module_id)
values (16351, 1, 147);
commit;
prompt 9 records loaded
prompt Loading T_SYS_USER...
insert into T_SYS_USER (id, username, password, randomcode, status, realname, create_date, create_person, role_id, create_id)
values (1, 'admin', '540168fc54ddeefc97b6af20bac6d457', '170960', 1, '管理员', to_date('16-05-2017 12:00:59', 'dd-mm-yyyy hh24:mi:ss'), '初始化', 1, null);
insert into T_SYS_USER (id, username, password, randomcode, status, realname, create_date, create_person, role_id, create_id)
values (8716, 'test', '612ebcbf4e2bfade5d29099aa085e8fc', '496742', 2, '测试', to_date('16-05-2017 23:39:52', 'dd-mm-yyyy hh24:mi:ss'), '管理员', 41, null);
commit;
prompt 2 records loaded
prompt Loading T_SYS_USERLOGIN...
insert into T_SYS_USERLOGIN (id, user_id, login_date, login_ip, terminal, explorertype, explorerversion)
values (221691, 1, to_date('16-05-2017 23:26:38', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'PC', 'chrome', '48.0.2564.82');
commit;

spool off
