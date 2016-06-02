--
-- Database: `blog`
--
CREATE DATABASE IF NOT EXISTS `blog` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `blog`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`name`, `password`) VALUES
('admin1', 'admin1'),
('admin2', 'admin2'),
('admin3', 'admin3');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `reference` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `comment` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`reference`, `id`, `username`, `comment`) VALUES
(1, 1, 'user2', 'Comment 1 for 1'),
(2, 4, 'admin3', 'Comment 1 for 4'),
(3, 1, 'user1', 'Comment 2 for 1'),
(4, 1, 'user3', 'Comment 3 for 1'),
(5, 3, 'user4', 'Comment 1 for 3'),
(6, 7, 'user4', 'comment 1 for 7'),
(7, 9, 'admin4', 'Comment 1 for 9'),
(8, 8, 'user1', 'comment 1 for 8'),
(9, 8, 'user3', 'comment 2 for 8'),
(67, 8, 'admin1', 'A new comment for post 8'),
(68, 9, 'admin1', 'A new comment for post 9'),
(69, 8, 'admin1', 'kjbhkj'),
(70, 8, 'admin1', 'kjhkl'),
(71, 5, 'admin1', 'A new comment for post 5'),
(72, 7, 'admin1', ''),
(73, 7, 'admin1', ''),
(74, 7, 'admin1', ''),
(75, 7, 'admin1', 'xfh'),
(76, 7, 'admin1', 'xfh'),
(77, 7, 'admin1', ''),
(78, 0, 'admin2', ''),
(79, 7, 'admin2', ''),
(80, 7, 'admin2', '');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `auther` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `heading` varchar(40) NOT NULL,
  `content` varchar(500) NOT NULL,
  `likes` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `auther`, `date`, `time`, `heading`, `content`, `likes`) VALUES
