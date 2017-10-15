-- Author [ent2]
alter table "public"."author"  add column  "keywords"  text;
alter table "public"."author"  add column  "name"  varchar(255);
alter table "public"."author"  add column  "university"  varchar(255);
alter table "public"."author"  add column  "email"  varchar(255);


-- User_Author [rel1]
alter table "public"."author"  add column  "user_oid"  int4;
alter table "public"."author"   add constraint fk_author_user foreign key ("user_oid") references "public"."user" ("oid");


-- Owner [rel3]
alter table "public"."publication"  add column  "author_oid"  int4;
alter table "public"."publication"   add constraint fk_publication_author foreign key ("author_oid") references "public"."author" ("oid");


