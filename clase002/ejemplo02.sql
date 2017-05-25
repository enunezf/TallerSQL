USE master;  
GO  
CREATE DATABASE tallerSQL3  
ON   
( NAME = tallerSQL3_dat,  
    FILENAME = 'D:\MSSQLSERVER\DATA\tallerSQL3.mdf',  
    SIZE = 10,  
    MAXSIZE = 50,  
    FILEGROWTH = 5 )  
LOG ON  
( NAME = tallerSQL3_log,  
    FILENAME = 'D:\MSSQLSERVER\DATA\tallerSQL3.ldf',  
    SIZE = 5MB,  
    MAXSIZE = 25MB,  
    FILEGROWTH = 5MB ) ;  
GO