## 公共权限管理（Oracle版本）

### 技术路线
- JDK 1.8
- web容器 Tomcat 8.0.39
- 数据库 Oracle11g
- 容器 Spring 4.3.3.RELEASE
- 控制层 SpringMVC 4.3.3.RELEASE
- 持久层 JDBCTemplate
- 缓存 EHCache 2.10.2
- 数据连接池 druid 1.0.25
- Json Jackson 2.5.4

- UI界面 BootStrap ACE 1.4

### 权限控制原理
权限控制采用RBAC原理，基于角色控制，首先设置系统功能模块菜单，再设置各个模块对应的功能按钮。
设置角色及该角色具有的权限。
设置用户及用户对应的角色。

系统级的权限控制采用SpringMVC的拦截器实现，精确至按钮级别。


### 数据库建表脚本
数据库脚本包括两部分，一个是oracle的建用户脚本，用sys用户执行，在doc/createOracleUser.sql
另一个是ua_ora的初始化脚本，在doc/ua_ora_db1.0.sql