(1, 'admin1', '2016-05-04', '01:13:25', 'POST1', '<b>Good Luck</b><br>This is my first post. ', 0),
(2, 'admin3', '2016-05-04', '10:37:31', 'POST2', 'This is second Post.', 4),
(3, 'admin1', '2016-05-04', '00:00:33', 'POST31', 'Third post thgis is....', 0),
(4, 'admin2', '2016-05-10', '00:22:14', 'Helllllo', 'A new post added.', 1),
(5, 'admin1', '2016-05-27', '00:00:23', 'POST5', 'This is 5th POst', 0),
(6, 'admin1', '2016-05-27', '00:00:23', 'POST6', 'Hi, Post6 added', 0),
(7, 'admin1', '2016-05-27', '23:35:42', 'POST7', 'This is a new post as 7th one.', 0),
(8, 'admin1', '2016-05-27', '00:00:23', 'POST8', '8th Post', 10),
(9, 'admin1', '2016-05-27', '23:39:43', 'POST9', '9th Post', 0),
(10, 'admin1', '2016-05-28', '14:23:18', 'POST 10', 'Hi<b>this is a new post</b> See how it looks....', 0),
(11, 'admin1', '2016-05-28', '16:52:54', 'POST11', 'dfklg,xdfkogm kmdfk jkkkkkkkkkkkk XkG GFk k kkkkkkkkkkkkkkZXDFBkkkkkkkkkkkkkkkkkkkkkkkkkk  a s SddddddddddddsaaaVXFaaaaaaaaaaaaeo aoeiooSG Gooooooaew aewrrrrrrrrrrrrrrrrrrrrWEER;w KJDHEWKJLHDLkj whlkjeDKLAEWHD JHKJ JhebDBJL EDAESKJLFJESHJ LBFAKLEWHJDF', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `likes` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `mobile`, `email`, `likes`) VALUES
('user1', 'user1', 111, '1@gmaill.com', '0'),
('user2', 'user2', 222, '2@gmail.com', '0'),
('user3', 'user3', 333, '3@gmail.com', '0'),
('user4', 'user4', 444, '4@gmail.com', '0'),
('user5', 'user5', 555, '5@gmail.com', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`reference`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `reference` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;--
-- Database: `ide`
--
CREATE DATABASE IF NOT EXISTS `ide` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ide`;

-- --------------------------------------------------------

--
-- Stand-in structure for view `leaderboard`
--
CREATE TABLE `leaderboard` (
`username` varchar(20)
,`total` bigint(25)
,`1_cpp` int(11)
,`1_java` int(11)
,`1_python` int(11)
,`2_cpp` int(11)
,`2_java` int(11)
,`2_python` int(11)
,`3_cpp` int(11)
,`3_java` int(11)
,`3_python` int(11)
,`4_cpp` int(11)
,`4_java` int(11)
,`4_python` int(11)
,`5_cpp` int(11)
,`5_java` int(11)
,`5_python` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `length_table`
--

CREATE TABLE `length_table` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `total` int(11) NOT NULL,
  `1_cpp` int(11) NOT NULL,
  `1_java` int(11) NOT NULL,
  `1_python` int(11) NOT NULL,
  `2_cpp` int(11) NOT NULL,
  `2_java` int(11) NOT NULL,
  `2_python` int(11) NOT NULL,
  `3_cpp` int(11) NOT NULL,
  `3_java` int(11) NOT NULL,
  `3_python` int(11) NOT NULL,
  `4_cpp` int(11) NOT NULL,
  `4_java` int(11) NOT NULL,
  `4_python` int(11) NOT NULL,
  `5_cpp` int(11) NOT NULL,
  `5_java` int(11) NOT NULL,
  `5_python` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `length_table`
--

INSERT INTO `length_table` (`username`, `password`, `total`, `1_cpp`, `1_java`, `1_python`, `2_cpp`, `2_java`, `2_python`, `3_cpp`, `3_java`, `3_python`, `4_cpp`, `4_java`, `4_python`, `5_cpp`, `5_java`, `5_python`) VALUES
('abhishek', 'abhi', 0, 130, 100000, 100000, 100000, 100000, 100000, 100000, 100000, 100000, 100000, 100000, 100000, 100000, 100000, 100000),
('ayush', 'ayush', 0, 100000, 227, 85, 100000, 100000, 100000, 100000, 100000, 100000, 100000, 100000, 100000, 100000, 100000, 100000),
('boss', 'boss', 0, 118, 150, 85, 100000, 197, 100000, 100000, 100000, 100000, 100000, 100000, 100000, 100000, 100000, 100000),
('shivam', 'shivam', 0, 100000, 199, 85, 100000, 197, 100000, 100000, 100000, 100000, 100000, 100000, 100000, 100000, 100000, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `q_no` int(11) NOT NULL,
  `q_desc` longtext NOT NULL,
  `input_file` varchar(50) NOT NULL,
  `output_file` varchar(50) NOT NULL,
  `C_sol` varchar(50) NOT NULL,
  `CPP_sol` varchar(50) NOT NULL,
  `JAVA_sol` varchar(50) NOT NULL,
  `PYTHON_sol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`q_no`, `q_desc`, `input_file`, `output_file`, `C_sol`, `CPP_sol`, `JAVA_sol`, `PYTHON_sol`) VALUES
