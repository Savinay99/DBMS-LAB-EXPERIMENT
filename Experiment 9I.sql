CREATE TABLE RailwayBooking (
    BookingID INT PRIMARY KEY,
    PassengerName VARCHAR(100),
    TrainNumber INT,
    SourceStation VARCHAR(50),
    DestinationStation VARCHAR(50),
    TravelDate DATE,
    SeatNumber INT,
    Fare DECIMAL(10,2),
    BookingStatus VARCHAR(20)
);

INSERT INTO RailwayBooking
VALUES
(1, 'Rahul', 12001, 'Delhi', 'Lucknow', '2026-11-01', 1, 850.00, 'Confirmed'),
(2, 'Priya', 12002, 'Mumbai', 'Pune', '2026-11-02', 2, 450.00, 'Confirmed'),
(3, 'Aman', 12001, 'Delhi', 'Lucknow', '2026-11-01', 3, 850.00, 'Waiting'),
(4, 'Neha', 12003, 'Chennai', 'Bangalore', '2026-11-03', 4, 600.00, 'Confirmed'),
(5, 'Rohan', 12002, 'Mumbai', 'Pune', '2026-11-02', 5, 450.00, 'Cancelled');

INSERT INTO RailwayBooking
(BookingID, PassengerName, TrainNumber, SourceStation, DestinationStation, TravelDate, SeatNumber, Fare, BookingStatus)
SELECT
    BookingID + 5,
    CONCAT('Passenger', BookingID + 5),
    TrainNumber,
    SourceStation,
    DestinationStation,
    TravelDate,
    SeatNumber + 5,
    Fare,
    BookingStatus
FROM RailwayBooking;

INSERT INTO RailwayBooking
(BookingID, PassengerName, TrainNumber, SourceStation, DestinationStation, TravelDate, SeatNumber, Fare, BookingStatus)
SELECT
    BookingID + 10,
    CONCAT('Passenger', BookingID + 10),
    TrainNumber,
    SourceStation,
    DestinationStation,
    TravelDate,
    SeatNumber + 10,
    Fare,
    BookingStatus
FROM RailwayBooking;

INSERT INTO RailwayBooking
(BookingID, PassengerName, TrainNumber, SourceStation, DestinationStation, TravelDate, SeatNumber, Fare, BookingStatus)
SELECT
    BookingID + 20,
    CONCAT('Passenger', BookingID + 20),
    TrainNumber,
    SourceStation,
    DestinationStation,
    TravelDate,
    SeatNumber + 20,
    Fare,
    BookingStatus
FROM RailwayBooking;

INSERT INTO RailwayBooking
(BookingID, PassengerName, TrainNumber, SourceStation, DestinationStation, TravelDate, SeatNumber, Fare, BookingStatus)
SELECT
    BookingID + 40,
    CONCAT('Passenger', BookingID + 40),
    TrainNumber,
    SourceStation,
    DestinationStation,
    TravelDate,
    SeatNumber + 40,
    Fare,
    BookingStatus
FROM RailwayBooking;

INSERT INTO RailwayBooking
(BookingID, PassengerName, TrainNumber, SourceStation, DestinationStation, TravelDate, SeatNumber, Fare, BookingStatus)
SELECT
    BookingID + 80,
    CONCAT('Passenger', BookingID + 80),
    TrainNumber,
    SourceStation,
    DestinationStation,
    TravelDate,
    SeatNumber + 80,
    Fare,
    BookingStatus
FROM RailwayBooking;

INSERT INTO RailwayBooking
(BookingID, PassengerName, TrainNumber, SourceStation, DestinationStation, TravelDate, SeatNumber, Fare, BookingStatus)
SELECT
    BookingID + 160,
    CONCAT('Passenger', BookingID + 160),
    TrainNumber,
    SourceStation,
    DestinationStation,
    TravelDate,
    SeatNumber + 160,
    Fare,
    BookingStatus
FROM RailwayBooking;

INSERT INTO RailwayBooking
(BookingID, PassengerName, TrainNumber, SourceStation, DestinationStation, TravelDate, SeatNumber, Fare, BookingStatus)
SELECT
    BookingID + 320,
    CONCAT('Passenger', BookingID + 320),
    TrainNumber,
    SourceStation,
    DestinationStation,
    TravelDate,
    SeatNumber + 320,
    Fare,
    BookingStatus
FROM RailwayBooking;

INSERT INTO RailwayBooking
(BookingID, PassengerName, TrainNumber, SourceStation, DestinationStation, TravelDate, SeatNumber, Fare, BookingStatus)
SELECT
    BookingID + 640,
    CONCAT('Passenger', BookingID + 640),
    TrainNumber,
    SourceStation,
    DestinationStation,
    TravelDate,
    SeatNumber + 640,
    Fare,
    BookingStatus
FROM RailwayBooking;

INSERT INTO RailwayBooking
(BookingID, PassengerName, TrainNumber, SourceStation, DestinationStation, TravelDate, SeatNumber, Fare, BookingStatus)
SELECT
    BookingID + 1280,
    CONCAT('Passenger', BookingID + 1280),
    TrainNumber,
    SourceStation,
    DestinationStation,
    TravelDate,
    SeatNumber + 1280,
    Fare,
    BookingStatus
FROM RailwayBooking;

INSERT INTO RailwayBooking
(BookingID, PassengerName, TrainNumber, SourceStation, DestinationStation, TravelDate, SeatNumber, Fare, BookingStatus)
SELECT
    BookingID + 2560,
    CONCAT('Passenger', BookingID + 2560),
    TrainNumber,
    SourceStation,
    DestinationStation,
    TravelDate,
    SeatNumber + 2560,
    Fare,
    BookingStatus
FROM RailwayBooking;

SELECT COUNT(*) AS TotalBookings
FROM RailwayBooking;

SELECT *
FROM RailwayBooking
LIMIT 10;

EXPLAIN
SELECT *
FROM RailwayBooking
WHERE TrainNumber = 12001;

CREATE INDEX idx_trainnumber
ON RailwayBooking(TrainNumber);

EXPLAIN
SELECT *
FROM RailwayBooking
WHERE TrainNumber = 12001;

CREATE INDEX idx_train_date
ON RailwayBooking(TrainNumber, TravelDate);

EXPLAIN
SELECT *
FROM RailwayBooking
WHERE TrainNumber = 12001
AND TravelDate = '2026-11-01';

SELECT *
FROM RailwayBooking
WHERE TrainNumber = 12001
AND TravelDate = '2026-11-01';

SELECT TrainNumber, COUNT(*) AS TotalBookings
FROM RailwayBooking
GROUP BY TrainNumber;

SELECT BookingStatus, COUNT(*) AS TotalBookings
FROM RailwayBooking
GROUP BY BookingStatus;

SHOW INDEX FROM RailwayBooking;
