Hibernate: 
    
    drop table if exists Comment ;
Hibernate: 
    
    drop table Community if exists
Hibernate: 
    
    drop table Donation if exists
Hibernate: 
    
    drop table Project if exists
Hibernate: 
    
    drop table Project_imageUrls if exists
Hibernate: 
    
    drop table Project_User if exists
Hibernate: 
    
    drop table ServiceEvent if exists
Hibernate: 
    
    drop table ServiceEvent_Project if exists
Hibernate: 
    
    drop table Skill if exists
Hibernate: 
    
    drop table Tool if exists
Hibernate: 
    
    drop table User if exists
Hibernate: 
    
    drop table User_Community if exists
Hibernate: 
    
    drop table User_Skill if exists
Hibernate: 
    
    drop table User_Tool if exists
Hibernate: 
    
    drop sequence if exists hibernate_sequence
Hibernate: create sequence hibernate_sequence start with 1 increment by 1
Apr 08, 2019 11:50:54 AM org.hibernate.resource.transaction.backend.jdbc.internal.DdlTransactionIsolatorNonJtaImpl getIsolatedConnection
INFO: HHH10001501: Connection obtained from JdbcConnectionAccess [org.hibernate.engine.jdbc.env.internal.JdbcEnvironmentInitiator$ConnectionProviderJdbcConnectionAccess@af9a89f] for (non-JTA) DDL execution was not in auto-commit mode; the Connection 'local transaction' will be committed and the Connection will be set into auto-commit mode.
Hibernate: 
    
    create table Comment (
       id integer not null,
        dateAdded timestamp,
        text clob,
        project_id integer,
        submitter_id integer,
        comments_index integer,
        primary key (id)
    )
Hibernate: 
    
    create table Community (
       id integer not null,
        name varchar(255),
        creator_id integer,
        primary key (id)
    )
Hibernate: 
    
    create table Donation (
       id integer not null,
        amount double not null,
        dateAdded timestamp,
        project_id integer,
        user_id integer,
        primary key (id)
    )
Hibernate: 
    
    create table Project (
       id integer not null,
        address1 varchar(255),
        address2 varchar(255),
        city varchar(255),
        dateAdded timestamp,
        description clob,
        email varchar(255),
        firstName varchar(255),
        lastName varchar(255),
        phone varchar(255),
        state varchar(255),
        title varchar(255),
        zip varchar(255),
        organizer_id integer,
        submitter_id integer,
        projectsOrganized_index integer,
        projectsSubmitted_index integer,
        primary key (id)
    )
Hibernate: 
    
    create table Project_imageUrls (
       Project_id integer not null,
        imageUrls varchar(255)
    )
Hibernate: 
    
    create table Project_User (
       projectsVolunteered_id integer not null,
        volunteers_id integer not null
    )
Hibernate: 
    
    create table ServiceEvent (
       id integer not null,
        date timestamp,
        description clob,
        name varchar(255),
        community_id integer,
        organizer_id integer,
        primary key (id)
    )
Hibernate: 
    
    create table ServiceEvent_Project (
       ServiceEvent_id integer not null,
        projects_id integer not null
    )
Hibernate: 
    
    create table Skill (
       id integer not null,
        name varchar(255),
        primary key (id)
    )
Hibernate: 
    
    create table Tool (
       id integer not null,
        name varchar(255),
        primary key (id)
    )
Hibernate: 
    
    create table User (
       id integer not null,
        email varchar(255),
        name varchar(255),
        phone varchar(255),
        primary key (id)
    )
Hibernate: 
    
    create table User_Community (
       User_id integer not null,
        communityMemberships_id integer not null
    )
Hibernate: 
    
    create table User_Skill (
       User_id integer not null,
        skills_id integer not null
    )
Hibernate: 
    
    create table User_Tool (
       User_id integer not null,
        tools_id integer not null
    )
Hibernate: 
    
    alter table User 
       add constraint UK_9t4er00mstv8by4kyik0uong0 unique (email)
Hibernate: 
    
    alter table Comment 
       add constraint FKad9y3qtjwnl6t3nuwuxthi7bi 
       foreign key (project_id) 
       references Project
Hibernate: 
    
    alter table Comment 
       add constraint FKn8jb1ggs0ahvwc1psolaktf12 
       foreign key (submitter_id) 
       references User
Hibernate: 
    
    alter table Community 
       add constraint FKdffgr4okav4rhur3b66foq3n6 
       foreign key (creator_id) 
       references User
Hibernate: 
    
    alter table Donation 
       add constraint FKal1xydulkctk6n89s0d427maq 
       foreign key (project_id) 
       references Project
Hibernate: 
    
    alter table Donation 
       add constraint FKemqkouhxxkdqqv6x6muxs1ea6 
       foreign key (user_id) 
       references User