(1, 'testing', 'inp_1.txt', 'out_1.txt', '', '', '', ''),
(2, '<h1>Networking Giants</h1><br>\r\nThe technicians faced a very interesting problem recently. Given a set of company units to visit, they needed to find the shortest path to visit all of the given points and return back to the central company building. Programmers have spent several months studying this problem but with no results. They were unable to find the solution fast enough. After a long time, one of the programmers found this problem in a conference article. Unfortunately, he found that the problem is so called "Traveling Salesman Problem" and it is very hard to solve. If we have N given points to be visited, we can visit them in any order, giving us N! possibilities to examine. The function expressing that number is called factorial and can be computed as a product<br>\r\n1.2.3.4....N. The number is very high even for a relatively small N.\r\nThe programmers understood they had no chance to solve the problem. But because they have already received the research grant from the government, they needed to continue with their studies and produce at least some results. So they started to study behavior of the factorial function.\r\nFor example, they defined the function Z. For any positive integer N, Z(N) is the number of zeros at the end of the decimal form of number N!. They noticed that this function never decreases. If we have two numbers N1< N2, then Z(N1) <= Z(N2). It is because we can never "lose" any trailing zero by multiplying by any positive number. We can only get new and new zeros. The function Z is very interesting, so we need a computer program that can determine its value efficiently.<br><br>\r\n\r\n<h3>Input</h3>\r\nThere is a single positive integer T on the first line of input (equal to about 100000). It stands for the number of numbers to follow. Then there are T lines, each containing exactly one positive integer number N, 1 <= N <= 50.<br><br>\r\n<h3>Output</h3>\r\nFor every number N, output a single line containing the single non-negative integer Z(N).<br><br>\r\n<h3>Example</h3<br>\r\n<h3>Sample Input:</h3>\r\n2<br>\r\n3<br>\r\n5<br><br><br>\r\n\r\n\r\n<h3>Sample Output:</h3>\r\n0<br>\r\n1<br>\r\n\r\n\r\n', '', '', '', '', '', ''),
(3, '<h1>Find the nth smallest element in the array m times.</h1> \r\n\r\n<h3>Input:</h3>\r\nFirst line of input has 2 positive integer values N and M\r\nN is the number of elements in the array\r\nsecond line of input has n elements a1 a2 a3…  aN \r\nnext M lines contains one positive integer k each, for which you have to print the kth smallest value from the array in subsequent lines…<br/>\r\n\r\n<h3>Sample test case:</h3>\r\n<h3>Input :</h3>\r\n5 3<br>\r\n42 33 2 4 12<br>\r\n2<br>\r\n3<br>\r\n1<br><br>\r\n\r\n<h3>Output:</h3>\r\n4<br>\r\n12<br>\r\n2\r\n', '', '', '', '', '', ''),
(4, 'Suyash like to Play with Binary numbers very much.One day his friend Ayush challenged him to check his knowledge and define a new class of numbers called "Intresting Numbers".<br>\r\nA Number x belongs to "Interesting" class only if it has all digits 1 in its binary form.<br>\r\nRamesh gives set of N numbers to Suresh to check how many of them are "Intresting".<br>\r\nSuyash is busy in organising event for zealicon, Suyash comes to you for help.Please help him to count how many of them are interesting.<br><br>\r\n\r\n<h3>Input</h3>\r\nThe first line of input contains an integer T denoting the number of test cases.<br> The description of T test cases follows.<br>\r\nThe first line of each test case contains a single integer N denoting the size of array.<br>\r\nThe second line contains N space-separated integers A1, A2, ..., AN denoting the elements of the array.<br><br>\r\n\r\n<h3>Output</h3>\r\nFor each test case, output in a single line the count of how many numbers are Interesting<br><br>\r\n\r\n<h3>Constraints</h3>\r\n1 ? T ? 5<br>\r\n1 ? N ? 105<br>\r\n1 ? Ai ? 109<br><br>\r\n\r\n<h3>Example</h3>\r\n\r\n<h3>Input:</h3>\r\n2<br>\r\n4<br>\r\n7 6 31 4<br>\r\n2<br>\r\n5 17<br><br>\r\n\r\n<h3>Output:</h3>\r\n2<br>\r\n0', '', '', '', '', '', ''),
(5, '<h1>CYPHER</h1>\r\nWe want to transfer certain data from one server to another it is to be encoded using  a cypher code.<br><br>\r\n\r\n<h3>Constrain:</h3>\r\nThe entered data which is to be transmitted is in only lowercase.<br>\r\nThe scheme of the cypher code is unique and entered by user for all 26 lowercase alphabet.<br><br>\r\n\r\n<h3>Input:</h3>\r\nThe first line of input contains scheme for encoding.<br><br>\r\n\r\n<h3>Output:</h3>\r\nFor each test case, output in a single line the output of the encoded string<br>\r\n\r\n\r\n<h3>Example</h3>\r\n<h3>Input:</h3>\r\n1 2 3 4 5 6 7 8 9 0 ! @ # $ % ^ & * ( ) _ + = . , <<br>\r\n1<br>\r\nzealicon<br><br>\r\n\r\n\r\n<h3>Output:</h3>\r\n<51@93%$\r\n', '', '', '', '', '', ''),
(6, 'It''s possible for all the digits displayed on a digital clock in the hours:minutes format to be identical. The time shown above (3:33) is an example of such a situation. Other examples are 2:2 and 1:11. Note that the digits of 33:33 are identical, but it is not a valid time on a usual digital clock.<br>\r\nThe above example was for a usual 24-hour format digital clock. Let''s consider a more general clock, where an hour lasts M minutes and a day lasts H hours (therefore, the clock can show any number of hours between 0 and H-1, inclusive, and any number of minutes between 0 and M-1, inclusive). Both the hours and the minutes are shown without leading zeroes in decimal notation and their separator (e.g., '':'') doesn''t matter.<br>\r\nCan you tell how many minutes during a day will the digital clock have identical digits displayed on it?<br><br>\r\n<h3>Input</h3>\r\nThe first line of the input contains an integer T - the number of test cases.\r\nEach of the next T lines contains two space-separated integers H and M for one test case.<br>\r\n<h3>Output</h3>\r\nFor each test case, output a single line corresponding to the answer of the problem.<br><br>\r\n<h3>Constraints</h3>\r\n1 ? T ? 50<br>\r\n1 ? H, M ? 100<br>\r\n<h3>Example</h3>\r\n<h3>Input:<h3>\r\n6<br>\r\n24 60<br>\r\n34 50<br>\r\n10 11<br>\r\n10 12<br>\r\n11 11<br>\r\n1 1<br><br>\r\n\r\n<h3>Output:</h3>\r\n19<br>\r\n20<br>\r\n10<br>\r\n11<br>\r\n10<br>\r\n1<br><br>\r\n\r\n\r\n<h3>Explanation</h3>\r\nExample case 1:<br>\r\nA clock shows two identical digits at times 0:0, 1:1, .., 9:9, three identical digits at times11:1, 22:2, 1:11, 2:22, 3:33, 4:44, 5:55, and four identical digits at times 11:11 and 22:22. So, there are 19 minutes during which the time displayed by the clock will have identical digits.<br>\r\nExample case 2:<br>\r\nCompared to the previous case, the clock doesn''t show 5:55, but can show 33:3 and 33:33.<br>\r\nExample case 6:<br>\r\nIn this example, our day consists of one hour and one hour consists of one minute. Hence, the entire day is just 1 minute - the only time the digital clock will display is 0:0 during the entire day, (i.e. the entire hour, i.e. entire minute). And 0:0 has all digits identical, so the answer is 1.', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `total` int(11) NOT NULL,
  `1_cpp` int(11) NOT NULL,
  `1_java` int(11) NOT NULL,
  `1_python` int(11) NOT NULL,
  `2_cpp` int(11) NOT NULL,
  `2_java` int(11) NOT NULL,
  `2_python` int(11) NOT NULL,
  `3_cpp` int(11) NOT NULL,
  `3_java` int(11) NOT NULL,
  `3_python` int(11) NOT NULL,
  `4_cpp` int(11) NOT NULL,
  `4_java` int(11) NOT NULL,
  `4_python` int(11) NOT NULL,
  `5_cpp` int(11) NOT NULL,
  `5_java` int(11) NOT NULL,
  `5_python` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `total`, `1_cpp`, `1_java`, `1_python`, `2_cpp`, `2_java`, `2_python`, `3_cpp`, `3_java`, `3_python`, `4_cpp`, `4_java`, `4_python`, `5_cpp`, `5_java`, `5_python`) VALUES
