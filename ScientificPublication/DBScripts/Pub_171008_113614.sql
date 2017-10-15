-- Group [Group]
create table "public"."group" (
   "oid"  int4  not null,
   "groupname"  varchar(255),
  primary key ("oid")
);


-- Module [Module]
create table "public"."module" (
   "oid"  int4  not null,
   "moduleid"  varchar(255),
   "modulename"  varchar(255),
  primary key ("oid")
);


-- User [User]
create table "public"."user" (
   "oid"  int4  not null,
   "username"  varchar(255),
   "password"  varchar(255),
   "email"  varchar(255),
  primary key ("oid")
);


-- Publication [ent1]
create table "public"."publication" (
   "oid"  int4  not null,
   "title"  varchar(255),
   "venue"  varchar(255),
   "year"  int4,
   "abstract"  text,
   "pdf"  varchar(255),
   "keyword"  varchar(255),
   "public"  int4,
  primary key ("oid")
);


-- Author [ent2]
create table "public"."author" (
   "oid"  int4  not null,
   "reputation"  float8,
  primary key ("oid")
);


-- Collection [ent5]
create table "public"."collection" (
   "oid"  int4  not null,
   "title"  varchar(255),
   "description"  text,
   "npublication"  int4,
   "keywords"  text,
  primary key ("oid")
);


-- Info [ent7]
create table "public"."info" (
   "oid"  int4  not null,
   "email"  varchar(255),
   "name"  varchar(255),
   "university"  varchar(255),
   "keyword"  text,
  primary key ("oid")
);


-- Comment [ent8]
create table "public"."comment" (
   "oid"  int4  not null,
   "title"  varchar(255),
   "timestamp"  timestamp,
   "textual"  text,
  primary key ("oid")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "public"."group"  add column  "module_oid"  int4;
alter table "public"."group"   add constraint fk_group_module foreign key ("module_oid") references "public"."module" ("oid");


-- Group_Module [Group2Module_Module2Group]
create table "public"."group_module" (
   "group_oid"  int4 not null,
   "module_oid"  int4 not null,
  primary key ("group_oid", "module_oid")
);
alter table "public"."group_module"   add constraint fk_group_module_group foreign key ("group_oid") references "public"."group" ("oid");
alter table "public"."group_module"   add constraint fk_group_module_module foreign key ("module_oid") references "public"."module" ("oid");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."user"  add column  "group_oid"  int4;
alter table "public"."user"   add constraint fk_user_group foreign key ("group_oid") references "public"."group" ("oid");


-- User_Group [User2Group_Group2User]
create table "public"."user_group" (
   "user_oid"  int4 not null,
   "group_oid"  int4 not null,
  primary key ("user_oid", "group_oid")
);
alter table "public"."user_group"   add constraint fk_user_group_user foreign key ("user_oid") references "public"."user" ("oid");
alter table "public"."user_group"   add constraint fk_user_group_group foreign key ("group_oid") references "public"."group" ("oid");


-- Author_Publication [rel10]
create table "public"."author_publication" (
   "author_oid"  int4 not null,
   "publication_oid"  int4 not null,
  primary key ("author_oid", "publication_oid")
);
alter table "public"."author_publication"   add constraint fk_author_publication_author foreign key ("author_oid") references "public"."author" ("oid");
alter table "public"."author_publication"   add constraint fk_author_publication_publicat foreign key ("publication_oid") references "public"."publication" ("oid");


-- Publication_Info [rel11]
alter table "public"."publication"  add column  "info_oid"  int4;
alter table "public"."publication"   add constraint fk_publication_info foreign key ("info_oid") references "public"."info" ("oid");


-- Author_Info [rel3]
alter table "public"."info"  add column  "author_oid"  int4;
alter table "public"."info"   add constraint fk_info_author foreign key ("author_oid") references "public"."author" ("oid");


-- User_Info [rel4]
alter table "public"."info"  add column  "user_oid"  int4;
alter table "public"."info"   add constraint fk_info_user foreign key ("user_oid") references "public"."user" ("oid");


-- Collection_Publication [rel5]
create table "public"."collection_publication" (
   "collection_oid"  int4 not null,
   "publication_oid"  int4 not null,
  primary key ("collection_oid", "publication_oid")
);
alter table "public"."collection_publication"   add constraint fk_collection_publication_coll foreign key ("collection_oid") references "public"."collection" ("oid");
alter table "public"."collection_publication"   add constraint fk_collection_publication_publ foreign key ("publication_oid") references "public"."publication" ("oid");


-- User_Collection [rel6]
alter table "public"."collection"  add column  "user_oid"  int4;
alter table "public"."collection"   add constraint fk_collection_user foreign key ("user_oid") references "public"."user" ("oid");


-- User_Collection_2 [rel7]
create table "public"."user_collection_2" (
   "user_oid"  int4 not null,
   "collection_oid"  int4 not null,
  primary key ("user_oid", "collection_oid")
);
alter table "public"."user_collection_2"   add constraint fk_user_collection_2_user foreign key ("user_oid") references "public"."user" ("oid");
alter table "public"."user_collection_2"   add constraint fk_user_collection_2_collectio foreign key ("collection_oid") references "public"."collection" ("oid");


-- User_Comment [rel8]
alter table "public"."user"  add column  "comment_oid"  int4;
alter table "public"."user"   add constraint fk_user_comment foreign key ("comment_oid") references "public"."comment" ("oid");


-- Comment_Publication [rel9]
alter table "public"."comment"  add column  "publication_oid"  int4;
alter table "public"."comment"   add constraint fk_comment_publication foreign key ("publication_oid") references "public"."publication" ("oid");