Hibernate: 
    
    alter table Project 
       add constraint FKqfrikm9nrmheg5blc0548vxtc 
       foreign key (organizer_id) 
       references User
Hibernate: 
    
    alter table Project 
       add constraint FK3w93gr36oeq8b66h7qbnd249m 
       foreign key (submitter_id) 
       references User
Hibernate: 
    
    alter table Project_imageUrls 
       add constraint FK1f9w17uky99xkf7ifvheob44d 
       foreign key (Project_id) 
       references Project
Hibernate: 
    
    alter table Project_User 
       add constraint FKiqvienoawsg7fospehsd8hgo1 
       foreign key (volunteers_id) 
       references User
Hibernate: 
    
    alter table Project_User 
       add constraint FKok6996j5ld6i5y82f74xud98o 
       foreign key (projectsVolunteered_id) 
       references Project
Hibernate: 
    
    alter table ServiceEvent 
       add constraint FK4nytso6o15vnkeb40f3vx8hxx 
       foreign key (community_id) 
       references Community
Hibernate: 
    
    alter table ServiceEvent 
       add constraint FK9fgywqqvyl4b4ulu2w2wyx2bq 
       foreign key (organizer_id) 
       references User
Hibernate: 
    
    alter table ServiceEvent_Project 
       add constraint FKsty4yr5dyy0s4nolw5uwkawt9 
       foreign key (projects_id) 
       references Project
Hibernate: 
    
    alter table ServiceEvent_Project 
       add constraint FK3ry9obpg6eagx0r57y2n16lk2 
       foreign key (ServiceEvent_id) 
       references ServiceEvent
Hibernate: 
    
    alter table User_Community 
       add constraint FK2x9rmek3o05cfr294wpsppds 
       foreign key (communityMemberships_id) 
       references Community
Hibernate: 
    
    alter table User_Community 
       add constraint FKhy5r9lsbcjr0epg2h3nmw7al8 
       foreign key (User_id) 
       references User
Hibernate: 
    
    alter table User_Skill 
       add constraint FKofe1nbhccdfcw4gmuuqi3fq08 
       foreign key (skills_id) 
       references Skill
Hibernate: 
    
    alter table User_Skill 
       add constraint FKf4m52klbythya2jxkfmy3apyi 
       foreign key (User_id) 
       references User
Hibernate: 
    
    alter table User_Tool 
       add constraint FK2bnyj9oxae2cxm8gwg6ktymrc 
       foreign key (tools_id) 
       references Tool
Hibernate: 
    
    alter table User_Tool 
       add constraint FK1rq50pr38jqoq5bln7tsftp0k 
       foreign key (User_id) 
       references User
Apr 08, 2019 11:50:54 AM org.hibernate.tool.schema.internal.SchemaCreatorImpl applyImportSources
INFO: HHH000476: Executing import script 'org.hibernate.tool.schema.internal.exec.ScriptSourceInputNonExistentImpl@4248e66b'
Hibernate: 
    call next value for hibernate_sequence
Hibernate: 
    insert 
    into
        Tool
        (name, id) 
    values
        (?, ?)
Hibernate: 
    call next value for hibernate_sequence
Hibernate: 
    insert 
    into
        Skill
        (name, id) 
    values
        (?, ?)
Hibernate: 
    call next value for hibernate_sequence
Hibernate: 
    insert 
    into
        User
        (email, name, phone, id) 
    values
        (?, ?, ?, ?)
Hibernate: 
    insert 
    into
        User_Skill
        (User_id, skills_id) 
    values
        (?, ?)
Hibernate: 
    insert 
    into
        User_Tool
        (User_id, tools_id) 
    values
        (?, ?)
Hibernate: 
    select
        user0_.id as id1_10_0_,
        user0_.email as email2_10_0_,
        user0_.name as name3_10_0_,
        user0_.phone as phone4_10_0_ 
    from
        User user0_ 
    where
        user0_.id=?
Hibernate: 
    select
        tools0_.User_id as User_id1_13_0_,
        tools0_.tools_id as tools_id2_13_0_,
        tool1_.id as id1_9_1_,
        tool1_.name as name2_9_1_ 
    from
        User_Tool tools0_ 
    inner join
        Tool tool1_ 
            on tools0_.tools_id=tool1_.id 
    where
        tools0_.User_id=?
Hibernate: 
    select
        skills0_.User_id as User_id1_12_0_,
        skills0_.skills_id as skills_i2_12_0_,
        skill1_.id as id1_8_1_,
        skill1_.name as name2_8_1_ 
    from
        User_Skill skills0_ 
    inner join
        Skill skill1_ 
            on skills0_.skills_id=skill1_.id 
    where
        skills0_.User_id=?

Name: Brett Meyer
Email: foo@foo.com
Phone: 123-456-7890
Tool: Hammer
Skill: Hammering Things