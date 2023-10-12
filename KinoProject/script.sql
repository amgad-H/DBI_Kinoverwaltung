create table "Opening_Hours"
(
    OH_PK                    NUMBER generated as identity
        constraint OH_PK
            primary key,
    "Starting_Hours_Of_Week" VARCHAR2(255),
    "Ending_Hours_Of_Week"   VARCHAR2(255)
)
/

create table "Category"
(
    "Category_PK" NUMBER generated as identity
        constraint "Category_PK"
            primary key,
    "Category"    VARCHAR2(255)
)
/

create table "Movie"
(
    "Movie_PK"     NUMBER generated as identity
        constraint "Movie_PK"
            primary key,
    "Duration"     NUMBER not null,
    "Release_Date" DATE   not null,
    "Category_FK"  NUMBER
        constraint "Movie_Category_Category_PK_fk"
            references "Category"
)
/

comment on column "Movie"."Duration" is 'Duration in minutes'
/

create table "Address"
(
    "Address_PK" NUMBER generated as identity
        constraint "Address_PK"
            primary key,
    "Street"     VARCHAR2(255),
    "Number"     NUMBER,
    "City"       VARCHAR2(255)
)
/

create table "Cinema"
(
    "Cinema_PK"     NUMBER generated as identity
        constraint "Cinema_PK"
            primary key,
    "Opening_Hours" NUMBER
        constraint "Cinema_Opening_Hours_OH_PK_fk"
            references "Opening_Hours",
    "Address"       NUMBER
        constraint "Cinema_Address_Address_PK_fk"
            references "Address"
)
/

create table "Showcasing"
(
    "Showcasing_PK" NUMBER generated as identity
        constraint "Showcasing_pk"
            primary key,
    "Movie_FK"      NUMBER
        constraint "Showcasing_Movie_Movie_PK_fk"
            references "Movie",
    "Start_Date"    DATE,
    "End_Date"      DATE
)
/

create table "Customer"
(
    "Customer_PK" NUMBER generated as identity
        constraint "Customer_PK"
            primary key,
    "Showcase_FK" NUMBER
        constraint "Customer_Showcasing_Showcasing_PK_fk"
            references "Showcasing"
)
/

create table "Type"
(
    "Type" NUMBER generated as identity
        constraint "Type_PK"
            primary key
)
/

create table "Room"
(
    "Room_PK"     NUMBER generated as identity,
    "Type_FK"     NUMBER
        constraint "Room_Type_Type_fk"
            references "Type",
    "Cinema_FK"   NUMBER
        constraint "Room_Cinema_Cinema_PK_fk"
            references "Cinema",
    "Showcase_FK" NUMBER
        constraint "Room_Showcasing_Showcasing_PK_fk"
            references "Showcasing"
)
/

create unique index "Room_pk"
    on "Room" ("Room_PK")
/

alter table "Room"
    add constraint "Room_PK"
        primary key ("Room_PK")
/

create table "Seat"
(
    "Seat_PK"     NUMBER generated as identity,
    "Is_Occupied" NUMBER,
    "Room_FK"     NUMBER
        constraint "Seat_Room_Room_PK_fk"
            references "Room",
    "Showcase_FK" NUMBER
        constraint "Seat_Showcasing_Showcasing_PK_fk"
            references "Showcasing"
)
/

create unique index "Seat_pk"
    on "Seat" ("Seat_PK")
/

alter table "Seat"
    add constraint "Seat_PK"
        primary key ("Seat_PK")
/


