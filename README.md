# Holic <br>
Java JDK 1.8.0_251 <br>
 <br>
Eclipse IDE 2019-12 <br>
 <br>
OracleXE 112_Win64 <br>
 <br>
DB 접속 : sqlplus system/1234 <br>
계정 생성 : create user scott5801 identified by tiger5801; <br>
생성 확인 : select * from ALL_users; <br>
권한 부여 : GRANT connect, resource, create view, create procedure to scott5801; <br>
접속 확인 : connect scott5801/tiger5801; <br>
현재 접속중인 계정 확인 : show user; <br>
포트 번호 확인 : select dbms_xdb.gethttpport() from dual; <br>
 <br>
 <br>
apache-tomcat-9.0.35 <br>
 <br>
 <br>
<Connector URIEncoding="UTF-8" connectionTimeout="20000" port="8101" protocol="HTTP/1.1" redirectPort="8443" useBodyEncodingForURI="true"/>
