auth_mmb3
=========

NOTE
=========
实现动态切换数据源，利用AOP和注解方式实现。

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

2、使用aop功能时需添加aspectjweaver-1.8.6.jar

3、20180814
添加Spring Security功能，主要修改地方包括：
在web.xml中配置org.springframework.web.filter.DelegatingFilterProxy过滤器。
添加spring-security.xml
新增的jar包：
spring-security-acl-3.2.8.RELEASE.jar
spring-security-config-3.2.8.RELEASE.jar
spring-security-core-3.2.8.RELEASE.jar
spring-security-taglibs-3.2.8.RELEASE.jar
spring-security-web-3.2.8.RELEASE.jar

4.引入jquery.form.js插件



