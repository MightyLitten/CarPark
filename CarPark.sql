USE [master]
GO
/****** Object:  Database [CarPark]    Script Date: 08/04/2021 14:27:13 ******/
CREATE DATABASE [CarPark]
 CONTAINMENT = NONE
GO
ALTER DATABASE [CarPark] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarPark].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarPark] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarPark] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarPark] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarPark] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarPark] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarPark] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CarPark] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarPark] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarPark] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarPark] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarPark] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarPark] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarPark] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarPark] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarPark] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CarPark] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarPark] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarPark] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarPark] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarPark] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarPark] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarPark] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarPark] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarPark] SET  MULTI_USER 
GO
ALTER DATABASE [CarPark] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarPark] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarPark] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarPark] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CarPark] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CarPark]
GO
/****** Object:  Table [dbo].[Bookingoffice]    Script Date: 08/04/2021 14:27:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bookingoffice](
	[office_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[endContractDeadline] [date] NULL,
	[name] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[place] [varchar](50) NULL,
	[price] [money] NULL,
	[startContractDeadline] [date] NULL,
	[trip_ID] [bigint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Car]    Script Date: 08/04/2021 14:27:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car](
	[licensePlate] [varchar](50) NOT NULL,
	[color] [varchar](20) NULL,
	[type] [varchar](50) NULL,
	[company] [nvarchar](50) NULL,
	[park_ID] [bigint] NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[licensePlate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 08/04/2021 14:27:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[employee_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[account] [varchar](50) NULL,
	[department] [varchar](10) NULL,
	[address] [varchar](50) NULL,
	[birthdate] [date] NULL,
	[email] [varchar](50) NULL,
	[name] [varchar](50) NULL,
	[phone] [varchar](10) NULL,
	[password] [varchar](20) NULL,
	[sex] [char](1) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parkinglot]    Script Date: 08/04/2021 14:27:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parkinglot](
	[park_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[area] [bigint] NULL,
	[name] [varchar](50) NULL,
	[place] [varchar](50) NULL,
	[price] [bigint] NULL,
	[status] [varchar](50) NULL,
 CONSTRAINT [PK_Parkinglot] PRIMARY KEY CLUSTERED 
(
	[park_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 08/04/2021 14:27:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ticket](
	[ticket_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[bookingTime] [time](7) NULL,
	[customerName] [varchar](50) NULL,
	[licensePlate] [varchar](50) NULL,
	[trip_ID] [bigint] NULL,
 CONSTRAINT [PK_ticket] PRIMARY KEY CLUSTERED 
(
	[ticket_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Trip]    Script Date: 08/04/2021 14:27:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trip](
	[trip_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[bookedTicketNumber] [int] NULL,
	[carType] [varchar](50) NULL,
	[departureDate] [date] NULL,
	[departureTime] [time](7) NULL,
	[destination] [varchar](50) NULL,
	[driver] [varchar](50) NULL,
	[maximumOnlineTicketNumber] [int] NULL,
 CONSTRAINT [PK_Trip] PRIMARY KEY CLUSTERED 
(
	[trip_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Bookingoffice] ON 

INSERT [dbo].[Bookingoffice] ([office_ID], [endContractDeadline], [name], [phone], [place], [price], [startContractDeadline], [trip_ID]) VALUES (1, CAST(N'2022-10-04' AS Date), N'ABC', N'0123456789', N'Quay so 4', 12000.0000, CAST(N'2020-10-04' AS Date), 1)
INSERT [dbo].[Bookingoffice] ([office_ID], [endContractDeadline], [name], [phone], [place], [price], [startContractDeadline], [trip_ID]) VALUES (2, CAST(N'2021-04-04' AS Date), N'abcd', N'0123456789', N'Quay so 1', 1000.0000, CAST(N'2021-03-29' AS Date), 1)
INSERT [dbo].[Bookingoffice] ([office_ID], [endContractDeadline], [name], [phone], [place], [price], [startContractDeadline], [trip_ID]) VALUES (3, CAST(N'2021-04-30' AS Date), N'abcd', N'0123456789', N'Quay so 2', 1000.0000, CAST(N'2021-03-30' AS Date), 1)
INSERT [dbo].[Bookingoffice] ([office_ID], [endContractDeadline], [name], [phone], [place], [price], [startContractDeadline], [trip_ID]) VALUES (4, CAST(N'2024-03-30' AS Date), N'java', N'0123456788', N'Quay so 3', 10000.0000, CAST(N'2021-03-30' AS Date), 1)
INSERT [dbo].[Bookingoffice] ([office_ID], [endContractDeadline], [name], [phone], [place], [price], [startContractDeadline], [trip_ID]) VALUES (5, CAST(N'2021-03-31' AS Date), N'java SE', N'0123456788', N'Quay so 5', 10000.0000, CAST(N'2021-03-01' AS Date), 2)
SET IDENTITY_INSERT [dbo].[Bookingoffice] OFF
INSERT [dbo].[Car] ([licensePlate], [color], [type], [company], [park_ID]) VALUES (N'29A1-30313', N'Black', N'Truong Hai', N'Hoang Long', 1)
INSERT [dbo].[Car] ([licensePlate], [color], [type], [company], [park_ID]) VALUES (N'30A1-1234', N'White', N'16 cho', N'Cam Van', 2)
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([employee_ID], [account], [department], [address], [birthdate], [email], [name], [phone], [password], [sex]) VALUES (1, N'longlst', N'Employee', N'Ha Noi', CAST(N'2000-06-30' AS Date), N'longtennis2000@gmail.com', N'Le Sy Thanh Long', N'11112222', N'thanhlongpro', N'm')
INSERT [dbo].[Employee] ([employee_ID], [account], [department], [address], [birthdate], [email], [name], [phone], [password], [sex]) VALUES (2, N'hieunt', N'Parking', N'Ha Noi', CAST(N'2000-06-06' AS Date), N'hieunt@fsoft.com', N'Nguyen Trung Hieu', N'33334444', N'123456', N'm')
INSERT [dbo].[Employee] ([employee_ID], [account], [department], [address], [birthdate], [email], [name], [phone], [password], [sex]) VALUES (3, N'namlh', N'Service', N'Ha Nam', CAST(N'2000-09-06' AS Date), N'namlh@fsoft.com.vn', N'Le Hai Nam', N'55556666', N'123456', N'm')
INSERT [dbo].[Employee] ([employee_ID], [account], [department], [address], [birthdate], [email], [name], [phone], [password], [sex]) VALUES (4, N'abcd', N'Employee', N'HCM', CAST(N'2000-06-30' AS Date), N'abcd@gmail.com', N'ABCD', N'77778888', N'123456', N'f')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Parkinglot] ON 

INSERT [dbo].[Parkinglot] ([park_ID], [area], [name], [place], [price], [status]) VALUES (1, 200, N'Khu 12', N'Khu 1', 100000, N'Active')
INSERT [dbo].[Parkinglot] ([park_ID], [area], [name], [place], [price], [status]) VALUES (2, 30, N'Khu 13', N'Lang Son', 120000, N'Inactive')
INSERT [dbo].[Parkinglot] ([park_ID], [area], [name], [place], [price], [status]) VALUES (3, 90, N'Khu 14', N'Bac Giang', 120000, N'Active')
SET IDENTITY_INSERT [dbo].[Parkinglot] OFF
SET IDENTITY_INSERT [dbo].[Ticket] ON 

INSERT [dbo].[Ticket] ([ticket_ID], [bookingTime], [customerName], [licensePlate], [trip_ID]) VALUES (1, CAST(N'14:34:00' AS Time), N'Nguyen Trung Hieu', N'29A1-30313', 1)
INSERT [dbo].[Ticket] ([ticket_ID], [bookingTime], [customerName], [licensePlate], [trip_ID]) VALUES (2, CAST(N'14:37:00' AS Time), N'ABC', N'29A1-30313', 1)
SET IDENTITY_INSERT [dbo].[Ticket] OFF
SET IDENTITY_INSERT [dbo].[Trip] ON 

INSERT [dbo].[Trip] ([trip_ID], [bookedTicketNumber], [carType], [departureDate], [departureTime], [destination], [driver], [maximumOnlineTicketNumber]) VALUES (1, 111, N'xe khach', CAST(N'2021-03-03' AS Date), CAST(N'14:30:00' AS Time), N'Ha Noi', N'Hai', 112)
INSERT [dbo].[Trip] ([trip_ID], [bookedTicketNumber], [carType], [departureDate], [departureTime], [destination], [driver], [maximumOnlineTicketNumber]) VALUES (2, 1, N'xe tai', CAST(N'2021-03-03' AS Date), CAST(N'16:20:00' AS Time), N'Hai Phone', N'Long', 111)
INSERT [dbo].[Trip] ([trip_ID], [bookedTicketNumber], [carType], [departureDate], [departureTime], [destination], [driver], [maximumOnlineTicketNumber]) VALUES (3, 0, N'C', CAST(N'2021-01-11' AS Date), CAST(N'13:22:00' AS Time), N'A', N'B', 10)
INSERT [dbo].[Trip] ([trip_ID], [bookedTicketNumber], [carType], [departureDate], [departureTime], [destination], [driver], [maximumOnlineTicketNumber]) VALUES (4, 0, N'BBC', CAST(N'2021-01-09' AS Date), CAST(N'13:28:00' AS Time), N'B', N'A', 200)
SET IDENTITY_INSERT [dbo].[Trip] OFF
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_Parkinglot] FOREIGN KEY([park_ID])
REFERENCES [dbo].[Parkinglot] ([park_ID])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_Parkinglot]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Trip] FOREIGN KEY([trip_ID])
REFERENCES [dbo].[Trip] ([trip_ID])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Trip]
GO
USE [master]
GO
ALTER DATABASE [CarPark] SET  READ_WRITE 
GO
