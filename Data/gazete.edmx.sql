
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/27/2016 18:30:23
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


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


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
    [Amount] nvarchar(max)  NOT NULL,
    [Date] datetime  NOT NULL
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

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------