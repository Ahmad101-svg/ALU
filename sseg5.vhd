LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg5 IS
PORT ( 
    bcd  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    sign : IN STD_LOGIC;
    right_leds : OUT STD_LOGIC_VECTOR(0 TO 3); -- Reduced to 4 bits
    left_leds : OUT STD_LOGIC_VECTOR(0 TO 3)   -- Reduced to 4 bits
);
END sseg5;

ARCHITECTURE Behavior OF sseg5 IS
BEGIN
PROCESS (bcd, sign)
BEGIN
    -- Map BCD input to 4-bit outputs for right_leds
    CASE bcd IS
        WHEN "0000" => right_leds <= "0001"; -- Represents digit 0
        WHEN "0001" => right_leds <= "0010"; -- Represents digit 1
        WHEN "0010" => right_leds <= "0011"; -- Represents digit 2
        WHEN "0011" => right_leds <= "0100"; -- Represents digit 3
        WHEN OTHERS => right_leds <= "0000"; -- Default to 0 for invalid inputs
    END CASE;

    -- Map sign input to 4-bit outputs for left_leds
    IF (sign = '1') THEN
        left_leds <= "0001"; -- Sign ON (e.g., could represent a minus sign)
    ELSE
        left_leds <= "0000"; -- Sign OFF
    END IF;
END PROCESS;
END Behavior;
