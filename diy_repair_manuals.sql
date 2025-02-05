-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2025 at 04:24 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diy_repair_manuals`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `answer_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `user_id`, `answer_text`, `created_at`) VALUES
(5, 6, 21, 'no you should use teflon tape', '2024-11-20 05:28:04'),
(6, 7, 22, '230v', '2024-11-20 09:04:23'),
(8, 7, 23, '220V', '2025-01-10 08:55:20');

-- --------------------------------------------------------

--
-- Table structure for table `appliance_manuals`
--

CREATE TABLE `appliance_manuals` (
  `id` int(11) NOT NULL,
  `problem_name` varchar(255) NOT NULL,
  `problem_description` text NOT NULL,
  `problem_solution` text NOT NULL,
  `video_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appliance_manuals`
--

INSERT INTO `appliance_manuals` (`id`, `problem_name`, `problem_description`, `problem_solution`, `video_link`) VALUES
(1, 'Washing Machine Not Spinning', 'The washing machine drum is not spinning during the wash cycle.', 'Check if the door is properly closed. If the door is closed, check the belt and motor. Replace the belt if it is broken.', 'https://example.com/washing-machine-not-spinning'),
(2, 'Refrigerator Not Cooling', 'The refrigerator is running but not cooling.', 'Check the thermostat settings. Clean the condenser coils. If the problem persists, check the compressor and coolant levels.', 'https://example.com/refrigerator-not-cooling'),
(3, 'Oven Not Heating', 'The oven is not heating up even though it is turned on.', 'Check if the oven is properly plugged in and the power is on. Replace the heating element if it is faulty.', 'https://example.com/oven-not-heating'),
(4, 'Dishwasher Leaking', 'The dishwasher is leaking water onto the floor.', 'Check the door seal for any damage and replace it if necessary. Ensure the dishwasher is level and not tilted. Inspect the hoses for any cracks or leaks.', 'https://example.com/dishwasher-leaking'),
(5, 'Microwave Not Heating', 'The microwave runs but does not heat the food.', 'Check the door switch and replace it if faulty. Inspect the magnetron and replace it if necessary.', 'https://example.com/microwave-not-heating');

-- --------------------------------------------------------

--
-- Table structure for table `electrical_manuals`
--

CREATE TABLE `electrical_manuals` (
  `id` int(11) NOT NULL,
  `problem_name` varchar(255) NOT NULL,
  `problem_description` text NOT NULL,
  `problem_solution` text NOT NULL,
  `video_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `electrical_manuals`
--

INSERT INTO `electrical_manuals` (`id`, `problem_name`, `problem_description`, `problem_solution`, `video_link`) VALUES
(1, 'Electrical Outlet Not Working', 'The electrical outlet is not powering up devices.', 'Check if the circuit breaker is turned off. Replace the outlet if necessary.', 'https://example.com/electrical-outlet-repair'),
(2, 'Flickering Light Bulb', 'The light bulb flickers intermittently.', 'Ensure the bulb is properly screwed in, or replace with a new one.', 'https://example.com/flickering-light-repair'),
(3, 'Tripped Circuit Breaker', 'The circuit breaker keeps tripping.', 'Check for overloaded circuits, and reset the breaker. Consult an electrician if the problem persists.', 'https://example.com/circuit-breaker-repair');

-- --------------------------------------------------------

--
-- Table structure for table `manuals`
--

CREATE TABLE `manuals` (
  `id` int(11) NOT NULL,
  `problem_name` varchar(255) NOT NULL,
  `problem_description` text NOT NULL,
  `problem_solution` text NOT NULL,
  `video_solution` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manuals`
--

INSERT INTO `manuals` (`id`, `problem_name`, `problem_description`, `problem_solution`, `video_solution`, `category`, `date_added`) VALUES
(6, 'electrical surges', 'Electrical surges are sudden increases in voltage that can last from a few microseconds to several milliseconds. They can be caused by various factors, including lightning strikes, power line issues, faulty appliances, or improper electrical wiring. Frequent surges can damage electronic devices and reduce their lifespan.', 'Install Surge Protectors: Use surge protectors to safeguard sensitive electronics. These devices divert excess voltage away from connected appliances.\r\n\r\nUnplug Unused Devices: Disconnect devices that are not in use to prevent them from being affected by potential surges.\r\n\r\nCheck Wiring: Ensure that your home\'s wiring is up to code and in good condition, as faulty wiring can contribute to surges.\r\n\r\nConsult a Professional: If surges are frequent, consult a licensed electrician to assess and address the underlying issues.', 'https://youtube.com/shorts/gyiBaqMrK9c?si=dFTcS6lXB66peG4E', 'Electrical Manuals', '2025-01-10 05:30:12');

-- --------------------------------------------------------

--
-- Table structure for table `plumbing_manuals`
--

CREATE TABLE `plumbing_manuals` (
  `id` int(11) NOT NULL,
  `problem_name` varchar(255) NOT NULL,
  `problem_description` text NOT NULL,
  `problem_solution` text NOT NULL,
  `video_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plumbing_manuals`
--

INSERT INTO `plumbing_manuals` (`id`, `problem_name`, `problem_description`, `problem_solution`, `video_link`) VALUES
(1, 'Leaky pipe', 'A faucet that drips water even when turned off completely. This can be caused by worn-out washers or O-rings, corrosion, or broken parts.', '1. Turn off the water supply.\n2. Disassemble the faucet to inspect washers and O-rings.\n3. Replace any worn-out or damaged parts.\n4. Reassemble the faucet and turn on the water supply to check for leaks.', 'https://example.com/leaky-faucet-repair'),
(2, 'Clogged Drain', 'A drain that is blocked, preventing water from flowing through. This can be caused by the buildup of hair, grease, soap, or other debris.', '1. Use a plunger to try to dislodge the blockage.\n2. If plunging fails, use a drain snake to reach and remove the clog.\n3. Clean the drain pipe and reassemble any removed parts.\n4. Run water to ensure the blockage is cleared.', 'https://example.com/clogged-drain-fix'),
(3, 'Running Toilet', 'A toilet that continues to run water into the bowl after flushing, usually due to a faulty flapper, float, or fill valve.', '1. Remove the toilet tank lid.\n2. Check the flapper for any signs of damage or misalignment.\n3. Adjust or replace the flapper as needed.\n4. Inspect the float and fill valve, and make adjustments or replacements if necessary.\n5. Test the toilet by flushing and observing if the issue is resolved.', 'https://example.com/fix-running-toilet'),
(4, 'Low Water Pressure', 'Water flow that is weaker than usual, which can be caused by buildup in pipes, issues with the water supply, or faulty fixtures.', '1. Check if the problem is isolated to a single fixture or the whole house.\n2. Clean or replace aerators in faucets to remove mineral buildup.\n3. Inspect and clean showerheads to ensure unobstructed water flow.\n4. If the issue persists, inspect the main water supply line for leaks or blockages.', 'https://example.com/low-water-pressure-solution');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `user_id`, `question_text`, `created_at`) VALUES
(6, 21, 'can we use insulation tape for the tap ?', '2024-11-20 05:16:50'),
(7, 21, 'ideal voltage in a household?\r\n', '2024-11-20 08:12:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(50) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `role`) VALUES
(21, 'testuser', 'manirseshu@gmail.com', '12344', '2024-11-19 05:07:23', 'user'),
(22, 'ram', 'ramnithin.1324@gmail.com', '1234', '2024-11-20 09:04:04', 'user'),
(23, 'admin', 'admin.DIY@gmail.com', '123', '2024-11-24 15:03:53', 'admin'),
(25, 'ram12', 'ramyajhothimba@gmail.com', '12345678', '2025-01-03 08:26:01', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `appliance_manuals`
--
ALTER TABLE `appliance_manuals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `electrical_manuals`
--
ALTER TABLE `electrical_manuals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manuals`
--
ALTER TABLE `manuals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plumbing_manuals`
--
ALTER TABLE `plumbing_manuals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `appliance_manuals`
--
ALTER TABLE `appliance_manuals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `electrical_manuals`
--
ALTER TABLE `electrical_manuals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `manuals`
--
ALTER TABLE `manuals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `plumbing_manuals`
--
ALTER TABLE `plumbing_manuals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
