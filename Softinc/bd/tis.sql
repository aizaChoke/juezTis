/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     11/10/2013 11:23:07 p.m.                     */
/*==============================================================*/


drop index RELATIONSHIP_13_FK;

drop index ARCHIVO_PK;

drop table ARCHIVO;

drop index RELATIONSHIP_12_FK;

drop index CALIFICACION_PK;

drop table CALIFICACION;

drop index LENGUAJE_PROGRAMACION_PK;

drop table LENGUAJE_PROGRAMACION;

drop index OLIMPIADA_PK;

drop table OLIMPIADA;

drop index RELATIONSHIP_9_FK;

drop index RELATIONSHIP_7_FK;

drop index RELATIONSHIP_7_PK;

drop table PERTENECE;

drop index RELATIONSHIP_8_FK;

drop index RELATIONSHIP_5_FK;

drop index PROBLEMA_PK;

drop table PROBLEMA;

drop index ROL_PK;

drop table ROL;

drop index RELATIONSHIP_11_FK;

drop index RELATIONSHIP_10_FK;

drop index SOLUCION_OLIMPISTA_PK;

drop table SOLUCION_OLIMPISTA;

drop index RELATIONSHIP_3_FK;

drop index USUARIO_PK;

drop table USUARIO;

/*==============================================================*/
/* Table: ARCHIVO                                               */
/*==============================================================*/
create table ARCHIVO (
   ID_ARCHIVO           SERIAL               not null,
   ID_PROBLEMA          INT4                 null,
   PROBLEMA_ARCHIVO     VARCHAR(50)          not null,
   ENTRADA_ARCHIVO      VARCHAR(50)          not null,
   SOLUCION_ARCHIVO     VARCHAR(50)          not null,
   constraint PK_ARCHIVO primary key (ID_ARCHIVO)
);

