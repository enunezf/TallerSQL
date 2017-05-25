CREATE TABLE dbo.Parametros (
  parametro_id smallint NOT NULL PRIMARY KEY CLUSTERED,
  codigo varchar(15) NOT NULL ,
  valor varchar(50) NOT NULL,
  CONSTRAINT PK_Parametros PRIMARY KEY CLUSTERED (parametro_id),
  CONSTRAINT IX_Parametros_Codigo UNIQUE NONCLUSTERED (codigo),
)
ON [PRIMARY]