
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/21/2016 00:37:48
-- Generated from EDMX file: C:\Users\Murat\Desktop\Gazete ve Haber\GazeteVeHaber\Data\gazete.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [gazete];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UserTypeUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserSet] DROP CONSTRAINT [FK_UserTypeUser];
GO
IF OBJECT_ID(N'[dbo].[FK_UserPayment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PaymentSet] DROP CONSTRAINT [FK_UserPayment];
GO
IF OBJECT_ID(N'[dbo].[FK_UserComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CommentSet] DROP CONSTRAINT [FK_UserComment];
GO
IF OBJECT_ID(N'[dbo].[FK_CategoryNews]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NewsSet] DROP CONSTRAINT [FK_CategoryNews];
GO
IF OBJECT_ID(N'[dbo].[FK_AuthorNews]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NewsSet] DROP CONSTRAINT [FK_AuthorNews];
GO
IF OBJECT_ID(N'[dbo].[FK_NewsTypeNews]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NewsSet] DROP CONSTRAINT [FK_NewsTypeNews];
GO
IF OBJECT_ID(N'[dbo].[FK_NewsPicture]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PictureSet] DROP CONSTRAINT [FK_NewsPicture];
GO
IF OBJECT_ID(N'[dbo].[FK_NewsComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CommentSet] DROP CONSTRAINT [FK_NewsComment];
GO
IF OBJECT_ID(N'[dbo].[FK_UserLog]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LogSet] DROP CONSTRAINT [FK_UserLog];
GO
IF OBJECT_ID(N'[dbo].[FK_UserProjectAccess]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProjectAccessSet] DROP CONSTRAINT [FK_UserProjectAccess];
GO
IF OBJECT_ID(N'[dbo].[FK_ProjectProjectAccess]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProjectAccessSet] DROP CONSTRAINT [FK_ProjectProjectAccess];
GO
IF OBJECT_ID(N'[dbo].[FK_UserCart]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CartSet] DROP CONSTRAINT [FK_UserCart];
GO
IF OBJECT_ID(N'[dbo].[FK_ProjectCart]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CartSet] DROP CONSTRAINT [FK_ProjectCart];
GO
IF OBJECT_ID(N'[dbo].[FK_UserProject]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProjectSet] DROP CONSTRAINT [FK_UserProject];
GO
IF OBJECT_ID(N'[dbo].[FK_ProjectAccessPayment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PaymentSet] DROP CONSTRAINT [FK_ProjectAccessPayment];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[UserSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserSet];
GO
IF OBJECT_ID(N'[dbo].[UserTypeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserTypeSet];
GO
IF OBJECT_ID(N'[dbo].[AuthorSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AuthorSet];
GO
IF OBJECT_ID(N'[dbo].[NewsSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NewsSet];
GO
IF OBJECT_ID(N'[dbo].[NewsTypeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NewsTypeSet];
GO
IF OBJECT_ID(N'[dbo].[CategorySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CategorySet];
GO
IF OBJECT_ID(N'[dbo].[PictureSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PictureSet];
GO
IF OBJECT_ID(N'[dbo].[CommentSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CommentSet];
GO
IF OBJECT_ID(N'[dbo].[PaymentSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PaymentSet];
GO
IF OBJECT_ID(N'[dbo].[LogSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LogSet];
GO
IF OBJECT_ID(N'[dbo].[ProjectSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProjectSet];
GO
IF OBJECT_ID(N'[dbo].[CartSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CartSet];
GO
IF OBJECT_ID(N'[dbo].[ProjectAccessSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProjectAccessSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserSet'
CREATE TABLE [dbo].[UserSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserTypeId] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Mail] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Avatar] varbinary(max)  NULL
);
GO

-- Creating table 'UserTypeSet'
CREATE TABLE [dbo].[UserTypeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'AuthorSet'
CREATE TABLE [dbo].[AuthorSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Adi] nvarchar(max)  NOT NULL,
    [Soyadi] nvarchar(max)  NOT NULL,
    [Telefon] nvarchar(max)  NOT NULL,
    [Mail] nvarchar(max)  NOT NULL,
    [Foto] varbinary(max)  NULL
);
GO

-- Creating table 'NewsSet'
CREATE TABLE [dbo].[NewsSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Baslik] nvarchar(max)  NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [YayimTarihi] datetime  NOT NULL,
    [ResimYol] varbinary(max)  NULL,
    [CategoryId] int  NOT NULL,
    [AuthorId] int  NOT NULL,
    [NewsTypeId] int  NOT NULL
);
GO

-- Creating table 'NewsTypeSet'
CREATE TABLE [dbo].[NewsTypeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Adi] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CategorySet'
CREATE TABLE [dbo].[CategorySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Adi] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PictureSet'
CREATE TABLE [dbo].[PictureSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Ozet] nvarchar(max)  NOT NULL,
    [Resim] varbinary(max)  NULL,
    [NewsId] int  NOT NULL
);
GO

-- Creating table 'CommentSet'
CREATE TABLE [dbo].[CommentSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Baslik] nvarchar(max)  NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [Date] datetime  NOT NULL,
    [Verified] bit  NOT NULL,
    [UserId] int  NOT NULL,
    [NewsId] int  NOT NULL
);
GO

-- Creating table 'PaymentSet'
CREATE TABLE [dbo].[PaymentSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [Amount] decimal(18,2)  NOT NULL,
    [Date] datetime  NOT NULL,
    [ProjectAccess_Id] int  NOT NULL
);
GO

-- Creating table 'LogSet'
CREATE TABLE [dbo].[LogSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [Subject] nvarchar(max)  NOT NULL,
    [Detail] nvarchar(max)  NOT NULL,
    [Date] datetime  NOT NULL
);
GO

-- Creating table 'ProjectSet'
CREATE TABLE [dbo].[ProjectSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [File] varbinary(max)  NOT NULL,
    [FileName] nvarchar(max)  NOT NULL,
    [ContentType] nvarchar(max)  NOT NULL,
    [Price] decimal(18,2)  NOT NULL
);
GO

-- Creating table 'CartSet'
CREATE TABLE [dbo].[CartSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [Status] int  NOT NULL,
    [Count] int  NOT NULL,
    [ProjectId] int  NOT NULL
);
GO

-- Creating table 'ProjectAccessSet'
CREATE TABLE [dbo].[ProjectAccessSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [ProjectId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [PK_UserSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserTypeSet'
ALTER TABLE [dbo].[UserTypeSet]
ADD CONSTRAINT [PK_UserTypeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AuthorSet'
ALTER TABLE [dbo].[AuthorSet]
ADD CONSTRAINT [PK_AuthorSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'NewsSet'
ALTER TABLE [dbo].[NewsSet]
ADD CONSTRAINT [PK_NewsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'NewsTypeSet'
ALTER TABLE [dbo].[NewsTypeSet]
ADD CONSTRAINT [PK_NewsTypeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CategorySet'
ALTER TABLE [dbo].[CategorySet]
ADD CONSTRAINT [PK_CategorySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PictureSet'
ALTER TABLE [dbo].[PictureSet]
ADD CONSTRAINT [PK_PictureSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CommentSet'
ALTER TABLE [dbo].[CommentSet]
ADD CONSTRAINT [PK_CommentSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PaymentSet'
ALTER TABLE [dbo].[PaymentSet]
ADD CONSTRAINT [PK_PaymentSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'LogSet'
ALTER TABLE [dbo].[LogSet]
ADD CONSTRAINT [PK_LogSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProjectSet'
ALTER TABLE [dbo].[ProjectSet]
ADD CONSTRAINT [PK_ProjectSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CartSet'
ALTER TABLE [dbo].[CartSet]
ADD CONSTRAINT [PK_CartSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProjectAccessSet'
ALTER TABLE [dbo].[ProjectAccessSet]
ADD CONSTRAINT [PK_ProjectAccessSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserTypeId] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [FK_UserTypeUser]
    FOREIGN KEY ([UserTypeId])
    REFERENCES [dbo].[UserTypeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserTypeUser'
CREATE INDEX [IX_FK_UserTypeUser]
ON [dbo].[UserSet]
    ([UserTypeId]);
GO

-- Creating foreign key on [UserId] in table 'PaymentSet'
ALTER TABLE [dbo].[PaymentSet]
ADD CONSTRAINT [FK_UserPayment]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserPayment'
CREATE INDEX [IX_FK_UserPayment]
ON [dbo].[PaymentSet]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'CommentSet'
ALTER TABLE [dbo].[CommentSet]
ADD CONSTRAINT [FK_UserComment]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserComment'
CREATE INDEX [IX_FK_UserComment]
ON [dbo].[CommentSet]
    ([UserId]);
GO

-- Creating foreign key on [CategoryId] in table 'NewsSet'
ALTER TABLE [dbo].[NewsSet]
ADD CONSTRAINT [FK_CategoryNews]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[CategorySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryNews'
CREATE INDEX [IX_FK_CategoryNews]
ON [dbo].[NewsSet]
    ([CategoryId]);
GO

-- Creating foreign key on [AuthorId] in table 'NewsSet'
ALTER TABLE [dbo].[NewsSet]
ADD CONSTRAINT [FK_AuthorNews]
    FOREIGN KEY ([AuthorId])
    REFERENCES [dbo].[AuthorSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AuthorNews'
CREATE INDEX [IX_FK_AuthorNews]
ON [dbo].[NewsSet]
    ([AuthorId]);
GO

-- Creating foreign key on [NewsTypeId] in table 'NewsSet'
ALTER TABLE [dbo].[NewsSet]
ADD CONSTRAINT [FK_NewsTypeNews]
    FOREIGN KEY ([NewsTypeId])
    REFERENCES [dbo].[NewsTypeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NewsTypeNews'
CREATE INDEX [IX_FK_NewsTypeNews]
ON [dbo].[NewsSet]
    ([NewsTypeId]);
GO

-- Creating foreign key on [NewsId] in table 'PictureSet'
ALTER TABLE [dbo].[PictureSet]
ADD CONSTRAINT [FK_NewsPicture]
    FOREIGN KEY ([NewsId])
    REFERENCES [dbo].[NewsSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NewsPicture'
CREATE INDEX [IX_FK_NewsPicture]
ON [dbo].[PictureSet]
    ([NewsId]);
GO

-- Creating foreign key on [NewsId] in table 'CommentSet'
ALTER TABLE [dbo].[CommentSet]
ADD CONSTRAINT [FK_NewsComment]
    FOREIGN KEY ([NewsId])
    REFERENCES [dbo].[NewsSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NewsComment'
CREATE INDEX [IX_FK_NewsComment]
ON [dbo].[CommentSet]
    ([NewsId]);
GO

-- Creating foreign key on [UserId] in table 'LogSet'
ALTER TABLE [dbo].[LogSet]
ADD CONSTRAINT [FK_UserLog]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserLog'
CREATE INDEX [IX_FK_UserLog]
ON [dbo].[LogSet]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'ProjectAccessSet'
ALTER TABLE [dbo].[ProjectAccessSet]
ADD CONSTRAINT [FK_UserProjectAccess]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserProjectAccess'
CREATE INDEX [IX_FK_UserProjectAccess]
ON [dbo].[ProjectAccessSet]
    ([UserId]);
GO

-- Creating foreign key on [ProjectId] in table 'ProjectAccessSet'
ALTER TABLE [dbo].[ProjectAccessSet]
ADD CONSTRAINT [FK_ProjectProjectAccess]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[ProjectSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectProjectAccess'
CREATE INDEX [IX_FK_ProjectProjectAccess]
ON [dbo].[ProjectAccessSet]
    ([ProjectId]);
GO

-- Creating foreign key on [UserId] in table 'CartSet'
ALTER TABLE [dbo].[CartSet]
ADD CONSTRAINT [FK_UserCart]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserCart'
CREATE INDEX [IX_FK_UserCart]
ON [dbo].[CartSet]
    ([UserId]);
GO

-- Creating foreign key on [ProjectId] in table 'CartSet'
ALTER TABLE [dbo].[CartSet]
ADD CONSTRAINT [FK_ProjectCart]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[ProjectSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectCart'
CREATE INDEX [IX_FK_ProjectCart]
ON [dbo].[CartSet]
    ([ProjectId]);
GO

-- Creating foreign key on [UserId] in table 'ProjectSet'
ALTER TABLE [dbo].[ProjectSet]
ADD CONSTRAINT [FK_UserProject]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserProject'
CREATE INDEX [IX_FK_UserProject]
ON [dbo].[ProjectSet]
    ([UserId]);
GO

-- Creating foreign key on [ProjectAccess_Id] in table 'PaymentSet'
ALTER TABLE [dbo].[PaymentSet]
ADD CONSTRAINT [FK_ProjectAccessPayment]
    FOREIGN KEY ([ProjectAccess_Id])
    REFERENCES [dbo].[ProjectAccessSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectAccessPayment'
CREATE INDEX [IX_FK_ProjectAccessPayment]
ON [dbo].[PaymentSet]
    ([ProjectAccess_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------