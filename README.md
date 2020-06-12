# Holic
Java JDK 1.8.0_251

Eclipse IDE 2019-12

OracleXE 112_Win64

DB 접속 : sqlplus system/1234
계정 생성 : create user scott5801 identified by tiger5801;
생성 확인 : select * from ALL_users;
권한 부여 : GRANT connect, resource, create view, create procedure to scott5801;
접속 확인 : connect scott5801/tiger5801;
현재 접속중인 계정 확인 : show user;
포트 번호 확인 : select dbms_xdb.gethttpport() from dual;


apache-tomcat-9.0.35


<Connector URIEncoding="UTF-8" connectionTimeout="20000" port="8101" protocol="HTTP/1.1" redirectPort="8443" useBodyEncodingForURI="true"/>
