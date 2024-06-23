use gamedb;

-- 게임 ID가 3인 게임의 장르를 배틀로얄로 변경
UPDATE Game
SET GenreID = 2
WHERE GameID = 3;  -- 오버워치

-- 유저 ID가 4인 사용자의 이름을 '이민호'로 변경
UPDATE User
SET Username = '이민호'
WHERE UserID = 4;  -- 최지은

-- 서버 ID가 5인 게임 서버의 위치를 '유럽'으로 변경
UPDATE GameServer
SET Location = '유럽'
WHERE ServerID = 5;  -- 메이플스토리

-- 게임 ID가 1인 게임의 모든 리뷰 삭제
DELETE FROM GameReview
WHERE GameID = 1;  -- 리그 오브 레전드

-- 유저 ID가 4인 사용자가 작성한 모든 리뷰 삭제
DELETE FROM GameReview
WHERE UserID = 4;  -- 최지은

-- 게임 ID가 2인 게임의 모든 서버 정보 삭제
DELETE FROM GameServer
WHERE GameID = 2;  -- 포트나이트

-- 게임 ID가 1인 게임의 제목과 출시일 조회
SELECT Title, ReleaseDate
FROM Game
WHERE GameID = 1;  -- 리그 오브 레전드

-- 유저 ID가 2인 사용자의 이름과 이메일 조회
SELECT Username, Email
FROM User
WHERE UserID = 2;  -- 이영희

-- 장르 ID가 4인 RPG 장르의 모든 게임 제목 조회
SELECT Title
FROM Game
WHERE GenreID = 4;  -- RPG

-- 개발사 ID가 7인 블리자드 엔터테인먼트가 만든 게임의 제목과 출시일 조회
SELECT Title, ReleaseDate
FROM Game
WHERE DeveloperID = 7;  -- 블리자드 엔터테인먼트

-- 점수가 4점 이상인 모든 레이팅 조회
SELECT GameID, UserID, Score
FROM Rating
WHERE Score > 4;

-- 게임 제목이 '로스트아크'인 게임의 이벤트 이름과 기간 조회
SELECT e.EventName, e.StartDate, e.EndDate
FROM Event e
INNER JOIN Game g ON e.GameID = g.GameID
WHERE g.Title = '로스트아크';

-- 게임 서버가 '활성' 상태인 모든 게임의 제목과 서버 이름 조회
SELECT g.Title, s.ServerName
FROM Game g
INNER JOIN GameServer s ON g.GameID = s.GameID
WHERE s.Status = '활성';

-- 장르 ID가 1인 MOBA 장르의 게임들의 제목과 개발사 이름 조회
SELECT g.Title, d.DeveloperName
FROM Game g
INNER JOIN Developer d ON g.DeveloperID = d.DeveloperID
WHERE g.GenreID = 1;

-- 유저 ID가 3인 박철수가 2023년에 작성한 리뷰와 해당 리뷰의 게임 제목 조회
SELECT g.Title, r.ReviewText
FROM GameReview r
INNER JOIN Game g ON r.GameID = g.GameID
WHERE r.UserID = 3 AND YEAR(r.ReviewDate) = 2023;

-- 평균 점수가 4.5 이상인 게임들의 제목과 평균 점수 조회
SELECT g.Title, AVG(r.Score) AS AverageRating
FROM Game g
INNER JOIN Rating r ON g.GameID = r.GameID
GROUP BY g.Title
HAVING AVG(r.Score) >= 4.5;

