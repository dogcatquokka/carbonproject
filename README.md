# carina 팀기록
## 일지는 각자 내용을 작성해주세요 혹시 결석이라면 PM이 작성해주시구요.
## 회의록은 PM이 작성해 주세요.
## 일지는 공동으로 작성하기 때문에 sync 를 맞춰주세요.
 - 내려받고 pull  - > 수정후 add, commit, push 
## 일지 폴더, 회의록 폴더를 만들어도 좋아요.
server ip : 192.168.0.40
           1521/xe
           system/oracle
pc/pw : 9222
# db mysql로 변경 (oracle xe 무료버전은 용량 최대 12GB )

## 설치 
`sudo apt-get install mysql-server`
## 상태 
`sudo systemctl status mysql`
## root 접속, 해제 
`mysql -u root -p --socket=/var/run/mysqld/mysqld.sock`
`exit`
## 디비 종료 
`sudo systemctl stop mysql`
## 케릭터 셋 
`sudo xed /etc/mysql/mysql.conf.d/mysqld.cnf`
 - 위에 명령어로 나온 내용에 추가 
  ```bash [mysqld]
     character-set-server=utf8mb4
     collation-server=utf8mb4_unicode_ci
   ```

## 재시작 
`sudo systemctl restart mysql`

## 계정생성 
`CREATE USER 'care'@'localhost' IDENTIFIED BY 'care';`

## 접속
 `USE care;`

# 다른곳에서 접속가능하도록 
`sudo xed /etc/mysql/mysql.conf.d/mysqld.cnf`
- mysqld.cnf 파일 내용수정
  bind-address = 0.0.0.0
 `sudo systemctl restart mysql`

## 계정에 외부접근 가능하도록 
`GRANT ALL PRIVILEGES ON mydatabase.* TO 'care'@'%';`
`FLUSH PRIVILEGES;`

## 계정으로 접속 
`mysql -u care -p --socket=/var/run/mysqld/mysqld.sock`

## db생성 
`CREATE DATABASE caredb;`

## 테이블 생성 동일함 
