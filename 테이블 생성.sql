-- CREATE DATABASE gameDB;
USE gameDB;

-- 테이블 생성: User
CREATE TABLE User (
    UserID INTEGER NOT NULL,
    RegistrationDate DATE NOT NULL,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    PRIMARY KEY (UserID)
);

-- 테이블 생성: Developer
CREATE TABLE Developer (
    DeveloperID INTEGER NOT NULL,
    DeveloperName VARCHAR(50) NOT NULL,
    EstablishmentDate DATE NOT NULL,
    HeadquartersLocation VARCHAR(50) NOT NULL,
    PRIMARY KEY (DeveloperID)
);

-- 테이블 생성: Genre
CREATE TABLE Genre (
    GenreID INTEGER NOT NULL,
    GenreName VARCHAR(50) NOT NULL,
    PRIMARY KEY (GenreID)
);

-- 테이블 생성: Game
CREATE TABLE Game (
    GameID INTEGER NOT NULL,
    Title VARCHAR(50) NOT NULL,
    DeveloperID INTEGER NOT NULL,
    ReleaseDate DATE NOT NULL,
    GenreID INTEGER NOT NULL,
    PRIMARY KEY (GameID),
    FOREIGN KEY (DeveloperID) REFERENCES Developer(DeveloperID),
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID)
);

-- 테이블 생성: MarketShare
CREATE TABLE MarketShare (
    MarketShareID INTEGER NOT NULL,
    GameID INTEGER NOT NULL,
    Date DATE NOT NULL,
    MarketShare DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (MarketShareID),
    FOREIGN KEY (GameID) REFERENCES Game(GameID)
);

-- 테이블 생성: Rating
CREATE TABLE Rating (
    RatingID INTEGER NOT NULL,
    GameID INTEGER NOT NULL,
    UserID INTEGER NOT NULL,
    Score DECIMAL(3,2) NOT NULL,
    PRIMARY KEY (RatingID),
    FOREIGN KEY (GameID) REFERENCES Game(GameID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- 테이블 생성: Event
CREATE TABLE Event (
    EventID INTEGER NOT NULL,
    GameID INTEGER NOT NULL,
    EventName VARCHAR(50) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    PRIMARY KEY (EventID),
    FOREIGN KEY (GameID) REFERENCES Game(GameID)
);

-- 테이블 생성: GameUpdate
CREATE TABLE GameUpdate (
    UpdateID INTEGER NOT NULL,
    GameID INTEGER NOT NULL,
    Version VARCHAR(50) NOT NULL,
    UpdateDescription TEXT NOT NULL,
    UpdateDate DATE NOT NULL,
    PRIMARY KEY (UpdateID),
    FOREIGN KEY (GameID) REFERENCES Game(GameID)
);

-- 테이블 생성: GameServer
CREATE TABLE GameServer (
    ServerID INTEGER NOT NULL,
    GameID INTEGER NOT NULL,
    ServerName VARCHAR(50) NOT NULL,
    Location VARCHAR(50) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    PRIMARY KEY (ServerID),
    FOREIGN KEY (GameID) REFERENCES Game(GameID)
);

-- 테이블 생성: GameReview
CREATE TABLE GameReview (
    ReviewID INTEGER NOT NULL,
    GameID INTEGER NOT NULL,
    UserID INTEGER NOT NULL,
    ReviewText TEXT NOT NULL,
    ReviewDate DATE NOT NULL,
    PRIMARY KEY (ReviewID),
    FOREIGN KEY (GameID) REFERENCES Game(GameID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);
