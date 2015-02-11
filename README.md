auth_mmb3
=========

NOTE
=========
实现动态切换数据源

技术实现
=========
EasyUI
SpringMVC
Spring
MyBatis(注入映射器方式)
MySQL

版本号
==============
EasyUI 1.3.4
Spring 3.2.5
MyBatis 3.2.3
MyBatis-Spring 1.2.2
MySQL 5.1.22



问题记录
=========
1、在使用jackson的@JsonIgnore和@JsonProperty注解时，不起作用。
原因：jackson的jar包版本不兼容所导致，因为jackson 1.x与jackson 2.x的jar包结构发生很大变化。
解决：全部使用jackson 2.x版本的jar即可正常。
