create table sede 
(
numerodesede number(4),
direccion varchar2(20),
nombrecordinador  varchar2(9),
CONSTRAINT pk_numero_sede PRIMARY KEY (numerodesede)
);

#En la tabla Sede crear la columna localidad

alter table sede
add localidad varchar2(10);

#En la tabla sede la localidad solo podran ser Madrid,Barcelona, Valencia y Malaga

ALTER TABLE sede 
ADD CONSTRAINT localidas_check CHECK (localidad IN (‘Malaga’, ‘Madrid’,
‘Barcelona’, ‘Valencia’));

#en la tabla sede el nombre del cordinador no se puede repetir

ALTER TABLE sede
ADD CONSTRAINT cordinador_unico UNIQUE (nombrecordinador);

Insert into  sede ( numerodesede, direccion, nombrecordinador, localidad ) values ('0001', 'Paseo de Mestalla', 'Juanma','Valencia');
Insert into  sede ( numerodesede, direccion, nombrecordinador, localidad ) values ('0002', 'Avenida de Cadiz', 'Maritoñi','Malaga');
Insert into  sede ( numerodesede, direccion, nombrecordinador, localidad ) values ('0003', 'Paseo de Gracia', 'Luisa','Barcelona');
Insert into  sede ( numerodesede, direccion, nombrecordinador, localidad ) values ('0004', 'Calle Japon', 'Toni','Valencia');











create table trajes
(
codigotraje number(6),
material varchar2(10),
color varchar2(6),
disenador varchar2(8),
numerodesede number(4),
cifproveedor varchar2(9),
constraint pk_codigotraje primary key (codigotraje),
constraint fk_numerodesede foreign key (numerodesede) references sede (numerodesede),
constraint fk_cifproveedor foreign key (cifproveedor) references proveedor (cifproveedor)
);

#en la tabla traje añadimos la columna temporada

alter table trajes
add temporada  varchar2(9);
#en la columna temporada solo podra ser, primavera,verano,otoño,invierno
ALTER TABLE trajes
ADD CONSTRAINT trajess_check CHECK (temporada IN (‘primavera’, ‘verano’,
‘otoño’, ‘invierno’));

#en la columna diseñador el nombre del diseñador empezara por mayuscula
ALTER TABLE trajes
ADD CONSTRAINT diseadornombre_check CHECK (disenador=INITCAP(DISENADOR));

#en la columna color no se puede quedar en blanco
ALTER TABLE trajes
ADD CONSTRAINT trajes_notnull
CHECK (color IS NOT NULL);




#en la columna color los colores solo podran ser azul,blanco,gris o negro
ALTER TABLE trajes
ADD CONSTRAINT colors_check CHECK (color IN (‘azul’, ‘blanco’,
‘gris’, ‘negro’));





Insert into  trajes ( codigotraje,material,color,disenador,numerodesede,cifproveedor,temporada ) values ('100012', 'lino', 'blanco','Napoli','0001','A46210334','primavera');
Insert into  trajes ( codigotraje,material,color,disenador,numerodesede,cifproveedor,temporada ) values ('100011', 'lino', 'azul','Napoli','0001','A46210334','primavera');
Insert into  trajes ( codigotraje,material,color,disenador,numerodesede,cifproveedor,temporada ) values ('100013', 'lino', 'negro','Napoli','0001','A46210334','primavera');
Insert into  trajes ( codigotraje,material,color,disenador,numerodesede,cifproveedor,temporada ) values ('200011', 'raso', 'gris','Eutimio','0002','A46210355','verano');
Insert into  trajes ( codigotraje,material,color,disenador,numerodesede,cifproveedor,temporada ) values ('200012', 'raso', 'blanco','Eutimio','0002','A46210355','verano');
Insert into  trajes ( codigotraje,material,color,disenador,numerodesede,cifproveedor,temporada ) values ('200013', 'raso', 'azul','Lalola','0003','A46210355','verano');
Insert into  trajes ( codigotraje,material,color,disenador,numerodesede,cifproveedor,temporada ) values ('220013', 'terciopelo', 'negro','Tucci','0004','A46210355','otoño');
Insert into  trajes ( codigotraje,material,color,disenador,numerodesede,cifproveedor,temporada ) values ('260013', 'terciopelo', 'gris','Lalola','0005','A46210734','invierno');
Insert into  trajes ( codigotraje,material,color,disenador,numerodesede,cifproveedor,temporada ) values ('280013', 'algodon', 'blanco','Tucci','0004','A46210355','invierno');
Insert into  trajes ( codigotraje,material,color,disenador,numerodesede,cifproveedor,temporada ) values ('267013', 'sarga', 'negro','Lalola','0005','A46210734','invierno');







create table proveedor
(
cifproveedor varchar2(9),
nombreproveedor varchar2(12),
fax number(10),
direccion varchar(20),
contrato varchar(9),
constraint pk_cif_proveedor primary key (cifproveedor)
);


#en la tabla provedor el nombre del proveedor no se puede repetir


ALTER TABLE proveedor
ADD CONSTRAINT proveedor_unico UNIQUE (nombreproveedor);

#en la tabla proveedor eliminamos la columna fax

alter table proveedor
drop column fax;

#el cifdelproveedor tendra el formato cif con una empresion regular

alter table proveedor
add constraint cifprofedor_expresion CHECK ( REGEXP_LIKE (cifproveedor, '[ABCDEFGHKLMNPQS]{1}[0-9]{7}.'));




ALTER TABLE proveedor
ADD CONSTRAINT contrato_check CHECK (contrato IN (‘exclusivo’, ‘normal’));



Insert into  proveedor ( cifproveedor, nombreproveedor, direccion, contrato ) values ('A46210334', 'Eutimio', 'Calle Pelota 3 cadiz','exclusivo');
Insert into  proveedor ( cifproveedor, nombreproveedor, direccion, contrato ) values ('A46210567', 'Trajeson', 'Gavia 3 Granada','exclusivo');
Insert into  proveedor ( cifproveedor, nombreproveedor, direccion, contrato ) values ('A46210355', 'Napoli', 'calle iris 3 Madrid','exclusivo');
Insert into  proveedor ( cifproveedor, nombreproveedor, direccion, contrato ) values ('A46214334', 'Tucci', 'Calle Ceuta Vigo','normal');
Insert into  proveedor ( cifproveedor, nombreproveedor, direccion, contrato ) values ('A46210734', 'lalola', 'Calle Real 3 Jerez','normal');