('abhishek', 'abhi', 0, 88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ayush', 'ayush', 0, 98, 23, 100, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('boss', 'boss', 0, 100, 100, 100, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('shivam', 'shivam', 0, 80, 51, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure for view `leaderboard`
--
DROP TABLE IF EXISTS `leaderboard`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `leaderboard`  AS  select `users`.`username` AS `username`,((((((((((((((`users`.`1_cpp` + `users`.`1_java`) + `users`.`1_python`) + `users`.`2_cpp`) + `users`.`2_java`) + `users`.`2_python`) + `users`.`3_cpp`) + `users`.`3_java`) + `users`.`3_python`) + `users`.`4_cpp`) + `users`.`4_java`) + `users`.`4_python`) + `users`.`5_cpp`) + `users`.`5_java`) + `users`.`5_python`) AS `total`,`users`.`1_cpp` AS `1_cpp`,`users`.`1_java` AS `1_java`,`users`.`1_python` AS `1_python`,`users`.`2_cpp` AS `2_cpp`,`users`.`2_java` AS `2_java`,`users`.`2_python` AS `2_python`,`users`.`3_cpp` AS `3_cpp`,`users`.`3_java` AS `3_java`,`users`.`3_python` AS `3_python`,`users`.`4_cpp` AS `4_cpp`,`users`.`4_java` AS `4_java`,`users`.`4_python` AS `4_python`,`users`.`5_cpp` AS `5_cpp`,`users`.`5_java` AS `5_java`,`users`.`5_python` AS `5_python` from `users` order by ((((((((((((((`users`.`1_cpp` + `users`.`1_java`) + `users`.`1_python`) + `users`.`2_cpp`) + `users`.`2_java`) + `users`.`2_python`) + `users`.`3_cpp`) + `users`.`3_java`) + `users`.`3_python`) + `users`.`4_cpp`) + `users`.`4_java`) + `users`.`4_python`) + `users`.`5_cpp`) + `users`.`5_java`) + `users`.`5_python`) desc ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `length_table`
--
ALTER TABLE `length_table`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`q_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);
--
-- Database: `mcq`
--
CREATE DATABASE IF NOT EXISTS `mcq` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mcq`;

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `email` varchar(20) NOT NULL,
  `a1` char(1) NOT NULL,
  `a2` char(1) NOT NULL,
  `a3` char(1) NOT NULL,
  `a4` char(1) NOT NULL,
  `a5` char(1) NOT NULL,
  `a6` char(1) NOT NULL,
  `a7` char(1) NOT NULL,
  `a8` char(1) NOT NULL,
  `a9` char(1) NOT NULL,
  `a10` char(1) NOT NULL,
  `a11` char(1) NOT NULL,
  `a12` char(1) NOT NULL,
  `a13` char(1) NOT NULL,
  `a14` char(1) NOT NULL,
  `a15` char(1) NOT NULL,
  `a16` char(1) NOT NULL,
  `a17` char(1) NOT NULL,
  `a18` char(1) NOT NULL,
  `a19` char(1) NOT NULL,
  `a20` char(1) NOT NULL,
  `a21` char(1) NOT NULL,
  `a22` char(1) NOT NULL,
  `a23` char(1) NOT NULL,
  `a24` char(1) NOT NULL,
  `a25` char(1) NOT NULL,
  `a26` char(1) NOT NULL,
  `a27` char(1) NOT NULL,
  `a28` char(1) NOT NULL,
  `a29` char(1) NOT NULL,
  `a30` char(1) NOT NULL,
  `a31` char(1) NOT NULL,
  `a32` char(1) NOT NULL,
  `a33` char(1) NOT NULL,
  `a34` char(1) NOT NULL,
  `a35` char(1) NOT NULL,
  `a36` char(1) NOT NULL,
  `a37` char(1) NOT NULL,
  `a38` char(1) NOT NULL,
  `a39` char(1) NOT NULL,
  `a40` char(1) NOT NULL,
  `a41` char(1) NOT NULL,
  `a42` char(1) NOT NULL,
  `a43` char(1) NOT NULL,
  `a44` char(1) NOT NULL,
  `a45` char(1) NOT NULL,
  `a46` char(1) NOT NULL,
  `a47` char(1) NOT NULL,
  `a48` char(1) NOT NULL,
  `a49` char(1) NOT NULL,
  `a50` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `qno` int(11) NOT NULL,
  `question` varchar(500) NOT NULL,
  `Opt1` varchar(20) NOT NULL,
  `Opt2` varchar(20) NOT NULL,
  `Opt3` varchar(20) NOT NULL,
  `Opt4` varchar(20) NOT NULL,
  `answer` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Name` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Branch` varchar(20) NOT NULL,
  `Year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`email`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'blog', '{"quick_or_custom":"custom","what":"sql","db_select[]":["blog","ide","mcq","phpmyadmin","test"],"output_format":"sendit","filename_template":"@SERVER@","remember_template":"on","charset":"utf-8","compression":"zip","maxsize":"","codegen_structure_or_data":"data","codegen_format":"0","csv_separator":",","csv_enclosed":"\\"","csv_escaped":"\\"","csv_terminated":"AUTO","csv_null":"NULL","csv_structure_or_data":"data","excel_null":"NULL","excel_edition":"win","excel_structure_or_data":"data","htmlword_structure_or_data":"structure_and_data","htmlword_null":"NULL","json_structure_or_data":"data","latex_caption":"something","latex_structure_or_data":"structure_and_data","latex_structure_caption":"Structure of table @TABLE@","latex_structure_continued_caption":"Structure of table @TABLE@ (continued)","latex_structure_label":"tab:@TABLE@-structure","latex_relation":"something","latex_comments":"something","latex_mime":"something","latex_columns":"something","latex_data_caption":"Content of table @TABLE@","latex_data_continued_caption":"Content of table @TABLE@ (continued)","latex_data_label":"tab:@TABLE@-data","latex_null":"\\\\textit{NULL}","mediawiki_structure_or_data":"data","mediawiki_caption":"something","mediawiki_headers":"something","ods_null":"NULL","ods_structure_or_data":"data","odt_structure_or_data":"structure_and_data","odt_relation":"something","odt_comments":"something","odt_mime":"something","odt_columns":"something","odt_null":"NULL","pdf_report_title":"","pdf_structure_or_data":"data","phparray_structure_or_data":"data","sql_include_comments":"something","sql_header_comment":"","sql_compatibility":"NONE","sql_structure_or_data":"structure_and_data","sql_create_table":"something","sql_auto_increment":"something","sql_create_view":"something","sql_procedure_function":"something","sql_create_trigger":"something","sql_backquotes":"something","sql_type":"INSERT","sql_insert_syntax":"both","sql_max_query_size":"50000","sql_hex_for_binary":"something","sql_utc_time":"something","texytext_structure_or_data":"structure_and_data","texytext_null":"NULL","yaml_structure_or_data":"data","":null,"as_separate_files":null,"csv_removeCRLF":null,"csv_columns":null,"excel_removeCRLF":null,"excel_columns":null,"htmlword_columns":null,"json_pretty_print":null,"ods_columns":null,"sql_dates":null,"sql_relation":null,"sql_mime":null,"sql_use_transaction":null,"sql_disable_fk":null,"sql_views_as_tables":null,"sql_metadata":null,"sql_drop_database":null,"sql_drop_table":null,"sql_if_not_exists":null,"sql_truncate":null,"sql_delayed":null,"sql_ignore":null,"texytext_columns":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{"db":"blog","table":"post"},{"db":"blog","table":"comments"},{"db":"blog","table":"admin"},{"db":"blog","table":"user"},{"db":"mcq","table":"user"},{"db":"mcq","table":"answers"},{"db":"mcq","table":"questions"},{"db":"ide","table":"leaderboard"},{"db":"ide","table":"length_table"},{"db":"ide","table":"questions"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'blog', 'user', '{"sorted_col":"`user`.`username` ASC"}', '2016-05-27 14:37:25'),
('root', 'test', 'gyanuser', '{"CREATE_TIME":"2016-04-08 23:59:49","col_visib":["1","1","1","1","1","1","1","1"]}', '2016-04-08 18:32:35');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2016-03-15 13:03:02', '{"collation_connection":"utf8mb4_unicode_ci"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Table structure for table `gyanuser`
--

CREATE TABLE `gyanuser` (
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Location` varchar(20) NOT NULL,
  `Age` int(11) NOT NULL,
  `Gender` char(1) NOT NULL,
  `DOB` date NOT NULL,
  `Mobile` text NOT NULL,
  `adhaar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gyanuser`
--

INSERT INTO `gyanuser` (`Username`, `Password`, `Name`, `Location`, `Age`, `Gender`, `DOB`, `Mobile`, `adhaar`) VALUES
('Akash', 'Hello', 'Akash Jain', 'Delhi', 19, 'M', '1998-02-04', '9878987987', '87868686534'),
('hi', 'hi', 'hi', 'hi', 1, 'M', '0001-01-01', '9', '9'),
('him', 'himanshu', 'himanshu', 'delhi', 19, '', '0011-11-11', '098972878', ''),
('Himanshu', 'Hello', 'Himanshu', 'Delhi', 19, 'M', '1998-02-24', '9654379609', ''),
('nis', 'nis', 'nishith', 'noida', 18, 'M', '1997-03-01', '9988768899', '8888888888888');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `Question` varchar(500) NOT NULL,
  `Opt1` varchar(50) NOT NULL,
  `Opt2` varchar(50) NOT NULL,
  `Opt3` varchar(50) NOT NULL,
  `Opt4` varchar(50) NOT NULL,
  `Ans` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `solution`
--

CREATE TABLE `solution` (
  `Email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Email` varchar(30) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Email`, `Password`) VALUES
('himanshuagrawal1998@gmail.com', 'Himanshu'),
('him@him.him', 'Him'),
('him@him.hi', 'him'),
('hi@a.x', 'asd'),
('d@d.s', 'ASD'),
('himmm@mi.in', 'him'),
('himanshuagrawal198@gmail.com', 's'),
('H@h.h', 'H'),
('H@hh.h', 'ji'),
('hu@h', 'huhu'),
('a@ss.s', 'kls'),
('He@g.c', 'jk');

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `name` varchar(30) NOT NULL,
  `mobi` bigint(20) NOT NULL,
  `emai` varchar(40) NOT NULL,
  `bloo` varchar(3) NOT NULL,
  `pass` varchar(12) NOT NULL,
  `loca` varchar(20) NOT NULL,
  `acti` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`name`, `mobi`, `emai`, `bloo`, `pass`, `loca`, `acti`) VALUES
('Aaditya Arora', 8765061432, 'aaditya@gmail.com', 'A+', 'aadi', 'pitampura', 1),
('Akarshit Kumar', 9876543210, 'akarshit@gmail.com', 'on', 'Hello', 'Rohini', 0),
('Alankrit Kumar', 9452530722, 'alan@gmail.com', 'on', 'vebz1', 'noida', 0),
('divya khanna', 9910878465, 'divyakh@gmail.com', 'B+', 'div', 'Rohini', 0),
('Himanshu Agrawal', 94525230733, 'himanshuagrawal1998@gmail.com', 'O+', 'him', 'noida', 0),
('akarshit verma', 3335, 'lslsj@gma.n', 'on', 'cvb', 'ksj', 0),
('Mohit Khare', 9910885678, 'Mohit123@gmail.com', 'A-', 'mohit', 'vaishali', 1),
('Pranjal Sharma', 9910868499, 'pranjal@gmail.com', 'O+', 'pran', 'vaishali', 0),
('shweta chaturvedi', 9411018298, 'shw@gmail.com', 'on', 'shw', 'noida', 0),
('Sonu Kumar', 9876543210, 'sonukumar@gmail.com', 'on', 'Hello', 'Rohini', 0),
('Vaibhav Bajpai', 8765061440, 'vaibhav@gmail.com', 'B+', 'vaibh', 'Rohini', 1),
('Mr. V.D. Chaturvedi', 9411018299, 'vashishthmangal@gmail.com', 'on', 'mangal', 'noida', 0),
('vibhav', 9452530722, 'vebz@gmail.com', 'on', 'vebz', 'noida', 0),
('Vibhav Chaturvedy', 9454755102, 'vebzchaturvedy@gmail.com', 'B+', 'vebz', 'Rohini', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gyanuser`
--
ALTER TABLE `gyanuser`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD UNIQUE KEY `emai` (`emai`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
