--O script abaixo mostra quais sao os datapath default do banco no OS
SELECT SERVERPROPERTY('InstanceDefaultDataPath') AS  [Default_Data_path] 
,		SERVERPROPERTY('InstanceDefaultLogPath') AS  [Default_log_path]
--O script agora parametriza a criacao de um banco de dados nos datapah
CREATE DATABASE db_Biblioteca ON PRIMARY
(NAME = db_Biblioteca,
FILENAME = '/var/opt/mssql/data/db_Biblioteca.mdf',
SIZE = 6MB,
MAXSIZE = 15MB,
FILEGROWTH = 10%)
LOG ON (
NAME = db_biblioteca_log,
FILENAME = '/var/opt/mssql/data/db_Biblioteca_log.ldf',
SIZE = 1MB, FILEGROWTH = 1MB)
GO