----------------------------------------------------------------------------------
-- Comments start with two dashes
-- You should always have the following
--		lines in all of your code
----------------------------------------------------------------------------------
-- Name:	Prof Jeff Falkinburg
-- Date:	Spring 2021
-- Course: 	CSCE 436
-- File: 	lec01.vhd
-- HW:		Lecture 1
-- Purp:	Majority circuit - output is high if the majority of inputs
-- 			are high
--
-- Doc:	<list the names of the people who you helped>
-- 		<list the names of the people who assisted you>
-- 	
-- Academic Integrity Statement: I certify that, while others may have 
-- assisted me in brain storming, debugging and validating this program, 
-- the program itself is my own work. I understand that submitting code 
-- which is the work of other individuals is a violation of the honor   
-- code.  I also understand that if I knowingly give my original work to 
-- another individual is also a violation of the honor code. 
----------------------------------------------------------------------------------
library IEEE;						-- These lines are similar to a #include in C
use IEEE.std_logic_1164.all;

entity majority is
        port(	a, b, c:	in std_logic; 
					f:   		out std_logic);
end majority;

architecture structure of majority is
signal	s1, s2, s3: std_logic;	-- wires which begin and end in the component

begin 
	s1 <= a and b;			-- These statements are called
	s2 <= b and c;			-- concurrent signal assignments.
	s3 <= a and c;			-- They all happen at the same time
	f <= s1 or s2 or s3;	-- unlike a regular programming lang.
end structure;
 