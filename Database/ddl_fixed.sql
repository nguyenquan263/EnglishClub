create table ADMIN
(
   ID                   int not null auto_increment  comment '',
   USERNAME             varchar(50) not null  comment '',
   PASSWORD             varchar(50) not null  comment '',
   LASTNAME             varchar(100) not null  comment '',
   FIRSTNAME            varchar(100) not null  comment '',
   ROLE                 varchar(10) not null  comment '',
   PHONE                varchar(15) not null  comment '',
   EMAIL                varchar(100) not null  comment '',
   STATUS               bool not null  comment '',
   primary key (ID)
) ENGINE=InnoDB CHARSET=utf8;

/*==============================================================*/
/* Table: MATERIALTYPE                                          */
/*==============================================================*/
create table MATERIALTYPE
(
   ID                   int not null auto_increment  comment '',
   NAME                 varchar(100) not null  comment '',
   STATUS               bool not null  comment '',
   primary key (ID)
) ENGINE=InnoDB CHARSET=utf8;

/*==============================================================*/
/* Table: MATERIAL                                              */
/*==============================================================*/
create table MATERIAL
(
   ID                   int not null auto_increment  comment '',
   TITLE                varchar(100) not null  comment '',
   TITLEPICTURE         varchar(255)  comment '',
   CONTENT              varchar(10000)  comment '',
   ADMINID              int not null  comment '',
   MATERIALTYPEID       int not null  comment '',
   POSTDATE             date  comment '',
   STATUS               bool not null  comment '',
   primary key (ID)
) ENGINE=InnoDB CHARSET=utf8;

/*==============================================================*/
/* Table: FILE                                                  */
/*==============================================================*/
create table FILE
(
   ID                   int not null auto_increment  comment '',
   LINK                 varchar(1000) not null  comment '',
   MATERIALID           int not null  comment '',
   STATUS               bool not null  comment '',
   primary key (ID)
) ENGINE=InnoDB CHARSET=utf8;

/*==============================================================*/
/* Table: TIPTYPE                                               */
/*==============================================================*/
create table TIPTYPE
(
   ID                   int not null auto_increment  comment '',
   NAME                 varchar(100) not null  comment '',
   STATUS               bool not null  comment '',
   primary key (ID)
) ENGINE=InnoDB CHARSET=utf8;

/*==============================================================*/
/* Table: TIP                                                   */
/*==============================================================*/
create table TIP
(
   ID                   int not null auto_increment  comment '',
   TITLE                varchar(100) not null  comment '',
   TITLEPICTURE         varchar(255) not null  comment '',
   CONTENT              varchar(100000) not null  comment '',
   ADMINID              int not null  comment '',
   TIPTYPEID            int not null  comment '',
   POSTDATE             date  comment '',
   STATUS               bool not null  comment '',
   primary key (ID)
) ENGINE=InnoDB CHARSET=utf8;

/*==============================================================*/
/* Table: VIDEOTYPE                                             */
/*==============================================================*/
create table VIDEOTYPE
(
   ID                   int not null auto_increment  comment '',
   NAME                 varchar(100) not null  comment '',
   STATUS               bool not null  comment '',
   primary key (ID)
) ENGINE=InnoDB CHARSET=utf8;

/*==============================================================*/
/* Table: VIDEO                                                 */
/*==============================================================*/
create table VIDEO
(
   ID                   int not null auto_increment  comment '',
   TITLE                varchar(100) not null  comment '',
   DESCRIPTION          varchar(1000) not null  comment '',
   LINK                 varchar(500) not null  comment '',
   ADMINID              int not null  comment '',
   CLIPTYPEID           int not null  comment '',
   POSTDATE             date  comment '',
   STATUS               bool not null  comment '',
   primary key (ID)
) ENGINE=InnoDB CHARSET=utf8;

alter table FILE add constraint FK_FILE_FK_FILE_MATERIAL foreign key (MATERIALID)
      references MATERIAL (ID) on delete restrict on update restrict;

alter table MATERIAL add constraint FK_MATERIAL_FK_MATERI_ADMIN foreign key (ADMINID)
      references ADMIN (ID) on delete restrict on update restrict;

alter table MATERIAL add constraint FK_MATERIAL_FK_MATERI_MATERIAL foreign key (MATERIALTYPEID)
      references MATERIALTYPE (ID) on delete restrict on update restrict;

alter table TIP add constraint FK_TIP_FK_TIP_ADMIN foreign key (ADMINID)
      references ADMIN (ID) on delete restrict on update restrict;

alter table TIP add constraint FK_TIP_FK_TIP_TY_TIPTYPE foreign key (TIPTYPEID)
      references TIPTYPE (ID) on delete restrict on update restrict;

alter table VIDEO add constraint FK_VIDEO_FK_CLIP_ADMIN foreign key (ADMINID)
      references ADMIN (ID) on delete restrict on update restrict;

alter table VIDEO add constraint FK_VIDEO_FK_CLIP_T_VIDEOTYP foreign key (CLIPTYPEID)
      references VIDEOTYPE (ID) on delete restrict on update restrict;