/*==============================================================*/
/* Index: ARCHIVO_PK                                            */
/*==============================================================*/
create unique index ARCHIVO_PK on ARCHIVO (
ID_ARCHIVO
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on ARCHIVO (
ID_PROBLEMA
);

/*==============================================================*/
/* Table: CALIFICACION                                          */
/*==============================================================*/
create table CALIFICACION (
   ID_CALIFICACION      SERIAL               not null,
   ID_SOLUCION_OLIMPISTA INT4                 not null,
   NOTA_CALIFICACION    INT4                 not null,
   MENSAJE_CALIFICACION VARCHAR(50)          not null,
   constraint PK_CALIFICACION primary key (ID_CALIFICACION)
);

/*==============================================================*/
/* Index: CALIFICACION_PK                                       */
/*==============================================================*/
create unique index CALIFICACION_PK on CALIFICACION (
ID_CALIFICACION
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on CALIFICACION (
ID_SOLUCION_OLIMPISTA
);

/*==============================================================*/
/* Table: LENGUAJE_PROGRAMACION                                 */
/*==============================================================*/
create table LENGUAJE_PROGRAMACION (
   ID_LENGUAJE          SERIAL               not null,
   NOMBRE_LENGUAJE      VARCHAR(50)          not null,
   constraint PK_LENGUAJE_PROGRAMACION primary key (ID_LENGUAJE)
);

/*==============================================================*/
/* Index: LENGUAJE_PROGRAMACION_PK                              */
/*==============================================================*/
create unique index LENGUAJE_PROGRAMACION_PK on LENGUAJE_PROGRAMACION (
ID_LENGUAJE
);

/*==============================================================*/
/* Table: OLIMPIADA                                             */
/*==============================================================*/
create table OLIMPIADA (
   ID_OLIMPIADA         SERIAL               not null,
   NOMBRE_OLIMPIADA     VARCHAR(50)          not null,
   FECHA_INICIO_OLIMPIADA DATE                 not null,
   FECHA_FIN_OLIMPIADA  DATE                 not null,
   constraint PK_OLIMPIADA primary key (ID_OLIMPIADA)
);

/*==============================================================*/
/* Index: OLIMPIADA_PK                                          */
/*==============================================================*/
create unique index OLIMPIADA_PK on OLIMPIADA (
ID_OLIMPIADA
);

/*==============================================================*/
/* Table: PERTENECE                                             */
/*==============================================================*/
create table PERTENECE (
   ID_USUARIO           INT4                 not null,
   ID_OLIMPIADA         INT4                 not null,
   constraint PK_PERTENECE primary key (ID_USUARIO, ID_OLIMPIADA)
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_PK                                     */
/*==============================================================*/
create unique index RELATIONSHIP_7_PK on PERTENECE (
ID_USUARIO,
ID_OLIMPIADA
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on PERTENECE (
ID_USUARIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on PERTENECE (
ID_OLIMPIADA
);

/*==============================================================*/
/* Table: PROBLEMA                                              */
/*==============================================================*/
create table PROBLEMA (
   ID_PROBLEMA          SERIAL               not null,
   ID_USUARIO           INT4                 null,
   ID_OLIMPIADA         INT4                 null,
   NOMBRE_PROBLEMA      VARCHAR(50)          not null,
   DESCRIPCION_PROBLEMA VARCHAR(10000)       not null,
   constraint PK_PROBLEMA primary key (ID_PROBLEMA)
);

/*==============================================================*/
/* Index: PROBLEMA_PK                                           */
/*==============================================================*/
create unique index PROBLEMA_PK on PROBLEMA (
ID_PROBLEMA
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on PROBLEMA (
ID_OLIMPIADA
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on PROBLEMA (
ID_USUARIO
);

/*==============================================================*/
/* Table: ROL                                                   */
/*==============================================================*/
create table ROL (
   ID_ROL               SERIAL               not null,
   NOMBRE_TIPO          VARCHAR(50)          not null,
   constraint PK_ROL primary key (ID_ROL)
);

/*==============================================================*/
/* Index: ROL_PK                                                */
/*==============================================================*/
create unique index ROL_PK on ROL (
ID_ROL
);

/*==============================================================*/
/* Table: SOLUCION_OLIMPISTA                                    */
/*==============================================================*/
create table SOLUCION_OLIMPISTA (
   ID_SOLUCION_OLIMPISTA SERIAL               not null,
   ID_LENGUAJE          INT4                 null,
   ID_PROBLEMA          INT4                 null,
   TEXTO_SOLUCION_OLIMPISTA VARCHAR(10000)       not null,
   CODIGO_SOLUCION_OLIMPISTA INT4                 not null,
   constraint PK_SOLUCION_OLIMPISTA primary key (ID_SOLUCION_OLIMPISTA)
);

/*==============================================================*/
/* Index: SOLUCION_OLIMPISTA_PK                                 */
/*==============================================================*/
create unique index SOLUCION_OLIMPISTA_PK on SOLUCION_OLIMPISTA (
ID_SOLUCION_OLIMPISTA
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on SOLUCION_OLIMPISTA (
ID_LENGUAJE
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on SOLUCION_OLIMPISTA (
ID_PROBLEMA
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID_USUARIO           SERIAL               not null,
   ID_ROL               INT4                 null,
   NOMBRE_USUARIO       VARCHAR(50)          not null,
   APELLIDO_USUARIO     VARCHAR(50)          not null,
   CI_USUARIO           VARCHAR(50)          not null,
   USER_USUARIO         VARCHAR(50)          not null,
   PASS_USUARIO         VARCHAR(50)          not null,
   INSTITUCION_USUARIO  VARCHAR(50)          not null,
   FECHA_NACIMIENTO_USUARIO DATE                 not null,
   EMAIL_USUARIO        VARCHAR(50)          not null,
   constraint PK_USUARIO primary key (ID_USUARIO)
);

/*==============================================================*/
/* Index: USUARIO_PK                                            */
/*==============================================================*/
create unique index USUARIO_PK on USUARIO (
ID_USUARIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on USUARIO (
ID_ROL
);

alter table ARCHIVO
   add constraint FK_ARCHIVO_RELATIONS_PROBLEMA foreign key (ID_PROBLEMA)
      references PROBLEMA (ID_PROBLEMA)
      on delete restrict on update restrict;

alter table CALIFICACION
   add constraint FK_CALIFICA_RELATIONS_SOLUCION foreign key (ID_SOLUCION_OLIMPISTA)
      references SOLUCION_OLIMPISTA (ID_SOLUCION_OLIMPISTA)
      on delete restrict on update restrict;

alter table PERTENECE
   add constraint FK_PERTENEC_RELATIONS_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on delete restrict on update restrict;

alter table PERTENECE
   add constraint FK_PERTENEC_RELATIONS_OLIMPIAD foreign key (ID_OLIMPIADA)
      references OLIMPIADA (ID_OLIMPIADA)
      on delete restrict on update restrict;

alter table PROBLEMA
   add constraint FK_PROBLEMA_RELATIONS_OLIMPIAD foreign key (ID_OLIMPIADA)
      references OLIMPIADA (ID_OLIMPIADA)
      on delete restrict on update restrict;

alter table PROBLEMA
   add constraint FK_PROBLEMA_RELATIONS_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on delete restrict on update restrict;

alter table SOLUCION_OLIMPISTA
   add constraint FK_SOLUCION_RELATIONS_LENGUAJE foreign key (ID_LENGUAJE)
      references LENGUAJE_PROGRAMACION (ID_LENGUAJE)
      on delete restrict on update restrict;

alter table SOLUCION_OLIMPISTA
   add constraint FK_SOLUCION_RELATIONS_PROBLEMA foreign key (ID_PROBLEMA)
      references PROBLEMA (ID_PROBLEMA)
      on delete restrict on update restrict;

alter table USUARIO
   add constraint FK_USUARIO_RELATIONS_ROL foreign key (ID_ROL)
      references ROL (ID_ROL)
      on delete restrict on update restrict;

