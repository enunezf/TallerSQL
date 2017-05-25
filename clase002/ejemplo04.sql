CREATE TABLE dbo.UbicacionGeo (
  UbicacionId varchar(15) NOT NULL,
  TipoUbicacionId varchar(15) NULL,
  Abreviacion varchar(10) NULL,
  Secuencia smallint NOT NULL DEFAULT (0),
  Descripcion varchar(50) NOT NULL,
  CONSTRAINT PK_UbicacionGeo PRIMARY KEY CLUSTERED (UbicacionId),
  CONSTRAINT FK_Tipo_UbicacionGeo FOREIGN KEY (TipoUbicacionId) REFERENCES dbo.TipoUbicacionGeo (TipoUbicacionId)
)
ON [PRIMARY]